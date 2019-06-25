package com.spring.riot.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.riot.service.RiotService;
import com.spring.riot.vo.ChampionVo;
import com.spring.riot.vo.RankVo;

@Controller
public class RiotController {

	@Autowired
	private RiotService riotService;
	
	private String api_key = "RGAPI-eeaeb75f-07e8-4ab2-8e68-61825d5bc3a8";
	List<RankVo> rankList = new ArrayList<>();
	
	@RequestMapping("/champion/detail")
	public ModelAndView championDetail(@RequestParam HashMap<String, Object> map) {
		String champName = (String) map.get("champName");
		ChampionVo champVo = riotService.selectChampDetail(map);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("champVo", champVo);
		mv.setViewName("menu/riot/championDetail");
		return mv;
	}
	
	@RequestMapping("/champion")
	public ModelAndView champion(@RequestParam HashMap<String, Object> map) throws IOException, ParseException {
		
		List<ChampionVo> champList = riotService.selectChampList(map);
		
		System.out.println(champList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("champList", champList);
		mv.setViewName("menu/riot/champion");
		return mv;
	}
	
	// 페이지 1 일땐 갱신하자
	@RequestMapping("/ranking")
	public ModelAndView challenger(@RequestParam HashMap<String, Object> map) throws UnsupportedEncodingException, IOException {
		String page = map.get("page").toString();
		String league = map.get("league").toString();
		String title = league.replace("leagues", " Leagues");
		title = title.substring(0, 1).toUpperCase() + title.substring(1);
		
		if (page.equals("1")) {
			String urlStr = "https://kr.api.riotgames.com/lol/league/v4/" + league + "/by-queue/RANKED_SOLO_5x5/";
			String json = "";
			
			BufferedReader br = null;
			URL url = new URL(urlStr + "?api_key=" + api_key);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			json = br.readLine();

			JSONParser prs = new JSONParser();
			JSONArray arr = null;
			JSONObject obj = null;
			
			try {
				obj = (JSONObject) prs.parse(json);
				arr = (JSONArray) obj.get("entries");
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			
			rankList = getRankList(arr);
			
			Collections.sort(rankList, new AscendingRankVo());
			
			int prevIdx = -1;
			int prevLP  = -1;
			for (int i = 0; i < rankList.size(); i++) {
				RankVo vo = rankList.get(i);
				if (vo.getLeaguePoints() == prevLP) {
					vo.setIdx(prevIdx);
				} else {
					vo.setIdx(i+1);
					prevIdx = vo.getIdx();
					prevLP = vo.getLeaguePoints();
				}
			}
			
		}
		
		int startIndex = Integer.parseInt(page);
		startIndex = (100 * (startIndex - 1) + 1);
		
		int totalPage = (int) (Math.ceil(rankList.size() / 100.0));
		
		String tier = league.replaceAll("leagues", "");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("rankList", rankList);
		mv.addObject("league", league);
		mv.addObject("title", title);
		mv.addObject("tier", tier);
		mv.addObject("startIndex", startIndex);
		mv.addObject("totalPage", totalPage);
		mv.setViewName("menu/riot/ranking");
		return mv;
	}
	
	private List<RankVo> getRankList(JSONArray arr) {
		List<RankVo> list = new ArrayList<>();
		for (int i = 0; i < arr.size(); i++) {
			RankVo vo = new RankVo((JSONObject) arr.get(i));
			list.add(vo);
		}
		return list;
	}
	
//	@RequestMapping("/summoner")
//	public ModelAndView summoner(@RequestParam HashMap<String, Object> map)
//			throws UnsupportedEncodingException, IOException, ParseException {
//
//		JSONObject summoner = summonerApi((String) map.get("summonerName"));
//		JSONArray rank = leagueApi((String) summoner.get("id"));
//		List<MatchVo> matches = matchesApi((String) summoner.get("accountId"), 0, 0, 5);
//
//		List<PrintMatchVo> printMatches = makePrintMatches(matches);
//		
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("summoner", summoner);
//		mv.addObject("rank", rank);
//		mv.addObject("printMatches", printMatches);
//		mv.setViewName("menu/riot/summoner");
//		
//		return mv;
//	}

//	private List<PrintMatchVo> makePrintMatches(List<MatchVo> matches) {
//		List<PrintMatchVo> list = new ArrayList<>();
//		for (MatchVo match : matches) {
//			PrintMatchVo printMatch = new PrintMatchVo(match);
//			list.add(printMatch);
//		}
//		return list;
//	}

	private JSONObject summonerApi(String userName) throws IOException {
		String urlStr = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/";
		String json = "";

		BufferedReader br = null;
		URL url = new URL(urlStr + userName.replaceAll(" ", "") + "?api_key=" + api_key);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
		json = br.readLine();

		JSONParser prs = new JSONParser();
		JSONObject obj = null;
		
		try {
			obj = (JSONObject) prs.parse(json);
		} catch (org.json.simple.parser.ParseException e) {
			e.printStackTrace();
		}

		return obj;
	}
	
	private JSONArray leagueApi(String summonerId) throws IOException {
		String urlStr = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/";
		String json = "";

		BufferedReader br = null;
		URL url = new URL(urlStr + summonerId + "?api_key=" + api_key);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
		json = br.readLine();

		JSONParser prs = new JSONParser();
		JSONArray  arr = null;
		JSONObject obj = null;
		
		try {
			arr = (JSONArray) prs.parse(json);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		if (arr.size() != 0) {
			String queuetype = (String) ((JSONObject)arr.get(0)).get("queueType");
			
			if (!queuetype.equals("RANKED_SOLO_5x5")) {
				obj = (JSONObject) arr.get(0);
				arr.set(0, arr.get(1));
				arr.set(1, obj);
			}
		}
		
		return arr;
	}
	
//	private List<MatchVo> matchesApi(String accountId, int champion, int queue,int endIndex) throws IOException {
//		String urlStr = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/";
//		String json = "";
//
//		BufferedReader br = null;
//		urlStr = urlStr + accountId + "?";
//		if (champion != 0) urlStr += "champion=" + champion + "&";
//		if (queue != 0) urlStr += "queue=" + queue + "&";
//		if (endIndex != 0) urlStr += "endIndex=" + endIndex + "&";
//		URL url = new URL(urlStr + "api_key=" + api_key);
//		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//		br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
//		json = br.readLine();
//
//		JSONParser prs = new JSONParser();
//		JSONArray  arr = null;
//		JSONObject obj = null;
//		
//		List<MatchVo> matches = new ArrayList<>();
//		
//		try {
//			obj = (JSONObject) prs.parse(json);
//			arr = (JSONArray) obj.get("matches");
//			for (int i = 0; i < arr.size(); i++) {
//				MatchVo match = new MatchVo(api_key, (JSONObject) arr.get(i));
//				matches.add(match);
//			}
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		
//		return matches;
//	}
	
	// ==================================================================================================================
//	   @RequestMapping("/summoner")
//	   public ModelAndView getUserCount(@RequestParam HashMap<Object, String> map) throws IOException, ParseException {
//	      ModelAndView mv = new ModelAndView();
//	      
//	      String[] tier = {"IRON", "BRONZE", "SILVER", "GOLD", "PLATINUM", "DIAMOND"};
//	      String[] division = { "I", "II", "III", "IV" };
//	      String queue = "RANKED_SOLO_5x5";
//	      HashMap<String, Integer> userCount = new HashMap<String, Integer>();
//	      int page = 1;
//	      
//	      String urlStr = "https://kr.api.riotgames.com";
//	      String tierParam = "";
//	      String apiKey = "RGAPI-14ec3293-277c-451c-9904-16c4f6fb3f18";
//	      
//	      for(int i = 0; i < tier.length; i++) {
//	         tierParam = urlStr + "/lol/league/v4/entries/"
//	               + queue + "/"
//	               + tier[i] + "/";
//	         for(int j = division.length - 1; j >= 0; j--) {
//	            String divisionParam = tierParam + division[j];
//	            while(true) {
//	               String pageParam = divisionParam
//	                     + "?page="
//	                     + page
//	                     + "&api_key=" + apiKey;
//	               
//	               URL url = new URL(pageParam);
//	               HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//	               BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//	               String line = "";
//	               String result = "";
//	               while((line = br.readLine()) != null) {
//	                  result = line + "\n";
//	               }
//	               JSONParser parser = new JSONParser();
//	               JSONArray jo = (JSONArray) parser.parse(result);
//	               if(jo.isEmpty())
//	                  break;
//	               String key = tier[i] + " " + division[j];
//	               if(userCount.containsKey(key)) {
//	                  userCount.put(tier[i] + " " + division[j],
//	                        (int)userCount.get(key) + jo.size());                  
//	               }
//	               else {
//	                  userCount.put(tier[i] + " " + division[j], jo.size());
//	               }
//	               page++;
//	               System.out.println(userCount);
//	            }            
//	            page = 1;
//	         }         
//	      }   
//	      
//	      //System.out.println(userCount);
//	      mv.addObject("userCount", userCount);
//	      mv.setViewName("result");
//	      return mv;
//	   }
	//
	
	// 랭킹 구하려고 만든 것
//	private SummonerVo leagueEntries() throws UnsupportedEncodingException, IOException {
//		SummonerVo vo = null;
//
//		int[][] arr = new int[4][6];
//		String[] tiers = {"DIAMOND", "PLATINUM", "GOLD", "SILVER", "BRONZE", "IRON"};
//		String[] divisions = {"I", "II", "III", "IV"};
//
//		String tier = "DIAMOND";
//		String division = "I";
//		int page = 1;
//		
//		int result = 0;
//		while ((result = rankCount(tier, division, page++)) != 0) {
//			arr[0][0] += result;
//		}
//		
//		System.out.println(result);
//
//		return vo;
//	}
//
//	// 랭킹 구하려고 만든 것
//	private int rankCount(String tier, String division, int page) throws UnsupportedEncodingException, IOException {
//
//		String urlStr = "https://kr.api.riotgames.com/lol/league/v4/entries/RANKED_SOLO_5x5"; // /DIAMOND/I?page=1";
//		String json = "";
//		BufferedReader br = null;
//		URL url = new URL(urlStr + "/" + tier + "/" + division + "?page=" + page + "&api_key=" + api_key);
//		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//		br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
//		json = br.readLine();
//
//		JSONParser prs = new JSONParser();
//		JSONArray arr = null;
//		try {
//			arr = (JSONArray) prs.parse(json);
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//
//		return arr.size();
//	}
}

class AscendingRankVo implements Comparator<RankVo> {

	@Override
	public int compare(RankVo o1, RankVo o2) {
		if (o2.getLeaguePoints() > o1.getLeaguePoints()) return 1;
		if (o2.getLeaguePoints() < o1.getLeaguePoints()) return -1;
		return 0;
	}
	
}

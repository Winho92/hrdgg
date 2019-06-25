package com.spring.riot.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.eclipse.jdt.internal.compiler.batch.Main;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.riot.match.vo.MatchInfoVo;
import com.spring.riot.match.vo.MatchTeamVo;
import com.spring.riot.match.vo.MatchVo;
import com.spring.riot.rank.vo.MiniSeriesVo;
import com.spring.riot.rank.vo.RankVo;

@Controller
public class RiotMatchController {
	
	protected static Logger logger = Logger.getLogger(Main.class.getName());
	private final String urlStr = "https://kr.api.riotgames.com";
	private final String apiKey = "?api_key=RGAPI-eeaeb75f-07e8-4ab2-8e68-61825d5bc3a8";
	private List<MatchVo> matchList;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {		
		
		return "home";
	}
	
	@RequestMapping("/Search")
	public ModelAndView srh(@RequestParam HashMap<String, Object> map) throws UnsupportedEncodingException {
		ModelAndView mv = new ModelAndView();
		String summonerName = (String) map.get("summonerName");
		summonerName = URLEncoder.encode(summonerName, "utf-8");
		mv.setViewName("redirect:/summoner/userName=" + summonerName);
		return mv;
	}
	@RequestMapping(
			value="/summoner/userName={summonerName}",
			method = RequestMethod.GET			
			)
	public ModelAndView search(@RequestParam HashMap<String, Object> map,
			@PathVariable("summonerName") String summonerName) throws IOException, ParseException {
		// summonerName    : 공백을 제거한 닉네임
		
		// 공백 제거
		summonerName = summonerName.replaceAll("\\+", ""); 
		String queryParams = "/lol/summoner/v4/summoners/by-name/"
				+ summonerName + apiKey;
		
		BufferedReader br = null;
		URL url = new URL(urlStr + queryParams);
		HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
		br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
		
		String line = "";
		String result = "";
		
		while((line = br.readLine()) != null) {
			result += line + "\n";
		}	
		
		/*
		 * result = 
		 * {
			    "profileIconId": 3478,
			    "name": "어니부뇽",
			    "puuid": "XHWsKPMIH2YEAKpAs2w0MDBmJQQHs2RN2iD1qN9qWkHNq0QCGxRBNl0vhD7s8Qfp7X17r2ORn0D1ng",
			    "summonerLevel": 148,
			    "accountId": "2aJbJQmDD_DD_Xhzp3-1uoTqkSP8rNEqd2wwYBRetz_N",
			    "id": "IU-4qGGEsB3fqKk_b5npsuNqNIzdv3VaHBOVubmm00eJvg",
			    "revisionDate": 1560324745000
			} 
		 */

		JSONParser parser = new JSONParser();
		
		// summonerJson : Summoner 정보를 가지고있는 JSON 객체
		JSONObject summonerJson = (JSONObject) parser.parse(result);
		// 소환사 개인 매칭 정보를 얻기 위한 accountId
		String accountId = (String) summonerJson.get("accountId");
		String oriSummonerName = (String) summonerJson.get("name");
		String summonerId = (String) summonerJson.get("id");
		
		// 개인 랭크 전적
		queryParams = "/lol/league/v4/entries/by-summoner/"
				+ summonerId + apiKey;
		
		url = new URL(urlStr + queryParams);
		urlconnection = (HttpURLConnection) url.openConnection();
		br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
		
		line = "";
		result = "";
		
		while((line = br.readLine()) != null) {
			result += line + "\n";
		}
		// 둘다 언랭, 팀랭만 언랭, 솔랭만 언랭인 경우
		JSONArray rankJson = (JSONArray) parser.parse(result);
		JSONObject tempRankJson = null;
		
		String progress = "";
		int losses = 0;
		int target = 0;
		int wins = 0;
		MiniSeriesVo miniSeries = null;
		JSONObject miniSeriesJson = null;
		
		String queueType = "";
		Object miniSeriesObj = null;
		
		String rank = "";			
		String tier = "";	
		int leaguePoints = 0;
		
		RankVo teamRankVo = null;
		RankVo soloRankVo = null;
		for(int i = 0; i < rankJson.size(); i++) {
			miniSeries = null;
			tempRankJson = (JSONObject) rankJson.get(i);
			
			queueType = (String) tempRankJson.get("queueType");
			miniSeriesObj = tempRankJson.get("miniSeries");
			
			if(miniSeriesObj != null) {
				miniSeriesJson = (JSONObject) miniSeriesObj;
			    progress = (String) miniSeriesJson.get("progress");	
				losses = CastJson.castInteger(miniSeriesJson.get("losses"));	
				target = CastJson.castInteger(miniSeriesJson.get("target"));
				wins = CastJson.castInteger(miniSeriesJson.get("wins"));			
				miniSeries = new MiniSeriesVo(progress, losses, target, wins);
			}
			wins = CastJson.castInteger(tempRankJson.get("wins"));		
			losses = CastJson.castInteger(tempRankJson.get("losses"));	
			rank = (String) tempRankJson.get("rank");			
			tier = (String) tempRankJson.get("tier");	
			leaguePoints = CastJson.castInteger(tempRankJson.get("leaguePoints"));
			
			if(queueType.equals("RANKED_SOLO_5x5")){
				soloRankVo = new RankVo(
						queueType, miniSeries, wins, losses,
						rank, tier, leaguePoints);
			}
			
			if(queueType.equals("RANKED_FLEX_SR")){
				teamRankVo = new RankVo(
						queueType, miniSeries, wins, losses,
						rank, tier, leaguePoints);
			}
		}		 
		
		/*
		 * [
		    {
		        "queueType": "RANKED_FLEX_SR",
		        "summonerName": "어니부뇽",
		        "hotStreak": false,
		        "wins": 12,
		        "veteran": false,
		        "losses": 10,
		        "rank": "II",
		        "tier": "GOLD",
		        "inactive": false,
		        "freshBlood": false,
		        "leagueId": "01e8f560-3770-11e9-9b0b-f8bc12426294",
		        "summonerId": "IU-4qGGEsB3fqKk_b5npsuNqNIzdv3VaHBOVubmm00eJvg",
		        "leaguePoints": 71
		    },
		    {
		        "queueType": "RANKED_SOLO_5x5",
		        "summonerName": "어니부뇽",
		        "hotStreak": true,
		        "miniSeries": {
		            "wins": 0,
		            "losses": 0,
		            "target": 2,
		            "progress": "NNN"
		        },
		        "wins": 65,
		        "veteran": false,
		        "losses": 60,
		        "rank": "IV",
		        "tier": "PLATINUM",
		        "inactive": false,
		        "freshBlood": false,
		        "leagueId": "2327fa30-789a-11e9-91c2-f8bc12426294",
		        "summonerId": "IU-4qGGEsB3fqKk_b5npsuNqNIzdv3VaHBOVubmm00eJvg",
		        "leaguePoints": 100
		    }
		]
		 */	
		
		
		// 개인 Match 정보
		queryParams = "/lol/match/v4/matchlists/by-account/"
				+ accountId + apiKey;
		
		url = new URL(urlStr + queryParams);
		urlconnection = (HttpURLConnection) url.openConnection();
		br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
		
		line = "";
		result = "";
		
		while((line = br.readLine()) != null) {
			result += line + "\n";
		}
		String userMatchInfo = result;
		/*
		 * result = 
		 * {
		    "matches": [
		        {
		            "lane": "JUNGLE",
		            "gameId": 3702612374,
		            "champion": 20,
		            "platformId": "KR",
		            "timestamp": 1560347749683,
		            "queue": 420,
		            "role": "NONE",
		            "season": 13
		        },
		        ...
		   ]}
		 */
		JSONObject matchJson = (JSONObject) parser.parse(userMatchInfo);
		JSONArray ja = (JSONArray) matchJson.get("matches");
		matchList = new ArrayList<MatchVo>();
		
		// 쿼리 트래픽 제한으로 인해 ja.size() 불가. 
		// 쿼리는 5개만 임시로 진행
		for(int i = 0; i < 8; i++){
			//<----------------------------------------------------------------------------->//
			
			matchJson = (JSONObject) ja.get(i);			
			
			long gameId = CastJson.castLong(matchJson.get("gameId"));
			String lane = (String) matchJson.get("lane");
			long champion = CastJson.castLong(matchJson.get("champion"));
			long season = CastJson.castLong(matchJson.get("season"));			
			long timestamp = CastJson.castLong(matchJson.get("timestamp"));
			long queue = CastJson.castLong(matchJson.get("queue"));
			
			queryParams = "/lol/match/v4/matches/" + gameId + apiKey;
			
			url = new URL(urlStr + queryParams);
			urlconnection = (HttpURLConnection) url.openConnection();
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream()));
			
			line = "";
			result = "";
			
			while((line = br.readLine()) != null) {
				result += line + "\n";
			}
			/* result = 
			 * {
			    "seasonId": 13,
			    "queueId": 440,
			    "gameId": 3697601947,
			    "participantIdentities": [
			        {
			            "player": {
			                "currentPlatformId": "KR",
			                "summonerName": "wwvww",
			                "matchHistoryUri": "/v1/stats/player_history/KR/1512855",
			                "platformId": "KR",
			                "currentAccountId": "2lJhr_ETQmu7TzImFBRxgRRp7sOx1ZXLJX-omfDyyfQY",
			                "profileIcon": 4050,
			                "summonerId": "hY6khp7K6z5fmEYt9Hz0GdbchizelQ49O2s8MARbTOfXfA",
			                "accountId": "2lJhr_ETQmu7TzImFBRxgRRp7sOx1ZXLJX-omfDyyfQY"
			            },
			            "participantId": 1
			        },
			        ...			        
			     ]
			     "gameVersion": "9.11.275.6613",
			     "platformId": "KR",
			     "gameMode": "CLASSIC",
			     "mapId": 11,
			     "gameType": "MATCHED_GAME",
			     "teams": [
			         {
			             "firstDragon": true,
			             "bans": [
			             ...
			 */			
			
			// 게임당 참가 유저 10명 정보를 담을 리스트
			List<String> userNames = new ArrayList<String>();
			JSONObject matchInfoJson = (JSONObject) parser.parse(result);
			
			// 게임 시간 정보
			long gameCreation = CastJson.castLong(matchInfoJson.get("gameCreation"));
		    long gameDuration = CastJson.castLong(matchInfoJson.get("gameDuration"));
		    
		    // 게임 팀 정보
		    JSONArray teamInfoJA = (JSONArray) matchInfoJson.get("teams");
		    JSONObject blueTeamInfoJson = (JSONObject) teamInfoJA.get(0);
		    boolean firstBlood = CastJson.castBoolean(blueTeamInfoJson.get("firstBlood"));
			boolean firstTower = CastJson.castBoolean(blueTeamInfoJson.get("firstTower"));
			boolean firstRiftHerald = CastJson.castBoolean(blueTeamInfoJson.get("firstRiftHerald"));
			int towerKills = CastJson.castInteger(blueTeamInfoJson.get("towerKills"));
			int dragonKills = CastJson.castInteger(blueTeamInfoJson.get("dragonKills"));
			int baronKills = CastJson.castInteger(blueTeamInfoJson.get("baronKills"));
			int inhibitorKills = CastJson.castInteger(blueTeamInfoJson.get("inhibitorKills"));
			int blueTeamId = CastJson.castInteger(blueTeamInfoJson.get("teamId"));
			String blueTeamWin = (String) blueTeamInfoJson.get("win");
			MatchTeamVo blueTeamVo = new MatchTeamVo(
					firstBlood, firstTower, firstRiftHerald, towerKills, dragonKills,
					baronKills, inhibitorKills, blueTeamId, blueTeamWin);
		    JSONObject purpleTeamInfoJson = (JSONObject) teamInfoJA.get(1);
		    firstBlood = CastJson.castBoolean(purpleTeamInfoJson.get("firstBlood"));
			firstTower = CastJson.castBoolean(purpleTeamInfoJson.get("firstTower"));
			firstRiftHerald = CastJson.castBoolean(purpleTeamInfoJson.get("firstRiftHerald"));
			towerKills = CastJson.castInteger(purpleTeamInfoJson.get("towerKills"));
			dragonKills = CastJson.castInteger(purpleTeamInfoJson.get("dragonKills"));
			baronKills = CastJson.castInteger(purpleTeamInfoJson.get("baronKills"));
			inhibitorKills = CastJson.castInteger(purpleTeamInfoJson.get("inhibitorKills"));
			int purpleTeamId = CastJson.castInteger(purpleTeamInfoJson.get("teamId"));
			String purpleTeamWin = (String) purpleTeamInfoJson.get("win");
			MatchTeamVo purpleTeamVo = new MatchTeamVo(
					firstBlood, firstTower, firstRiftHerald, towerKills, dragonKills,
					baronKills, inhibitorKills, purpleTeamId, purpleTeamWin);
		    
		    
		    
		    
		    
		    // 플레이어 10명에 대한 정보를 담고있는 JSON Data : participantIdentities
			JSONArray ppidJsonArray = (JSONArray) matchInfoJson.get("participantIdentities");
			/*
			 * "participantIdentities": [
		        {
		            "player": {
		                "currentPlatformId": "KR",
		                "summonerName": "wwvww",
		                "matchHistoryUri": "/v1/stats/player_history/KR/1512855",
		                "platformId": "KR",
		                "currentAccountId": "2lJhr_ETQmu7TzImFBRxgRRp7sOx1ZXLJX-omfDyyfQY",
		                "profileIcon": 4050,
		                "summonerId": "hY6khp7K6z5fmEYt9Hz0GdbchizelQ49O2s8MARbTOfXfA",
		                "accountId": "2lJhr_ETQmu7TzImFBRxgRRp7sOx1ZXLJX-omfDyyfQY"
		            },
		            "participantId": 1
		        }, ... ]
			 */
			// 10명의 플레이어중 나 자신
			long myParticipantId = 0L;
			for(int index = 0; index < ppidJsonArray.size(); index++) {			
				JSONObject ppidJson = (JSONObject) ppidJsonArray.get(index);
				JSONObject playerJson = (JSONObject) ppidJson.get("player");
				String participantName = (String) playerJson.get("summonerName");
				userNames.add(participantName);
				if(participantName.equalsIgnoreCase(oriSummonerName)) {
					myParticipantId = CastJson.castLong(ppidJson.get("participantId"));
				}
			}
			
			JSONArray ppJsonArray = (JSONArray) matchInfoJson.get("participants");
			/*
			 * "participants": [
			        {
			            "spell1Id": 14,                      스펠 1
			            "spell2Id": 4,                       스펠 2
			            "participantId": 1,                  소환사 10명중 번호
			            "timeline": {
			                "lane": "MIDDLE",
			                "participantId": 1, ... }
			            
			            "teamId": 100,                       팀 ID (100:블루 200:레드)
			            "stats": {			                
			                "visionScore": 14,     			 시야 점수
			                "largestMultiKill": 2, 			 최다 연속킬
			                "tripleKills": 0,
			                "kills": 2,       				 K
			                "deaths": 8,      				 D
			                "assists": 7,      				 A			                
			                "neutralMinionsKilled": 20,      중립 미니언킬
			                "totalMinionsKilled": 129, 		 CS킬
			                "totalDamageTaken": 33356,       받은 피해량
			                "wardsKilled": 2,                와드 제거
			                "item2": 3027,
			                "item3": 1033,
			                "item0": 3020,
			                "item1": 3157,
			                "item6": 3340,
			                "item4": 3108,
			                "item5": 0,
			                "participantId": 1,              소환사 10명중 번호
			                "totalDamageDealtToChampions": 13077, 가한 피해량
			                "win": false,                    승리 여부			                
			                "wardsPlaced": 7,                와드 설치
			                "goldEarned": 8746,              골드 획득량
			                "champLevel": 14,                챔피언 레벨
			            },
			            "championId": 50                     챔피언 ID
			        },
			 */
			// 1경기의 정보를 담을 matchVo
			MatchVo matchVo = new MatchVo(
					gameId, lane, champion, season, 
					timestamp, queue, myParticipantId, 
					gameCreation, gameDuration, teamRankVo, soloRankVo, blueTeamVo, purpleTeamVo);
			// 플레이어 10명에 대한 각각의 세부정보
			// 10명의 정보를 담을 HashMap
			HashMap<String, MatchInfoVo> matchMap = new HashMap<String, MatchInfoVo>();
			int blueKill = 0;
			int blueDeath = 0;
			int blueAssist = 0;
			int redKill = 0;
			int redDeath = 0;
			int redAssist = 0;
			long maxTotalDamageTaken = 0;
			long maxTotalDamageDealtToChampions = 0;
			for(int index = 0; index < ppJsonArray.size(); index++) {				
				
				JSONObject ppJson = (JSONObject) ppJsonArray.get(index);
				JSONObject statsJson = (JSONObject) ppJson.get("stats");
				JSONObject timelineJson = (JSONObject) ppJson.get("timeline");		
				
				long spell1Id = CastJson.castLong(ppJson.get("spell1Id"));
				long spell2Id = CastJson.castLong(ppJson.get("spell2Id"));
				long participantId = CastJson.castLong(ppJson.get("participantId")); // 소환사 10명중 번호
			    String lane_m = (String) timelineJson.get("lane"); // 포지션
			    long teamId = CastJson.castLong(ppJson.get("teamId")); // 팀 ID (100:블루 200:레드)
				long visionScore = CastJson.castLong(statsJson.get("visionScore")); // 시야 점수
				long kills = CastJson.castLong(statsJson.get("kills")); // K
				long deaths = CastJson.castLong(statsJson.get("deaths")); // D
				long assists = CastJson.castLong(statsJson.get("assists")); // A		                
			    long neutralMinionsKilled = CastJson.castLong(statsJson.get("neutralMinionsKilled")); // 중립 미니언킬
			    long totalMinionsKilled = CastJson.castLong(statsJson.get("totalMinionsKilled")); // CS킬
			    long totalDamageTaken = CastJson.castLong(statsJson.get("totalDamageTaken")); // 받은 피해량
			    long wardsKilled = CastJson.castLong(statsJson.get("wardsKilled")); // 와드 제거
			    long item0 = CastJson.castLong(statsJson.get("item0")); // 아이템 0
			    long item1 = CastJson.castLong(statsJson.get("item1")); // 아이템 1
			    long item2 = CastJson.castLong(statsJson.get("item2")); // 아이템 2
			    long item3 = CastJson.castLong(statsJson.get("item3")); // 아이템 3
			    long item4 = CastJson.castLong(statsJson.get("item4")); // 아이템 4
			    long item5 = CastJson.castLong(statsJson.get("item5")); // 아이템 5
			    long item6 = CastJson.castLong(statsJson.get("item6")); // 아이템 6 (장신구)
			    long totalDamageDealtToChampions = CastJson.castLong(statsJson.get("totalDamageDealtToChampions")); // 가한 피해량
			    boolean win = CastJson.castBoolean(statsJson.get("win")); // 승리 여부			                
			    long wardsPlaced = CastJson.castLong(statsJson.get("wardsPlaced")); // 와드 설치
			    long goldEarned = CastJson.castLong(statsJson.get("goldEarned")); // 골드 획득량
			    long champLevel = CastJson.castLong(statsJson.get("champLevel")); // 챔피언 레벨
			    long visionWardsBoughtInGame = CastJson.castLong(statsJson.get("visionWardsBoughtInGame")); // 제어 와드
			    long championId = CastJson.castLong(ppJson.get("championId")); // 챔피언 ID
			    
			    
			    int largestMultiKill = CastJson.castInteger(statsJson.get("largestMultiKill")); // 최다 다중킬
			    int doubleKills = CastJson.castInteger(statsJson.get("doubleKills")); // 더블킬
			    int tripleKills = CastJson.castInteger(statsJson.get("tripleKills")); // 트리플킬
			    int quadraKills = CastJson.castInteger(statsJson.get("quadraKills")); // 쿼드라킬			    
			    int pentaKills = CastJson.castInteger(statsJson.get("pentaKills")); // 펜타킬
			    
			    int statPerk0 = CastJson.castInteger(statsJson.get("statPerk0")); // StatMods1
			    int statPerk1 = CastJson.castInteger(statsJson.get("statPerk1")); // StatMods2
			    int statPerk2 = CastJson.castInteger(statsJson.get("statPerk2")); // StatMods3
			    
			    int perk0 = CastJson.castInteger(statsJson.get("perk0")); // Primary path keystone rune.
			    int perk1 = CastJson.castInteger(statsJson.get("perk1")); // Primary path rune.
			    int perk2 = CastJson.castInteger(statsJson.get("perk2")); // Primary path rune.			    
			    int perk3 = CastJson.castInteger(statsJson.get("perk3")); // Primary path rune.
			    int perk4 = CastJson.castInteger(statsJson.get("perk4")); // Secondary path rune.			    
			    int perk5 = CastJson.castInteger(statsJson.get("perk5")); // Secondary path rune.   			    
			    
			    int perkPrimaryStyle = CastJson.castInteger(statsJson.get("perkPrimaryStyle")); // Primary rune path
			    int perkSubStyle = CastJson.castInteger(statsJson.get("perkSubStyle")); // Secondary rune path   
			    
			   
//			    int perk0Var1 = CastJson.castInteger(statsJson.get("perk0Var1")); // Post game rune stats.
//			    int perk0Var2 = CastJson.castInteger(statsJson.get("perk0Var2")); // Post game rune stats.
//			    int perk0Var3 = CastJson.castInteger(statsJson.get("perk0Var3")); // Post game rune stats.
//			    
//			    int perk1Var1 = CastJson.castInteger(statsJson.get("perk1Var1")); // Post game rune stats.
//			    int perk1Var2 = CastJson.castInteger(statsJson.get("perk1Var2")); // Post game rune stats.
//			    int perk1Var3 = CastJson.castInteger(statsJson.get("perk1Var3")); // Post game rune stats.
//			    
//			    int perk2Var1 = CastJson.castInteger(statsJson.get("perk2Var1")); // Post game rune stats.
//			    int perk2Var2 = CastJson.castInteger(statsJson.get("perk2Var2")); // Post game rune stats.
//			    int perk2Var3 = CastJson.castInteger(statsJson.get("perk2Var3")); // Post game rune stats.
//			    
//			    int perk3Var1 = CastJson.castInteger(statsJson.get("perk3Var1")); // Post game rune stats.
//			    int perk3Var2 = CastJson.castInteger(statsJson.get("perk3Var2")); // Post game rune stats.
//			    int perk3Var3 = CastJson.castInteger(statsJson.get("perk3Var3")); // Post game rune stats.
//			    
//			    int perk4Var1 = CastJson.castInteger(statsJson.get("perk4Var1")); // Post game rune stats.
//			    int perk4Var2 = CastJson.castInteger(statsJson.get("perk4Var2")); // Post game rune stats.
//			    int perk4Var3 = CastJson.castInteger(statsJson.get("perk4Var3")); // Post game rune stats.
//			    
//			    int perk5Var1 = CastJson.castInteger(statsJson.get("perk5Var1")); // Post game rune stats.
//			    int perk5Var2 = CastJson.castInteger(statsJson.get("perk5Var2")); // Post game rune stats.
//			    int perk5Var3 = CastJson.castInteger(statsJson.get("perk5Var3")); // Post game rune stats.		    
			   

			    // 나 자신에 대한 정보 MatchVo 에 Set
			    if(participantId == myParticipantId) {
			    	matchVo.setTeamId(teamId);
			    	matchVo.setSpell1Id(spell1Id);
			    	matchVo.setSpell2Id(spell2Id);
			    	matchVo.setKills(kills);
			    	matchVo.setDeaths(deaths);			    	
			    	matchVo.setAssists(assists);
			    	matchVo.setGrade();
			    	matchVo.setChampionLevel(champLevel);
			    	matchVo.setTotalMinionsKilled(neutralMinionsKilled + totalMinionsKilled);
			    	matchVo.setItems(item0, item1, item2, item3, item4, item5, item6);
			    	matchVo.setVisionWardsBoughtInGame(visionWardsBoughtInGame);
			    	matchVo.setWin(win);
			    	matchVo.setSpellName();
			    	matchVo.setDoubleKills(doubleKills);
			    	matchVo.setTripleKills(tripleKills);
			    	matchVo.setQuadraKills(quadraKills);
			    	matchVo.setPentaKills(pentaKills);
			    	matchVo.setGoldEarned(goldEarned);
			    	matchVo.setLargestMultiKill(largestMultiKill);
			    	matchVo.setWardsPlaced(wardsPlaced);
			    	matchVo.setWardsKilled(wardsKilled);
			    	matchVo.setPerk0(perk0);
			    	matchVo.setPerk1(perk1);
			    	matchVo.setPerk2(perk2);
			    	matchVo.setPerk3(perk3);
			    	matchVo.setPerk4(perk4);
			    	matchVo.setPerk5(perk5);
			    	matchVo.setPerkPrimaryStyle(perkPrimaryStyle);
			    	matchVo.setPerkSubStyle(perkSubStyle);
			    	matchVo.setStatPerk0(statPerk0);
			    	matchVo.setStatPerk1(statPerk1);
			    	matchVo.setStatPerk2(statPerk2);			    	
			    	
//				    System.out.println("perk0Var1 : " + perk0Var1);
//				    System.out.println("perk0Var2 : " + perk0Var2);
//				    System.out.println("perk0Var3 : " + perk0Var3);
//				    System.out.println("perk1Var1 : " + perk1Var1);
//				    System.out.println("perk1Var2 : " + perk1Var2);
//				    System.out.println("perk1Var3 : " + perk1Var3);
//				    System.out.println("perk2Var1 : " + perk2Var1);
//				    System.out.println("perk2Var2 : " + perk2Var2);
//				    System.out.println("perk2Var3 : " + perk2Var3);
//				    System.out.println("perk3Var1 : " + perk3Var1);
//				    System.out.println("perk3Var2 : " + perk3Var2);
//				    System.out.println("perk3Var3 : " + perk3Var3);
//				    System.out.println("perk4Var1 : " + perk4Var1);
//				    System.out.println("perk4Var2 : " + perk4Var2);
//				    System.out.println("perk4Var3 : " + perk4Var3);
//				    System.out.println("perk5Var1 : " + perk5Var1);
//				    System.out.println("perk5Var2 : " + perk5Var2);
//				    System.out.println("perk5Var3 : " + perk5Var3);
//				    System.out.println("perk0 : " + perk0);
//				    System.out.println("perk1 : " + perk1);
//				    System.out.println("perk2 : " + perk2);
//				    System.out.println("perk3 : " + perk3);
//				    System.out.println("perk4 : " + perk4);
//				    System.out.println("perk5 : " + perk5);
//				    System.out.println("perkPrimaryStyle : " + perkPrimaryStyle);
//				    System.out.println("perkSubStyle : " + perkSubStyle);
			    }
			    
			    if(maxTotalDamageTaken < totalDamageTaken)
			    	maxTotalDamageTaken = totalDamageTaken;
			    if(maxTotalDamageDealtToChampions < totalDamageDealtToChampions)
			    	maxTotalDamageDealtToChampions = totalDamageDealtToChampions;
			    
			    if(teamId == 100) {
			    	blueKill += kills;
			    	blueDeath += deaths;
			    	blueAssist += assists;
			    }
			    
			    if(teamId == 200) {
			    	redKill += kills;
			    	redDeath += deaths;
			    	redAssist += assists;
			    }
			    	
			    
			    // 개개인의 MatchInfo
			    MatchInfoVo matchInfoVo = new MatchInfoVo(
			    		spell1Id, spell2Id, participantId, lane_m,
			    		teamId, visionScore, kills, deaths, assists,
			    		neutralMinionsKilled, totalMinionsKilled,
			    		totalDamageTaken, wardsKilled, item0, item1,
			    		item2, item3, item4, item5, item6,
			    		totalDamageDealtToChampions, win, wardsPlaced,
			    		goldEarned, champLevel, championId, statPerk0,
			    		statPerk1, statPerk2, perk0, perk1, perk2, perk3,
			    		perk4, perk5, perkPrimaryStyle, perkSubStyle , visionWardsBoughtInGame);
			    
			    matchMap.put(userNames.get(index), matchInfoVo);			    
			    
			}
			if(matchVo.getTeamId() == 100) {
				matchVo.setTotalKill(blueKill);				
			}
			else {
				matchVo.setTotalKill(redKill);
			}
			matchVo.setMaxTotalDamageDealtToChampions(maxTotalDamageDealtToChampions);
			matchVo.setMaxTotalDamageTaken(maxTotalDamageTaken);
			matchVo.setBtTotalKill(blueKill);
			matchVo.setBtTotalDeath(blueDeath);
			matchVo.setBtTotalAssist(blueAssist);
			matchVo.setPtTotalKill(redKill);
			matchVo.setPtTotalDeath(redDeath);
			matchVo.setPtTotalAssist(redAssist);
			matchVo.setMatchMap(matchMap);
			matchVo.setChampionNames();
			matchVo.setTeamNames();
			matchList.add(matchVo);
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("summonerJson", summonerJson);
		mv.addObject("teamRank", teamRankVo);
		mv.addObject("soloRank", soloRankVo);
		mv.addObject("matchList", matchList);
		mv.setViewName("menu/riot/result");
		return mv;
	}	
	
	@RequestMapping("/get/matchInfo")
	public void getMatchInfo(@RequestParam HashMap<Object, String> map, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		String matchInfo = (String) map.get("matchInfoVo");
		MatchVo selMatchVo = null;
		int startIndex = matchInfo.indexOf("gameId") + 7;
		int endIndex = matchInfo.indexOf(",");
		long gameId = Long.parseLong(matchInfo.substring(startIndex, endIndex));
		for(MatchVo matchVo : matchList) {
			if(matchVo.getGameId() == gameId) 
				selMatchVo = matchVo;
		}
		
		MatchTeamVo blueTeamVo = selMatchVo.getBlueTeamVo();
		MatchTeamVo purpleTeamVo = selMatchVo.getPurpleTeamVo();	
		int btTotalKill = selMatchVo.getBtTotalKill();
		int btTotalDeath = selMatchVo.getBtTotalDeath();
		int btTotalAssist = selMatchVo.getBtTotalAssist();
		int ptTotalKill = selMatchVo.getPtTotalKill();
		int ptTotalDeath = selMatchVo.getPtTotalDeath();
		int ptTotalAssist = selMatchVo.getPtTotalAssist();
		long maxTotalDamageDealtToChampions = selMatchVo.getMaxTotalDamageDealtToChampions();
		long maxTotalDamageTaken = selMatchVo.getMaxTotalDamageTaken();
		int gameDurationMin = selMatchVo.getGameDurationMin();
		
		HashMap<String, MatchInfoVo> selMatchInfo = selMatchVo.getMatchMap();
		Iterator<String> it = selMatchInfo.keySet().iterator();
		String result = "{";
		result += "\"summonerInfo\":[";
		while(it.hasNext()) {
			String summonerName = it.next();			
			result += selMatchInfo.get(summonerName).toJSON();
			result  = result.substring(0, result.length() - 1);
			result += ",";
			result += "\"summonerName\":";
			result += "\"" + summonerName + "\"";
			result += "}";
			result += ",";
		}
		result = result.substring(0, result.length() -1);
		result += "]";
		
		result += "," + "\"blueTeam\":" + blueTeamVo.toJSON();
		result = result.substring(0, result.length() - 1);
		result += ",\"totalKill\":";
		result += btTotalKill;
		result += ",\"totalDeath\":";
		result += btTotalDeath;
		result += ",\"totalAssist\":";
		result += btTotalAssist + "}";
		result += "," + "\"purpleTeam\":" + purpleTeamVo.toJSON();
		result = result.substring(0, result.length() - 1);
		result += ",\"totalKill\":";
		result += ptTotalKill;
		result += ",\"totalDeath\":";
		result += ptTotalDeath;
		result += ",\"totalAssist\":";
		result += ptTotalAssist + "}";
		result += ",\"maxDamage\":";
		result += maxTotalDamageDealtToChampions;
		result += ",\"maxTaken\":";
		result += maxTotalDamageTaken;
		result += ",\"gameDurationMin\":";
		result += gameDurationMin;
		result += "}";	

	    response.setContentType("application/json;charset=utf-8");
	    PrintWriter out = response.getWriter();
	    out.print(result);
	    out.flush();
	    out.close();  
	}
	
	@RequestMapping("/UserCount")
	public ModelAndView getUserCount(@RequestParam HashMap<Object, String> map) throws IOException, ParseException {
		ModelAndView mv = new ModelAndView();
		
		String[] tier = {"IRON", "BRONZE", "SILVER", "GOLD", "PLATINUM", "DIAMOND"};
		String[] division = { "I", "II", "III", "IV" };
		String queue = "RANKED_SOLO_5x5";
		HashMap<String, Integer> userCount = new HashMap<String, Integer>();
		int page = 1;
		
		String urlStr = "https://kr.api.riotgames.com";
		String tierParam = "";		
		
		for(int i = 0; i < tier.length; i++) {
			tierParam = urlStr + "/lol/league/v4/entries/"
					+ queue + "/"
					+ tier[i] + "/";
			for(int j = division.length - 1; j >= 0; j--) {
				String divisionParam = tierParam + division[j];
				while(true) {
					String pageParam = divisionParam
							+ "?page="
							+ page
							+ "&api_key=" + apiKey;
					
					URL url = new URL(pageParam);
					HttpURLConnection conn = (HttpURLConnection) url.openConnection();
					BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
					String line = "";
					String result = "";
					while((line = br.readLine()) != null) {
						result = line + "\n";
					}
					JSONParser parser = new JSONParser();
					JSONArray jo = (JSONArray) parser.parse(result);
					if(jo.isEmpty())
						break;
					String key = tier[i] + " " + division[j];
					if(userCount.containsKey(key)) {
						userCount.put(tier[i] + " " + division[j],
								(int)userCount.get(key) + jo.size());						
					}
					else {
						userCount.put(tier[i] + " " + division[j], jo.size());
					}
					page++;
					System.out.println(userCount);
				}				
				page = 1;
			}			
		}	
		
		//System.out.println(userCount);
		mv.addObject("userCount", userCount);
		mv.setViewName("menu/riot/result");
		return mv;
	}
	
}

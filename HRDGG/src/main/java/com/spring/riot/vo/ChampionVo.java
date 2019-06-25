package com.spring.riot.vo;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class ChampionVo {
	private int key; // 11
	private String id; // MasterYi
	private String name; // 마스터 이
	private String title; // 우주 검사
	private String image; // champion/MasterYi.png
	private String skins; // 0,A,1,B,2,C
	private String lore; // 챔피언 설명
	private String info; // 챔피언 정보 (공격력,생명력,주문력,난이도)
	private String tags; // ["Assassin","Fighter"]
	private String stats; // 능력치
	private String passive;
	private String spellQ;
	private String spellW;
	private String spellE;
	private String spellR;

	public ChampionVo() {}

	public ChampionVo(String championName) throws IOException, ParseException {
//		File file = new File("/Users/winho/Downloads/dragontail-9.3.1/9.3.1/data/ko_KR/champion/MasterYi.json");
		File file = new File("/Users/winho/Downloads/dragontail-9.3.1/9.3.1/data/ko_KR/championFull.json");
		BufferedReader br = new BufferedReader(new FileReader(file));
		String line = "";
		String json = "";
		JSONParser jsonPrs = new JSONParser();
		JSONObject jsonObj = null;
		JSONObject obj = null;
		JSONArray jsonArr = null;

		while ((line = br.readLine()) != null) {
			json += line;
		}

		jsonObj = (JSONObject) jsonPrs.parse(json);
		jsonObj = (JSONObject) jsonPrs.parse(jsonObj.get("data").toString());
		Object tmp = jsonObj.get(championName);
		if (tmp == null) return;
		jsonObj = (JSONObject) jsonPrs.parse(tmp.toString());

		this.key = Integer.parseInt(jsonObj.get("key").toString());
		this.id = jsonObj.get("id").toString();
		this.name = jsonObj.get("name").toString();
		this.title = jsonObj.get("title").toString();
		this.image = imageParsing(jsonObj.get("image"));
		this.skins = skinsParsing(jsonObj.get("skins"));
		this.lore = jsonObj.get("lore").toString();
		this.tags = tagsParsing(jsonObj.get("tags"));
		this.info = infoParsing(jsonObj.get("info"));
		this.stats = statsParsing(jsonObj.get("stats"));
		this.passive = passiveParsing(jsonObj.get("passive"));
		this.spellQ = spellsParsing(jsonObj.get("spells"), 0);
		this.spellW = spellsParsing(jsonObj.get("spells"), 1);
		this.spellE = spellsParsing(jsonObj.get("spells"), 2);
		this.spellR = spellsParsing(jsonObj.get("spells"), 3);

	}
	
	private String spellsParsing(Object object, int i) {
		JSONArray arr = (JSONArray) object;
		String result = "";

		String[] keyArr = { "id", "name", "description", "cooldownBurn", "costBurn", "image" };
		JSONObject obj = (JSONObject) arr.get(i);
		for (int j = 0; j < keyArr.length; j++) {
			if (j != keyArr.length - 1) {
				result += obj.get(keyArr[j]).toString() + ",";
			} else {
				obj = (JSONObject) obj.get(keyArr[j]);
				result += obj.get("group").toString() + "/" + obj.get("full").toString();
			}
		}
		return result;
	}

	private String passiveParsing(Object object) {
		JSONObject obj = (JSONObject) object;
		String result = "";
		result += obj.get("name").toString() + ",";
		result += obj.get("description").toString() + ",";
		obj = (JSONObject) obj.get("image");
		result += obj.get("group").toString() + "/";
		result += obj.get("full").toString();
		return result;
	}

	private String statsParsing(Object object) {
		JSONObject obj = (JSONObject) object;
		String[] keyArr = { "hp", "hpperlevel", "mp", "mpperlevel", "movespeed", "armor", "armorperlevel", "spellblock",
				"spellblockperlevel", "attackrange", "hpregen", "hpregenperlevel", "mpregen", "mpregenperlevel", "crit",
				"critperlevel", "attackdamage", "attackdamageperlevel", "attackspeedperlevel", "attackspeed" };
		String result = "";
		for (int i = 0; i < keyArr.length; i++) {
			result += obj.get(keyArr[i]).toString();
			if (i < keyArr.length - 1)
				result += ",";
		}
		return result;
	}

	private String infoParsing(Object object) {
		JSONObject obj = (JSONObject) object;
		String[] keyArr = { "attack", "defense", "magic", "difficulty" };
		String result = "";
		for (int i = 0; i < keyArr.length; i++) {
			result += obj.get(keyArr[i]).toString();
			if (i < keyArr.length - 1)
				result += ",";
		}
		return result;
	}

	private String tagsParsing(Object object) {
		JSONArray arr = (JSONArray) object;
		String result = "";
		for (int i = 0; i < arr.size(); i++) {
			result += arr.get(i).toString();
			if (i < arr.size() - 1)
				result += ",";
		}
		return result;
	}

	private String skinsParsing(Object object) {
		JSONArray arr = (JSONArray) object;
		String result = "";
		for (int i = 0; i < arr.size(); i++) {
			JSONObject obj = (JSONObject) arr.get(i);
			result += obj.get("num").toString() + "," + obj.get("name").toString();
			if (i < arr.size() - 1)
				result += ",";
		}
		return result;
	}

	private String imageParsing(Object object) {
		JSONObject obj = (JSONObject) object;
		return obj.get("group").toString() + "/" + obj.get("full").toString();
	}

	public int getKey() {
		return key;
	}

	public void setKey(int key) {
		this.key = key;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getSkins() {
		return skins;
	}

	public void setSkins(String skins) {
		this.skins = skins;
	}

	public String getLore() {
		return lore;
	}

	public void setLore(String lore) {
		this.lore = lore;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getStats() {
		return stats;
	}

	public void setStats(String stats) {
		this.stats = stats;
	}

	public String getPassive() {
		return passive;
	}

	public void setPassive(String passive) {
		this.passive = passive;
	}

	public String getSpellQ() {
		return spellQ;
	}

	public void setSpellQ(String spellQ) {
		this.spellQ = spellQ;
	}

	public String getSpellW() {
		return spellW;
	}

	public void setSpellW(String spellW) {
		this.spellW = spellW;
	}

	public String getSpellE() {
		return spellE;
	}

	public void setSpellE(String spellE) {
		this.spellE = spellE;
	}

	public String getSpellR() {
		return spellR;
	}

	public void setSpellR(String spellR) {
		this.spellR = spellR;
	}

	
}

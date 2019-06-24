package com.spring.riot.vo;

import org.json.simple.JSONObject;

import com.spring.test.MyJSON;

public class RankVo {
	private int idx;
	private String leagueId;
	private String queueType;
	private String tier;
	private String rank;
	private String summonerId;
	private String summonerName;
	private int leaguePoints;
	private int wins;
	private int losses;
	private String veteran;
	private String inactive;
	private String freshBlood;
	private String hotStreak;
	private String miniSeries;

	public RankVo() {}
	
	public RankVo(String leagueId, String queueType, String tier, String rank, String summonerId, String summonerName,
			int leaguePoints, int wins, int losses, String veteran, String inactive, String freshBlood,
			String hotStreak, String miniSeries) {
		this.leagueId = leagueId;
		this.queueType = queueType;
		this.tier = tier;
		this.rank = rank;
		this.summonerId = summonerId;
		this.summonerName = summonerName;
		this.leaguePoints = leaguePoints;
		this.wins = wins;
		this.losses = losses;
		this.veteran = veteran;
		this.inactive = inactive;
		this.freshBlood = freshBlood;
		this.hotStreak = hotStreak;
		this.miniSeries = miniSeries;
	}
	
	public RankVo(JSONObject obj) {
		this.summonerName = MyJSON.toString(obj.get("summonerName"));
		this.leaguePoints = MyJSON.toInteger(obj.get("leaguePoints"));
		this.wins = MyJSON.toInteger(obj.get("wins"));
		this.losses = MyJSON.toInteger(obj.get("losses"));
	}

	@Override
	public String toString() {
		return "RankVo [leagueId=" + leagueId + ", queueType=" + queueType + ", tier=" + tier + ", rank=" + rank
				+ ", summonerId=" + summonerId + ", summonerName=" + summonerName + ", leaguePoints=" + leaguePoints
				+ ", wins=" + wins + ", losses=" + losses + ", veteran=" + veteran + ", inactive=" + inactive
				+ ", freshBlood=" + freshBlood + ", hotStreak=" + hotStreak + ", miniSeries=" + miniSeries + "]";
	}

	public String getLeagueId() {
		return leagueId;
	}

	public void setLeagueId(String leagueId) {
		this.leagueId = leagueId;
	}

	public String getQueueType() {
		return queueType;
	}

	public void setQueueType(String queueType) {
		this.queueType = queueType;
	}

	public String getTier() {
		return tier;
	}

	public void setTier(String tier) {
		this.tier = tier;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getSummonerId() {
		return summonerId;
	}

	public void setSummonerId(String summonerId) {
		this.summonerId = summonerId;
	}

	public String getSummonerName() {
		return summonerName;
	}

	public void setSummonerName(String summonerName) {
		this.summonerName = summonerName;
	}

	public int getLeaguePoints() {
		return leaguePoints;
	}

	public void setLeaguePoints(int leaguePoints) {
		this.leaguePoints = leaguePoints;
	}

	public int getWins() {
		return wins;
	}

	public void setWins(int wins) {
		this.wins = wins;
	}

	public int getLosses() {
		return losses;
	}

	public void setLosses(int losses) {
		this.losses = losses;
	}

	public String getVeteran() {
		return veteran;
	}

	public void setVeteran(String veteran) {
		this.veteran = veteran;
	}

	public String getInactive() {
		return inactive;
	}

	public void setInactive(String inactive) {
		this.inactive = inactive;
	}

	public String getFreshBlood() {
		return freshBlood;
	}

	public void setFreshBlood(String freshBlood) {
		this.freshBlood = freshBlood;
	}

	public String getHotStreak() {
		return hotStreak;
	}

	public void setHotStreak(String hotStreak) {
		this.hotStreak = hotStreak;
	}

	public String getMiniSeries() {
		return miniSeries;
	}

	public void setMiniSeries(String miniSeries) {
		this.miniSeries = miniSeries;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

}

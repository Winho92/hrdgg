package com.spring.riot.rank.vo;

public class RankVo {
	private String queueType;
	private MiniSeriesVo miniSeries;	
	private int wins;		
	private int losses;	
	private String rank;			
	private String tier;	
	private int leaguePoints;
	
	public RankVo(String queueType, MiniSeriesVo miniSeries, int wins, int losses, String rank, String tier,
			int leaguePoints) {
		super();
		this.queueType = queueType;
		this.miniSeries = miniSeries;
		this.wins = wins;
		this.losses = losses;
		this.rank = rank;
		this.tier = tier;
		this.leaguePoints = leaguePoints;
	}
	public String getQueueType() {
		return queueType;
	}
	public void setQueueType(String queueType) {
		this.queueType = queueType;
	}
	public MiniSeriesVo getMiniSeries() {
		return miniSeries;
	}
	public void setMiniSeries(MiniSeriesVo miniSeries) {
		this.miniSeries = miniSeries;
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
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getTier() {
		return tier;
	}
	public void setTier(String tier) {
		this.tier = tier;
	}
	public int getLeaguePoints() {
		return leaguePoints;
	}
	public void setLeaguePoints(int leaguePoints) {
		this.leaguePoints = leaguePoints;
	}
	@Override
	public String toString() {
		return "RankVo [queueType=" + queueType + ", miniSeries=" + miniSeries + ", wins=" + wins + ", losses=" + losses
				+ ", rank=" + rank + ", tier=" + tier + ", leaguePoints=" + leaguePoints + "]";
	}
	
	
}

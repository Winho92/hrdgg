package com.spring.riot.rank.vo;

public class MiniSeriesVo {
	private String progress;	
	private int losses;	
	private int target;	
	private int wins;
	public MiniSeriesVo(String progress, int losses, int target, int wins) {
		super();
		this.progress = progress;
		this.losses = losses;
		this.target = target;
		this.wins = wins;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public int getLosses() {
		return losses;
	}
	public void setLosses(int losses) {
		this.losses = losses;
	}
	public int getTarget() {
		return target;
	}
	public void setTarget(int target) {
		this.target = target;
	}
	public int getWins() {
		return wins;
	}
	public void setWins(int wins) {
		this.wins = wins;
	}
	@Override
	public String toString() {
		return "MiniSeriesVo [progress=" + progress + ", losses=" + losses + ", target=" + target + ", wins=" + wins
				+ "]";
	}
	
	
}

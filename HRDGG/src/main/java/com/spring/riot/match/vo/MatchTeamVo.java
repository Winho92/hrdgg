package com.spring.riot.match.vo;

import java.io.IOException;

import org.codehaus.jackson.map.ObjectMapper;

public class MatchTeamVo {
	private boolean firstBlood; // 선취점
	private boolean firstTower; // 포탑 선취점
	private boolean firstRiftHerald; // 전령
	private int towerKills; // 타워 킬수
	private int dragonKills; // 드래곤 킬수
	private int baronKills; // 바론 킬수
	private int inhibitorKills; // 억제기 킬수
	private int teamId; // 팀 Id (100:블루, 200:레드)
	private String win; // 승리 여부('Win', 'False')
	
	
	
	
	public MatchTeamVo(boolean firstBlood, boolean firstTower, boolean firstRiftHerald, int towerKills, int dragonKills,
			int baronKills, int inhibitorKills, int teamId, String win) {
		super();
		this.firstBlood = firstBlood;
		this.firstTower = firstTower;
		this.firstRiftHerald = firstRiftHerald;
		this.towerKills = towerKills;
		this.dragonKills = dragonKills;
		this.baronKills = baronKills;
		this.inhibitorKills = inhibitorKills;
		this.teamId = teamId;
		this.win = win;
	}




	public boolean isFirstBlood() {
		return firstBlood;
	}




	public void setFirstBlood(boolean firstBlood) {
		this.firstBlood = firstBlood;
	}




	public boolean isFirstTower() {
		return firstTower;
	}




	public void setFirstTower(boolean firstTower) {
		this.firstTower = firstTower;
	}




	public boolean isFirstRiftHerald() {
		return firstRiftHerald;
	}




	public void setFirstRiftHerald(boolean firstRiftHerald) {
		this.firstRiftHerald = firstRiftHerald;
	}




	public int getTowerKills() {
		return towerKills;
	}




	public void setTowerKills(int towerKills) {
		this.towerKills = towerKills;
	}




	public int getDragonKills() {
		return dragonKills;
	}




	public void setDragonKills(int dragonKills) {
		this.dragonKills = dragonKills;
	}




	public int getBaronKills() {
		return baronKills;
	}




	public void setBaronKills(int baronKills) {
		this.baronKills = baronKills;
	}




	public int getInhibitorKills() {
		return inhibitorKills;
	}




	public void setInhibitorKills(int inhibitorKills) {
		this.inhibitorKills = inhibitorKills;
	}




	public int getTeamId() {
		return teamId;
	}




	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}




	public String getWin() {
		return win;
	}




	public void setWin(String win) {
		this.win = win;
	}




	@Override
	public String toString() {
		return "MatchTeamVo [firstBlood=" + firstBlood + ", firstTower=" + firstTower + ", firstRiftHerald="
				+ firstRiftHerald + ", towerKills=" + towerKills + ", dragonKills=" + dragonKills + ", baronKills="
				+ baronKills + ", inhibitorKills=" + inhibitorKills + ", teamId=" + teamId + ", win=" + win + "]";
	}




	public String toJSON() {
		try {
			return new ObjectMapper().writeValueAsString(this);
		} catch (IOException e) {
			return "";
		}
	} 
	
}

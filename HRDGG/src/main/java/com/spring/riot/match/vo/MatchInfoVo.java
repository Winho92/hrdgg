package com.spring.riot.match.vo;

import java.io.IOException;

import org.codehaus.jackson.map.ObjectMapper;

import com.spring.riot.mapper.ChampionMapper;
import com.spring.riot.mapper.PerkMapper;
import com.spring.riot.mapper.SummonerSpellMapper;

public class MatchInfoVo {
	private long spell1Id; // 스펠 1
    private long spell2Id; // 스펠 2
    private String spell1Name; // 실제 스펠1 이름
    private String spell2Name; // 실제 스펠2 이름
    private long participantId; // 소환사 10명중 번호
    private String lane; // 포지션
    private long teamId; // 팀 ID (100:블루 200:레드)
	private long visionScore; // 시야 점수
	private long kills; // K
	private long deaths; // D
	private long assists; // A		                
    private long neutralMinionsKilled; // 중립 미니언킬
    private long totalMinionsKilled; // CS킬
    private long totalDamageTaken; // 받은 피해량
    private long wardsKilled; // 와드 제거
    private long visionWardsBoughtInGame; // 제어 와드
    private long item0, item1, item2, item3, item4, item5, item6; // 아이템 (6:장신구)
    private long totalDamageDealtToChampions; // 가한 피해량
    private boolean win; // 승리 여부			                
    private long wardsPlaced; // 와드 설치
    private long goldEarned; // 골드 획득량
    private long champLevel; // 챔피언 레벨
    private long championId; // 챔피언 ID
    private String championName; // 챔피언 이름
    private double grade; // 평점
     
    // 룬정보
    private int statPerk1; // 스텟룬1
    private int statPerk2; // 스텟룬2
    private int statPerk3; // 스테룬3
    
    private int perk0; // 주요룬 빌드 세부룬1
    private String perk0URI; // 주요룬 빌드 세부룬1 경로
    private int perk1; // 주요룬 빌드 세부룬2
    private String perk1URI; // 주요룬 빌드 세부룬2 경로
    private int perk2; // 주요룬 빌드 세부룬3
    private String perk2URI; // 주요룬 빌드 세부룬3 경로
    private int perk3; // 주요룬 빌드 세부룬4
    private String perk3URI; // 주요룬 빌드 세부룬4 경로
    private int perk4; // 부가룬 빌드 세부룬1			
    private String perk4URI; // 부가룬 빌드 세부룬1 경로
    private int perk5; // 부가룬 빌드 세부룬2   		
    private String perk5URI; // 부가룬 빌드 세부룬2 경로
    
    private int perkPrimaryStyle; // 주요룬
    private String perkPrimaryStyleURI; // 주요룬 경로
    private int perkSubStyle; // 부가룬
    private String perkSubStyleURI; // 주요룬 경로  
    
    
	public MatchInfoVo(long spell1Id, long spell2Id, long participantId,
			String lane, long teamId, long visionScore, long kills, long deaths, long assists,
			long neutralMinionsKilled, long totalMinionsKilled, long totalDamageTaken, long wardsKilled, long item0,
			long item1, long item2, long item3, long item4, long item5, long item6, long totalDamageDealtToChampions,
			boolean win, long wardsPlaced, long goldEarned, long champLevel, long championId,
			int statPerk1, int statPerk2, int statPerk3, int perk0, int perk1, int perk2, int perk3, int perk4,
			int perk5, int perkPrimaryStyle, int perkSubStyle, long visionWardsBoughtInGame) {
		this.spell1Id = spell1Id;
		this.spell2Id = spell2Id;
		setSpellName();
		this.participantId = participantId;
		this.lane = lane;
		this.teamId = teamId;
		this.visionScore = visionScore;
		this.kills = kills;
		this.deaths = deaths;
		this.assists = assists;
		this.neutralMinionsKilled = neutralMinionsKilled;
		this.totalMinionsKilled = totalMinionsKilled;
		this.totalDamageTaken = totalDamageTaken;
		this.wardsKilled = wardsKilled;
		this.item0 = item0;
		this.item1 = item1;
		this.item2 = item2;
		this.item3 = item3;
		this.item4 = item4;
		this.item5 = item5;
		this.item6 = item6;
		this.totalDamageDealtToChampions = totalDamageDealtToChampions;
		this.win = win;
		this.wardsPlaced = wardsPlaced;
		this.goldEarned = goldEarned;
		this.champLevel = champLevel;
		this.championId = championId;
		this.championName = ChampionMapper.mapper((int)championId);
		this.statPerk1 = statPerk1;
		this.statPerk2 = statPerk2;
		this.statPerk3 = statPerk3;
		this.perk0 = perk0;
		this.perk1 = perk1;
		this.perk2 = perk2;
		this.perk3 = perk3;
		this.perk4 = perk4;
		this.perk5 = perk5;
		this.perkPrimaryStyle = perkPrimaryStyle;
		this.perkSubStyle = perkSubStyle;
		this.visionWardsBoughtInGame = visionWardsBoughtInGame;
		
		this.perk0URI = PerkMapper.mapper(perk0);
		this.perk1URI = PerkMapper.mapper(perk1);
		this.perk2URI = PerkMapper.mapper(perk2);
		this.perk3URI = PerkMapper.mapper(perk3);
		this.perk4URI = PerkMapper.mapper(perk4);
		this.perk5URI = PerkMapper.mapper(perk5);
		this.perkPrimaryStyleURI = PerkMapper.mapper(perkPrimaryStyle);
		this.perkSubStyleURI = PerkMapper.mapper(perkSubStyle);
		
		this.setGrade();
	}
	
	
	
	public long getVisionWardsBoughtInGame() {
		return visionWardsBoughtInGame;
	}



	public void setVisionWardsBoughtInGame(long visionWardsBoughtInGame) {
		this.visionWardsBoughtInGame = visionWardsBoughtInGame;
	}



	public void setGrade() {
		this.grade = ((double)this.kills + (double)this.assists) / (double)this.deaths;
		this.grade = Math.round(this.grade * 100) / 100.0;
	}
	
	public void setSpellName() {
		this.spell1Name = SummonerSpellMapper.mapper(this.spell1Id);
		this.spell2Name = SummonerSpellMapper.mapper(this.spell2Id);
	}
	
	public long getSpell1Id() {
		return spell1Id;
	}
	public void setSpell1Id(long spell1Id) {
		this.spell1Id = spell1Id;
	}
	public long getSpell2Id() {
		return spell2Id;
	}
	public void setSpell2Id(long spell2Id) {
		this.spell2Id = spell2Id;
	}
	public String getSpell1Name() {
		return spell1Name;
	}
	public String getSpell2Name() {
		return spell2Name;
	}
	public long getParticipantId() {
		return participantId;
	}
	public void setParticipantId(long participantId) {
		this.participantId = participantId;
	}
	public String getLane() {
		return lane;
	}
	public void setLane(String lane) {
		this.lane = lane;
	}
	public long getTeamId() {
		return teamId;
	}
	public void setTeamId(long teamId) {
		this.teamId = teamId;
	}
	public long getVisionScore() {
		return visionScore;
	}
	public void setVisionScore(long visionScore) {
		this.visionScore = visionScore;
	}
	public long getKills() {
		return kills;
	}
	public void setKills(long kills) {
		this.kills = kills;
	}
	public long getDeaths() {
		return deaths;
	}
	public void setDeaths(long deaths) {
		this.deaths = deaths;
	}
	public long getAssists() {
		return assists;
	}
	public void setAssists(long assists) {
		this.assists = assists;
	}
	public long getNeutralMinionsKilled() {
		return neutralMinionsKilled;
	}
	public void setNeutralMinionsKilled(long neutralMinionsKilled) {
		this.neutralMinionsKilled = neutralMinionsKilled;
	}
	public long getTotalMinionsKilled() {
		return totalMinionsKilled;
	}
	public void setTotalMinionsKilled(long totalMinionsKilled) {
		this.totalMinionsKilled = totalMinionsKilled;
	}
	public long getTotalDamageTaken() {
		return totalDamageTaken;
	}
	public void setTotalDamageTaken(long totalDamageTaken) {
		this.totalDamageTaken = totalDamageTaken;
	}
	public long getWardsKilled() {
		return wardsKilled;
	}
	public void setWardsKilled(long wardsKilled) {
		this.wardsKilled = wardsKilled;
	}
	public long getItem0() {
		return item0;
	}
	public void setItem0(long item0) {
		this.item0 = item0;
	}
	public long getItem1() {
		return item1;
	}
	public void setItem1(long item1) {
		this.item1 = item1;
	}
	public long getItem2() {
		return item2;
	}
	public void setItem2(long item2) {
		this.item2 = item2;
	}
	public long getItem3() {
		return item3;
	}
	public void setItem3(long item3) {
		this.item3 = item3;
	}
	public long getItem4() {
		return item4;
	}
	public void setItem4(long item4) {
		this.item4 = item4;
	}
	public long getItem5() {
		return item5;
	}
	public void setItem5(long item5) {
		this.item5 = item5;
	}
	public long getItem6() {
		return item6;
	}
	public void setItem6(long item6) {
		this.item6 = item6;
	}
	public long getTotalDamageDealtToChampions() {
		return totalDamageDealtToChampions;
	}
	public void setTotalDamageDealtToChampions(long totalDamageDealtToChampions) {
		this.totalDamageDealtToChampions = totalDamageDealtToChampions;
	}
	public boolean isWin() {
		return win;
	}
	public void setWin(boolean win) {
		this.win = win;
	}
	public long getWardsPlaced() {
		return wardsPlaced;
	}
	public void setWardsPlaced(long wardsPlaced) {
		this.wardsPlaced = wardsPlaced;
	}
	public long getGoldEarned() {
		return goldEarned;
	}
	public void setGoldEarned(long goldEarned) {
		this.goldEarned = goldEarned;
	}
	public long getChampLevel() {
		return champLevel;
	}
	public void setChampLevel(long champLevel) {
		this.champLevel = champLevel;
	}
	public long getChampionId() {
		return championId;
	}
	public void setChampionId(long championId) {
		this.championId = championId;
	}
	public String getChampionName() {
		return championName;
	}
	public void setChampionName(String championName) {
		this.championName = championName;
	}
	public int getStatPerk1() {
		return statPerk1;
	}
	public void setStatPerk1(int statPerk1) {
		this.statPerk1 = statPerk1;
	}
	public int getStatPerk2() {
		return statPerk2;
	}
	public void setStatPerk2(int statPerk2) {
		this.statPerk2 = statPerk2;
	}
	public int getStatPerk3() {
		return statPerk3;
	}
	public void setStatPerk3(int statPerk3) {
		this.statPerk3 = statPerk3;
	}
	public int getPerk0() {
		return perk0;
	}
	public void setPerk0(int perk0) {
		this.perk0 = perk0;
	}
	public int getPerk1() {
		return perk1;
	}
	public void setPerk1(int perk1) {
		this.perk1 = perk1;
	}
	public int getPerk2() {
		return perk2;
	}
	public void setPerk2(int perk2) {
		this.perk2 = perk2;
	}
	public int getPerk3() {
		return perk3;
	}
	public void setPerk3(int perk3) {
		this.perk3 = perk3;
	}
	public int getPerk4() {
		return perk4;
	}
	public void setPerk4(int perk4) {
		this.perk4 = perk4;
	}
	public int getPerk5() {
		return perk5;
	}
	public void setPerk5(int perk5) {
		this.perk5 = perk5;
	}
	public int getPerkPrimaryStyle() {
		return perkPrimaryStyle;
	}
	public void setPerkPrimaryStyle(int perkPrimaryStyle) {
		this.perkPrimaryStyle = perkPrimaryStyle;
		
	}
	public int getPerkSubStyle() {
		return perkSubStyle;
	}
	public void setPerkSubStyle(int perkSubStyle) {
		this.perkSubStyle = perkSubStyle;
	}
	
	

//	@Override
//	public String toString() {
//		return "[\"spell1Id\":\"" + spell1Id + "\", \"spell2Id\":\"" + spell2Id + "\", \"spell1Name\":\"" + spell1Name
//		+ ", \"spell2Name\":\"" + spell2Name + "\", \"participantId\":\"" + participantId + "\", \"lane\":\"" + lane + "\", \"teamId\":\""
//		+ teamId + "\", \"visionScore\":\"" + visionScore + "\", \"kills\":\"" + kills + "\", \"deaths\":\"" + deaths + "\", \"assists\":\""
//		+ assists + ", neutralMinionsKilled=" + neutralMinionsKilled + ", totalMinionsKilled="
//		+ totalMinionsKilled + "\", \"totalDamageTaken\":\"" + totalDamageTaken + "\", \"wardsKilled\":\"" + wardsKilled
//		+ "\", \"item0\":\"" + item0 + "\", \"item1\":\"" + item1 + "\", \"item2\":\"" + item2 + "\", \"item3\":\"" + item3 + "\", \"item4\":\"" + item4
//		+ "\", \"item5\":\"=" + item5 + "\", \"item6\":\"" + item6 + "\", \"totalDamageDealtToChampions\":\""
//		+ totalDamageDealtToChampions + "\", \"win\":\"" + win + "\", \"wardsPlaced\":\"" + wardsPlaced + "\", \"goldEarned\":\""
//		+ goldEarned + "\", \"champLevel\":\"" + champLevel + "\", \"championId\":\"" + championId + "\", \"championName\":\""
//		+ championName + "\", \"statPerk1\":\"" + statPerk1 + "\", \"statPerk2\":\"" + statPerk2 + "\", \"statPerk3\":\"" + statPerk3
//		+ "\", \"perk0\":\"" + perk0 + "\", \"perk1\":\"" + perk1 + "\", \"perk2\":\"" + perk2 + "\", \"perk3\":\"" + perk3 + "\", \"perk4\":\"" + perk4
//		+ "\", \"perk5\":\"" + perk5 + "\", \"perkPrimaryStyle\":\"" + perkPrimaryStyle + "\", \"perkSubStyle\":\"" + perkSubStyle
//		+ "\"]";
//	}

	public String getPerkPrimaryStyleURI() {
		return perkPrimaryStyleURI;
	}

	public String getPerkSubStyleURI() {
		return perkSubStyleURI;
	}

	public String toJSON() {
		try {
			return new ObjectMapper().writeValueAsString(this);
		} catch (IOException e) {
			return "";
		}
	}



	public double getGrade() {
		return grade;
	}



	public void setGrade(double grade) {
		this.grade = grade;
	}



	public void setSpell1Name(String spell1Name) {
		this.spell1Name = spell1Name;
	}



	public void setSpell2Name(String spell2Name) {
		this.spell2Name = spell2Name;
	}



	public void setPerkPrimaryStyleURI(String perkPrimaryStyleURI) {
		this.perkPrimaryStyleURI = perkPrimaryStyleURI;
	}



	public void setPerkSubStyleURI(String perkSubStyleURI) {
		this.perkSubStyleURI = perkSubStyleURI;
	}



	@Override
	public String toString() {
		return "MatchInfoVo [spell1Id=" + spell1Id + ", spell2Id=" + spell2Id + ", spell1Name=" + spell1Name
				+ ", spell2Name=" + spell2Name + ", participantId=" + participantId + ", lane=" + lane + ", teamId="
				+ teamId + ", visionScore=" + visionScore + ", kills=" + kills + ", deaths=" + deaths + ", assists="
				+ assists + ", neutralMinionsKilled=" + neutralMinionsKilled + ", totalMinionsKilled="
				+ totalMinionsKilled + ", totalDamageTaken=" + totalDamageTaken + ", wardsKilled=" + wardsKilled
				+ ", item0=" + item0 + ", item1=" + item1 + ", item2=" + item2 + ", item3=" + item3 + ", item4=" + item4
				+ ", item5=" + item5 + ", item6=" + item6 + ", totalDamageDealtToChampions="
				+ totalDamageDealtToChampions + ", win=" + win + ", wardsPlaced=" + wardsPlaced + ", goldEarned="
				+ goldEarned + ", champLevel=" + champLevel + ", championId=" + championId + ", championName="
				+ championName + ", grade=" + grade + ", statPerk1=" + statPerk1 + ", statPerk2=" + statPerk2
				+ ", statPerk3=" + statPerk3 + ", perk0=" + perk0 + ", perk0URI=" + perk0URI + ", perk1=" + perk1
				+ ", perk1URI=" + perk1URI + ", perk2=" + perk2 + ", perk2URI=" + perk2URI + ", perk3=" + perk3
				+ ", perk3URI=" + perk3URI + ", perk4=" + perk4 + ", perk4URI=" + perk4URI + ", perk5=" + perk5
				+ ", perk5URI=" + perk5URI + ", perkPrimaryStyle=" + perkPrimaryStyle + ", perkPrimaryStyleURI="
				+ perkPrimaryStyleURI + ", perkSubStyle=" + perkSubStyle + ", perkSubStyleURI=" + perkSubStyleURI + ",]";
	}



	

	
	
	
	
    
}

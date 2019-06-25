package com.spring.riot.match.vo;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

import com.spring.riot.mapper.ChampionMapper;
import com.spring.riot.mapper.PerkMapper;
import com.spring.riot.mapper.QueueMapper;
import com.spring.riot.mapper.SummonerSpellMapper;
import com.spring.riot.rank.vo.RankVo;

public class MatchVo {	
	// Match 데이터
	private long gameId; // 해당 게임 ID
	private String lane; // 포지션
	private long champion; // 챔피언 Id
	private String championName; // 실제 챔피언 이름
	private long season; // 시즌 정보
	private long timestamp; // 타임 스탬프	
	private long queue; // 큐타입
	private String queueName; // 큐타입 실제 이름
	private long gameCreation; // 게임 시작시간
	private long gameDuration; // 게임 지속시간
	private int gameDurationMin; // 게임 지속시간 분
	private int gameDurationSec; // 게임 지속시간 초
	private String gameDurationStr; // 게임 지속시간 분, 초
	private RankVo teamRankVo; // 팀랭 정보
	private RankVo soloRankVo; // 솔랭 정보
	
	// Match 세부정보
	private HashMap<String, MatchInfoVo> matchMap;
	private long participantId; // 해당 Match 에서 자신의 순서
	private long spell1Id; // 해당 Match 에서 자신의 스펠 1
    private long spell2Id; // 해당 Match 에서 자신의 스펠 2
    private String spell1Name; // 실제 스펠1 이름
    private String spell2Name; // 실제 스펠2 이름
    private boolean win;  // 승리 여부
    private long teamId;  // 팀 아이디 (100:블루 200:레드)
    private long kills;   // 킬
	private long deaths;  // 데스   	
	private long assists; // 어시스트
	private double grade; // 평점
	private long champLevel; // 챔피언 레벨
	private long totalMinionsKilled; // CS
	private long item0, item1, item2, item3, item4, item5, item6; // 아이템 (6:장신구)
	private long visionWardsBoughtInGame; // 제어 와드  
	private int btTotalKill; // 블루팀 전체킬
	private int btTotalDeath; // 블루팀 전체데스
	private int btTotalAssist; // 블루팀 전체어시스트
	private int ptTotalKill; // 블루팀 전체킬
	private int ptTotalDeath; // 블루팀 전체데스
	private int ptTotalAssist; // 블루팀 전체어시스트
	private long totalKill; // 팀 전체킬
	private String gameLaterDate; // 경기 종료 날짜
	private String gameLaterTime; // 현재 ~ 경기 종료 시간
	private HashMap<Long, String> teamNames; // 소환사 이름들
	private HashMap<Long, String> championNames; // 챔피언 이름들
	private int largestMultiKill; // 최다 다중킬
	private int doubleKills; // 더블킬
	private int tripleKills; // 트리플킬
	private int quadraKills; // 쿼드라킬	
	private int pentaKills; // 펜타킬
	private int kpRate; // Kill Participation Rate 킬 관여율
	private long goldEarned; // 골드 획득량
	private String goldEarnedStr; // 골드 획득량 ',' 구분
	private double csPerMin; // 분당 CS
	private long wardsPlaced; // 와드 설치수
	private long wardsKilled; // 와드 재거수
	private long maxTotalDamageTaken; // 게임 내 최대 받은 피해량
	private long maxTotalDamageDealtToChampions; // 게임 내 최대 가한 피해량
	
	// 룬정보
    private int statPerk0; // 스테룬0
    private String statPerk0URI; // 스텟룬0 이미지 경로
    private int statPerk1; // 스텟룬1
    private String statPerk1URI; // 스텟룬1 이미지 경로
    private int statPerk2; // 스텟룬2
    private String statPerk2URI; // 스텟룬2 이미지 경로
    
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
    
    private MatchTeamVo blueTeamVo; // 파랑팀 정보
    private MatchTeamVo purpleTeamVo; // 빨강팀 정보
	
    
	public MatchVo(long gameId, String lane, long champion, long season, long timestamp, long queue,
			long participantId, long gameCreation, long gameDuration,
			RankVo teamRankVo, RankVo soloRankVo, MatchTeamVo blueTeamVo,
			MatchTeamVo purpleTeamVo ) {
		super();
		this.gameId = gameId;
		this.lane = lane;
		this.champion = champion;
		this.season = season;
		this.timestamp = timestamp;
		this.queue = queue;
		this.participantId = participantId;
		this.gameCreation = gameCreation;
		this.gameDuration = gameDuration;
		this.championName = ChampionMapper.mapper(champion);	
		this.teamRankVo = teamRankVo;
		this.soloRankVo = soloRankVo;
		this.blueTeamVo = blueTeamVo;
		this.purpleTeamVo = purpleTeamVo;
		
		this.gameDurationMin = (int) (this.gameDuration / 60);
		this.gameDurationSec = (int) this.gameDuration % 60;
		
		this.gameDurationStr = "";
		if(gameDurationMin != 0)
			this.gameDurationStr += gameDurationMin + "분 ";
		if(gameDurationSec != 0)
			this.gameDurationStr += gameDurationSec + "초";

		SimpleDateFormat format = new SimpleDateFormat("YY년MM월dd일 HH시mm분");		
		Date date = new Date();
		this.gameLaterDate = format.format(date);
		
		long currentTimeMillis = System.currentTimeMillis();
		long gameTimeMillis = gameCreation + (gameDuration * 1000);
		long gameTimeSeconds = (currentTimeMillis - gameTimeMillis) / 1000;
		
		if(gameTimeSeconds < 60) // 1분
			this.gameLaterTime = gameTimeSeconds + "초 전";
		else if(gameTimeSeconds < 3600) // 1시간
			this.gameLaterTime = ((int)Math.floor(gameTimeSeconds / 60.0)) + "분 전";
		else if(gameTimeSeconds < 3600 * 24) // 1일 
			this.gameLaterTime = ((int)Math.floor(gameTimeSeconds / 3600.0)) + "시간 전";
		else if(gameTimeSeconds < 3600 * 24 * 30) // 1달
			this.gameLaterTime = ((int)Math.floor(gameTimeSeconds / 3600.0 / 24.0)) + "일 전";
		else if(gameTimeSeconds < 3600 * 24 * 30 * 12) // 1년
			this.gameLaterTime = ((int)Math.floor(gameTimeSeconds / 3600.0 / 24.0 / 30)) + "달 전";
		else 
			this.gameLaterTime = ((int)Math.floor(gameTimeSeconds / 3600.0 / 24.0 / 30 / 12)) + "년 전";	
		this.queueName = QueueMapper.mapper(queue);
		this.teamNames = new HashMap<Long, String>();
		this.championNames = new HashMap<Long, String>();
	}
	
	public String getStatPerk1URI() {
		return statPerk1URI;
	}

	public String getStatPerk2URI() {
		return statPerk2URI;
	}

	public String getStatPerk0URI() {
		return statPerk0URI;
	}

	public String getPerk0URI() {
		return perk0URI;
	}

	public String getPerk1URI() {
		return perk1URI;
	}

	public String getPerk2URI() {
		return perk2URI;
	}

	public String getPerk3URI() {
		return perk3URI;
	}

	public String getPerk4URI() {
		return perk4URI;
	}

	public String getPerk5URI() {
		return perk5URI;
	}

	public String getPerkPrimaryStyleURI() {
		return perkPrimaryStyleURI;
	}

	public String getPerkSubStyleURI() {
		return perkSubStyleURI;
	}

	public int getStatPerk1() {
		return statPerk1;
	}
	public void setStatPerk1(int statPerk1) {
		this.statPerk1 = statPerk1;
		this.statPerk1URI = PerkMapper.mapper(statPerk1);
	}
	public int getStatPerk2() {
		return statPerk2;
	}
	public void setStatPerk2(int statPerk2) {
		this.statPerk2 = statPerk2;
		this.statPerk2URI = PerkMapper.mapper(statPerk2);
	}
	public int getStatPerk0() {
		return statPerk0;
	}
	public void setStatPerk0(int statPerk3) {
		this.statPerk0 = statPerk3;
		this.statPerk0URI = PerkMapper.mapper(statPerk3);
	}
	public int getPerk0() {
		return perk0;
	}
	public void setPerk0(int perk0) {
		this.perk0 = perk0;
		this.perk0URI = PerkMapper.mapper(perk0);
	}
	public int getPerk1() {
		return perk1;
	}
	public void setPerk1(int perk1) {
		this.perk1 = perk1;
		this.perk1URI = PerkMapper.mapper(perk1);
	}
	public int getPerk2() {
		return perk2;
	}
	public void setPerk2(int perk2) {
		this.perk2 = perk2;
		this.perk2URI = PerkMapper.mapper(perk2);
	}
	public int getPerk3() {
		return perk3;
	}
	public void setPerk3(int perk3) {
		this.perk3 = perk3;
		this.perk3URI = PerkMapper.mapper(perk3);
	}
	public int getPerk4() {
		return perk4;
	}
	public void setPerk4(int perk4) {
		this.perk4 = perk4;
		this.perk4URI = PerkMapper.mapper(perk4);
	}
	public int getPerk5() {
		return perk5;
	}
	public void setPerk5(int perk5) {
		this.perk5 = perk5;
		this.perk5URI = PerkMapper.mapper(perk5);
	}
	public int getPerkPrimaryStyle() {
		return perkPrimaryStyle;
	}
	public void setPerkPrimaryStyle(int perkPrimaryStyle) {
		this.perkPrimaryStyle = perkPrimaryStyle;
		this.perkPrimaryStyleURI = PerkMapper.mapper(perkPrimaryStyle);
	}
	public int getPerkSubStyle() {
		return perkSubStyle;
	}
	public void setPerkSubStyle(int perkSubStyle) {
		this.perkSubStyle = perkSubStyle;
		this.perkSubStyleURI = PerkMapper.mapper(perkSubStyle);
	}
	public RankVo getTeamRankVo() {
		return teamRankVo;
	}
	public RankVo getSoloRankVo() {
		return soloRankVo;
	}
	public long getWardsPlaced() {
		return wardsPlaced;
	}
	public void setWardsPlaced(long wardsPlaced) {
		this.wardsPlaced = wardsPlaced;
	}
	public long getWardsKilled() {
		return wardsKilled;
	}
	public void setWardsKilled(long wardsKilled) {
		this.wardsKilled = wardsKilled;
	}
	public int getLargestMultiKill() {
		return largestMultiKill;
	}
	public void setLargestMultiKill(int largestMultiKill) {
		this.largestMultiKill = largestMultiKill;
	}
	public String getGoldEarnedStr() {
		return goldEarnedStr;
	}
	public long getGoldEarned() {
		return goldEarned;
	}
	public void setGoldEarned(long goldEarned) {
		this.goldEarned = goldEarned;
		this.goldEarnedStr = new DecimalFormat("###,###").format((int)goldEarned);
	}
	public String getGameDurationStr() {
		return gameDurationStr;
	}
	public int getKpRate() {
		return kpRate;
	}
	public void setKpRate() {
		this.kpRate = (int) Math.round(((double)(this.kills + this.assists) / (double)this.totalKill) * 100);
		
	}
	public int getDoubleKills() {
		return doubleKills;
	}
	public void setDoubleKills(int doubleKills) {
		this.doubleKills = doubleKills;
	}
	public int getTripleKills() {
		return tripleKills;
	}
	public void setTripleKills(int tripleKills) {
		this.tripleKills = tripleKills;
	}
	public int getQuadraKills() {
		return quadraKills;
	}
	public void setQuadraKills(int quadraKills) {
		this.quadraKills = quadraKills;
	}
	public int getPentaKills() {
		return pentaKills;
	}
	public void setPentaKills(int pentaKills) {
		this.pentaKills = pentaKills;
	}
	public String getQueueName() {
		return queueName;
	}
	public void setGrade() {
		this.grade = ((double)this.kills + (double)this.assists) / (double)this.deaths;
		this.grade = Math.round(this.grade * 100) / 100.0;
	}

	public double getGrade() {
		return grade;
	}



	public HashMap<Long, String> getTeamNames() {
		return teamNames;
	}



	public HashMap<Long, String> getChampionNames() {
		return championNames;
	}
	
	public void setChampionNames() {
		Iterator<String> it = matchMap.keySet().iterator();
		while(it.hasNext()) {
			String tempName = (String) it.next();
			MatchInfoVo tempInfo = matchMap.get(tempName);
			long tempPID = tempInfo.getParticipantId();
			String championName = tempInfo.getChampionName();
			championNames.put(tempPID, championName);			
		}
	}
	
	public void setTeamNames() {
		Iterator<String> it = matchMap.keySet().iterator();
		while(it.hasNext()) {
			String tempName = (String) it.next();
			MatchInfoVo tempInfo = matchMap.get(tempName);			
			long tempPID = tempInfo.getParticipantId();
			teamNames.put(tempPID, tempName);
		}
	}
	
	public void setSpellName() {
		this.spell1Name = SummonerSpellMapper.mapper(this.spell1Id);
		this.spell2Name = SummonerSpellMapper.mapper(this.spell2Id);
	}
	
	public String getSpell1Name() {
		return spell1Name;
	}

	public String getSpell2Name() {
		return spell2Name;
	}
	
	public long getGameId() {
		return gameId;
	}
	public void setGameId(long gameId) {
		this.gameId = gameId;
	}
	public String getLane() {
		return lane;
	}
	public void setLane(String lane) {
		this.lane = lane;
	}
	public long getChampion() {
		return champion;
	}
	public void setChampion(long champion) {
		this.champion = champion;
	}
	public String getChampionName() {
		return championName;
	}
	public void setChampionName(String championName) {
		this.championName = championName;
	}
	public long getSeason() {
		return season;
	}
	public void setSeason(long season) {
		this.season = season;
	}
	public long getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}
	public long getQueue() {
		return queue;
	}
	public void setQueue(long queue) {
		this.queue = queue;
	}
	public HashMap<String, MatchInfoVo> getMatchMap() {
		return matchMap;
	}
	public void setMatchMap(HashMap<String, MatchInfoVo> matchMap) {
		this.matchMap = matchMap;
	}
	public long getParticipantId() {
		return participantId;
	}
	public void setParticipantId(long participantId) {
		this.participantId = participantId;
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
	
	public void setTeamId(long teamId) {
		this.teamId = teamId;
		
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
	public void setChampionLevel(long champLevel) {
		this.champLevel = champLevel;
		
	}
	public void setTotalMinionsKilled(long totalMinionsKilled) {
		this.totalMinionsKilled = totalMinionsKilled;
		
		this.csPerMin = Math.round((double) this.totalMinionsKilled / (double) this.gameDurationMin * 10) / 10.0;
		
	}
	
	
	
	public double getCsPerMin() {
		return csPerMin;
	}



	public void setItems(long item0, long item1, long item2, long item3,
			long item4, long item5, long item6) {
		this.item0 = item0;
		this.item1 = item1;
		this.item2 = item2;
		this.item3 = item3;
		this.item4 = item4;
		this.item5 = item5;
		this.item6 = item6;
		
	}
	
	
	public long getMaxTotalDamageTaken() {
		return maxTotalDamageTaken;
	}

	public void setMaxTotalDamageTaken(long maxTotalDamageTaken) {
		this.maxTotalDamageTaken = maxTotalDamageTaken;
	}

	public long getMaxTotalDamageDealtToChampions() {
		return maxTotalDamageDealtToChampions;
	}

	public void setMaxTotalDamageDealtToChampions(long maxTotalDamageDealtToChampions) {
		this.maxTotalDamageDealtToChampions = maxTotalDamageDealtToChampions;
	}

	public void setVisionWardsBoughtInGame(long visionWardsBoughtInGame) {
		this.visionWardsBoughtInGame = visionWardsBoughtInGame;
		
	}
	public long getGameCreation() {
		return gameCreation;
	}
	public long getGameDuration() {
		return gameDuration;
	}	
	public boolean isWin() {
		return win;
	}
	public long getTeamId() {
		return teamId;
	}
	public long getChampLevel() {
		return champLevel;
	}
	public long getTotalMinionsKilled() {
		return totalMinionsKilled;
	}
	public long getItem0() {
		return item0;
	}
	public long getItem1() {
		return item1;
	}
	public long getItem2() {
		return item2;
	}
	public long getItem3() {
		return item3;
	}
	public long getItem4() {
		return item4;
	}
	public long getItem5() {
		return item5;
	}	
	public long getItem6() {
		return item6;
	}
	public long getVisionWardsBoughtInGame() {
		return visionWardsBoughtInGame;
	}
	public void setTotalKill(int totalKill) {
		this.totalKill = totalKill;		
		setKpRate();
	}
	public long getTotalKill() {
		return totalKill;
	}
	public String getGameLaterTime() {
		return gameLaterTime;
	}
	public String getGameLaterDate() {
		return gameLaterDate;
	}
	public void setWin(boolean win) {
		this.win = win;
		
	}	
	
	

	public int getBtTotalDeath() {
		return btTotalDeath;
	}

	public void setBtTotalDeath(int btTotalDeath) {
		this.btTotalDeath = btTotalDeath;
	}

	public int getBtTotalAssist() {
		return btTotalAssist;
	}

	public void setBtTotalAssist(int btTotalAssist) {
		this.btTotalAssist = btTotalAssist;
	}

	public int getPtTotalDeath() {
		return ptTotalDeath;
	}

	public void setPtTotalDeath(int ptTotalDeath) {
		this.ptTotalDeath = ptTotalDeath;
	}

	public int getPtTotalAssist() {
		return ptTotalAssist;
	}

	public void setPtTotalAssist(int ptTotalAssist) {
		this.ptTotalAssist = ptTotalAssist;
	}

	public int getBtTotalKill() {
		return btTotalKill;
	}

	public void setBtTotalKill(int btTotalKill) {
		this.btTotalKill = btTotalKill;
	}

	public int getPtTotalKill() {
		return ptTotalKill;
	}

	public void setPtTotalKill(int ptTotalKill) {
		this.ptTotalKill = ptTotalKill;
	}

	public MatchTeamVo getBlueTeamVo() {
		return blueTeamVo;
	}

	public MatchTeamVo getPurpleTeamVo() {
		return purpleTeamVo;
	}
	
	

	public int getGameDurationMin() {
		return gameDurationMin;
	}

	@Override
	public String toString() {
		return "MatchVo [gameId=" + gameId + ", lane=" + lane + ", champion=" + champion + ", championName="
				+ championName + ", season=" + season + ", timestamp=" + timestamp + ", queue=" + queue + ", queueName="
				+ queueName + ", gameCreation=" + gameCreation + ", gameDuration=" + gameDuration + ", gameDurationMin="
				+ gameDurationMin + ", gameDurationSec=" + gameDurationSec + ", gameDurationStr=" + gameDurationStr
				+ ", teamRankVo=" + teamRankVo + ", soloRankVo=" + soloRankVo + ", matchMap=" + matchMap
				+ ", participantId=" + participantId + ", spell1Id=" + spell1Id + ", spell2Id=" + spell2Id
				+ ", spell1Name=" + spell1Name + ", spell2Name=" + spell2Name + ", win=" + win + ", teamId=" + teamId
				+ ", kills=" + kills + ", deaths=" + deaths + ", assists=" + assists + ", grade=" + grade
				+ ", champLevel=" + champLevel + ", totalMinionsKilled=" + totalMinionsKilled + ", item0=" + item0
				+ ", item1=" + item1 + ", item2=" + item2 + ", item3=" + item3 + ", item4=" + item4 + ", item5=" + item5
				+ ", item6=" + item6 + ", visionWardsBoughtInGame=" + visionWardsBoughtInGame + ", totalKill="
				+ totalKill + ", gameLaterDate=" + gameLaterDate + ", gameLaterTime=" + gameLaterTime + ", teamNames="
				+ teamNames + ", championNames=" + championNames + ", largestMultiKill=" + largestMultiKill
				+ ", doubleKills=" + doubleKills + ", tripleKills=" + tripleKills + ", quadraKills=" + quadraKills
				+ ", pentaKills=" + pentaKills + ", kpRate=" + kpRate 
				+ ", goldEarnedStr=" + goldEarnedStr + ", csPerMin=" + csPerMin + ", wardsPlaced=" + wardsPlaced
				+ ", wardsKilled=" + wardsKilled + ", statPerk1=" + statPerk1 + ", statPerk1URI=" + statPerk1URI
				+ ", statPerk2=" + statPerk2 + ", statPerk2URI=" + statPerk2URI + ", statPerk0=" + statPerk0
				+ ", statPerk0URI=" + statPerk0URI + ", perk0=" + perk0 + ", perk0URI=" + perk0URI + ", perk1=" + perk1
				+ ", perk1URI=" + perk1URI + ", perk2=" + perk2 + ", perk2URI=" + perk2URI + ", perk3=" + perk3
				+ ", perk3URI=" + perk3URI + ", perk4=" + perk4 + ", perk4URI=" + perk4URI + ", perk5=" + perk5
				+ ", perk5URI=" + perk5URI + ", perkPrimaryStyle=" + perkPrimaryStyle + ", perkPrimaryStyleURI="
				+ perkPrimaryStyleURI + ", perkSubStyle=" + perkSubStyle + ", perkSubStyleURI=" + perkSubStyleURI + ", goldEarned=" + goldEarned + "]";
	}   
	
}

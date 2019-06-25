package com.spring.riot.mapper;

public class SummonerSpellMapper {
	public static String mapper(long spellId) {
		switch((int) spellId) {
		case 21:
			return "SummonerBarrier";
		case 1:
			return "SummonerBoost";
		case 35:
			return "SummonerDarkStarChampSelect1";
		case 36:
			return "SummonerDarkStarChampSelect2";
		case 14:
			return "SummonerDot";
		case 3:
			return "SummonerExhaust";
		case 4:
			return "SummonerFlash";
		case 6:
			return "SummonerHaste";
		case 7:
			return "SummonerHeal";
		case 13:
			return "SummonerMana";
		case 52:
			return "SummonerOdysseyFlash";
		case 51:
			return "SummonerOdysseyGhost";
		case 50:
			return "SummonerOdysseyRevive";
		case 30:
			return "SummonerPoroRecall";
		case 31:
			return "SummonerPoroThrow";
		case 33:
			return "SummonerSiegeChampSelect1";
		case 34:
			return "SummonerSiegeChampSelect2";
		case 11:
			return "SummonerSmite";
		case 39:
			return "SummonerSnowURFSnowball_Mark";
		case 32:
			return "SummonerSnowball";
		case 12:
			return "SummonerTeleport";
		default :
				return null; 
		}
	}
}

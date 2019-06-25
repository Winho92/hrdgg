package com.spring.riot.mapper;

public class QueueMapper {
	public static String mapper(long queue) {
		switch((int) queue) {
		case 0:
			return "Custom games";
		case 72:
			return "Howling Abyss	1v1 Snowdown Showdown games	";
		case 73:
			return "Howling Abyss	2v2 Snowdown Showdown games	";
		case 75:
			return "Summoner's Rift	6v6 Hexakill games";
		case 76:
			return "Summoner's Rift	Ultra Rapid Fire games";
		case 78:
			return "Howling Abyss	One For All: Mirror Mode games";
		case 83:
			return "Summoner's Rift	Co-op vs AI Ultra Rapid Fire games";
		case 98:
			return "Twisted Treeline	6v6 Hexakill games";
		case 100:
			return "Butcher's Bridge	5v5 ARAM games";
		case 310:
			return "Summoner's Rift	Nemesis games";
		case 313:
			return "Summoner's Rift	Black Market Brawlers games";
		case 317:
			return "Crystal Scar	Definitely Not Dominion games";
		case 325:
			return "Summoner's Rift	All Random games";
		case 400:
			return "Summoner's Rift	5v5 Draft Pick games";
		case 420:
			return "랭크"; // Summoner's Rift	5v5 Ranked Solo games
		case 430:
			return "일반"; // Summoner's Rift	5v5 Blind Pick games
		case 440:
			return "자유랭크";	// Summoner's Rift	5v5 Ranked Flex games		
		case 450:
			return "총력전"; // Howling Abyss	5v5 ARAM games
		case 460:
			return "Twisted Treeline	3v3 Blind Pick games";
		case 470:
			return "Twisted Treeline	3v3 Ranked Flex games";
		case 600:
			return "Summoner's Rift	Blood Hunt Assassin games";
		case 610:
			return "Cosmic Ruins	Dark Star: Singularity games";
		case 700:
			return "Summoner's Rift	Clash games";
		case 800:
			return "Twisted Treeline	Co-op vs. AI Intermediate Bot games";
		case 810:
			return "Twisted Treeline	Co-op vs. AI Intro Bot games";
		case 820:
			return "Twisted Treeline	Co-op vs. AI Beginner Bot games";
		case 830:
			return "Summoner's Rift	Co-op vs. AI Intro Bot games";
		case 840:
			return "Summoner's Rift	Co-op vs. AI Beginner Bot games";
		case 850:
			return "Summoner's Rift	Co-op vs. AI Intermediate Bot games";
		case 900:
			return "Summoner's Rift	ARURF games";
		case 910:
			return "Crystal Scar	Ascension games";
		case 920:
			return "Howling Abyss	Legend of the Poro King games";
		case 940:
			return "Summoner's Rift	Nexus Siege games";
		case 950:
			return "Summoner's Rift	Doom Bots Voting games";
		case 960:
			return "Summoner's Rift	Doom Bots Standard games";
		case 980:
			return "Valoran City Park	Star Guardian Invasion: Normal games";
		case 990:
			return "Valoran City Park	Star Guardian Invasion: Onslaught games";
		case 1000:
			return "Overcharge	PROJECT: Hunters games";
		case 1010:
			return "Summoner's Rift	Snow ARURF games";
		case 1020:
			return "Summoner's Rift	One for All games";
		case 1030:
			return "Crash Site	Odyssey Extraction: Intro games";
		case 1040:
			return "Crash Site	Odyssey Extraction: Cadet games";
		case 1050:
			return "Crash Site	Odyssey Extraction: Crewmember games";
		case 1060:
			return "Crash Site	Odyssey Extraction: Captain games";
		case 1070:
			return "Crash Site	Odyssey Extraction: Onslaught games";
		default:
			return null;
		}
	}
}



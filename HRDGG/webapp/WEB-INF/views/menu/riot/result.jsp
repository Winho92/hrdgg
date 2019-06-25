<!--
	88        88 888888888ba,  8888888ba,       ,ad8888ba,    ,ad8888ba,
	88        88 88       "8b  88      ba,     d8"'    `"8b  d8"'    `"8b
	88        88 88       ,8P  88       ba,   d8'           d8'
	88aaaaaaaa88 88aaaaaaa8P'  88       "8b   88            88
	88""""""""88 88    Y8a.    88       ,8P   88      88888 88      88888
	88        88 88     Y8a.   88       8P'   Y8,        88 Y8,        88
	88        88 88      Y8a.  88      8P'     Y8a.    .a88  Y8a.    .a88
	88        88 88       Y8a. 88888888P'   @   `"Y88888P"    `"Y88888P"
	
			 Copyright © 2019 HRD.GG. All rights reserved.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<link rel="stylesheet" href="http://z.fow.kr/css/style.css?20171222"
	type="text/css">
<link rel="stylesheet" href="http://z.fow.kr/css/new.css?20150711"
	type="text/css">
<link rel="stylesheet" href="http://z.fow.kr/css/news.css?20150703"
	type="text/css">
<link rel="stylesheet" href="http://z.fow.kr/css/neo.css?2"
	type="text/css">
<link rel="stylesheet"
	href="http://z.fow.kr/css/ui-lightness/jquery-ui-1.8.18.custom.css?20150702"
	type="text/css">
<link rel="stylesheet"
	href="http://z.fow.kr/css/jquery.tipsy.css?20150702" type="text/css">
<link rel="stylesheet"
	href="http://z.fow.kr/css/nanum-font.css?20170819" type="text/css">

<title>소환사 검색 :: HRD.GG</title>
<link rel="shortcut icon" href="/img/favicon.ico"/>
<style>
html, body {
	margin: 0;
	height: 100%;
}

.profile {
	background-color: #fff;
	background-image: url(//z.fow.kr/img/profile_bg.png);
	background-image: -webkit-gradient(linear, 0 0, 0 100%, color-stop(0, #ccc),
		color-stop(0.02, #ddd), color-stop(1, #fff));
	background-image: -moz-linear-gradient(top, #aaa, #eee 2%, #ccc);
	background-image: -o-linear-gradient(top, #aaa, #eee 2%, #ccc);
	width: 802px;
	height: 67px;
	text-align: left;
	position: relative;
	padding: 3px;
	border: 1px solid silver;
}

.recent_td:not (.recent_champ ):not (.tipsy_live ) img {
	display: block;
	float: left;
}

.p-bar {
	margin: 5px;
	border: 1px solid gray;
}

.p-fill {
	height: 8px;
}

footer {
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	color: black;
	text-align: center;
	padding-bottom: 20px;
}

#home {
	background: #EAEAEA;
	min-width: 1080px;
	min-height: 100%;
	position: relative;
	overflow: hidden;
}

.container {
	height:100%;
	padding-top: 30px;
	width: 830px;
	margin: 0 auto;
	position: relative;
	min-height: 700px;
	padding-bottom: 120px;
}

.mi_item img {
	display: block;
	float: left;
}

.mi_rune img {
	display: block;
	float: left;
}

.my_matchlist img {
	display: block;
	float: left;
}
</style>

<link rel="stylesheet" type="text/css" href="/css/header.css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {

		$('.spec_list_name').mouseenter(function() {
			$(this).children('span').css('text-decoration', "underline");
			$(this).click(function() {
				var summonerName = $(this).children('span').text();
				summonerName = $.trim(summonerName);

				window.location = '/Search?summonerName=' + summonerName;
			});
		});

		$('.spec_list_name').mouseleave(function() {
			$(this).children('span').css('text-decoration', "none");
		});

		var perkPriList = [ '/img/perk-images/Styles/7200_Domination.png',
				'/img/perk-images/Styles/7203_Whimsy.png',
				'/img/perk-images/Styles/7201_Precision.png',
				'/img/perk-images/Styles/7204_Resolve.png',
				'/img/perk-images/Styles/7202_Sorcery.png' ];
		var perkList = [
				// 0 ~ 13 Domination
				'/img/perk-images/Styles/Domination/Electrocute/Electrocute.png',
				'/img/perk-images/Styles/Domination/Predator/Predator.png',
				'/img/perk-images/Styles/Domination/DarkHarvest/DarkHarvest.png',
				'/img/perk-images/Styles/Domination/HailOfBlades/HailOfBlades.png',
				'/img/perk-images/Styles/Domination/CheapShot/CheapShot.png',
				'/img/perk-images/Styles/Domination/TasteOfBlood/GreenTerror_TasteOfBlood.png',
				'/img/perk-images/Styles/Domination/SuddenImpact/SuddenImpact.png',
				'/img/perk-images/Styles/Domination/ZombieWard/ZombieWard.png',
				'/img/perk-images/Styles/Domination/GhostPoro/GhostPoro.png',
				'/img/perk-images/Styles/Domination/EyeballCollection/EyeballCollection.png',
				'/img/perk-images/Styles/Domination/RavenousHunter/RavenousHunter.png',
				'/img/perk-images/Styles/Domination/IngeniousHunter/IngeniousHunter.png',
				'/img/perk-images/Styles/Domination/RelentlessHunter/RelentlessHunter.png',
				'/img/perk-images/Styles/Domination/UltimateHunter/UltimateHunter.png',

				// 14 ~ 27 Inspiration
				'/img/perk-images/Styles/Inspiration/GlacialAugment/GlacialAugment.png',
				'/img/perk-images/Styles/Inspiration/Kleptomancy/Kleptomancy.png',
				'/img/perk-images/Styles/Inspiration/UnsealedSpellbook/UnsealedSpellbook.png',
				'',
				'/img/perk-images/Styles/Inspiration/HextechFlashtraption/HextechFlashtraption.png',
				'/img/perk-images/Styles/Inspiration/MagicalFootwear/MagicalFootwear.png',
				'/img/perk-images/Styles/Inspiration/PerfectTiming/PerfectTiming.png',
				'/img/perk-images/Styles/Inspiration/FuturesMarket/FuturesMarket.png',
				'/img/perk-images/Styles/Inspiration/MinionDematerializer/MinionDematerializer.png',
				'/img/perk-images/Styles/Inspiration/BiscuitDelivery/BiscuitDelivery.png',
				'/img/perk-images/Styles/Inspiration/CosmicInsight/CosmicInsight.png',
				'/img/perk-images/Styles/Resolve/ApproachVelocity/ApproachVelocity.png',
				'/img/perk-images/Styles/Inspiration/TimeWarpTonic/TimeWarpTonic.png',
				'',

				// 28 ~ 41 Precision
				'/img/perk-images/Styles/Precision/PressTheAttack/PressTheAttack.png',
				'/img/perk-images/Styles/Precision/LethalTempo/LethalTempoTemp.png',
				'/img/perk-images/Styles/Precision/FleetFootwork/FleetFootwork.png',
				'/img/perk-images/Styles/Precision/Conqueror/Conqueror.png',
				'/img/perk-images/Styles/Precision/Overheal.png',
				'/img/perk-images/Styles/Precision/Triumph.png',
				'/img/perk-images/Styles/Precision/PresenceOfMind/PresenceOfMind.png',
				'/img/perk-images/Styles/Precision/LegendAlacrity/LegendAlacrity.png',
				'/img/perk-images/Styles/Precision/LegendTenacity/LegendTenacity.png',
				'/img/perk-images/Styles/Precision/LegendBloodline/LegendBloodline.png',
				'/img/perk-images/Styles/Precision/CoupDeGrace/CoupDeGrace.png',
				'/img/perk-images/Styles/Precision/CutDown/CutDown.png',
				'/img/perk-images/Styles/Sorcery/LastStand/LastStand.png',
				'',

				// 42 ~ 55 Resolve
				'/img/perk-images/Styles/Resolve/GraspOfTheUndying/GraspOfTheUndying.png',
				'/img/perk-images/Styles/Resolve/VeteranAftershock/VeteranAftershock.png',
				'/img/perk-images/Styles/Resolve/Guardian/Guardian.png',
				'',
				'/img/perk-images/Styles/Resolve/Demolish/Demolish.png',
				'/img/perk-images/Styles/Resolve/FontOfLife/FontOfLife.png',
				'/img/perk-images/Styles/Resolve/MirrorShell/MirrorShell.png',
				'/img/perk-images/Styles/Resolve/Conditioning/Conditioning.png',
				'/img/perk-images/Styles/Resolve/SecondWind/SecondWind.png',
				'/img/perk-images/Styles/Resolve/BonePlating/BonePlating.png',
				'/img/perk-images/Styles/Resolve/Overgrowth/Overgrowth.png',
				'/img/perk-images/Styles/Resolve/Revitalize/Revitalize.png',
				'/img/perk-images/Styles/Sorcery/Unflinching/Unflinching.png',
				'',

				// 56 ~ 69 Sorcery
				'/img/perk-images/Styles/Sorcery/SummonAery/SummonAery.png',
				'/img/perk-images/Styles/Sorcery/ArcaneComet/ArcaneComet.png',
				'/img/perk-images/Styles/Sorcery/PhaseRush/PhaseRush.png',
				'',
				'/img/perk-images/Styles/Sorcery/NullifyingOrb/Pokeshield.png',
				'/img/perk-images/Styles/Sorcery/ManaflowBand/ManaflowBand.png',
				'/img/perk-images/Styles/Sorcery/NimbusCloak/6361.png',
				'/img/perk-images/Styles/Sorcery/Transcendence/Transcendence.png',
				'/img/perk-images/Styles/Sorcery/Celerity/CelerityTemp.png',
				'/img/perk-images/Styles/Sorcery/AbsoluteFocus/AbsoluteFocus.png',
				'/img/perk-images/Styles/Sorcery/Scorch/Scorch.png',
				'/img/perk-images/Styles/Sorcery/Waterwalking/Waterwalking.png',
				'/img/perk-images/Styles/Sorcery/GatheringStorm/GatheringStorm.png',
				'' ];

		var list = new Array();
		<c:forEach var="matchList" items="${matchList }" >
		list.push("${matchList}");
		</c:forEach>

		// 룬 정보 확인 (JSON 처리방식 업데이트 필요)
		$('.show_new_build')
				.click(
						function() {
							var index = $(this).closest('tr').prevAll().length;
							var top = $(this).offset().top - 180;
							$('#build_info').css('top', top);

							var startIndex;
							var endIndex;

							startIndex = list[index].indexOf('perk0URI');
							startIndex = list[index].indexOf('=', startIndex);
							endIndex = list[index].indexOf(',', startIndex);
							var perk0 = list[index].substring(startIndex + 1,
									endIndex);

							startIndex = list[index].indexOf('perk1URI');
							startIndex = list[index].indexOf('=', startIndex);
							endIndex = list[index].indexOf(',', startIndex);
							var perk1 = list[index].substring(startIndex + 1,
									endIndex);

							startIndex = list[index].indexOf('perk2URI');
							startIndex = list[index].indexOf('=', startIndex);
							endIndex = list[index].indexOf(',', startIndex);
							var perk2 = list[index].substring(startIndex + 1,
									endIndex);

							startIndex = list[index].indexOf('perk3URI');
							startIndex = list[index].indexOf('=', startIndex);
							endIndex = list[index].indexOf(',', startIndex);
							var perk3 = list[index].substring(startIndex + 1,
									endIndex);

							startIndex = list[index].indexOf('perk4URI');
							startIndex = list[index].indexOf('=', startIndex);
							endIndex = list[index].indexOf(',', startIndex);
							var perk4 = list[index].substring(startIndex + 1,
									endIndex);

							startIndex = list[index].indexOf('perk5URI');
							startIndex = list[index].indexOf('=', startIndex);
							endIndex = list[index].indexOf(',', startIndex);
							var perk5 = list[index].substring(startIndex + 1,
									endIndex);

							startIndex = list[index]
									.indexOf('perkPrimaryStyleURI');
							startIndex = list[index].indexOf('=', startIndex);
							endIndex = list[index].indexOf(',', startIndex);
							var perkPrimaryStyle = list[index].substring(
									startIndex + 1, endIndex);

							startIndex = list[index].indexOf('perkSubStyleURI');
							startIndex = list[index].indexOf('=', startIndex);
							endIndex = list[index].indexOf(',', startIndex);
							var perkSubStyle = list[index].substring(
									startIndex + 1, endIndex);

							startIndex = list[index].indexOf('statPerk0URI');
							startIndex = list[index].indexOf('=', startIndex);
							endIndex = list[index].indexOf(',', startIndex);
							var statPerk0 = list[index].substring(
									startIndex + 1, endIndex);

							startIndex = list[index].indexOf('statPerk1URI');
							startIndex = list[index].indexOf('=', startIndex);
							endIndex = list[index].indexOf(',', startIndex);
							var statPerk1 = list[index].substring(
									startIndex + 1, endIndex);

							startIndex = list[index].indexOf('statPerk2URI');
							startIndex = list[index].indexOf('=', startIndex);
							endIndex = list[index].indexOf(',', startIndex);
							var statPerk2 = list[index].substring(
									startIndex + 1, endIndex);
							// 			console.log('perk0 : ' + perk0);
							// 			console.log('perk1 : ' + perk1);
							// 			console.log('perk2 : ' + perk2);
							// 			console.log('perk3 : ' + perk3);
							// 			console.log('perk4 : ' + perk4);
							// 			console.log('perk5 : ' + perk5);
							// 			console.log('perkPrimaryStyle : ' + perkPrimaryStyle);
							// 			console.log('perkSubStyle : ' + perkSubStyle);
							// 			console.log('statPerk0 : ' + statPerk0);
							// 			console.log('statPerk1 : ' + statPerk1);
							// 			console.log('statPerk2 : ' + statPerk2);
							var perkPriIndex;
							var perkSubIndex;
							for (var i = 0; i < perkPriList.length; i++) {
								if (perkPriList[i] == perkPrimaryStyle)
									perkPriIndex = i;
								if (perkPriList[i] == perkSubStyle)
									perkSubIndex = i;
							}

							var startPriIndex;
							var startSubIndex;
							if (perkPriIndex == 0)
								startPriIndex = 0;
							if (perkPriIndex == 1)
								startPriIndex = 14;
							if (perkPriIndex == 2)
								startPriIndex = 28;
							if (perkPriIndex == 3)
								startPriIndex = 42;
							if (perkPriIndex == 4)
								startPriIndex = 56;

							if (perkSubIndex == 0)
								startSubIndex = 4;
							if (perkSubIndex == 1)
								startSubIndex = 18;
							if (perkSubIndex == 2)
								startSubIndex = 32;
							if (perkSubIndex == 3)
								startSubIndex = 46;
							if (perkSubIndex == 4)
								startSubIndex = 60;

							//  		주요룬 5개 0 ~ 4
							// 			선택된 주요룬의 LV1 5~8
							// 			선택된 주요룬의 LV2 9~11
							// 			선택된 주요룬의 LV3 12~14
							// 			선택된 주요룬의 LV4 15~18

							// 			부가룬 5개 19~23
							// 			선택된 부가룬의 LV1 24~26
							// 			선택된 부가룬의 LV2 27~29
							// 			선택된 부가룬의 LV3 30~33

							// 			능력치룬 LV1 34~36
							// 			능력치룬 LV2 37~39
							// 			능력치룬 LV3 40~42
							$('#build_info')
									.find('.tipsy_live')
									.each(
											function(index) {
												if (index >= 0 && index <= 4) {
													if ($(this).attr("src") == perkPrimaryStyle) {
														$(this).css("opacity",
																"1");
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													} else {
														$(this).css("opacity",
																"0.5");
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(1)");
													}

												}

												if (index == 5) {
													$(this)
															.attr(
																	"src",
																	perkList[startPriIndex]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk0) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}
												if (index == 6) {
													$(this)
															.attr(
																	"src",
																	perkList[startPriIndex + 1]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk0) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}
												if (index == 7) {
													$(this)
															.attr(
																	"src",
																	perkList[startPriIndex + 2]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk0) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}
												if (index == 8) {
													$(this)
															.attr(
																	"src",
																	perkList[startPriIndex + 3]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk0) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}

												if (index == 9) {
													$(this)
															.attr(
																	"src",
																	perkList[startPriIndex + 4]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk1) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}
												if (index == 10) {
													$(this)
															.attr(
																	"src",
																	perkList[startPriIndex + 5]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk1) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}
												if (index == 11) {
													$(this)
															.attr(
																	"src",
																	perkList[startPriIndex + 6]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk1) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}

												if (index == 12) {
													$(this)
															.attr(
																	"src",
																	perkList[startPriIndex + 7]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk2) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}
												if (index == 13) {
													$(this)
															.attr(
																	"src",
																	perkList[startPriIndex + 8]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk2) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}
												if (index == 14) {
													$(this)
															.attr(
																	"src",
																	perkList[startPriIndex + 9]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk2) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}

												if (index == 15) {
													$(this)
															.attr(
																	"src",
																	perkList[startPriIndex + 10]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk3) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}
												if (index == 16) {
													$(this)
															.attr(
																	"src",
																	perkList[startPriIndex + 11]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk3) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}
												if (index == 17) {
													$(this)
															.attr(
																	"src",
																	perkList[startPriIndex + 12]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk3) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}
												if (index == 18) {
													$(this)
															.attr(
																	"src",
																	perkList[startPriIndex + 13]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk3) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}

												if (index >= 19 && index <= 23) {
													if ($(this).attr("src") == perkSubStyle) {
														$(this).css("opacity",
																"1");
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													} else {
														$(this).css("opacity",
																"0.5");
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(1)");
													}

												}

												if (index == 24) {
													$(this)
															.attr(
																	"src",
																	perkList[startSubIndex]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk4
															|| $(this).attr(
																	"src") == perk5) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}
												if (index == 25) {
													$(this)
															.attr(
																	"src",
																	perkList[startSubIndex + 1]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk4
															|| $(this).attr(
																	"src") == perk5) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}
												if (index == 26) {
													$(this)
															.attr(
																	"src",
																	perkList[startSubIndex + 2]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk4
															|| $(this).attr(
																	"src") == perk5) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}

												if (index == 27) {
													$(this)
															.attr(
																	"src",
																	perkList[startSubIndex + 3]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk4
															|| $(this).attr(
																	"src") == perk5) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}
												if (index == 28) {
													$(this)
															.attr(
																	"src",
																	perkList[startSubIndex + 4]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk4
															|| $(this).attr(
																	"src") == perk5) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}
												if (index == 29) {
													$(this)
															.attr(
																	"src",
																	perkList[startSubIndex + 5]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk4
															|| $(this).attr(
																	"src") == perk5) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}

												if (index == 30) {
													$(this)
															.attr(
																	"src",
																	perkList[startSubIndex + 6]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk4
															|| $(this).attr(
																	"src") == perk5) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}
												if (index == 31) {
													$(this)
															.attr(
																	"src",
																	perkList[startSubIndex + 7]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk4
															|| $(this).attr(
																	"src") == perk5) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}
												if (index == 32) {
													$(this)
															.attr(
																	"src",
																	perkList[startSubIndex + 8]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk4
															|| $(this).attr(
																	"src") == perk5) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}
												if (index == 33) {
													$(this)
															.attr(
																	"src",
																	perkList[startSubIndex + 9]);
													$(this).css("opacity", 0.5);
													$(this).css(
															"-webkit-filter",
															"grayscale(1)");
													if ($(this).attr("src") == perk4
															|| $(this).attr(
																	"src") == perk5) {
														$(this).css("opacity",
																1);
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													}
												}

												if (index >= 34 && index <= 36) {
													if ($(this).attr("src") == statPerk0) {
														$(this).css("opacity",
																"1");
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													} else {
														$(this).css("opacity",
																"0.5");
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(1)");
													}
												}

												if (index >= 37 && index <= 39) {
													if ($(this).attr("src") == statPerk1) {
														$(this).css("opacity",
																"1");
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													} else {
														$(this).css("opacity",
																"0.5");
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(1)");
													}
												}

												if (index >= 40 && index <= 42) {
													if ($(this).attr("src") == statPerk2) {
														$(this).css("opacity",
																"1");
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(0)");
													} else {
														$(this).css("opacity",
																"0.5");
														$(this)
																.css(
																		"-webkit-filter",
																		"grayscale(1)");
													}
												}
											});

							$('#build_info').show();
						});

		// 매치 상세정보
		$('.show_match_info')
				.click(
						function() {
// 							var top = $(this).offset().top - 180;
							var top = $(this).parents('table').offset().top - 120;
							var index = $(this).closest('tr').prevAll().length;
							$('#battle_info').css('top', top);

							$
									.ajax({
										url : "/get/matchInfo",
										data : {
											matchInfoVo : list[index]
										// 선택된 게임 ID 만 보내주도록 수정필요
										},
										type : "POST",
										dataType : "json",
										success : function(data) {
											var json = data.summonerInfo;
											var btjson = data.blueTeam;
											var ptjson = data.purpleTeam;
											var maxDamage = data.maxDamage;
											var maxTaken = data.maxTaken;
											var gameDurationMin = data.gameDurationMin;
											$
													.each(
															json,
															function(index,
																	post) {
																var spell1Name = post.spell1Name; // 실제 스펠1 이름
																var spell2Name = post.spell2Name; // 실제 스펠2 이름
																var participantId = post.participantId; // 소환사 10명중 번호
																var lane = post.lane; // 포지션
																var teamId = post.teamId; // 팀 ID (100:블루 200:레드)		
																var kills = post.kills; // K
																var deaths = post.deaths; // D
																var assists = post.assists; // A		                
																var neutralMinionsKilled = post.neutralMinionsKilled; // 중립 미니언킬
																var totalMinionsKilled = post.totalMinionsKilled; // CS킬
																var totalCS = neutralMinionsKilled
																		+ totalMinionsKilled; // 총 CS
																var totalDamageTaken = post.totalDamageTaken; // 받은 피해량
																var wardsKilled = post.wardsKilled; // 와드 제거
																var item0 = post.item0;
																var item1 = post.item1;
																var item2 = post.item2;
																var item3 = post.item3;
																var item4 = post.item4;
																var item5 = post.item5;
																var item6 = post.item6; // 아이템 (6:장신구)
																var totalDamageDealtToChampions = post.totalDamageDealtToChampions; // 가한 피해량
																var win = post.win; // 승리 여부			                
																var wardsPlaced = post.wardsPlaced; // 와드 설치
																var goldEarned = post.goldEarned; // 골드 획득량
																var champLevel = post.champLevel; // 챔피언 레벨					    
																var championName = post.championName; // 챔피언 이름
																var summonerName = post.summonerName; // 소환사명
																var visionWardsBoughtInGame = post.visionWardsBoughtInGame; // 제어 와드

																var grade = post.grade; // 평점					    

																// 룬 상세정보					    
																var perkPrimaryStyleURI = post.perkPrimaryStyleURI; // 주요룬
																var perkSubStyleURI = post.perkSubStyleURI; // 부가룬

																if (participantId < 6) {
																	var index = (participantId - 1) * 10;
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index)
																			.html(
																					champLevel);
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 1)
																			.children(
																					'img')
																			.attr(
																					'src',
																					'/img/champion/'
																							+ championName
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 1)
																			.children(
																					'span')
																			.html(
																					' '
																							+ summonerName);

																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 2)
																			.find(
																					'img')
																			.eq(
																					0)
																			.attr(
																					'src',
																					'/img/spell/'
																							+ spell1Name
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 2)
																			.find(
																					'img')
																			.eq(
																					1)
																			.attr(
																					'src',
																					perkPrimaryStyleURI);
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 2)
																			.find(
																					'img')
																			.eq(
																					2)
																			.attr(
																					'src',
																					'/img/spell/'
																							+ spell2Name
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 2)
																			.find(
																					'img')
																			.eq(
																					3)
																			.attr(
																					'src',
																					perkSubStyleURI);
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 3)
																			.html(
																					champLevel);

																	if (grade <= 2) {
																		$(
																				'#battle_detail')
																				.find(
																						'.t_blue')
																				.eq(
																						index + 4)
																				.children(
																						'font')
																				.css(
																						'color',
																						'gray');
																		$(
																				'#battle_detail')
																				.find(
																						'.t_blue')
																				.eq(
																						index + 4)
																				.children(
																						'font')
																				.html(
																						'<b>평점 '
																								+ grade
																								+ '</b>');
																	} else if (grade <= 4) {
																		$(
																				'#battle_detail')
																				.find(
																						'.t_blue')
																				.eq(
																						index + 4)
																				.children(
																						'font')
																				.css(
																						'color',
																						'#4444CC');
																		$(
																				'#battle_detail')
																				.find(
																						'.t_blue')
																				.eq(
																						index + 4)
																				.children(
																						'font')
																				.html(
																						'<b>평점 '
																								+ grade
																								+ '</b>');
																	} else {
																		$(
																				'#battle_detail')
																				.find(
																						'.t_blue')
																				.eq(
																						index + 4)
																				.children(
																						'font')
																				.css(
																						'color',
																						'#CC4444');
																		if (deaths == 0)
																			$(
																					'#battle_detail')
																					.find(
																							'.t_blue')
																					.eq(
																							index + 4)
																					.children(
																							'font')
																					.html(
																							'<b>Perfect</b>');
																		else
																			$(
																					'#battle_detail')
																					.find(
																							'.t_blue')
																					.eq(
																							index + 4)
																					.children(
																							'font')
																					.html(
																							'<b>평점 '
																									+ grade
																									+ '</b>');
																	}

																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 4)
																			.find(
																					'span')
																			.eq(
																					0)
																			.html(
																					kills
																							+ ' / '
																							+ deaths
																							+ ' / '
																							+ deaths);

																	var kpRate = Math
																			.floor((kills + assists)
																					/ btjson.totalKill
																					* 100);

																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 4)
																			.find(
																					'span')
																			.eq(
																					1)
																			.html(
																					'('
																							+ kpRate
																							+ '%)');

																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 5)
																			.find(
																					'img')
																			.eq(
																					0)
																			.attr(
																					'src',
																					'/img/item/'
																							+ item0
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 5)
																			.find(
																					'img')
																			.eq(
																					1)
																			.attr(
																					'src',
																					'/img/item/'
																							+ item1
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 5)
																			.find(
																					'img')
																			.eq(
																					2)
																			.attr(
																					'src',
																					'/img/item/'
																							+ item2
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 5)
																			.find(
																					'img')
																			.eq(
																					3)
																			.attr(
																					'src',
																					'/img/item/'
																							+ item3
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 5)
																			.find(
																					'img')
																			.eq(
																					4)
																			.attr(
																					'src',
																					'/img/item/'
																							+ item4
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 5)
																			.find(
																					'img')
																			.eq(
																					5)
																			.attr(
																					'src',
																					'/img/item/'
																							+ item5
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 5)
																			.find(
																					'img')
																			.eq(
																					6)
																			.attr(
																					'src',
																					'/img/item/'
																							+ item6
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 6)
																			.find(
																					'span')
																			.eq(
																					0)
																			.html(
																					goldEarned
																							+ ' G');

																	var csPerMin = (totalCS / gameDurationMin)
																			.toFixed(1);
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 6)
																			.find(
																					'span')
																			.eq(
																					1)
																			.html(
																					totalCS
																							+ ' ('
																							+ csPerMin
																							+ ')');

																	var damageRate = Math
																			.floor(totalDamageDealtToChampions
																					/ maxDamage
																					* 100);
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 7)
																			.find(
																					'span')
																			.eq(
																					0)
																			.html(
																					totalDamageDealtToChampions);
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 7)
																			.find(
																					'div')
																			.eq(
																					1)
																			.width(
																					damageRate
																							+ '%');
																	var takenRate = Math
																			.floor(totalDamageTaken
																					/ maxTaken
																					* 100);
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 8)
																			.find(
																					'span')
																			.eq(
																					0)
																			.html(
																					totalDamageTaken);
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 8)
																			.find(
																					'div')
																			.eq(
																					1)
																			.width(
																					takenRate
																							+ '%');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_blue')
																			.eq(
																					index + 9)
																			.html(
																					visionWardsBoughtInGame
																							+ '<br/>'
																							+ wardsPlaced
																							+ '/'
																							+ wardsKilled);
																} else {
																	var index = (participantId - 6) * 10 + 3;
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index)
																			.html(
																					champLevel);
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 1)
																			.children(
																					'img')
																			.attr(
																					'src',
																					'/img/champion/'
																							+ championName
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 1)
																			.children(
																					'span')
																			.html(
																					' '
																							+ summonerName);

																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 2)
																			.find(
																					'img')
																			.eq(
																					0)
																			.attr(
																					'src',
																					'/img/spell/'
																							+ spell1Name
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 2)
																			.find(
																					'img')
																			.eq(
																					1)
																			.attr(
																					'src',
																					perkPrimaryStyleURI);
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 2)
																			.find(
																					'img')
																			.eq(
																					2)
																			.attr(
																					'src',
																					'/img/spell/'
																							+ spell2Name
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 2)
																			.find(
																					'img')
																			.eq(
																					3)
																			.attr(
																					'src',
																					perkSubStyleURI);
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 3)
																			.html(
																					champLevel);

																	if (grade <= 2) {
																		$(
																				'#battle_detail')
																				.find(
																						'.t_purple')
																				.eq(
																						index + 4)
																				.children(
																						'font')
																				.css(
																						'color',
																						'gray');
																		$(
																				'#battle_detail')
																				.find(
																						'.t_purple')
																				.eq(
																						index + 4)
																				.children(
																						'font')
																				.html(
																						'<b>평점 '
																								+ grade
																								+ '</b>');
																	} else if (grade <= 4) {
																		$(
																				'#battle_detail')
																				.find(
																						'.t_purple')
																				.eq(
																						index + 4)
																				.children(
																						'font')
																				.css(
																						'color',
																						'#4444CC');
																		$(
																				'#battle_detail')
																				.find(
																						'.t_purple')
																				.eq(
																						index + 4)
																				.children(
																						'font')
																				.html(
																						'<b>평점 '
																								+ grade
																								+ '</b>');
																	} else {
																		$(
																				'#battle_detail')
																				.find(
																						'.t_purple')
																				.eq(
																						index + 4)
																				.children(
																						'font')
																				.css(
																						'color',
																						'#CC4444');
																		if (deaths == 0)
																			$(
																					'#battle_detail')
																					.find(
																							'.t_purple')
																					.eq(
																							index + 4)
																					.children(
																							'font')
																					.html(
																							'<b>Perfect</b>');
																		else
																			$(
																					'#battle_detail')
																					.find(
																							'.t_purple')
																					.eq(
																							index + 4)
																					.children(
																							'font')
																					.html(
																							'<b>평점 '
																									+ grade
																									+ '</b>');
																	}

																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 4)
																			.find(
																					'span')
																			.eq(
																					0)
																			.html(
																					kills
																							+ ' / '
																							+ deaths
																							+ ' / '
																							+ deaths);

																	var kpRate = Math
																			.floor((kills + assists)
																					/ ptjson.totalKill
																					* 100);
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 4)
																			.find(
																					'span')
																			.eq(
																					1)
																			.html(
																					'('
																							+ kpRate
																							+ '%)');

																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 5)
																			.find(
																					'img')
																			.eq(
																					0)
																			.attr(
																					'src',
																					'/img/item/'
																							+ item0
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 5)
																			.find(
																					'img')
																			.eq(
																					1)
																			.attr(
																					'src',
																					'/img/item/'
																							+ item1
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 5)
																			.find(
																					'img')
																			.eq(
																					2)
																			.attr(
																					'src',
																					'/img/item/'
																							+ item2
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 5)
																			.find(
																					'img')
																			.eq(
																					3)
																			.attr(
																					'src',
																					'/img/item/'
																							+ item3
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 5)
																			.find(
																					'img')
																			.eq(
																					4)
																			.attr(
																					'src',
																					'/img/item/'
																							+ item4
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 5)
																			.find(
																					'img')
																			.eq(
																					5)
																			.attr(
																					'src',
																					'/img/item/'
																							+ item5
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 5)
																			.find(
																					'img')
																			.eq(
																					6)
																			.attr(
																					'src',
																					'/img/item/'
																							+ item6
																							+ '.png');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 6)
																			.find(
																					'span')
																			.eq(
																					0)
																			.html(
																					goldEarned
																							+ ' G');

																	var csPerMin = (totalCS / gameDurationMin)
																			.toFixed(1);
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 6)
																			.find(
																					'span')
																			.eq(
																					1)
																			.html(
																					totalCS
																							+ ' ('
																							+ csPerMin
																							+ ')');

																	var damageRate = Math
																			.floor(totalDamageDealtToChampions
																					/ maxDamage
																					* 100);
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 7)
																			.find(
																					'span')
																			.eq(
																					0)
																			.html(
																					totalDamageDealtToChampions);
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 7)
																			.find(
																					'div')
																			.eq(
																					1)
																			.css(
																					'width',
																					damageRate
																							+ '%');
																	var takenRate = Math
																			.floor(totalDamageTaken
																					/ maxTaken
																					* 100);
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 8)
																			.find(
																					'span')
																			.eq(
																					0)
																			.html(
																					totalDamageTaken);
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 8)
																			.find(
																					'span')
																			.eq(
																					0)
																			.css(
																					'padding-top',
																					'3px');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 8)
																			.find(
																					'span')
																			.eq(
																					0)
																			.attr(
																					'padding-top',
																					'3px');
																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 8)
																			.find(
																					'div')
																			.eq(
																					1)
																			.css(
																					'width',
																					takenRate
																							+ '%');

																	$(
																			'#battle_detail')
																			.find(
																					'.t_purple')
																			.eq(
																					index + 9)
																			.html(
																					visionWardsBoughtInGame
																							+ '<br/>'
																							+ wardsPlaced
																							+ '/'
																							+ wardsKilled);
																}
															});

											if (btjson.win == 'Win')
												btjson.win = '승리팀';
											else
												btjson.win = '패배팀';

											var msg = '';
											if (btjson.firstBlood == true)
												msg += '선취점, ';
											if (btjson.firstTower == true)
												msg += '선타워, '
											if (btjson.firstRiftHerald == true)
												msg += '협곡의 전령, ';

											$('#battle_detail').find('.t_blue')
													.eq(50).html(btjson.win);
											$('#battle_detail')
													.find('.t_blue')
													.eq(51)
													.children('span')
													.html(
															btjson.totalKill
																	+ ' / '
																	+ btjson.totalDeath
																	+ ' / '
																	+ btjson.totalAssist) // 팀 KDA
											$('#battle_detail').find('.t_blue')
													.eq(52).find('span').eq(0)
													.html(msg) // 선취점 정보
											$('#battle_detail')
													.find('.t_blue')
													.eq(52)
													.find('span')
													.eq(1)
													.html(
															'포탑 : '
																	+ btjson.towerKills
																	+ '&nbsp;,') // 포탑
											$('#battle_detail')
													.find('.t_blue')
													.eq(52)
													.find('span')
													.eq(2)
													.html(
															'드래곤 : '
																	+ btjson.dragonKills
																	+ '&nbsp;,') // 드래곤
											$('#battle_detail')
													.find('.t_blue')
													.eq(52)
													.find('span')
													.eq(3)
													.html(
															'바론 : '
																	+ btjson.baronKills
																	+ '&nbsp;,') // 바론
											$('#battle_detail')
													.find('.t_blue')
													.eq(52)
													.find('span')
													.eq(4)
													.html(
															'억제기 : '
																	+ btjson.inhibitorKills
																	+ '&nbsp;') // 억제기

											if (ptjson.win == 'Win')
												ptjson.win = '승리팀';
											else
												ptjson.win = '패배팀';

											msg = '';
											if (ptjson.firstBlood == true)
												msg += '선취점, ';
											if (ptjson.firstTower == true)
												msg += '선타워, '
											if (ptjson.firstRiftHerald == true)
												msg += '협곡의 전령, ';
											$('#battle_detail').find(
													'.t_purple').eq(0).html(
													ptjson.win);
											$('#battle_detail')
													.find('.t_purple')
													.eq(1)
													.children('span')
													.html(
															ptjson.totalKill
																	+ ' / '
																	+ ptjson.totalDeath
																	+ ' / '
																	+ ptjson.totalAssist) // 팀 KDA
											$('#battle_detail').find(
													'.t_purple').eq(2).find(
													'span').eq(0).html(msg) // 선취점 정보
											$('#battle_detail').find(
													'.t_purple').eq(2).find(
													'span').eq(1).html(
													'포탑 : ' + ptjson.towerKills
															+ '&nbsp;,') // 포탑
											$('#battle_detail')
													.find('.t_purple')
													.eq(2)
													.find('span')
													.eq(2)
													.html(
															'드래곤 : '
																	+ ptjson.dragonKills
																	+ '&nbsp;,') // 드래곤
											$('#battle_detail').find(
													'.t_purple').eq(2).find(
													'span').eq(3).html(
													'바론 : ' + ptjson.baronKills
															+ '&nbsp;,') // 바론
											$('#battle_detail')
													.find('.t_purple')
													.eq(2)
													.find('span')
													.eq(4)
													.html(
															'억제기 : '
																	+ ptjson.inhibitorKills
																	+ '&nbsp;') // 억제기

										},
										error : function(xhr) {
											alert(xhr.status + ":"
													+ xhr.statusText);
										}

									})

							$('#battle_info').show();

							// 			var selMatchInfo = list[index];
							// 			var startIndex = selMatchInfo.indexOf("matchMap=") + 10;
							// 			var endIndex = selMatchInfo.indexOf("}", startIndex);
							// 			var matchMap = selMatchInfo.substring(startIndex, endIndex);

							// 			console.log(matchMap);

							// 			console.log(selMatchInfo);

						});
	});
</script>
</head>
<body>

	<%@ include file="/WEB-INF/include/header.jspf"%>
	<div id="home">
		<!-- 정보 컨테이너 -->
		<div class="container" style="position: relative;">
			<!-- 소환사 프로필 -->
			<div
				style="background-color: #eeeeee; border: 1px solid #dddddd; color: #333333; border-radius: 4px; padding: 8px;">
				<div class="profile" style="height: 85px">
					<div style="float: left; margin-right: 5px;">
						<img src="/img/profileicon/${summonerJson.profileIconId }.png"
							style="width: 82px; height: 82px;"
							onerror="this.src='/img/profileicon/null.png'; this.style.border='1px solid red';" />
					</div>

					<div style="float: left; padding-top: 5px;">
						<span class="username" style="font-size: 28px; font-weight: bold;">
							${summonerJson.name }</span>
					</div>

					<div
						style="position: absolute; bottom: 5px; left: 92px; text-align: left; line-height: 20px;">
						<c:set var="soloRankURI" value="/img/emblems/UNRANKED.png" />
						<c:set var="teamRankURI" value="/img/emblems/UNRANKED.png" />
						<a class="sbtn small"><span>레벨:
								${summonerJson.summonerLevel }</span></a>
						<c:if test="${soloRank ne null}">
							<a class="sbtn small"><span>랭크 : ${soloRank.wins }승
									${soloRank.losses }패</span></a>
							<c:set var="soloRankURI"
								value="/img/emblems/${soloRank.tier }.png" />
						</c:if>

						<c:if test="${teamRank ne null }">
							<a class="sbtn small"><span>자유랭크 : ${teamRank.wins }승
									${teamRank.losses }패</span></a>
							<c:set var="teamRankURI"
								value="/img/emblems/${teamRank.tier }.png" />
						</c:if>
					</div>
				</div>

				<!-- 랭크 정보 -->
				<div class="table_summary">
					<br>
					<div
						style="width: 400px; border: 1px solid silver; height: 125px; position: relative; background-color: white; float: left;">
						<div style="top: 10px; left: 20px; position: absolute;">
							<img src="<c:out value="${soloRankURI }" />" alt="티어정보.png"
								width="90" style="border: 0px;">
						</div>
						<div
							style="top: 7px; left: 155px; line-height: 14px; position: absolute;">
							<c:if test="${soloRank ne null}">
				리그: 솔로랭크 5x5<br>
								<br>
				등급: <b><font color="#228822">${soloRank.tier }
										${soloRank.rank }</font></b>
								<br>
				리그 포인트: ${soloRank.leaguePoints }<br />
								<c:choose>
									<c:when test="${soloRank.miniSeries ne null }">
										<font color="red">진행중</font>
						( 
						<c:set var="soloProg" value="${soloRank.miniSeries.progress }" />
										<c:forEach var="cnt" begin="1" end="${fn:length(soloProg) }"
											step="1">
											<c:choose>
												<c:when
													test="${fn:substring(soloProg, cnt - 1, cnt) eq 'L'}">
													<span style="color: #BB0000; font-weight: bold;">X </span>
												</c:when>

												<c:when
													test="${fn:substring(soloProg, cnt - 1, cnt) eq 'W'}">
													<span style="color: green; font-weight: bold;">√ </span>
												</c:when>

												<c:otherwise>
													<span>- </span>
												</c:otherwise>

											</c:choose>
										</c:forEach>
						)
						<br>
										<br>
									</c:when>

									<c:otherwise>
						승급전: -<br>
										<br>
									</c:otherwise>
								</c:choose>
				${soloRank.wins + soloRank.losses }전 ${soloRank.wins }승 ${soloRank.losses }패 (<fmt:formatNumber
									value="${soloRank.wins / (soloRank.wins + soloRank.losses) * 100 }"
									pattern=".00" />%)
			</c:if>
							<c:if test="${soloRank eq null}">
				리그: 솔로랭크 5x5<br>
								<br>
				등급: <b><font color="#228822">UNRANKED</font></b>
								<br />
							</c:if>
						</div>
					</div>

					<div
						style="width: 5px; height: 125px; position: relative; float: left;">
					</div>
					<div
						style="width: 400px; border: 1px solid silver; height: 125px; position: relative; background-color: white; float: left;">
						<div style="top: 10px; left: 20px; position: absolute;">
							<img src="<c:out value="${teamRankURI }" />" alt="티어정보.png"
								width="90" style="border: 0px;">
						</div>
						<div
							style="top: 7px; left: 155px; line-height: 14px; position: absolute;">
							<c:if test="${teamRank ne null}">
					리그: 자유랭크 5x5<br>
								<br>
					등급: <b><font color="#228822">${teamRank.tier }
										${teamRank.rank }</font></b>
								<br>
					리그 포인트: ${teamRank.leaguePoints }<br>
								<c:choose>
									<c:when test="${teamRank.miniSeries ne null }">
										<font color="red">진행중</font>
						( 
						<c:set var="teamProg" value="${teamRank.miniSeries.progress }" />
										<c:forEach var="cnt" begin="1" end="${fn:length(teamProg) }"
											step="1">
											<c:choose>
												<c:when
													test="${fn:substring(teamProg, cnt - 1, cnt) eq 'L'}">
													<span style="color: #BB0000; font-weight: bold;">X </span>
												</c:when>

												<c:when
													test="${fn:substring(teamProg, cnt - 1, cnt) eq 'W'}">
													<span style="color: green; font-weight: bold;">√ </span>
												</c:when>

												<c:otherwise>
													<span>- </span>
												</c:otherwise>

											</c:choose>
										</c:forEach>
						)
						<br>
										<br>
									</c:when>

									<c:otherwise>
						승급전: -<br>
										<br>
									</c:otherwise>
								</c:choose>
					
					${teamRank.wins + teamRank.losses }전 ${teamRank.wins }승 ${teamRank.losses }패 <fmt:formatNumber
									value="${teamRank.wins / (teamRank.wins + teamRank.losses) * 100 }"
									pattern="0.00" />%
				</c:if>

							<c:if test="${teamRank eq null}">
					리그: 솔로랭크 5x5<br>
								<br>
					등급: <b><font color="#228822">UNRANKED</font></b>
								<br />
							</c:if>
						</div>
					</div>
					<div style="clear: both;"></div>
				</div>

				<div class="div_recent">
					<table class="tablesorter table_recent" style="width: 100%;">
						<thead>
							<tr>
								<th class="header">승</th>
								<th style="text-align: center;" class="header">챔피언</th>
								<th class="header">타입</th>
								<th class="header">KDA</th>
								<th class="header">킬관여</th>
								<th style="width: 40px;" class="header">S/R</th>
								<th style="width: 114px;" class="header">팀</th>
								<th style="width: 88px;" class="header">아이템</th>
								<th class="header">LV/G/CS</th>
								<th class="header">플레이</th>
								<th class="header">와드</th>
								<th style="text-align: center;" class="header">+</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="matchVo" items="${matchList }">
								<c:if test="${matchVo.win eq true }">
									<c:set var="win" value="승" />
									<c:set var="background" value="#D4E4FE" />
								</c:if>

								<c:if test="${matchVo.win eq false }">
									<c:set var="win" value="패" />
									<c:set var="background" value="#FFEEEE" />
								</c:if>
								<tr>
									<!-- 승패 -->
									<td class="recent_td"
										style="background:<c:out value="${background }" />;
							 vertical-align:middle; text-align:center;">
										<c:out value="${win }" />
									</td>

									<!-- 챔피언 -->
									<td class="recent_td recent_champ"
										style="background:<c:out value="${background }" />;
							 vertical-align:middle; text-align:center; width:52px; padding:0px;">
										<div style="position: relative; width: 100%; height: 100%;">
											<img src="/img/champion/${matchVo.championName }.png"
												alt="챔피언" width="48" height="48">

											<div
												style="position: absolute; width: 48px; height: 14px; bottom: 0px; left: 2px; text-align: center; background-color: black; filter: alpha(opacity = 80); -moz-opacity: 0.8; opacity: 0.8; color: white; font-size: 12px;">
												<b>${matchVo.championName }</b>
											</div>
										</div>
									</td>

									<!-- 타입 -->
									<td class="recent_td"
										style="background:<c:out value="${background }" />; 
							 vertical-align:middle; text-align:center; padding:2px;">
										${matchVo.queueName }</td>

									<!-- KDA -->
									<td class="recent_td"
										style="background:<c:out value="${background }" />; 
							 vertical-align:middle; text-align:center; padding:0px;">
										<c:choose>
											<c:when test="${matchVo.grade le 2 }">
												<c:set var="fontColor" value="gray" />
											</c:when>

											<c:when test="${matchVo.grade le 4 }">
												<c:set var="fontColor" value="#4444CC" />
											</c:when>

											<c:when test="${matchVo.grade gt 4 }">
												<c:set var="fontColor" value="#CC4444" />
											</c:when>
										</c:choose> <c:choose>
											<c:when test="${matchVo.deaths eq 0 }">
												<c:set var="matchGrade" value="Perfect" />
											</c:when>

											<c:otherwise>
												<fmt:formatNumber var="gradeFormat"
													value="${(matchVo.kills + matchVo.assists) / matchVo.deaths }"
													pattern="0.00" />
												<c:set var="matchGrade" value="평점 ${gradeFormat }" />
											</c:otherwise>
										</c:choose> <font color="<c:out value='${fontColor }' />"><b>${matchGrade }</b></font><br />
										${matchVo.kills } / ${matchVo.deaths } / ${matchVo.assists } <c:choose>
											<c:when test="${matchVo.pentaKills ne 0 }">
												<c:set var="multiKillType" value="펜타킬" />
												<c:set var="multiKillColor" value="#FFDDDD" />
												<c:set var="multiKillOk" value="1" />
											</c:when>
											<c:when test="${matchVo.quadraKills ne 0 }">
												<c:set var="multiKillType" value="쿼드라킬" />
												<c:set var="multiKillColor" value="#FFDDDD" />
												<c:set var="multiKillOk" value="1" />
											</c:when>
											<c:when test="${matchVo.tripleKills ne 0 }">
												<c:set var="multiKillType" value="트리플킬" />
												<c:set var="multiKillColor" value="#FFDDDD" />
												<c:set var="multiKillOk" value="1" />
											</c:when>
											<c:when test="${matchVo.doubleKills ne 0 }">
												<c:set var="multiKillType" value="더블킬" />
												<c:set var="multiKillColor" value="#FFFFFF" />
												<c:set var="multiKillOk" value="1" />
											</c:when>
											<c:otherwise>
												<c:set var="multiKillOk" value="0" />
											</c:otherwise>
										</c:choose> <c:if test="${multiKillOk eq 1 }">
											<span style="font-size: 11px; font-family: arial;"><br />
												<span
												style="border-radius:3px; -moz-border-radius:3px;
									 -webkit-border-radius: 3px; border:1px solid #FBB; 
									 background-color:<c:out value="${multiKillColor }" />; padding:0px 1px 0px 1px;">
													${multiKillType } </span> </span>
										</c:if>

									</td>

									<!-- 킬관여 -->
									<td class="recent_td"
										style="background:<c:out value="${background }" />; 
							 vertical-align:middle; text-align:center; 
							 font-size:13px; font-family:Arial;">
										${matchVo.kpRate }%</td>

									<!-- 스펠 -->
									<td class="recent_td my_matchlist"
										style="background:<c:out value="${background }" />; 
							 vertical-align:middle; text-align:center; width:28px; padding:0px;">

										<img width="20" src="/img/spell/${matchVo.spell1Name }.png" />
										<img class="show_new_build tipsy_live"
										style="width: 20px; cursor: pointer;"
										src="${matchVo.perkPrimaryStyleURI }" /><br /> <img
										width="20" src="/img/spell/${matchVo.spell2Name }.png" /> <img
										class="show_new_build tipsy_live"
										style="width: 20px; cursor: pointer;"
										src="${matchVo.perkSubStyleURI }" />
									</td>

									<!-- 팀 -->
									<td class="recent_td my_matchlist"
										style="background:<c:out value="${background }" />;">
										<!-- 블루팀 -->
										<div style="border: 0;">
											<c:forEach var="championName"
												items="${matchVo.championNames }">

												<c:if test="${championName.key le 5}">
													<img src="/img/champion/${championName.value }.png"
														class="tipsy_live" width="20">
												</c:if>
											</c:forEach>
										</div> <!-- 레드팀 -->
										<div style="border: 0;">
											<c:forEach var="championName"
												items="${matchVo.championNames }">
												<c:if test="${championName.key gt 5}">
													<img src="/img/champion/${championName.value }.png"
														class="tipsy_live" width="20">
												</c:if>
											</c:forEach>
										</div>

									</td>

									<!-- 아이템 -->
									<td class="recent_td my_matchlist"
										style="background:<c:out value="${background }" />;">
										<div style="position: relative; width: 100%; height: 100%;">
											<img width="20" src="/img/item/${matchVo.item0 }.png" /> <img
												width="20" src="/img/item/${matchVo.item1 }.png" /> <img
												width="20" src="/img/item/${matchVo.item2 }.png" /> <img
												width="20" src="/img/item/${matchVo.item6 }.png" /><br /> <img
												width="20" src="/img/item/${matchVo.item3 }.png" /> <img
												width="20" src="/img/item/${matchVo.item4 }.png" /> <img
												width="20" src="/img/item/${matchVo.item5 }.png" /> <img
												class="show_new_build tipsy_live"
												src="/img/item/item_detail.png" width="20"
												style="cursor: pointer;">
										</div>
									</td>

									<!-- LV/G/CS -->
									<td class="recent_td"
										style="background:<c:out value="${background }" />;
			     	        vertical-align:middle; text-align:center;
			     	        padding:0px; font-size:11px;">
										레벨 ${matchVo.champLevel }<br> <b>골드
											${matchVo.goldEarnedStr }</b><br> <span class="tipsy_live"
										style="font-size: 11px;"> CS
											${matchVo.totalMinionsKilled } (${matchVo.csPerMin }) </span>
									</td>

									<!-- 플레이 -->
									<td class="recent_td"
										style="background:<c:out value="${background }" />; 
							 vertical-align:middle; text-align:center; line-height:13px; 
							 font-size:11px;">
										<span style="font-size: 11px;">
											${matchVo.gameDurationStr } </span><br /> <span class="tipsy_live"
										style="font-size: 11px;"> ${matchVo.gameLaterTime } </span>
									</td>


									<!-- 와드 -->
									<td class="recent_td tipsy_live"
										style="line-height:14px; 
							font-size:12px; background:<c:out value="${background }" />; vertical-align:middle; 
							text-align:center;">
										<img src="/img/item/2055.png" alt="제어와드 설치 수"
										style="width: 14px; border: 0; height: 14px; margin: 4px; vertical-align: middle;">
										${matchVo.visionWardsBoughtInGame }<br>
										${matchVo.wardsPlaced } / ${matchVo.wardsKilled }
									</td>

									<!-- + -->
									<td class="show_match_info recent_td"
										style="background:<c:out value="${background }" />; vertical-align:middle; text-align:center;
							 font-size:11px; cursor:pointer;">▼
									</td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 소환사 프로필 끝 -->


			<!-- 룬 페이지 -->
			<div
				style="padding-top: 5px; border: 1px solid gray; z-index: 999; width: 796px; position: absolute; margin: 0px; left: 16px; background: white; text-align: center; top: 790px; display: none;"
				id="build_info" onclick="$('#build_info').hide();">

				<div style="position: relative; width: 780px; padding: 0 30px;">
					<div
						style="position: relative; width: 350px; text-align: center; height: 500px; float: left; margin: 3px; padding: 3px; border: 1px solid #b6aa82;">
						<!-- 주요룬 5개 -->
						<img class="tipsy_live"
							src="/img/perk-images/Styles/7200_Domination.png"
							style="width: 64px; border: 0;" /> <img class="tipsy_live"
							src="/img/perk-images/Styles/7203_Whimsy.png"
							style="width: 64px; border: 0;" /> <img class="tipsy_live"
							src="/img/perk-images/Styles/7201_Precision.png"
							style="width: 64px; border: 0;" /> <img class="tipsy_live"
							src="/img/perk-images/Styles/7204_Resolve.png"
							style="width: 64px; border: 0;" /> <img class="tipsy_live"
							src="/img/perk-images/Styles/7202_Sorcery.png"
							style="width: 64px; border: 0;"><br>
						<br>
						<br>

						<!-- 선택된 주요룬의 LV1 -->
						<img class="tipsy_live" src="" style="width: 64px; border: 0;" />
						<img class="tipsy_live" src="" style="width: 64px; border: 0;" />
						<img class="tipsy_live" src="" style="width: 64px; border: 0;" />
						<img class="tipsy_live" src="" style="width: 64px; border: 0;" /><br>
						<br>
						<br>

						<!-- 선택된 주요룬의 LV2 -->
						<img class="tipsy_live" src="" style="width: 48px; border: 0;" />
						<img class="tipsy_live" src="" style="width: 48px; border: 0;" />
						<img class="tipsy_live" src="" style="width: 48px; border: 0;" /><br>
						<br>
						<br>

						<!-- 선택된 주요룬의 LV3 -->
						<img class="tipsy_live" src="" style="width: 48px; border: 0;" />
						<img class="tipsy_live" src="" style="width: 48px; border: 0;" />
						<img class="tipsy_live" src="" style="width: 48px; border: 0;" /><br>
						<br>
						<br>

						<!-- 선택된 주요룬의 LV4 -->
						<img class="tipsy_live" src="" style="width: 48px; border: 0;" />
						<img class="tipsy_live" src="" style="width: 48px; border: 0;" />
						<img class="tipsy_live" src="" style="width: 48px; border: 0;">
						<img class="tipsy_live" src="" style="width: 48px; border: 0;"><br>
						<br>
						<br>
					</div>

					<!-- 부가룬 5개 -->
					<div
						style="position: relative; width: 350px; text-align: center; float: left; margin: 3px; padding: 3px; border: 1px solid #8793d6;">
						<img class="tipsy_live"
							src="/img/perk-images/Styles/7200_Domination.png"
							style="width: 64px; border: 0;" /> <img class="tipsy_live"
							src="/img/perk-images/Styles/7203_Whimsy.png"
							style="width: 64px; border: 0;" /> <img class="tipsy_live"
							src="/img/perk-images/Styles/7201_Precision.png"
							style="width: 64px; border: 0;" /> <img class="tipsy_live"
							src="/img/perk-images/Styles/7204_Resolve.png"
							style="width: 64px; border: 0;" /> <img class="tipsy_live"
							src="/img/perk-images/Styles/7202_Sorcery.png"
							style="width: 64px; border: 0;"><br>
						<br>
						<br>

						<!-- 선택된 부가룬의 LV1 -->
						<img class="tipsy_live" src="" style="width: 48px; border: 0;" />
						<img class="tipsy_live" src="" style="width: 48px; border: 0;" />
						<img class="tipsy_live" src="" style="width: 48px; border: 0;"><br>
						<br>
						<br>

						<!-- 선택된 부가룬의 LV2 -->
						<img class="tipsy_live" src="" style="width: 48px; border: 0;" />
						<img class="tipsy_live" src="" style="width: 48px; border: 0;" />
						<img class="tipsy_live" src="" style="width: 48px; border: 0;" /><br>
						<br>
						<br>

						<!-- 선택된 부가룬의 LV3 -->
						<img class="tipsy_live" src="" style="width: 48px; border: 0;" />
						<img class="tipsy_live" src="" style="width: 48px; border: 0;" />
						<img class="tipsy_live" src="" style="width: 48px; border: 0;" />
						<img class="tipsy_live" src="" style="width: 48px; border: 0;" /><br>
						<br>
					</div>

					<!-- 능력치 룬 -->
					<div
						style="position: relative; width: 350px; text-align: center; float: left; margin: 3px; padding: 3px; border: 1px solid gray;">
						<!-- 능력치 룬 LV1 -->
						<img class="tipsy_live"
							src="/img/perk-images/StatMods/StatModsAdaptiveForceIcon.png"
							style="width: 32px; border: 0;" /> <img class="tipsy_live"
							src="/img/perk-images/StatMods/StatModsAttackSpeedIcon.png"
							style="width: 32px; border: 0;" /> <img class="tipsy_live"
							src="/img/perk-images/StatMods/StatModsCDRScalingIcon.png"
							style="width: 32px; border: 0;"><br>
						<br>
						<br>

						<!-- 능력치 룬 LV2 -->
						<img class="tipsy_live"
							src="/img/perk-images/StatMods/StatModsAdaptiveForceIcon.png"
							style="width: 32px; border: 0;" /> <img class="tipsy_live"
							src="/img/perk-images/StatMods/StatModsArmorIcon.png"
							style="width: 32px; border: 0;" /> <img class="tipsy_live"
							src="/img/perk-images/StatMods/StatModsMagicResIcon.png"
							style="width: 32px; border: 0;" /><br>
						<br>
						<br>

						<!-- 능력치 룬 LV3 -->
						<img class="tipsy_live"
							src="/img/perk-images/StatMods/StatModsHealthScalingIcon.png"
							style="width: 32px; border: 0;" /> <img class="tipsy_live"
							src="/img/perk-images/StatMods/StatModsArmorIcon.png"
							style="width: 32px; border: 0;" /> <img class="tipsy_live"
							src="/img/perk-images/StatMods/StatModsMagicResIcon.png"
							style="width: 32px; border: 0;" /><br>
						<br>
						<br>
					</div>
				</div>
			</div>
			<!-- 룬 페이지 끝 -->


			<!-- 매치 세부정보 -->
			<div
				style="padding-top: 5px; border: 1px solid gray; z-index: 999; position: absolute; margin: 0px; left: 16px; background: white; text-align: center; top: 794px; display: none;"
				id="battle_info" onclick="$('#battle_info').hide();">

				<span style=""><b>&lt; 이 전투의 자세한 정보 &gt;</b></span>
				<div
					style="position: absolute; top: 3px; right: 3px; cursor: pointer;">
					<b>X</b>
				</div>

				<table class="tablesorter nosort" id="battle_sorter"
					style="width: 796px; margin: 0px;">
					<thead>
						<tr>
							<th style="text-align: center">L</th>
							<th>Champ &amp; name</th>
							<th style="width: 15px;">SS</th>
							<th>Lv</th>
							<th style="text-align: center">KDA</th>
							<th style="width: 154px;">아이템</th>
							<th>G/CS</th>
							<th style="width: 52px;">딜량</th>
							<th style="width: 52px;">피해량</th>
							<th>와드</th>
						</tr>
					</thead>

					<tbody id="battle_detail">
						<!-- 블루팀 1 -->
						<tr>
							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_blue spec_list_name"
								style="vertical-align: middle; text-align: left;"><img
								style="border: 1px solid black;" src="" class="tipsy_live"
								width="18"> <span
								style="vertical-align: middle; text-align: left;"></span></td>

							<td class="t_blue mi_rune"
								style="width: 38px; margin: 0px; padding: 0px; vertical-align: middle; text-align: center;">
								<img style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src=""><br> <img
								style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src="">
							</td>

							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"><font
								color="gray"><b></b></font><br> <span class="tipsy_live"
								style="font-size: 11px;"></span> <span class="tipsy_live"
								style="font-size: 11px;"></span></td>

							<td class="t_blue mi_item"><img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"></td>

							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"><span
								class="tipsy_live" style="font-size: 11px;"></span> <br> <span
								class="tipsy_live" style="font-size: 11px;"></span></td>

							<td class="t_blue tipsy_live"
								style="padding: 0px; vertical-align: middle; text-align: center;">

								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: red; border: 1px solid red;"></div>
								</div>
							</td>

							<td class="t_blue"
								style="padding: 0px; vertical-align: middle; text-align: center;">
								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<span></span>
									<div class="p-fill"
										style="background-color: green; border: 1px solid #393;">
										<span class="tipsy_live" style="font-size: 11px;"></span>
									</div>
								</div>
							</td>

							<td class="t_blue tipsy_live"
								style="vertical-align: middle; text-align: center;"><br>

							</td>
						</tr>

						<!-- 블루팀 2 -->
						<tr>
							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_blue spec_list_name"
								style="vertical-align: middle; text-align: left;"><img
								style="border: 1px solid black;" src="" class="tipsy_live"
								width="18"> <span
								style="vertical-align: middle; text-align: left;"></span></td>

							<td class="t_blue mi_rune"
								style="width: 38px; margin: 0px; padding: 0px; vertical-align: middle; text-align: center;">
								<img style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src=""><br> <img
								style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src="">
							</td>

							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"><font
								color="gray"><b></b></font><br> <span class="tipsy_live"
								style="font-size: 11px;"></span> <span class="tipsy_live"
								style="font-size: 11px;"></span></td>

							<td class="t_blue mi_item"><img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"></td>

							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"><span
								class="tipsy_live" style="font-size: 11px;"></span> <br> <span
								class="tipsy_live" style="font-size: 11px;"></span></td>

							<td class="t_blue tipsy_live"
								style="padding: 0px; vertical-align: middle; text-align: center;">

								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: red; border: 1px solid red;"></div>
								</div>
							</td>

							<td class="t_blue"
								style="padding: 0px; vertical-align: middle; text-align: center;">
								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: green; border: 1px solid #393;">
										<span class="tipsy_live" style="font-size: 11px;"></span>
									</div>
								</div>
							</td>

							<td class="t_blue tipsy_live"
								style="vertical-align: middle; text-align: center;"><br>

							</td>
						</tr>

						<!-- 블루팀 3 -->
						<tr>
							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_blue spec_list_name"
								style="vertical-align: middle; text-align: left;"><img
								style="border: 1px solid black;" src="" class="tipsy_live"
								width="18"> <span
								style="vertical-align: middle; text-align: left;"></span></td>

							<td class="t_blue mi_rune"
								style="width: 38px; margin: 0px; padding: 0px; vertical-align: middle; text-align: center;">
								<img style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src=""><br> <img
								style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src="">
							</td>

							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"><font
								color="gray"><b></b></font><br> <span class="tipsy_live"
								style="font-size: 11px;"></span> <span class="tipsy_live"
								style="font-size: 11px;"></span></td>

							<td class="t_blue mi_item"><img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"></td>

							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"><span
								class="tipsy_live" style="font-size: 11px;"></span> <br> <span
								class="tipsy_live" style="font-size: 11px;"></span></td>

							<td class="t_blue tipsy_live"
								style="padding: 0px; vertical-align: middle; text-align: center;">

								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: red; border: 1px solid red;"></div>
								</div>
							</td>

							<td class="t_blue"
								style="padding: 0px; vertical-align: middle; text-align: center;">
								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: green; border: 1px solid #393;">
										<span class="tipsy_live" style="font-size: 11px;"></span>
									</div>
								</div>
							</td>

							<td class="t_blue tipsy_live"
								style="vertical-align: middle; text-align: center;"><br>

							</td>
						</tr>

						<!-- 블루팀 4 -->
						<tr>
							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_blue spec_list_name"
								style="vertical-align: middle; text-align: left;"><img
								style="border: 1px solid black;" src="" class="tipsy_live"
								width="18"> <span
								style="vertical-align: middle; text-align: left;"></span></td>

							<td class="t_blue mi_rune"
								style="width: 38px; margin: 0px; padding: 0px; vertical-align: middle; text-align: center;">
								<img style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src=""><br> <img
								style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src="">
							</td>

							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"><font
								color="gray"><b></b></font><br> <span class="tipsy_live"
								style="font-size: 11px;"></span> <span class="tipsy_live"
								style="font-size: 11px;"></span></td>

							<td class="t_blue mi_item"><img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"></td>

							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"><span
								class="tipsy_live" style="font-size: 11px;"></span> <br> <span
								class="tipsy_live" style="font-size: 11px;"></span></td>

							<td class="t_blue tipsy_live"
								style="padding: 0px; vertical-align: middle; text-align: center;">

								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: red; border: 1px solid red;"></div>
								</div>
							</td>

							<td class="t_blue"
								style="padding: 0px; vertical-align: middle; text-align: center;">
								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: green; border: 1px solid #393;">
										<span class="tipsy_live" style="font-size: 11px;"></span>
									</div>
								</div>
							</td>

							<td class="t_blue tipsy_live"
								style="vertical-align: middle; text-align: center;"><br>

							</td>
						</tr>

						<!-- 블루팀 5 -->
						<tr>
							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_blue spec_list_name"
								style="vertical-align: middle; text-align: left;"><img
								style="border: 1px solid black;" src="" class="tipsy_live"
								width="18"> <span
								style="vertical-align: middle; text-align: left;"></span></td>

							<td class="t_blue mi_rune"
								style="width: 38px; margin: 0px; padding: 0px; vertical-align: middle; text-align: center;">
								<img style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src=""><br> <img
								style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src="">
							</td>

							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"><font
								color="gray"><b></b></font><br> <span class="tipsy_live"
								style="font-size: 11px;"></span> <span class="tipsy_live"
								style="font-size: 11px;"></span></td>

							<td class="t_blue mi_item"><img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"></td>

							<td class="t_blue"
								style="vertical-align: middle; text-align: center;"><span
								class="tipsy_live" style="font-size: 11px;"></span> <br> <span
								class="tipsy_live" style="font-size: 11px;"></span></td>

							<td class="t_blue tipsy_live"
								style="padding: 0px; vertical-align: middle; text-align: center;">

								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: red; border: 1px solid red;"></div>
								</div>
							</td>

							<td class="t_blue"
								style="padding: 0px; vertical-align: middle; text-align: center;">
								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: green; border: 1px solid #393;">
										<span class="tipsy_live" style="font-size: 11px;"></span>
									</div>
								</div>
							</td>

							<td class="t_blue tipsy_live"
								style="vertical-align: middle; text-align: center;"><br>

							</td>
						</tr>

						<!-- 블루팀 총 결과 -->
						<tr>
							<td class="t_blue" style="text-align: center;"></td>

							<td class="t_blue" style="text-align: center;" colspan="3">
								<img style="border: 0px; height: 15px;"
								src="/img/common/score.png"> <span></span>

							</td>

							<td class="t_blue" style="text-align: right;" colspan="6"><span></span>
								<img style="border: 0px; height: 15px;"
								src="/img/common/turret_100.png"> <span></span> <img
								style="border: 0px; height: 15px;"
								src="/img/common/dragon_100.png"> <span></span> <img
								style="border: 0px; height: 15px;"
								src="/img/common/baron_100.png"> <span></span> <img
								style="border: 0px; height: 15px;"
								src="/img/common/inhibitor_100.png"> <span></span></td>
						</tr>


						<!-- 레드팀 총 결과 -->
						<tr>
							<td class="t_purple" style="text-align: center;"></td>

							<td class="t_purple" style="text-align: center;" colspan="3">
								<img style="border: 0px; height: 15px;"
								src="/img/common/score.png"> <span></span>

							</td>

							<td class="t_purple" style="text-align: right;" colspan="6">
								<span></span> <img style="border: 0px; height: 15px;"
								src="/img/common/turret_100.png"> <span></span> <img
								style="border: 0px; height: 15px;"
								src="/img/common/dragon_100.png"> <span></span> <img
								style="border: 0px; height: 15px;"
								src="/img/common/baron_100.png"> <span></span> <img
								style="border: 0px; height: 15px;"
								src="/img/common/inhibitor_100.png"> <span></span>
							</td>
						</tr>

						<!-- 레드팀 1 -->
						<tr>
							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_purple spec_list_name"
								style="vertical-align: middle; text-align: left;"><img
								style="border: 1px solid black;" src="" class="tipsy_live"
								width="18"> <span
								style="vertical-align: middle; text-align: left;"></span></td>

							<td class="t_purple mi_rune"
								style="width: 38px; margin: 0px; padding: 0px; vertical-align: middle; text-align: center;">
								<img style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src=""><br> <img
								style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src="">
							</td>

							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"><font
								color="gray"><b></b></font><br> <span class="tipsy_live"
								style="font-size: 11px;"></span> <span class="tipsy_live"
								style="font-size: 11px;"></span></td>

							<td class="t_purple mi_item"><img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"></td>

							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"><span
								class="tipsy_live" style="font-size: 11px;"></span> <br> <span
								class="tipsy_live" style="font-size: 11px;"></span></td>

							<td class="t_purple tipsy_live"
								style="padding: 0px; vertical-align: middle; text-align: center;">

								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: red; border: 1px solid red;"></div>
								</div>
							</td>

							<td class="t_purple"
								style="padding: 0px; vertical-align: middle; text-align: center;">
								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: green; border: 1px solid #393;">
										<span class="tipsy_live" style="font-size: 11px;"></span>
									</div>
								</div>
							</td>

							<td class="t_purple tipsy_live"
								style="vertical-align: middle; text-align: center;"><br>

							</td>
						</tr>

						<!-- 레드팀 2 -->
						<tr>
							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_purple spec_list_name"
								style="vertical-align: middle; text-align: left;"><img
								style="border: 1px solid black;" src="" class="tipsy_live"
								width="18"> <span
								style="vertical-align: middle; text-align: left;"></span></td>

							<td class="t_purple mi_rune"
								style="width: 38px; margin: 0px; padding: 0px; vertical-align: middle; text-align: center;">
								<img style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src=""><br> <img
								style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src="">
							</td>

							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"><font
								color="gray"><b></b></font><br> <span class="tipsy_live"
								style="font-size: 11px;"></span> <span class="tipsy_live"
								style="font-size: 11px;"></span></td>

							<td class="t_purple mi_item"><img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"></td>

							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"><span
								class="tipsy_live" style="font-size: 11px;"></span> <br> <span
								class="tipsy_live" style="font-size: 11px;"></span></td>

							<td class="t_purple tipsy_live"
								style="padding: 0px; vertical-align: middle; text-align: center;">

								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: red; border: 1px solid red;"></div>
								</div>
							</td>

							<td class="t_purple"
								style="padding: 0px; vertical-align: middle; text-align: center;">
								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: green; border: 1px solid #393;">
										<span class="tipsy_live" style="font-size: 11px;"></span>
									</div>
								</div>
							</td>

							<td class="t_purple tipsy_live"
								style="vertical-align: middle; text-align: center;"><br>

							</td>
						</tr>

						<!-- 레드팀 3 -->
						<tr>
							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_purple spec_list_name"
								style="vertical-align: middle; text-align: left;"><img
								style="border: 1px solid black;" src="" class="tipsy_live"
								width="18"> <span
								style="vertical-align: middle; text-align: left;"></span></td>

							<td class="t_purple mi_rune"
								style="width: 38px; margin: 0px; padding: 0px; vertical-align: middle; text-align: center;">
								<img style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src=""><br> <img
								style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src="">
							</td>

							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"><font
								color="gray"><b></b></font><br> <span class="tipsy_live"
								style="font-size: 11px;"></span> <span class="tipsy_live"
								style="font-size: 11px;"></span></td>

							<td class="t_purple mi_item"><img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"></td>

							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"><span
								class="tipsy_live" style="font-size: 11px;"></span> <br> <span
								class="tipsy_live" style="font-size: 11px;"></span></td>

							<td class="t_purple tipsy_live"
								style="padding: 0px; vertical-align: middle; text-align: center;">
								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: red; border: 1px solid red;"></div>
								</div>
							</td>

							<td class="t_purple"
								style="padding: 0px; vertical-align: middle; text-align: center;">
								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: green; border: 1px solid #393;">
										<span class="tipsy_live" style="font-size: 11px;"></span>
									</div>
								</div>
							</td>

							<td class="t_purple tipsy_live"
								style="vertical-align: middle; text-align: center;"><br>

							</td>
						</tr>

						<!-- 레드팀 4 -->
						<tr>
							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_purple spec_list_name"
								style="vertical-align: middle; text-align: left;"><img
								style="border: 1px solid black;" src="" class="tipsy_live"
								width="18"> <span
								style="vertical-align: middle; text-align: left;"></span></td>

							<td class="t_purple mi_rune"
								style="width: 38px; margin: 0px; padding: 0px; vertical-align: middle; text-align: center;">
								<img style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src=""><br> <img
								style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src="">
							</td>

							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"><font
								color="gray"><b></b></font><br> <span class="tipsy_live"
								style="font-size: 11px;"></span> <span class="tipsy_live"
								style="font-size: 11px;"></span></td>

							<td class="t_purple mi_item"><img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"></td>

							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"><span
								class="tipsy_live" style="font-size: 11px;"></span> <br> <span
								class="tipsy_live" style="font-size: 11px;"></span></td>

							<td class="t_purple tipsy_live"
								style="padding: 0px; vertical-align: middle; text-align: center;">
								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: red; border: 1px solid red;"></div>
								</div>
							</td>

							<td class="t_purple"
								style="padding: 0px; vertical-align: middle; text-align: center;">
								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: green; border: 1px solid #393;">
										<span class="tipsy_live" style="font-size: 11px;"></span><span
											class="tipsy_live" style="font-size: 11px;"></span>
									</div>
								</div>
							</td>

							<td class="t_purple tipsy_live"
								style="vertical-align: middle; text-align: center;"><br>

							</td>
						</tr>

						<!-- 레드팀 5 -->
						<tr>
							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_purple spec_list_name"
								style="vertical-align: middle; text-align: left;"><img
								style="border: 1px solid black;" src="" class="tipsy_live"
								width="18"> <span
								style="vertical-align: middle; text-align: left;"></span></td>

							<td class="t_purple mi_rune"
								style="width: 38px; margin: 0px; padding: 0px; vertical-align: middle; text-align: center;">
								<img style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src=""><br> <img
								style="border: 0px;" width="15" src=""> <img
								style="border: 0px; width: 18px;" src="">
							</td>

							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"></td>

							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"><font
								color="gray"><b></b></font><br> <span class="tipsy_live"
								style="font-size: 11px;"></span> <span class="tipsy_live"
								style="font-size: 11px;"></span></td>

							<td class="t_purple mi_item"><img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"> <img width="20" src=""
								class="tipsy_live"></td>

							<td class="t_purple"
								style="vertical-align: middle; text-align: center;"><span
								class="tipsy_live" style="font-size: 11px;"></span> <br> <span
								class="tipsy_live" style="font-size: 11px;"></span></td>

							<td class="t_purple tipsy_live"
								style="padding: 0px; vertical-align: middle; text-align: center;">

								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: red; border: 1px solid red;"></div>
								</div>
							</td>

							<td class="t_purple"
								style="padding: 0px; vertical-align: middle; text-align: center;">
								<span class="tipsy_live" style="font-size: 11px;"></span>
								<div class="p-bar">
									<div class="p-fill"
										style="background-color: green; border: 1px solid #393;">
										<span class="tipsy_live" style="font-size: 11px;"></span>
									</div>
								</div>
							</td>

							<td class="t_purple tipsy_live"
								style="vertical-align: middle; text-align: center;"><br>

							</td>
						</tr>

						<tr>
							<td colspan="10" style="text-align: left; font-size: 12px;">
								※ HRD.GG</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 매치 세부정보 끝 -->
		<%@ include file="/WEB-INF/include/footer.jspf"%>
		</div>
		<!-- 정보 컨테이너 끝 -->
	</div>

</body>
</html>
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
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
	display: inline-block;
}

#champView {
	/* 	border: 1px solid black; */
	
}

.champDetail_main {
	display: block;
	width: 1000px;
	margin: 0 auto;
}

.champDetail_nav {
	display: block;
}

.champDetail_nav li {
	display: inline-block;
}

.champDetail_nav li:last-child {margin-right;
	float: right;
	display: inline-block;
}

.champDetail_nav li a {
	width: 100px;
	text-decoration: none;
	color: #000;
	text-align: center;
	display: inline-block;
}

#champView {
	width: 1000px;
	height: 500px;
}

.champ_img {
	display: block;
	margin-bottom: 30px;
}

.namePart {
	border: none;
	color: #fff;
}

.namePart div {
	display: block;
	margin-left: 15px;
	border: none;
}

#champInfo {
	display: block;
	width: 1000px;
	height: 500px;
	background: url(/img/splash/${champVo.id}_0.jpg) no-repeat left top;
	background-size: 100% 100%;
}

#champInfo .champIcon {
	width: 120px;
	height: 120px;
	overflow: hidden;
	background:
		url(/img/bg_img/bg_86x86_champion_image.png)
		no-repeat left top;
	background-size: 100%;
}

#champInfo .champIcon img {
	width: 100px;
	height: 100px;
	margin: 10px;
}

#champInfo .shadow {
	display: block;
	font-size: 13px;
	margin: 0px;
	height: 500px;
	background:	url(/img/bg_img/bg_663x340_transform.png) no-repeat left top;
	background-size: 97.5%;
	padding: 50px 0 0 50px;
	background-size: 97.5%;
}

#champInfo .shadow .descPart {
	display: block;
	width: 500px;
	color: #fff;
	background: #000717;
	border: 1px solid #08335B;
	padding: 10px;
	opacity: 0.9;
	line-height: 20px;
}

#champInfo .shadow .etcPart {
	display: block;
	font-size: 17px;
	width: 500px;
	color: #fff;
	padding: 10px;
	opacity: 0.9;
	line-height: 20px;
	width: 500px;
}

.detailPage {
	display: block;
	box-sizing: border-box;
	width: 100%;
	height: 325px;
	overflow: hidden;
	margin: 2px;
	width: 100%;
}

#champStat {
	color: white;
	display: block;
	width: 1000px;
	height: 500px;
	background: url(/img/splash/${champVo.id}_0.jpg) no-repeat left top;
	background-size: 100% 100%;
}

#champStat .shadow {
	display: block;
	font-size: 13px;
	margin: 0px;
	height: 100%;
	background:
		url(/img/bg_img/bg_663x340_transform.png)
		no-repeat left top;
	background-size: 97.5%;
}

#champStat .tab {
	width: 238px;
	margin: 5px 0 0 5px;
}

#champStat .status {
	border-bottom: 1px solid #08335B;
	padding: 10px 0;
	display: block;
}

#champStat .title {
	
}

#champStat .bars {
	position: relative;
	width: 79%;
	height: 20px;
	vertical-align: middle;
}

#champStat .bar_left {
	border: 1px solid black;
	position: absolute;
	left: 0;
	top: 0;
	height: 100%;
	border-radius: 5px;
	display: inline-block;
	height: 20px;
	z-index: 1;
}

#champStat .bar_right {
	border: 1px solid black;
	position: absolute;
	left: 0;
	top: 0;
	height: 100%;
	border-radius: 5px;
	display: inline-block;
	background-color: gray;
	width: 100%;
	height: 20px;
}

#champStat .statTable table, #champStat .statTable td {
	border: 1px solid #01305C;
	border-collapse: collapse;
	margin: 20px 0 0 20px;
	padding: 10px;
	text-align: center;
}

#champStat .statTable th {
	background-color: #08335B;
	border-collapse: collapse;
	padding: 10px;
}

#champStat .statTable th:first-child {
	border-right: 1px solid black;
}

#champStat .statTable th:last-child {
	border-left: 1px solid black;
}

#champStat .statTable td:last-child {
	color: #00EE34;
}

#champStat .statTable .green {
	color: #D8E500;
}

#champSkill {
	display: block;
}

.skillListWrap {
	border: 1px solid #08335B;
	background-color: #030E21;
	box-sizing: border-box;
	display: block;
	width: 800px;
	height: 150px;
	padding: 35px 21% 20px 21%;
	margin: 0 auto 40px auto;
}

.skillDescWrap {
	border: 1px solid #08335B;
	background-color: #030E21;
	display: block;
	width: 800px;
	height: 250px;
	margin: 0 auto;
}

#champSkill .skillListWrap .skillIcon {
	display: block;
	text-align: center;
	width: 70px;
	height: 70px;
	overflow: hidden;
	background:	url(/img/bg_img/bg_70x70_skill.png)	no-repeat left top;
}

#champSkill .skillListWrap .skillIcon img {
	width: 64px;
	height: 64px;
	margin: 3px;
}

#champSkill .skillListWrap .skillType {
	display: block;
	text-align: center;
}

#champSkill .skillDescWrap .div1 {
	display: block;
}

#champSkill .skillDescWrap .div2 {
	margin: 20px 10px 10px 50px;
	vertical-align: middle;
}

#champSkill .skillDescWrap .skilldescs .skillIcon {
	width: 70px;
	height: 70px;
	overflow: hidden;
	background:
		url(/img/bg_img/bg_70x70_skill.png) no-repeat left top;
	margin-top: 12px;
}

#champSkill .skillDescWrap .skilldescs .skillIcon img {
	width: 64px;
	height: 64px;
	margin: 3px;
}

#champSkill .skillDescWrap .skillCool {
	width: 100%;
	text-align: right;
	color: #ffd339;
}

#champSkill .skillDescWrap .skillName {
	font-weight: bold;
	color: #f67004;
	margin-bottom: 10px;
}

#champSkill .skillDescWrap .skillDesc {
	color: #a0acbd;
	line-height: 20px;
}

/* slideshow */
* {
	box-sizing: border-box
}

/* Slideshow container */
.slideshow-container {
	max-width: 1000px;
	position: relative;
	margin: auto;
}

/* Hide the images by default */
.mySlides {
	display: none;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	margin-top: -22px;
	padding: 16px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

.slideshow-container .text span {
	background-color: black;
	padding: 5px;
	font-size: 16px;
	color: #ff9600;
	font-weight: bold;
}

/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
	background-color: #717171;
}

/* Fading animation */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}
</style>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {
		
		$('.menus').on('click', function() {
			console.log($(this).attr('id'));
			$('#champView').children().each(function(idx, item){
				$(item).hide();
			});
			switch($(this).attr('id')) {
			case 'menu0':
				$('#champInfo').fadeIn(1000);
				break;
			case 'menu1':
				$('#champStat').fadeIn(1000);
				break;
			case 'menu2':
				$('#champSkill').fadeIn(1000);
				break;
			case 'menu3':
				$('#champSkin').fadeIn(1000);
				break;
			}
			
		});
		
		$('.skills').hover(function() {
			var idx = $(this).attr('id').charAt(5);
			$('.skilldescs').each(function(idx, item){
				$(item).hide();
			});
			var show = '#skillDesc' + idx;
			$(show).show();
		});
	});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/include/header.jspf" %>
	<div id="jb-header">
			<img src="/img/lll2.jpg" width="100%" height="250px">
	</div>
	<div id="icon">
		<h1>Champion Information</h1>
	</div>
	<div class="champDetail_main">
		<div class="champDetail_nav">
			<ul>
				<li><a href="javascript:void(0);" id="menu0" class="menus">챔피언 정보</a></li>
				<li><a href="javascript:void(0);" id="menu1" class="menus">능력치</a></li>
				<li><a href="javascript:void(0);" id="menu2" class="menus">스킬</a></li>
				<li><a href="javascript:void(0);" id="menu3" class="menus">스킨</a></li>
				<li><a href="/champion" id="menu4">챔피언 목록</a></li>
			</ul>
		</div>
		<div id="champView">
			<!-- 챔피언정보 -->
			<div id="champInfo">
				<div class="shadow">
					<div class="champ_img">
						<div class="champIcon">
							<img src="/img/${champVo.image}" />
						</div>
						<div class="namePart">
							<div class="korName">
								<span style="font-size: 30px">${champVo.name},
									${champVo.title}</span>
							</div>
							<div class="engName">
								<span>${champVo.id}</span>
							</div>
						</div>
					</div>
					<div class="descPart">${champVo.lore}</div>
					<div class="etcPart">
						<span style="color: red;">Tags : </span>
						<c:forEach items="${fn:split(champVo.tags,'|') }" var="item" varStatus="g">
						    ${item}
						    <c:if test="${!g.last}">
						    	, 
						    </c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- 			챔피언 능력치 -->
			<div id="champStat" class="detailPage" style="display: none;">
				<div class="shadow">
					<div class="status">
						<div class="stat_hp tab">
							<div class="title">생명력</div>
							<div class="bars">
								<div class="bar_left"
									style="width: ${fn:split(champVo.info,'|')[0] * 10}%; background-color: green;"></div>
								<div class="bar_right"></div>
							</div>
						</div>
						<div class="stat_ad tab">
							<div class="title">공격력</div>
							<div class="bars">
								<div class="bar_left"
									style="width: ${fn:split(champVo.info,'|')[1] * 10}%; background-color: red;"></div>
								<div class="bar_right"></div>
							</div>
						</div>
						<div class="stat_ap tab">
							<div class="title">주문력</div>
							<div class="bars">
								<div class="bar_left"
									style="width: ${fn:split(champVo.info,'|')[2] * 10}%; background-color: blue;"></div>
								<div class="bar_right"></div>
							</div>
						</div>
						<div class="stat_hard tab">
							<div class="title">난이도</div>
							<div class="bars">
								<div class="bar_left"
									style="width: ${fn:split(champVo.info,'|')[3] * 10}%; background-color: purple;"></div>
								<div class="bar_right"></div>
							</div>
						</div>
					</div>
					<div class="statTable">
						<table>
							<tr>
								<th>구분</th>
								<th>1레벨 (레벨당 성장수치)</th>
								<th>18레벨 최종 수치</th>
							</tr>
							<tr>
								<td>체력</td>
								<td>${fn:split(champVo.stats,'|')[0]}<span class="green">(+${fn:split(champVo.stats,'|')[1]})</span></td>
								<fmt:formatNumber var="lvl18"
									value="${fn:split(champVo.stats,'|')[0] + fn:split(champVo.stats,'|')[1] * 17}"
									pattern="0.00" />
								<td>${lvl18}</td>
							</tr>
							<tr>
								<td>마나</td>
								<td>${fn:split(champVo.stats,'|')[2]}<span class="green">(+${fn:split(champVo.stats,'|')[3]})</span></td>
								<fmt:formatNumber var="lvl18"
									value="${fn:split(champVo.stats,'|')[2] + fn:split(champVo.stats,'|')[3] * 17}"
									pattern="0.00" />
								<td>${lvl18}</td>
							</tr>
							<tr>
								<td>공격력</td>
								<td>${fn:split(champVo.stats,'|')[16]}<span class="green">(+${fn:split(champVo.stats,'|')[17]})</span></td>
								<fmt:formatNumber var="lvl18"
									value="${fn:split(champVo.stats,'|')[14] + fn:split(champVo.stats,'|')[15] * 17}"
									pattern="0.00" />
								<td>${lvl18}</td>
							</tr>
							<tr>
								<td>공격속도</td>
								<c:set var="attackSpeed"
									value="${fn:split(champVo.stats,'|')[19]}" />
								<td>${attackSpeed}<span class="green">(+${fn:split(champVo.stats,'|')[18]}%)</span></td>
								<c:set var="attackspeedperlevel"
									value="${(attackSpeed * (fn:split(champVo.stats,'|')[18]*0.01)) * 17}" />
								<fmt:formatNumber var="lvl18"
									value="${attackSpeed + attackspeedperlevel}" pattern="0.000" />
								<td>${lvl18}</td>
							</tr>
							<tr>
								<td>5초당 체력회복</td>
								<td>${fn:split(champVo.stats,'|')[10]}<span class="green">(+${fn:split(champVo.stats,'|')[11]})</span></td>
								<fmt:formatNumber var="lvl18"
									value="${fn:split(champVo.stats,'|')[10] + fn:split(champVo.stats,'|')[11] * 17}"
									pattern="0.00" />
								<td>${lvl18}</td>
							</tr>
							<tr>
								<td>5초당 마나회복</td>
								<td>${fn:split(champVo.stats,'|')[12]}<span class="green">(+${fn:split(champVo.stats,'|')[13]})</span></td>
								<fmt:formatNumber var="lvl18"
									value="${fn:split(champVo.stats,'|')[12] + fn:split(champVo.stats,'|')[13] * 17}"
									pattern="0.00" />
								<td>${lvl18}</td>
							</tr>
							<tr>
								<td>방어력</td>
								<td>${fn:split(champVo.stats,'|')[5]}<span class="green">(+${fn:split(champVo.stats,'|')[6]})</span></td>
								<fmt:formatNumber var="lvl18"
									value="${fn:split(champVo.stats,'|')[5] + fn:split(champVo.stats,'|')[6] * 17}"
									pattern="0.00" />
								<td>${lvl18}</td>
							</tr>
							<tr>
								<td>마법 저항력</td>
								<td>${fn:split(champVo.stats,'|')[7]}<span class="green">(+${fn:split(champVo.stats,'|')[8]})</span></td>
								<fmt:formatNumber var="lvl18"
									value="${fn:split(champVo.stats,'|')[7] + fn:split(champVo.stats,'|')[8] * 17}"
									pattern="0.00" />
								<td>${lvl18}</td>
							</tr>
							<tr>
								<td>이동속도</td>
								<td>${fn:split(champVo.stats,'|')[4]}</td>
								<td>${fn:split(champVo.stats,'|')[4]}</td>
							</tr>
							<tr>
								<td>사정거리</td>
								<td>${fn:split(champVo.stats,'|')[9]}</td>
								<td>${fn:split(champVo.stats,'|')[9]}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!-- 챔피언 스킬 -->
			<div id="champSkill"
				style="background-color: #000817; height: 100%; display: none;">
				<div class="skillListWrap">
					<div class="skills skill0" id="skill0">
						<div class="skillIcon">
							<img alt="${fn:split(champVo.passive,'|')[2]}"
								src="/img/${fn:split(champVo.passive,'|')[2]}">
						</div>
						<div class="skillType">Passive</div>
					</div>
					<div class="skills skill1" id="skill1">
						<div class="skillIcon">
							<img alt="${fn:split(champVo.spellQ,'|')[5]}"
								src="/img/${fn:split(champVo.spellQ,'|')[5]}">
						</div>
						<div class="skillType">Q</div>
					</div>
					<div class="skills skill2" id="skill2">
						<div class="skillIcon">
							<img alt="${fn:split(champVo.spellW,'|')[5]}"
								src="/img/${fn:split(champVo.spellW,'|')[5]}">
						</div>
						<div class="skillType">W</div>
					</div>
					<div class="skills skill3" id="skill3">
						<div class="skillIcon">
							<img alt="${fn:split(champVo.spellE,'|')[5]}"
								src="/img/${fn:split(champVo.spellE,'|')[5]}">
						</div>
						<div class="skillType">E</div>
					</div>
					<div class="skills skill4" id="skill4">
						<div class="skillIcon">
							<img alt="${fn:split(champVo.spellR,'|')[5]}"
								src="/img/${fn:split(champVo.spellR,'|')[5]}">
						</div>
						<div class="skillType">R</div>
					</div>
				</div>
				<div class="skillDescWrap">
					<div id="skillDesc0" class="skilldescs">
						<div class="div1">
							<div class="skillCool">
								<c:if test="${fn:length(fn:split(champVo.passive,'|')) gt 3} ">
									${fn:split(champVo.passive,'|')[2]}
									${fn:split(champVo.passive,'|')[3]}
								</c:if>
							</div>
						</div>
						<div style="display: block; position: relative;">
							<div class="div2">
								<div class="skillIcon">
									<c:choose>
										<c:when
											test="${fn:length(fn:split(champVo.passive,'|')) gt 3}">
											<img alt="${fn:split(champVo.passive,'|')[4]}"
												src="/img/${fn:split(champVo.passive,'|')[4]}">
										</c:when>
										<c:otherwise>
											<img alt="${fn:split(champVo.passive,'|')[2]}"
												src="/img/${fn:split(champVo.passive,'|')[2]}">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="div2" style="width: 600px;">
								<div class="skillName">${fn:split(champVo.passive,'|')[0]}</div>
								<div class="skillDesc">${fn:split(champVo.passive,'|')[1]}</div>
							</div>
						</div>
					</div>
					<div id="skillDesc1" class="skilldescs" style="display: none;">
						<div class="div1">
							<div class="skillCool">
								<c:if test="${fn:length(fn:split(champVo.spellQ,'|')) > 4}">
									마나 소모 : ${fn:split(champVo.spellQ,'|')[4]} <br />
									재사용 대기시간 : ${fn:split(champVo.spellQ,'|')[3]}
								</c:if>
							</div>
						</div>
						<div style="display: block; position: relative;">
							<div class="div2">
								<div class="skillIcon">
									<c:choose>
										<c:when test="${fn:length(fn:split(champVo.spellQ,'|')) gt 4}">
											<img alt="${fn:split(champVo.spellQ,'|')[5]}"
												src="/img/${fn:split(champVo.spellQ,'|')[5]}">
										</c:when>
										<c:otherwise>
											<img alt="${fn:split(champVo.spellQ,'|')[3]}"
												src="/img/${fn:split(champVo.spellQ,'|')[3]}">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="div2" style="width: 600px;">
								<div class="skillName">${fn:split(champVo.spellQ,'|')[1]}</div>
								<div class="skillDesc">${fn:split(champVo.spellQ,'|')[2]}</div>
							</div>
						</div>
					</div>
					<div id="skillDesc2" class="skilldescs" style="display: none;">
						<div class="div1">
							<div class="skillCool">
								<c:if test="${fn:length(fn:split(champVo.spellW,'|')) > 4}">
										마나 소모 : ${fn:split(champVo.spellW,'|')[4]} <br />
										재사용 대기시간 : ${fn:split(champVo.spellW,'|')[3]}
								</c:if>
							</div>
						</div>
						<div style="display: block; position: relative;">
							<div class="div2">
								<div class="skillIcon">
									<c:choose>
										<c:when test="${fn:length(fn:split(champVo.spellW,'|')) gt 4}">
											<img alt="${fn:split(champVo.spellW,'|')[5]}"
												src="/img/${fn:split(champVo.spellW,'|')[5]}">
										</c:when>
										<c:otherwise>
											<img alt="${fn:split(champVo.spellW,'|')[3]}"
												src="/img/${fn:split(champVo.spellW,'|')[3]}">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="div2" style="width: 600px;">
								<div class="skillName">${fn:split(champVo.spellW,'|')[1]}</div>
								<div class="skillDesc">${fn:split(champVo.spellW,'|')[2]}</div>
							</div>
						</div>
					</div>
					<div id="skillDesc3" class="skilldescs" style="display: none;">
						<div class="div1">
							<div class="skillCool">
								<c:if test="${fn:length(fn:split(champVo.spellE,'|')) > 4}">
										마나 소모 : ${fn:split(champVo.spellE,'|')[4]} <br />
										재사용 대기시간 : ${fn:split(champVo.spellE,'|')[3]}
								</c:if>
							</div>
						</div>
						<div style="display: block; position: relative;">
							<div class="div2" style="vertical-align: middle;">
								<div class="skillIcon">
									<c:choose>
										<c:when test="${fn:length(fn:split(champVo.spellE,'|')) gt 4}">
											<img alt="${fn:split(champVo.spellE,'|')[5]}"
												src="/img/${fn:split(champVo.spellE,'|')[5]}">
										</c:when>
										<c:otherwise>
											<img alt="${fn:split(champVo.spellE,'|')[3]}"
												src="/img/${fn:split(champVo.spellE,'|')[3]}">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="div2" style="width: 600px;">
								<div class="skillName">${fn:split(champVo.spellE,'|')[1]}</div>
								<br />
								<div class="skillDesc">${fn:split(champVo.spellE,'|')[2]}</div>
							</div>
						</div>
					</div>
					<div id="skillDesc4" class="skilldescs" style="display: none;">
						<div class="div1">
							<div class="skillCool">
								<c:if test="${fn:length(fn:split(champVo.spellR,'|')) > 4}">
										마나 소모 : ${fn:split(champVo.spellR,'|')[4]} <br />
										재사용 대기시간 : ${fn:split(champVo.spellR,'|')[3]}
								</c:if>
							</div>
						</div>
						<div style="display: block; position: relative;">
							<div class="div2">
								<div class="skillIcon">
									<c:choose>
										<c:when test="${fn:length(fn:split(champVo.spellR,'|')) gt 4}">
											<img alt="${fn:split(champVo.spellR,'|')[5]}"
												src="/img/${fn:split(champVo.spellR,'|')[5]}">
										</c:when>
										<c:otherwise>
											<img alt="${fn:split(champVo.spellR,'|')[3]}"
												src="/img/${fn:split(champVo.spellR,'|')[3]}">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="div2" style="width: 600px;">
								<div class="skillName">${fn:split(champVo.spellR,'|')[1]}</div>
								<div class="skillDesc">${fn:split(champVo.spellR,'|')[2]}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="champSkin" style="display: none;">
				<!-- Slideshow container -->
				<div class="slideshow-container">

					<!-- Full-width images with number and caption text -->
					<c:forEach var="skin" items="${fn:split(champVo.skins,'|')}"
						varStatus="i">
						<div class="mySlides fade">
							<div class="numbertext">${i.index + 1}/${fn:length(fn:split(champVo.skins,'|')) + 1}</div>
							<img src="/img/splash/${champVo.id}_${fn:split(skin,',')[0]}.jpg"
								style="width: 100%">
							<c:if test="${fn:split(skin,',')[1] ne 'default'}">
								<div class="text">
									<span>${fn:split(skin,',')[1]}</span>
								</div>
							</c:if>
						</div>
					</c:forEach>

					<!-- Next and previous buttons -->
					<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
						class="next" onclick="plusSlides(1)">&#10095;</a>
				</div>
				<br>

				<!-- The dots/circles -->
				<div style="text-align: center; display: block;">
					<c:forEach begin="0"
						end="${fn:length(fn:split(champVo.skins,'|'))}" step="1"
						varStatus="status">
						<span class="dot" onclick="currentSlide(${status.count})"></span>
					</c:forEach>
				</div>

				<script>
					var slideIndex = 1;
					showSlides(slideIndex);
				
					// Next/previous controls
					function plusSlides(n) {
						showSlides(slideIndex += n);
					}
				
					// Thumbnail image controls
					function currentSlide(n) {
						showSlides(slideIndex = n);
					}
				
					function showSlides(n) {
						var i;
						var slides = document.getElementsByClassName("mySlides");
						var dots = document.getElementsByClassName("dot");
						if (n > slides.length) {
							slideIndex = 1
						}
						if (n < 1) {
							slideIndex = slides.length
						}
						for (i = 0; i < slides.length; i++) {
							slides[i].style.display = "none";
						}
						for (i = 0; i < dots.length; i++) {
							dots[i].className = dots[i].className.replace(" active", "");
						}
						slides[slideIndex - 1].style.display = "block";
						dots[slideIndex - 1].className += " active";
					}
				</script>
			</div>
		</div>
	</div>
</body>
</html>
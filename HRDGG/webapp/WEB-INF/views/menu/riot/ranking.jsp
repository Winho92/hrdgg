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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소환사 래더 랭킹 :: HRD.GG</title>
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<link rel="shortcut icon" href="/img/favicon.ico"/>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
html, body {
	margin: 0;
	height: 100%;
}
#rank_header {
	display: block;
	position: relative;
	padding-top: 28px;
    margin: 0 0 17px;
    border-bottom: 1px solid #d7dada;
}

#rank_header ul {
	list-style: none;
	width: 970px;
    margin: 0 auto;
    padding: 0;
}

#rank_header .Item.active {
    border-color: #000;
}

#rank_header .Item.active .Link {
    font-weight: bold;
}

#rank_header .Item {
    display: inline-block;
    margin: 0 30px -1px 0;
    padding: 0;
    border-bottom: 1px solid transparent;
    vertical-align: middle;
}

#rank_header .Item .Link {
    display: block;
    color: #555e5e;
    font-size: 28px;
    line-height: 32px;
    text-decoration: none;
    letter-spacing: -1px;
    padding-bottom: 17px;
}

#rank_table table, #rank_table td {
	font-family: Helvetica,"Malgun Gothic","Apple SD Gothic Neo",AppleGothic,Dotum,Arial,Tahoma;
}

#rank_table table {
	border: 1px solid #cdd2d2;
	border-collapse: collapse;
	margin: 0 auto;
	width: 100%;
}

#rank_table td {
	border-bottom: 1px solid #cdd2d2;
	padding: 20px;
	margin: 20px;
	height: 45px;
	color: #444b4b;
}

#rank_table td:last-child {
	border-right: 1px solid #cdd2d2;
}

#rank_table td .summoner_name {
	text-decoration: none;
	vertical-align: middle;
    line-height: 19px;
    font-size: 17px;
    font-weight: bold;
    color: #444b4b;
}

#rank_table .winrate > span {
	margin-left: 5px;
	font-size: 13px;
	font-weight: bold;
	display: inline-block;
	vertical-align: middle;
	color: #4a4a4a;
}

#rank_table .winrate_text {
	color: white;
	font-size: 14px;
	position: absolute;
	top: 2px;
	z-index: 1;
}

#rank_table .winrate_text_left {
	left: 8px;
	text-align: left;
	z-index: 1px;
}

#rank_table .winrate_text_right {
	right: 8px;
	text-align: right;
}

#rank_table .winrate_graph {
	position: relative;
	display: inline-block;
	width: 300px;
	height: 30px;
	vertical-align: middle;
}

#rank_table .winrate_fill {
	position: absolute;
	left: 0;
	top: 0;
	height: 100%;
	border-radius: 5px;
}

#rank_table .winrate_bg_left {
	background-color: #3d95e5;
	z-index: 1;
}

#rank_table .winrate_bg_right {
	text-align: right;
	width: 100%;
	background-color: #ee5a52;
}

.ranking-pagination {
    text-align: center;
    margin-top: 30px;
}

.ranking-pagination__list {
	list-style: none;
}

.ranking-pagination__item {
    display: inline-block;
    margin-left: 10px;
}

.ranking-pagination__item a {
    display: block;
    width: 50px;
    padding: 4px 0 8px;
    background-color: #fff;
    border: solid 1px #cdd2d2;
    line-height: 16px;
    font-family: Helvetica,AppleSDGothic,"Apple SD Gothic Neo",AppleGothic,Arial,Tahoma;
    font-size: 14px;
    text-align: center;
    text-decoration: none;
    color: #444b4b;
    box-sizing: border-box;
}

.container {
	width: 1080px;
	margin: 0 auto;
	position: relative;
	min-height: 700px;
	padding-bottom: 120px;
}

#home {
	background: #EAEAEA;
	min-width: 1080px;
	min-height: 100%;
	position: relative;
	overflow: hidden;
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
</style>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {
		var result = -1;
		var league = '${league}';
		switch (league) {
		case 'challengerleagues':
			result = 0;
			break;
		case 'grandmasterleagues':
			result = 1;
			break;
		case 'masterleagues':
			result = 2;
			break;
		}
		
		$('#rank_header ul li').each(function (idx, item){
			if (idx == result) {
				$(this).attr('class', 'Item active');				
			}
		});
	});
</script>
</head>
<body style="background-color: #EAEAEA">
	<div id="home">
		<%@ include file="/WEB-INF/include/header.jspf"%>

		<div class="container">

			<div id="rank_header">
				<ul>
					<li class="Item"> 
						<a href="/ranking?league=challengerleagues&page=1" class="Link">챌린저</a>	
					</li>
					<li class="Item">
						<a href="/ranking?league=grandmasterleagues&page=1" class="Link">그랜드마스터</a>	
					</li>
					<li class="Item">
						<a href="/ranking?league=masterleagues&page=1" class="Link">마스터</a>	
					</li>
				</ul>
			</div>
			<div id="rank_table">
				<table>

					<tr style="background-color: #F2F2F2">
						<td style="text-align: center; width:80px">순위</td>
						<td>소환사</td>
						<td>티어</td>
						<td>LP</td>
						<td>승률</td>
					</tr>
					<c:set var="prevLP" value="-1" />
					<c:set var="prevIdx" value="-1" />
					<c:forEach var="rank" items="${rankList}" begin="${startIndex - 1}"
						end="${startIndex + 98}" step="1">
						<tr style="background-color: #EDEDED">
							<td class="rank" width="70px" style="text-align: center;">${rank.idx}</td>
							<td width="200px"><a class="summoner_name" href="/Search?summonerName=${rank.summonerName}">${rank.summonerName}</a></td>
							<td width="200px">${tier}</td>
							<td width="150px">${rank.leaguePoints}</td>
							<td>
								<div class="winrate">
									<div class="winrate_graph">
										<fmt:formatNumber var="winrate"
											value="${rank.wins / (rank.wins + rank.losses) * 100}"
											pattern="00" />
										<div class="winrate_fill winrate_bg_left"
											style="width: <c:out value="${winrate}" />%"></div>
										<div class="winrate_text winrate_text_left">${rank.wins}</div>
										<div class="winrate_fill winrate_bg_right"></div>
										<div class="winrate_text winrate_text_right">${rank.losses}</div>
									</div>
									<span><c:out value="${winrate}" />%</span>
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="ranking-pagination">
					<ul class="ranking-pagination__list">
						<c:set var="idx" value="1" /> <c:forEach begin="1" end="${totalPage}" step="1">
							<li class="ranking-pagination__item">
								<a href="/ranking?league=${league}&page=${idx}">${idx}</a> &nbsp;&nbsp;
							</li>
							<c:set var="idx" value="${idx + 1}" />
						</c:forEach>
					</ul>
				</div>
			</div>
			<%@ include file="/WEB-INF/include/footer.jspf"%>
		</div>		
	</div>	
</body>
</html>
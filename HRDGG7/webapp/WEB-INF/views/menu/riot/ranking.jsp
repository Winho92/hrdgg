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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
	
	table {
		border: 1px solid black;
		border-collapse: collapse;
 		margin: 0 auto;
		width:1000px;
	}
		
	td {
		border-bottom: 1px solid black;
		padding: 20px;
		margin: 20px;
		height:45px;
	}
	
	td:last-child {
		border-right: 1px solid black;
	}
	

	
	.winrate > span {
	    margin-left: 5px;
		font-size: 13px;
		font-weight: bold;
		display: inline-block;
		vertical-align: middle;
		color: #4a4a4a;
	}
	
	.winrate_text {
		color: white;
		font-size: 14px;
		position: absolute;
	    top: 2px;
 		z-index: 1;
	}
	
 	.winrate_text_left {
	    left: 8px;
		text-align: left;
	    z-index: 1px;
 	}
	
 	.winrate_text_right {
		right: 8px;
		text-align: right;
	}
	
	.winrate_graph {
		position: relative;
		display: inline-block;
	    width: 300px;
	    height: 30px;
	    vertical-align: middle;
	}
	
	.winrate_fill {
		position: absolute;
	    left: 0;
	    top: 0;
	    height: 100%;
	    border-radius: 5px;
	}
	
	.winrate_bg_left {
		background-color: #3d95e5;
		z-index: 1;
	}
	
	.winrate_bg_right {
		text-align: right;
		width: 100%;
		background-color: #ee5a52;
	}
	#icon{
		position:absolute;
		top:50%; left:21%;
		margin-top:-250px;
		margin-left:-110px;
		border-radius: 28px;
		color:white;
	
	}
	#main a{
		font-size:25px;
		
		text-decoration:none;
	
	}
	#main a:hover{
		font-size:27px;
	}
	#main2 {
		width: 1040px;
		padding: 20px;
		margin-bottom: 20px;
		float: left;
		border: 1px solid #bcbcbc;
		position:absolute;
		top:50%; left:21%;
		overflow:hidden;
		margin-top:-170px;
		margin-left:-150px;
		background-color:#EAEAEA;
		
	}

	
</style>
</head>
<body style="background-color:#EAEAEA">
	<%@ include file="/WEB-INF/include/header.jspf" %>
	<div id="jb-header">
			<img src="/img/lll.jpg" width="100%" height="250px">
	</div>
	<div id="icon">
		<h1>Ranking<h1>
	</div>
	
	<div id="main2">
	
		<div id="main">
			<a href="/ranking?league=challengerleagues&page=1">챌린저</a> &nbsp;&nbsp;
			<a href="/ranking?league=grandmasterleagues&page=1">그랜드마스터</a> &nbsp;&nbsp;
			<a href="/ranking?league=masterleagues&page=1">마스터</a>
		</div>
		<div >
			<h1 style="text-align:center;  margin:20px auto;">${title}</h1>
			<table>
			
				<tr style="background-color:#F2F2F2">
					<td>&nbsp;&nbsp;&nbsp;순위</td>
					<td>소환사</td>
					<td>티어</td>
					<td>LP</td>
					<td>승률</td>
				</tr>
				<c:set var="prevLP" value="-1" />
				<c:set var="prevIdx" value="-1" />
				<c:forEach var="rank" items="${rankList}" begin="${startIndex - 1}" end="${startIndex + 98}" step="1">
					<tr style="background-color:#EDEDED">
						<td class="rank" width="70px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${rank.idx}</td>
						<td width="200px">${rank.summonerName}</td>
						<td width="200px">${tier}</td>
						<td width="150px">${rank.leaguePoints}</td>
						<td>
							<div class="winrate">
								<div class="winrate_graph">
									<fmt:formatNumber var="winrate" value="${rank.wins / (rank.wins + rank.losses) * 100}" pattern="00"/>
									<div class="winrate_fill winrate_bg_left" style="width: <c:out value="${winrate}" />%"></div>
									<div class="winrate_text winrate_text_left">${rank.wins}</div>
									<div class="winrate_fill winrate_bg_right"></div>
									<div class="winrate_text winrate_text_right">${rank.losses}</div>
								</div>
								<span><c:out value="${winrate}" />%</span>
							</div>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="7" style="text-align: center">
						<c:set var="idx" value="1" />
						<c:forEach begin="1" end="${totalPage}" step="1">
							<a href="/ranking?league=${league}&page=${idx}">${idx}</a> &nbsp;&nbsp;
							<c:set var="idx" value="${idx + 1}" />
						</c:forEach>
					</td>
				</tr>
			</table>
		</div>
	</div>
 <%@ include file="/WEB-INF/include/footer.jspf" %>
</body>
</html>
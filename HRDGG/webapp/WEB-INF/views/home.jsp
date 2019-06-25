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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#home * {
	box-sizing: border-box;
}

#home {
	background: #608FBA;
	min-width: 1080px;
	min-height: 100%;
	position: relative;
	overflow: hidden;
}

.summoner-search-form {
	position: relative;
	width: 624px;
	margin: 0 auto;
	border-radius: 2px;
	background-color: #fff;
}

.summoner-search-form__text {
	display: block;
	width: 100%;
	padding: 15px 150px 18px 17px;
	background: none;
	border: none;
	line-height: 17px;
	font-size: 14px;
	color: #9b9b9b;
	box-sizing: border-box;
	outline: none;
	box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.19);
}

.container {
	width: 800px;
	margin: 0 auto;
	position: relative;
	min-height: 700px;
	padding-bottom: 120px;
}

#id img {
	display: block;
	max-width: 360px;
	max-height: 320px;
	margin: 0 auto;
}

* {
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}

#header {
	background-color: black;
	height: 100px;
	width: 100%;
	color: white;
}

#headerDiv1 {
	display: flex;
	position: relative;
	width: 100%;
	height: 50px;
	font-size: 20px;
	padding: 5px;
}

#header .btnStyle {
	font-size: 15px;
	margin: 0 5px;
	padding: .5rem 1rem;
	border-radius: .25rem;
	color: white;
	background-color: #608FBA;
	border: 1px solid #608FBA;
	cursor: pointer;
}

#headerDiv2 {
	width: 100%;
	background-color: #608FBA;
	border-bottom: 1px solid #72A1CC;
	height: 50px;
	color: white;
}

#headerDiv2 li {
	padding: 15px;
	text-align: center;
	width: 150px;
	height: 100%;
	float: left;
	list-style-type: none;
}

#headerDiv2 li:hover {
	border-bottom: 3px solid white;
}

#headerDiv2 a {
	text-decoration: none;
	height: 100%;
	color: aliceblue;
}

#headerDiv2 a:hover {
	text-decoration: none;
	height: 100%;
}

#headerDiv2 .searchDiv {
	position: relative;
	display: inline-block;
	float: right;
	margin-right: 10px;
	margin-top: 5px;
}

#headerDiv2 .text2 {
	border-radius: 10px;
	border-color: orange;
	height: 40px;
	font-size: 15px;
	background-color: black;
	color: white;
	vertical-align: middle;
}

small, div, p, span, button {
	font-family: Helvetica, "Malgun Gothic", "Apple SD Gothic Neo",
		AppleGothic, Dotum, Arial, Tahoma;
}

.header_logo {
	position: absolute;
	left: 0;
	top: 0;
	width: 98px;
	height: 100%;
	background-color: #608FBA;
}

.header_logo_anchor {
	display: block;
	color: #ffffff;
	font-size: 16px;
	text-align: center;
	vertical-align: middle;
	line-height: 3;
	width: 100%;
	height: 16px;
}

.headerDiv1_left {
	flex: 4;
	margin-left: 110px;
}

.headerDiv1_left img {
	height: 100%;
	width: 100px;
}

.headerDiv1_right {
	flex: 1;
	text-align: right;
}

footer {
	position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    color: white;
    text-align: center;
    padding-bottom: 20px;
}

html, body {
	margin: 0;
	height: 100%;
}

#logo {
	margin: 10px;
    padding-top: 150px;
}


</style>
<title>롤 전적 검색 :: HRD.GG</title>
<link rel="shortcut icon" href="/img/favicon.ico"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {
		$('#srhSummoner').keydown(function(key) {
			if (key.keyCode == 13) {
				var summonerName = $(this).val();
				summonerName = $.trim(summonerName);
				window.location = "/Search?summonerName=" + summonerName;
			}
		});

		$(document).on('ready', function() {
			var url = window.location.href;
			var uri = url.substring(21);

			$('#loginBtn').on('click', function() {
				location.href = '/Login/?cp=' + uri;
			})
		});
	});
</script>
</head>
<body>
	<div id="home">
		<header id="header">
			<div id="headerDiv1">
				<h1 class="header_logo">
					<a href="/" class="header_logo_anchor"> <img alt="HRD.GG"
						height="16" src="/img/logo3.png" width="65" />
					</a>
				</h1>

				<div class="headerDiv1_left">
					<a href="https://kr.leagueoflegends.com/"> <img
						src="/img/lol.jpg" />
					</a>
				</div>

				<div class="headerDiv1_right">
					<c:choose>
						<c:when test="${user == null}">
							<button type="button" id="loginBtn" class="btnStyle">로그인</button>
							<button type="button" class="btnStyle"
								onclick="location.href='/Join/'">회원가입</button>
						</c:when>
						<c:otherwise>
							<span>${user.username}</span>
							<%-- 					<span>${user.usergrd}</span> --%>
							<button type="button" onclick="location.href='/Login/Logout'"
								style="border: none; background: none; color: orange;">로그아웃</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div id="headerDiv2">
				<ul style="height: 98%">
					<li><a href="/">홈</a></li>
					<li><a href="/champion">챔피언 분석</a></li>
					<li><a href="/ranking?league=challengerleagues&page=1">랭킹</a></li>
					<li><a
						href="/Board/ListPaging?menu_id=MENU01&now_page=1&per_page=10">커뮤니티</a></li>
				</ul>
			</div>
		</header>
		<div class="container">
			<div id="logo">
				<img src="/img/logo3.png" style="width:100%;" />

			</div>

			<form class="summoner-search-form" id="srhSummoner" action="/Search"
				autocomplete="off">
				<input type="text" name="summonerName"
					class="summoner-search-form__text _suggest"
					placeholder="소환사명, 소환사명, ..." autocomplete="off">
			</form>			
		</div>
		<%@ include file="/WEB-INF/include/footer.jspf"%>		
	</div>

</body>
</html>
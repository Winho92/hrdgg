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
<title>챔피언 정보 :: HRD.GG</title>
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<link rel="shortcut icon" href="/img/favicon.ico"/>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
html, body {
	margin: 0;
	height: 100%;
}

.champion_main {
	width: 1000px;
	margin: 0 auto;
	position: relative;
	min-height: 700px;
	padding-bottom: 120px;
	background-color: #F9F9FA;
}

.champion_content_list {
	position: relative;
	display: inline-block;
	margin: 5px 9px;
	padding: 5px;
	display: inline-block;
	width: 120px;
}

.champion_content_list_img {
	margin: 5px;
}

.champion_content_list_text {
	text-align: center;
    margin: 0;
    padding: 0;
    white-space: nowrap;
    width: 100%;
    overflow: hidden;
    text-overflow: ellipsis 
}

.champion_content_filter {
	background-color: white;
	position: relative;
	height: 50px;
}

.champion_content_filte:after {
	visibility: hidden;
    display: block;
    font-size: 0;
    content: "";
    clear: both;
    height: 0;
}
.champion_content_filter_kor {
	vertical-align: middle;
	display: inline-block;
	border: none;
}

.champion_main .champion_content_filter ul {
	width: 500px;
	padding: 10px;
}

.champion_main .champion_content_filter ul li {
	display: inline-block;
	text-align: center;
}

.champion_main .champion_content_filter ul li a {
	width: 30px;
	height: 20px;
	text-decoration: none;
	display: inline-block;
	color: #fff;
	background: #608FBA;
}

.champion_main .champion_content_filter ul li a:hover {
	color: #608FBA;
	background: #fff;
}

.champion_content_filter_search {
	float: right;
    margin: 7px 7px 7px 0;
}

.champion_content_filter_search input {
	height: 36px;
    width: 193px;
    border: none;
    background: #f7f7f7;
    line-height: 15px;
    font-size: 12px;
    color: #9b9b9b;
    padding: 9px 0 10px 10px;
    box-sizing: border-box;
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

#home * {
	box-sizing: border-box;
}

#home {
	background: #EAEAEA;
	min-width: 1080px;
	min-height: 100%;
	position: relative;
	overflow: hidden;
}
</style>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function getChosung(input, i) {
		var val = input.charCodeAt(i) - 44032;
		if (val < 0) {
			return null;
		} else if (val < 588) {
			return 'ㄱ';
		} else if (val < 1176) {
			return 'ㄲ';
		} else if (val < 1764) {
			return 'ㄴ';
		} else if (val < 2352) {
			return 'ㄷ';
		} else if (val < 2940) {
			return 'ㄸ';
		} else if (val < 3528) {
			return 'ㄹ';
		} else if (val < 4116) {
			return 'ㅁ';
		} else if (val < 4704) {
			return 'ㅂ';
		} else if (val < 5292) {
			return 'ㅃ';
		} else if (val < 5880) {
			return 'ㅅ';
		} else if (val < 6468) {
			return 'ㅆ';
		} else if (val < 7056) {
			return 'ㅇ';
		} else if (val < 7644) {
			return 'ㅈ';
		} else if (val < 8232) {
			return 'ㅉ';
		} else if (val < 8820) {
			return 'ㅊ';
		} else if (val < 9408) {
			return 'ㅋ';
		} else if (val < 9996) {
			return 'ㅌ';
		} else if (val < 10584) {
			return 'ㅍ';
		} else if (val < 11172) {
			return 'ㅎ';
		} else {
			return null;
		}
	}

	function isChosung(input) {
		for (var i = 0; i < input.length; i++) {
			if (getChosung(input, i) != null) {
				return false;
			}
		}
		return true;
	}

	function isWord(input) {
		for (var i = 0; i < input.length; i++) {
			if (getChosung(input, i) == null) {
				return false;
			}
		}
		return true;
	}

	$(function() {
		var oldVal = '';
		$('#champSearchTxt')
				.on(
						'propertychange change keyup paste input',
						function() {
							var currentVal = $(this).val();
							if (currentVal == oldVal) {
								return;
							}
							oldVal = currentVal;

							console.log(isChosung(currentVal));
							console.log(isWord(currentVal));

							if (currentVal == '') {
								$('.champion_content_list').each(
										function(index, item) {
											$(this).show();
										});
							} else {
								var isChosungVal = false;
								var isWordVal = false;
								if (isChosung(currentVal)) {
									$('.champion_content_list')
											.each(
													function(index, item) {
														$(this).hide();
														var champId = $(item)
																.find(
																		'.champion_content_list_text')
																.text().trim()
																.replace(' ',
																		'');
														var champChosung = '';
														for (var i = 0; i < champId.length; i++) {
															champChosung += getChosung(
																	champId, i);
														}
														if (champChosung
																.indexOf(currentVal) > -1) { // == 0 으로하면 첫초성부터 확인함
															$(this).show();
														}
													});
									isChosungVal = true;
								}

								if (isWord(currentVal)) {
									$('.champion_content_list')
											.each(
													function(index, item) {
														$(this).hide();
														var champId = $(item)
																.find(
																		'.champion_content_list_text')
																.text().trim();
														if (champId
																.indexOf(currentVal) > -1) { // == 0 으로하면 첫글자부터 확인함
															$(this).show();
														}
													});
									isWordVal = true;
								}

								if (!(isChosungVal || isWordVal)) {
									$('.champion_content_list').each(
											function(index, item) {
												$(this).hide();
											});
								}
							}
						});

		$('.filter').on(
				'click',
				function() {
					var filter = $(this).html();
					$('.champion_content_list').each(
							function(index, item) {
								$(this).show();
								var champId = $(item).find(
										'.champion_content_list_text').text()
										.trim();
								var code = getChosung(champId, 0);
								if (filter != code) {
									$(this).hide();
								}
							});

				});
	});
</script>
</head>
<body>
	<div id="home">
		<%@ include file="/WEB-INF/include/header.jspf"%>
		<div class="champion_main">
			<div class="champion_content_filter">
				<div class="champion_content_filter_kor">
					<ul>
						<li><a href="javascript:void(0);" class="filter">ㄱ</a></li>
						<li><a href="javascript:void(0);" class="filter">ㄴ</a></li>
						<li><a href="javascript:void(0);" class="filter">ㄷ</a></li>
						<li><a href="javascript:void(0);" class="filter">ㄹ</a></li>
						<li><a href="javascript:void(0);" class="filter">ㅁ</a></li>
						<li><a href="javascript:void(0);" class="filter">ㅂ</a></li>
						<li><a href="javascript:void(0);" class="filter">ㅅ</a></li>
						<li><a href="javascript:void(0);" class="filter">ㅇ</a></li>
						<li><a href="javascript:void(0);" class="filter">ㅈ</a></li>
						<li><a href="javascript:void(0);" class="filter">ㅊ</a></li>
						<li><a href="javascript:void(0);" class="filter">ㅋ</a></li>
						<li><a href="javascript:void(0);" class="filter">ㅌ</a></li>
						<li><a href="javascript:void(0);" class="filter">ㅍ</a></li>
						<li><a href="javascript:void(0);" class="filter">ㅎ</a></li>
					</ul>
				</div>
				<div class="champion_content_filter_search">
					<input type="text" id="champSearchTxt"
						placeholder="챔피언 검색 (가렌, ㄱㄹ, ...)" size="30" />
				</div>
			</div>
			<div class="champion_content_main">
				<c:forEach var="champ" items="${champList}">
					<div class="champion_content_list">
						<div class="champion_content_list_img">
							<a href="/champion/detail?champName=${champ.name}"> <img
								alt="" src="/img/${champ.image}" width="100px" />
							</a>
						</div>
						<div class="champion_content_list_text">
							<h4>${champ.name}</h4>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<%@ include file="/WEB-INF/include/footer.jspf"%>
	</div>
</body>
</html>
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
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
.champion_main {
	display: block;
	margin: 0 auto;
	border: 1px solid black;
	width: 70%;
	padding: 20px;
	margin-bottom: 20px;
	min-height: calc(100vh - 180px);
}

.champion_content_list {
	position: relative;
	display: inline-block;
	margin: 10px 8px;
	padding: 5px;
	display: inline-block;
	border: 1px solid orange;
	background-color:#F2F2F2;
}

.champion_content_list_img {
	margin: 5px;
}


.champion_content_list_text {
	text-align: center;
	margin: 0;
	padding: 0;
}

.champion_content_filter {
	position: relative;
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
	background: navy;
}

.champion_main .champion_content_filter ul li a:hover {
	color: black;
	background: #fff;
}

.champion_content_filter_search {
	width: 400px;
	display: inline-block;
	vertical-align: middle;
	margin-left: 40px;
	border: none;
}

.champion_content_filter_search input {
	float: right;
	width: 180px;
}

.champion_content_filter_search button {
	float: right;
	margin-left: 5px;
}
</style>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function getChosung(input, i) {
		var val = input.charCodeAt(i) - 44032;
	    if (val < 0) {
	    	return null;
	    }
	    else if (val < 588) {
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
		$('#champSearchTxt').on('propertychange change keyup paste input', function() {
		    var currentVal = $(this).val();
		    if(currentVal == oldVal) {
		        return;
		    }
		    oldVal = currentVal;
		    
		    console.log(isChosung(currentVal));
		    console.log(isWord(currentVal));
		    
		    if (currentVal == '') {
		    	$('.champion_content_list').each(function (index, item){
		    		$(this).show();
		    	});
		    } else {
		    	var isChosungVal = false;
		    	var isWordVal = false;
		    	if (isChosung(currentVal)) {
			    	$('.champion_content_list').each(function (index, item){
						$(this).hide();
						var champId = $(item).find('.champion_content_list_text').text().trim().replace(' ', '');
						var champChosung = '';
						for (var i = 0; i < champId.length; i++) {
							champChosung += getChosung(champId, i);
						}
						if (champChosung.indexOf(currentVal) > -1) {  // == 0 으로하면 첫초성부터 확인함
							$(this).show();
						}
					});
			    	isChosungVal = true;
			    }
			    
			    if (isWord(currentVal)) {
			    	$('.champion_content_list').each(function (index, item){
						$(this).hide();
						var champId = $(item).find('.champion_content_list_text').text().trim();
						if (champId.indexOf(currentVal) > -1) {  // == 0 으로하면 첫글자부터 확인함
							$(this).show();
						}
					});
			    	isWordVal = true;
			    }
			    
			    if (!(isChosungVal || isWordVal)) {
			    	$('.champion_content_list').each(function (index, item){
			    		$(this).hide();
			    	});
			    }
		    }
		});
		
		$('.filter').on('click', function() {
			var filter = $(this).html();
			$('.champion_content_list').each(function (index, item){
				$(this).show();
				var champId = $(item).find('.champion_content_list_text').text().trim();
				var code = getChosung(champId, 0);
				if (filter != code) {
					$(this).hide();
				}
			});
			
		});
	});

</script>
</head>
<body style="background-color:#EAEAEA">
	<%@ include file="/WEB-INF/include/header.jspf" %>
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
				<input type="text" id="champSearchTxt" placeholder="챔피언 검색 (가렌, ㄱㄹ, ...)" size="30" />
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
	<%@ include file="/WEB-INF/include/footer.jspf" %>
</body>
</html>
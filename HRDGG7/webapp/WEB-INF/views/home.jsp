<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#home * {
	display: inline-block;
	box-sizing: border-box;
}

#home {
	background: url(/img/good.jpg) no-repeat left top;
	background-size: 100%;
	padding-top: 20%;
	padding-left: 20%;
	
	display: block;
	position: relative;
    min-height: 700px;
    padding-bottom: 120px;
}

#home .searchDiv {
}

#home .text {
	vertical-align: middle;
	border-radius: 15px;
	border-color: orange;
	height: 60px;
	font-size: 20px;
	background-color: black;
	color: white;
}

#home .img {
	vertical-align: middle;
	background: url(/img/cc.jpg) no-repeat left top;
	background-size: 60px;
	border-radius: 15px;
	border-color: orange;
	width: 60px;
	height: 60px;
}
</style>
<title>HRD.GG > Home</title>
<link rel="icon" href="/img/favicon.ico" type="image/x-icon" />
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/include/header.jspf"%>
		<div id="home">
			<div class="searchDiv">
				<input type="text" size="75px" class="text" placeholder="League of Legends ID.">
				<input type="submit" class="img" value=""/>
			</div>
		</div>
	<%@ include file="/WEB-INF/include/footer.jspf"%>
</body>
</html>
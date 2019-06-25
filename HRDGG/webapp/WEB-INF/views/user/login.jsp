<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRD.GG > 로그인 </title>
<link rel="icon" href="/img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
body {
	background-color : #f3f5f7;
}
#loginPanel {
	position:absolute;
	top:50%; left:45%;
	width:400px;
	height:500px;
	overflow:hidden;
	margin-top:-250px;
	margin-left:-100px;
	padding:50px;
	background-color :#fff;
	box-shadow: 10px 10px rgba(0,0,0,0.4);
	border-radius : 5px;
	display: inline-block;
}
#loginPanel label {
	font-size: 20px;
	margin: 15px;
}
#msg {
	margin:20px;
	height:30px;
}
input {
	border: none;
	border-bottom: 1px solid #bbb;
	width:100%;
	margin:10px;
}
.btn btn-outline-dark btn-sm {
	width: 40%;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(function() {
		var msg = '${msg}';
		$('#msg').css("color", "red");
		$('#msg').append('<p>' + msg + '</p>');
	})
</script>
</head>
<body>
	<div id="loginPanel">
    <form action="/Login/Login" method="POST">
    <input type="hidden" name="cp" value="${cp}" />
		<table>
			<tr>
			   <td colspan="2">
			      <img src="../img/logo.jpg" height="102px" />
			   </td>
			</tr>
			<tr>
				<td colspan="2">
					<label>로그인</label>
				</td>
			</tr>
			<tr>
			   <td colspan="2"><input type="text" id="Id" name="userid" placeholder="ID" ></td>
			</tr>
			<tr>
			   <td colspan="2"><input type="password" id="Pw" name="userpwd" placeholder="PASSWORD" ></td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="msg" align="center">
					</div>
				</td>
			</tr>
			<tr align="center">
				<td><button type="submit" class="btn btn-outline-dark" style="width:100px;">로그인</button></td>
				<td><a class="btn btn-outline-dark" style="width:100px;" href="/Join">회원가입</a></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>
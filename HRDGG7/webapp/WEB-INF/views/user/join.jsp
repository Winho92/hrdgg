<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRD.GG > 회원가입</title>
<link rel="icon" href="/img/favicon.ico" type="image/x-icon" />
<style>
	td { border-bottom:1px solid gray;
	     height:70px;
	     font-size:20px;
	}
	
	input {border:none;
		font-size:20px;
		color:black;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(function() {
	  $('#idDupCheckBtn').click(function( e ) {
		  e.preventDefault();
		  e.stopPropagation();
		  $.ajax({
			  url      : '/IdDupCheck', 
			  type     : 'GET',
			  data     : {userid : $('[name=userid]').val() },
			  dataType : 'json', 
			  success  : function(data) {
				 
				  if(data.loginVo == null) {
					  $('#dupResult').html(
						 '<br><b style="color:green;">사용가능한 아이디입니다</b>');
					  $('#jbtn').attr('disabled', false);
				  } else {
					  $('#dupResult').html(
						 '<br><b style="color:red;">사용 불가능한 아이디입니다</b>');
					  	$('#jbtn').attr('disabled', true);
					  	
				  }
			  }
			  
		  })
	  });
});
</script>
</head>
<body>
	<form action="/Join/insert" id="login-form" method="POST">
	<div align="center"><img src="/img/logo.jpg" height="120"></div>
	<table  cellpadding="0" cellspacing="0" width="500" align="center" >
	<caption><h2>회원가입</h2></caption>
		<tr>
			<td>
				아이디 : <input type="text" name="userid"  placeholder="ID" class="form-control id"  autofocus required />
				<input type="button" value="중복확인" id="idDupCheckBtn" />
       			<span id="dupResult"></span>
			</td>
		</tr>
		<tr>
			<td>
				닉네임 :  <input type="text" name="username" placeholder="NAME" required />
			</td>
		</tr>
		<tr>
			<td>
				비밀번호 : <input type="password" name="userpwd" placeholder="PASSWORD" required />
			</td>
		</tr>
		<tr>
			<td align="right">
			    <input type="submit" id="jbtn" value="가입하기"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <a href="javascript:history.back()" style="text-decoration:none; color:red ">취소</a>    
		    </td>
		</tr>
	</table>
	</form>
</body>
</html>
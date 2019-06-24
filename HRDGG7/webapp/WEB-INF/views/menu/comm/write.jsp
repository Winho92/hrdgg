<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRD.GG > ${boardVo.title}</title>
<link rel="icon" href="/img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/comm.css">
<style>
.tr1{
	height:50px;



</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	window.onload = function() {
		var menu_index = '${menu_id}'.substr(4,2);
		document.querySelector('select[name=menu_id]').selectedIndex = parseInt(menu_index) - 1;
	}
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="/WEB-INF/include/container-header.jspf" %>

	<!-- 메인 컨텐츠 -->
	<div id="jb-content" align="center">
	
		<!-- 글 작성 편집기 -->
		<div id="new" style="padding:20px;">
			<h2 style="text-align:center;background-color:#337AB7;color:white;padding:10px 0px 10px 0px">게시물 작성</h2>
			<form method="POST" action="/Board/Write" id="frmWrite" enctype="multipart/form-data" >
			<!-- <input type="hidden" name="menu_id" value="${boardVo.menu_id }" /> -->
			<input type="hidden" name="bnum" value="${boardVo.bnum }" />
			<input type="hidden" name="lvl"  value="${boardVo.lvl }" />
			<input type="hidden" name="step" value="${boardVo.step }" />
			<input type="hidden" name="nref" value="${boardVo.nref }" />
				<table>
					<tr class="tr1">
						<td style="width:100px;">게시판</td>
						<td>
							<select name="menu_id">
							<c:forEach var="menu" items="${menuList}">
								<option value="${menu.menu_id}">${menu.menu_name}</option>
							</c:forEach>
							</select>
						</td>
					</tr>
					<tr class="tr1">
						<td style="width:100px;">작성자</td>
						<td>
							<input type="text" name="writer" id="writer" style="width:330px;" value="${user.username}" required>
						</td>
					</tr >
					<tr class="tr1">
						<td style="width:100px;">제목</td>
						<td>
							<input type="text" name="title" id="title" style="width:330px;" required>
						</td>
					</tr>	
					<tr>
						<td style="width:100px;">내용</td>
						<td>
							<textarea name="cont" id="cont" style="height:200px; width:328px;" required></textarea>
						</td>
					</tr>
					<tr>
						<td  >파일</td>
						<td width="400">
				
							<input class="you" type="file" name="upfile" id="orgFile" />
							<input class="you" type="file" name="upfile2" id="orgFile2" />
							<input class="you" type="file" name="upfile3" id="orgFile3"/>
							<input class="you" type="file" name="upfile4" id="orgFile4" />
				
					</tr>
					<tr>
						<td style="text-align:center; " colspan=2>
							<button  id="btn" class="btn btn-primary" style="width:85px;height:35px;">확인</button><span style="padding-left:30px;"></span>
							<button  id="123" class="btn btn-primary" style="width:85px;height:35px;"><a href="/Board/List?menu_id=${menu_id}" style="color:white;" >목록으로</a></button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	
	</div>	<!-- #jb-content end -->
	
<%@ include file="/WEB-INF/include/container-footer.jspf" %>	
<%@ include file="/WEB-INF/include/footer.jspf" %>
</body>
</html>
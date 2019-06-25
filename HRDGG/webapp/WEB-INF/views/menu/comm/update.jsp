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
<link rel="stylesheet" type="text/css" href="/css/header.css" /><style>
	.tr1{
	height:50px;
	}
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
	
		<div id="new" style="padding:20px;">
			<h2 style="text-align:center;background-color:#337AB7;color:white;padding:10px 0px 10px 0px">게시물 수정</h2>
			<form method="POST" action="/Board/Update" id="frmWrite" enctype="multipart/form-data">
			<!-- <input type="hidden" name="menu_id" value="${boardVo.menu_id }" /> -->
			<input type="hidden" name="idx"  value="${boardVo.idx }" />
			<input type="hidden" name="bnum" value="${boardVo.bnum }" />
			<input type="hidden" name="lvl"  value="${boardVo.lvl }" />
			<input type="hidden" name="step" value="${boardVo.step }" />
			<input type="hidden" name="nref" value="${boardVo.nref }" />
				<table>
					<tr class="tr1">
						<td style="width:100px;">게시판</td>
						<td>
							${boardVo.menu_id}
						</td>
					</tr>
					<tr class="tr1">
						<td style="width:100px;">작성자</td>
						<td>
							${boardVo.writer}
						</td>
					</tr >
					<tr class="tr1">
						<td style="width:100px;">제목</td>
						<td>
							<input type="text" name="title" id="title"
							 style="width:330px;" value="${boardVo.title}">
						</td>
					</tr>	
					<tr>
						<td style="width:100px;">내용</td>
						<td>
							<textarea name="cont" id="cont"
							 style="height:200px; width:328px;" >${boardVo.cont}</textarea>
						</td>
					</tr>
					<tr>
						<td width="100" align="center">파일</td>
						<td width="400" >
							<div >
							<c:set var="i" value="4" />
							<c:forEach var="file" items="${fileList }">
								<a href="<c:out value='/download/external/${file.filename}' />">
									${ file.filename } 
								</a>
								<input type="button"  value="삭제"  onclick="location.href='/FileDelete?file_num=${ file.file_num }&idx=${file.idx }'"/>
							<c:set var="i" value="${i-1 }" />
							</c:forEach>
							<c:forEach begin="1" end="${ i }" step="1" varStatus="sts">
							<div class="filebox bs3-primary">
						       	<input type="file" name="upfile<c:out value='${sts.current}'/>" id="newFile<c:out value='${ sts.current }'/>" size="50" />   
											    
						    </div>
						       
						    </c:forEach>
							</div>
	 
						</td>
					</tr>
					
					<tr>
						<td style="text-align:center; padding-top:40px;" colspan=2>
							<input type="submit" class="btn btn-primary" style="width:85px;" value="수정완료" />
							<span style="padding-left:30px;"></span>
							<input type="button" class="btn btn-primary" style="width:85px;"
								onclick="location.href='javascript:history.back()'" value="취소" />
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
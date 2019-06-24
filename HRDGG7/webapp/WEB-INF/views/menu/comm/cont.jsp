<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>HRD.GG > ${boardVo.title}</title>
<link rel="icon" href="/img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/comm.css">
<style>
.comment_reply {
	display: none;
}

.btnb {
	width: 100px;
	background-color:white;
	border:1px solid #337AB7;
}
.btnb:hover{
	background-color:#EAEAEA;
}
.btn2 {
	text-align: center;
}
#sdf{
	background-color:white ;
	width:70px;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(function() {
		$('.replyBtn').on('click', function() {
			$('.comment_reply').hide();
			$(this).parents('tr').next('.comment_reply').show();
		})

		$('.replyCancel').on('click', function() {
			$(this).parents('.comment_reply').hide();
		})
	})
</script>
</head>
<body>
	<%@ include file="/WEB-INF/include/header.jspf"%>
	<%@ include file="/WEB-INF/include/container-header.jspf"%>

	<!-- 메인 컨텐츠 -->
	<div id="jb-content">
		<div>
			<div class="sub-header">
				<div>
					<!-- 글 내용 정보 -->
					<table border="1" cellpadding="0" cellpadding="0" width="718"
						align="center">
						<tr>
							<td
								style="width: 400px; height: 100px; text-align: center; font-size: 30px; text-align: left;"
								colspan="3">&nbsp;&nbsp;&nbsp;${ boardVo.title }</td>
						</tr>
						<tr>
							<td class="btn2" colspan="3"><c:choose>
									<c:when test="${boardVo.writer eq user.username}">
										<div class="btnDiv">
											<button id="delBtn"
												onclick="location.href='/Board/Remove?idx=${boardVo.idx}&now_page=1&per_page=10'"
												class="btnb" style="color:red">삭제</button>
											<button id="editBtn"
												onclick="location.href='/Board/UpdateForm?idx=${boardVo.idx}'"
												class="btnb" style="color:blue">수정</button>
										</div>
									</c:when>
									<c:otherwise>
										<button id="reBtn"
											onclick="location.href='/Board/WriteForm?menu_id=${menu_id}&bnum=${boardVo.bnum}&lvl=${boardVo.lvl}&step=${boardVo.step}&nref=${boardVo.nref}'">답글쓰기</button>
									</c:otherwise>
								</c:choose></td>
						</tr>
						<tr>
							<td style="width: 150px; height: 30px; text-align: left;">
								&nbsp;&nbsp;&nbsp;&nbsp;ID : ${ boardVo.writer }</td>
							<td style="width: 150px; height: 30px; text-align: right;"
								colspan=2>Date : ${ boardVo.regdate } ∥ 조회 : ${ boardVo.readcount }&nbsp;&nbsp;&nbsp;</td>
						</tr>

						<tr>
							<td
								style="width: 500px; height: 150px; vertical-align: top; background-color: white"
								colspan="3">&nbsp;&nbsp;${ boardVo.cont }</td>
						</tr>
						<tr>
							<td style="width: 100px; height: 30px; text-align: center">
								파일</td>
							<td style="width: 400px;" colspan="3"><c:forEach var="file"
									items="${ fileList }">
									<div>
										<a
											href="<c:out value='/download/external/${file.filename}' />">
											${ file.filename } </a>
									</div>
								</c:forEach></td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<!-- 댓글 작성하기 -->
		<div id="comment">
			<form action="/Reply/Write" method="GET"
				enctype="multipart/form-data">
				<table style="width: 100%;">
					<caption>댓글</caption>
					<tr>
						<td width="100" align="center">작성자</td>
						<td width="100" colspan="3"><input type="text" name="writer"
							size="15" placeholder="작성자" value="${user.username}" /> <input
							type="hidden" name="idx" value="${boardVo.idx}"
							style="width: 100px;" /></td>
					</tr>
					<tr>
						<td align="center">댓글 내용</td>
						<td colspan="2"><textarea name="cont"
								style="width: 100%; text-align: left;"
								placeholder="주제와 무관한 댓글, 타인의 권리를 침해하거나 명예를 훼손하는 게시물은 별도의 통보 없이 제재를 받을 수 있습니다."></textarea>
						</td>
						<td align="center"><input type="submit" value="확인" id="sdf"/></td>
					</tr>
				</table>
			</form>
		</div>
		<br>
		<div id="board">
			<table style="width: 100%;">
				<c:forEach var="replyVo" items="${ replyList }">
					<tr>
						<td style="width: 50px; height: 30px; text-align: center"><a
							href="/Board/Search?menu_id=MENU&now_page=1&per_page=10&target=me&search=${replyVo.writer}">${replyVo.writer}</a>
						</td>
						<td
							style="width:350px;height:30px;padding-left:${replyVo.lvl*30}px">
							<c:choose>
								<%-- 큰 댓글부분 --%>
								<c:when test="${ replyVo.lvl eq 0 }">
									<c:choose>
										<c:when test="${ replyVo.delnum eq 0 }">
													${replyVo.cont}<br>
											<a class="replyBtn">답글쓰기</a>
											<c:if test="${user.username eq replyVo.writer}">
												<a
													href="/Reply/Remove?idx=${replyVo.idx}&regdate=${replyVo.regdate}"
													style="color: red;">삭제</a>
											</c:if>
										</c:when>
										<c:otherwise>
											<s>삭제된 글입니다</s>
										</c:otherwise>
									</c:choose>
								</c:when>
								<%-- 대댓글 부분 --%>
								<c:otherwise>
									<c:choose>
										<c:when test="${ replyVo.delnum eq 0 }">
													ㄴ ${replyVo.cont}<br>
											<a class="replyBtn">답글쓰기</a>
											<c:if test="${user.username eq replyVo.writer}">
												<a
													href="/Reply/Remove?idx=${replyVo.idx}&regdate=${replyVo.regdate}"
													style="color: red;">삭제</a>
											</c:if>
										</c:when>
										<c:otherwise>
											<s>삭제된 댓글입니다</s>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</td>
						<td style="width: 100px; height: 30px; text-align: center">${replyVo.regdate}</td>
					</tr>
					<tr class="comment_reply">
						<td colspan="3" align="center">
							<form action="/Reply/Write" method="GET"
								enctype="multipart/form-data">
								<input type="hidden" name="rnum" value="${replyVo.rnum}" /> <input
									type="hidden" name="lvl" value="${replyVo.lvl}" /> <input
									type="hidden" name="step" value="${replyVo.step}" /> <input
									type="hidden" name="nref" value="${replyVo.nref}" />
								<table style="width: 80%;">
									<tr>
										<td rowspan="2" style="border: none;" valign="top">ㄴ</td>
										<td width="100" align="center">작성자</td>
										<td width="100" colspan="3"><input type="text"
											name="writer" size="15" placeholder="작성자"
											value="${user.username}" /> <input type="hidden" name="idx"
											value="${boardVo.idx}" style="width: 100px;" /></td>
									</tr>
									<tr>
										<td align="center">댓글 내용</td>
										<td colspan="2"><textarea name="cont"
												style="width: 100%; text-align: left;"
												placeholder="주제와 무관한 댓글, 타인의 권리를 침해하거나 명예를 훼손하는 게시물은 별도의 통보 없이 제재를 받을 수 있습니다."></textarea>
										</td>
										<td align="center"><input type="submit" value="확인" /> <input
											class="replyCancel" type="button" value="취소" /></td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>
	<!-- #jb-content end -->

	<%@ include file="/WEB-INF/include/container-footer.jspf"%>
	<%@ include file="/WEB-INF/include/footer.jspf"%>
</body>
</html>
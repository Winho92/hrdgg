<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>HRD.GG > 커뮤니티</title>
<link rel="icon" href="/img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/comm.css">
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<style>
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(function() {
		var pagecalc = $('#pagecalc');
		var totalcnt = '${totalcnt}';
		if (totalcnt=='') totalcnt = 0;
			else totalcnt *= 1;

		var now_page = '${now_page}';
		if (now_page=='') now_page = 0;
			else now_page *= 1;

		var per_page = '${per_page}';
		if (per_page=='') per_page = 0;
			else per_page *= 1;

		var pagecnt  = parseInt((totalcnt - 1)/ per_page) + 1;

		var stt_page = parseInt(pagecnt / 10) + 1;

		var prev_page = stt_page - 1;
		if (prev_page<=0) prev_page = 1;
		var end_page = stt_page + 10;
		if (end_page > pagecnt) end_page = pagecnt;
		var next_page = end_page + 1;
		if (next_page >= pagecnt) next_page = pagecnt;
		
		console.log(end_page);
			pagecalc.append('총 건수 : ' + totalcnt + '건,\t');
			pagecalc.append('총 페이지 수 : ' + pagecnt + '페이지');

		var pagePanel = $('#pagePanel');
			pagePanel.append('<a href="/Board/ListPaging?menu_id=${menu_id}&now_page=1&per_page=${per_page}">◀</a>');
			pagePanel.append('<a href="/Board/ListPaging?menu_id=${menu_id}&now_page=' + prev_page + '&per_page=${per_page}">◁</a>');
			for(var i=stt_page;i<=end_page;i++) {
				pagePanel.append('<a href="/Board/ListPaging?menu_id=${menu_id}&now_page=' + i + '&per_page=${per_page}">' + i + '</a>');
			}
			pagePanel.append('<a href="/Board/ListPaging?menu_id=${menu_id}&now_page=' + next_page + '&per_page=${per_page}">▷</a>');
			pagePanel.append('<a href="/Board/ListPaging?menu_id=${menu_id}&now_page=' + pagecnt + '&per_page=${per_page}">▶</a>');
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/include/header.jspf" %>
<%@ include file="/WEB-INF/include/container-header.jspf" %>
		
		<!-- 게시판 -->
		<div id="jb-content">
			<div >
				<div class="sub-header">
					<div>
						<a href="/Board/WriteForm?menu_id=${menu_id}&bnum=0&lvl=0&step=0&nref=0" style="font-weight:bold; float: right;">새 글
								쓰기<img src="/img/pan.png" width="20spx"></a>
									<h3 style="font-weight:bold">전체</h3>
					</div>
					<div style="float: right;">
						<form action="/Board/Search" method="POST">
						<input type="hidden" name="menu_id" value="${menu_id}"/>
						<input type="hidden" name="now_page" value="1"/>
						<input type="hidden" name="per_page" value="${per_page}"/>
							<label>
							<select name="target" class="sub-header-search__select"  style="width:80px;height:25px;">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
							</select>
							</label>
							<input type="text" name="search" class="sub-header-search__input" placeholder="검색">
							<button class="sub-header-search__button">
								<img src="https://talk.op.gg/images/icon-search@2x.png" width="20" alt="검색">
							</button>
						</form>
					</div>
				</div>
			</div>

			<div id="board">
				<table style="width: 100%;">
					<caption>${menu_id}게시판</caption>
					<tr>
						<td colspan="5">
							<p id="pagecalc">
								<!-- 조회된 목록 수를 jQuery를 통해 계산 -->
							</p>
						</td>
					</tr>
					<tr>
						<td style="width: 100px; height: 30px; text-align: center">번호</td>
						<td style="width: 200px; height: 30px; text-align: center">글제목</td>
						<td style="width: 100px; height: 30px; text-align: center">글쓴이</td>
						<td style="width: 100px; height: 30px; text-align: center">작성일</td>
						<td style="width: 100px; height: 30px; text-align: center">조회수</td>
					</tr>
					<c:forEach var="brd" items="${ boardList }">
						<tr>
							<td style="width: 100px; height: 30px; text-align: center">
							<c:choose>
								<c:when test="${ brd.lvl eq 0 }"> 
								          ${brd.bnum}
								        </c:when>
								<c:otherwise>
								          &nbsp;
								        </c:otherwise>
							</c:choose>
							</td>
							<td
								style="width:200px;height:30px;text-align:center;padding-left:${brd.lvl*30}px">
								<c:choose>
									<%-- 새 글 부분 --%>
									<c:when test="${ brd.lvl eq 0 }">
										<c:choose>
											<c:when test="${ brd.delnum eq 0 }">
												<a href="/Board/Cont?idx=${brd.idx}">
													${brd.title}</a> [${brd.rcnt}]
											</c:when>
											<c:otherwise>
												<s>삭제된 글입니다</s>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${ brd.delnum eq 0 }">
												<a href="/Board/Cont?idx=${brd.idx}">
													└[Re:] ${brd.title}</a> [${brd.rcnt}]
											</c:when>
											<c:otherwise>
												<s>└[Re:]삭제된 글입니다</s>
											</c:otherwise>
										</c:choose>										
									</c:otherwise>
								</c:choose>
							</td>
							<td style="width: 100px; height: 30px; text-align: center">${brd.writer}</td>
							<td style="width: 100px; height: 30px; text-align: center">${brd.regdate}</td>
							<td style="width: 100px; height: 30px; text-align: center">${brd.readcount}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5">
							<div id="pagePanel" align="center">
								<!-- jQuery를 통한 페이징 처리 -->
							</div>
						</td>
					</tr>
				</table>
			</div>
			
		</div>	<!-- #jb-content end -->
			
<%@ include file="/WEB-INF/include/container-footer.jspf" %>	
<%@ include file="/WEB-INF/include/footer.jspf" %>
</body>
</html>
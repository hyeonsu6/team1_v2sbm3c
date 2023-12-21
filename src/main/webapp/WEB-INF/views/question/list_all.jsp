<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival Question</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='title_line'>질문 목록(전체)</div>

	<div>
		<c:forEach var="fcateVO" items="${fcatelist}">
			<a href="./list_by_fcateno.do?fcateno=${fcateVO.fcateno}" class='title_link Q_menu_link'>${fcateVO.name}</a>
			<c:if test="${not loop.last}"> | </c:if>
		</c:forEach>
	</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
	</aside>

	<div style="text-align: right; clear: both;">
		<form name='frm' id='frm' method='get' action='./list_all.do'>
			<input type='hidden' name='fcateno' value='${fcateVO.fcateno }'>
			<%-- 게시판의 구분 --%>
		</form>
	</div>

	<div class="menu_line"></div>

	<table class="table table-hover">
		<colgroup>
			<col style="width: 20%;"></col>
			<col style="width: 50%;"></col>
			<col style="width: 15%;"></col>
			<col style="width: 15%;"></col>
		</colgroup>
		<thead>
			<tr>
				<th style='text-align: center;'>제목</th>
				<th style='text-align: center;'>내용</th>
				<th style='text-align: center;'>등록일</th>
				<th style='text-align: center;'>기타</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="questionVO" items="${list }" varStatus="info">
				<c:set var="questno" value="${questionVO.questno }" />
				<c:set var="title" value="${questionVO.title }" />

				<tr onclick="location.href='./read.do?questno=${questno}'" style="cursor: pointer;">
					<td class=td_bs_left>
						<span style="font-weight: bold;">${questionVO.title }</span>
						<br>
					</td>
					<td class="td_bs">
						<c:choose>
							<c:when test="${questionVO.quest.length() > 160 }">
                  ${questionVO.quest.substring(0, 160) }...
                </c:when>
							<c:otherwise>
                  ${questionVO.quest }
                </c:otherwise>
						</c:choose>
					</td>
					<td class="td_bs">${questionVO.rdate.substring(0, 10) }</td>
					<td class="td_bs">
						<c:if test="${isAdmin}">
							<a href="../answer/create.do?questno=${questno }&now_page=${param.now_page}" title="답변 등록">
								<img src="/question/images/create.png" class="icon">
							</a>
						</c:if>
						<a href="/question/update_quest.do?questno=${questno }&tcateno=${tcateno}&now_page=${param.now_page}" title="수정">
							<img src="/question/images/update.png" class="icon">
						</a>
						<a href="/question/delete.do?questno=${questno }&tcateno=${tcateno}&now_page=${param.now_page}" title="삭제">
							<img src="/question/images/delete.png" class="icon">
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
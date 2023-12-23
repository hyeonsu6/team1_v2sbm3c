<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival Blog Answer</title>
<link rel="shortcut icon" href="/images/star.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='title_line'>답변 목록(전체)</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
		<span class='menu_divide'>│</span>
		<a href="./create.do?questno=${questionVO.questno }">답변 등록</a>
	</aside>

	<div class="menu_line"></div>

	<table class="table table-hover">
		<colgroup>
			<col style="width: 10%;"></col>
			<col style="width: 80%;"></col>
			<col style="width: 10%;"></col>
		</colgroup>
		<thead>
			<tr>
				<th style='text-align: center;'>제목</th>
				<th style='text-align: center;'>내용</th>
				<th style='text-align: center;'>기타</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="answerVO" items="${list }" varStatus="info">
				<c:set var="questno" value="${questionVO.questno }" />
				<c:set var="title" value="${questionVO.title }" />

				<tr onclick="location.href='./read.do?ansno=${ansno}'" style="cursor: pointer;">
					<td class="td_bs">
						<span style="font-weight: bold;">${questionVO.title }</span>
						<br>
					</td>
					<td class="td_bs">
						<c:choose>
							<c:when test="${answerVO.ans.length() > 160 }">
                  ${answerVO.ans.substring(0, 160) }...
                </c:when>
							<c:otherwise>
                  ${answerVO.ans }
                </c:otherwise>
						</c:choose>
						(${answerVO.rdate.substring(0, 16) })
					</td>
					<td class="td_bs">
						<a href="/answer/update_answer.do?ansno=${ansno }&questno=${questno}&now_page=${param.now_page}" title="수정">
							<img src="/answer/images/update.png" class="icon">
						</a>
						<a href="/answer/delete.do?ansno=${ansno }&questno=${questno}&now_page=${param.now_page}" title="삭제">
							<img src="/answer/images/delete.png" class="icon">
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
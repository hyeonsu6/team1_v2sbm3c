<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival Blog Question</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='title_line'>[Q&A] 질문 목록 (전체)</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
	</aside>

	<div class="menu_line"></div>
	<br>

	<div
		style="text-align: center; margin: 0px auto; border: 1px #a39485 solid; border-radius: 10px; background-color: #a39485; padding: 5px;">
		<table>
			<tr style="text-align: center;">
				<c:forEach var="fcateVO" items="${fcatelist}" varStatus="info">
					<c:if test="${fcateVO.visible == 'Y'}">
						<td>
							<a href="./list_by_fcateno.do?fcateno=${fcateVO.fcateno}" class='Q_menu_link'>${fcateVO.name}</a>
						</td>
					</c:if>
				</c:forEach>
			</tr>
		</table>
	</div>

	<br>


	<table>
		<colgroup>
			<col style="width: 10%;"></col>
			<col style="width: 20%;"></col>
			<col style="width: 45%;"></col>
			<col style="width: 15%;"></col>
			<col style="width: 10%;"></col>
		</colgroup>

		<thead>
			<tr style="text-align: center;">
				<th>질문 번호</th>
				<th>질문 제목</th>
				<th>질문 내용</th>
				<th>등록일</th>
				<th>비고</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="questionVO" items="${list }" varStatus="info">
				<c:set var="questno" value="${questionVO.questno }" />
				<c:set var="title" value="${questionVO.title }" />

				<tr style="cursor: pointer; text-align: center;">
					<td>${questionVO.questno}</td>

					<td>
						<a href="./read.do?questno=${questno }" style="display: block;">${questionVO.title }</a>
					</td>

					<td>
						<c:choose>
							<c:when test="${questionVO.quest.length() > 160 }"> ${questionVO.quest.substring(0, 160) }...</c:when>
							<c:otherwise>${questionVO.quest }</c:otherwise>
						</c:choose>
					</td>

					<td>${questionVO.rdate.substring(0, 10) }</td>

					<td>
						<c:if test="${isAdmin}">
							<a href="../answer/create.do?questno=${questno }&now_page=${param.now_page}" title="답변 등록">
								<img src="/question/images/create.png" class="icon">
							</a>
						</c:if>
						<c:if test="${questionVO.memberno eq sessionScope.memberno}">
							<a href="/question/update_quest.do?questno=${questno }&fcateno=${fcateno}&now_page=${param.now_page}" title="수정">
								<img src="/question/images/update.png" class="icon">
							</a>
							<a href="/question/delete.do?questno=${questno }&fcateno=${fcateno}&now_page=${param.now_page}" title="삭제">
								<img src="/question/images/delete.png" class="icon">
							</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
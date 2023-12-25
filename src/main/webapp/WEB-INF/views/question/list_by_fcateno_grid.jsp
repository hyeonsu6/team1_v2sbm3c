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

	<div class='title_line'>
		${fcateVO.name } 질문 목록
		<c:if test="${param.quest.length() > 0 }">
      > 「${param.quest }」 검색 ${search_count } 건
    </c:if>
	</div>

	<aside class="aside_right">
		<a href="./create.do?fcateno=${fcateVO.fcateno }">질문 등록</a>
		<span class='menu_divide'>│</span>
		<a href="javascript:location.reload();">새로고침</a>
		<span class='menu_divide'>│</span>
		<a
			href="./list_by_fcateno.do?fcateno=${param.fcateno }&now_page=${param.now_page == null ? 1 : param.now_page }&quest=${param.quest }">목록형</a>
		<span class='menu_divide'>│</span>
		<a
			href="./list_by_fcateno_grid.do?fcateno=${param.fcateno }&now_page=${param.now_page == null ? 1 : param.now_page }&quest=${param.quest }">갤러리형</a>
	</aside>
	<br>
	<div style="text-align: right; clear: both;">
		<form name='frm' id='frm' method='get' action='./list_by_fcateno.do'>
			<input type='hidden' name='fcateno' value='${param.fcateno }'>
			<%-- 게시판의 구분 --%>

			<c:choose>
				<c:when test="${param.quest != '' }">
					<%-- 검색하는 경우 --%>
					<input type='text' name='quest' id='quest' value='${param.quest }' class='input_word'>
				</c:when>
				<c:otherwise>
					<%-- 검색하지 않는 경우 --%>
					<input type='text' name='quest' id='quest' value='' class='input_word'>
				</c:otherwise>
			</c:choose>
			<button type='submit' class="btn btn-outline-warning btn-sm"
				style="height: 30px; margin-bottom: 5px; background-color: #B8860B;">검색</button>
			<c:if test="${param.quest.length() > 0 }">
				<button type='button' class="btn btn-outline-warning btn-sm"
					style="height: 30px; margin-bottom: 5px;background-color: #B8860B;"
					onclick="location.href='./list_by_fcateno.do?fcateno=${fcateVO.fcateno}&word='">검색 취소</button>
			</c:if>

		</form>
	</div>

	<div class="menu_line"></div>

	<div style='width: 100%;'>
		<%-- 갤러리 Layout 시작 --%>
		<c:forEach var="QuestionVO" items="${list }" varStatus="status">
			<c:set var="title" value="${QuestionVO.title }" />
			<c:set var="quest" value="${QuestionVO.quest }" />
			<c:set var="questno" value="${QuestionVO.questno }" />
			<c:set var="fcateno" value="${QuestionVO.fcateno }" />
			<c:set var="rdate" value="${QuestionVO.rdate }" />

			<div
				onclick="location.href='./read.do?questno=${questno}&quest=${param.quest }&now_page=${param.now_page == null ? 1 : param.now_page }&fcateno=${param.fcateno }'"
				style='width: 15%; height: 200px; float: left; margin: 0.5%; padding: 0.5%; background-color: #FFF8DC; text-align: center; color: #556B2F; font-size: 14px; cursor: pointer; border: 3px solid #8B4513; border-radius: 10px;'>
				<br> <br>
				<span style="color: #556B2F;">${title }</span>
				<br> <br>
				<span style="color: #556B2F;">${fcateVO.rdate.substring(0, 10) }</span>
			</div>

			<%-- 하나의 행에 이미지를 5개씩 출력후 행 변경, index는 0부터 시작 --%>
			<c:if test="${status.count % 5 == 0}">
				<hr class='content_line'>
				<%-- 줄바꿈 --%>
			</c:if>

		</c:forEach>
	</div>

	<!-- 페이지 목록 출력 부분 시작 -->
	<div class='bottom_menu'>${paging }</div>
	<%-- 페이지 리스트 --%>
	<!-- 페이지 목록 출력 부분 종료 -->

	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
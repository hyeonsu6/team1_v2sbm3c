<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival Reply List</title>
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
					<td>${questionVO.questno }
					<td>
						<a
							href="./read.do?questno=${questno}&now_page=${param.now_page == null ? 1 : param.now_page }&fcateno=${param.fcateno }">${questionVO.title }</a>
					</td>

					<td>
						<c:choose>
							<c:when test="${questionVO.quest.length() > 160 }">${questionVO.quest.substring(0, 160) }...</c:when>
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

	<!-- 페이지 목록 출력 부분 시작 -->
	<DIV class='bottom_menu'>${paging }</DIV>
	<%-- 페이지 리스트 --%>
	<!-- 페이지 목록 출력 부분 종료 -->

	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="questno" value="${questionVO.questno }" />
<c:set var="fcateno" value="${questionVO.fcateno }" />
<c:set var="memberno" value="${questionVO.memberno }" />
<c:set var="title" value="${questionVO.title }" />
<c:set var="quest" value="${questionVO.quest }" />
<c:set var="rdate" value="${questionVO.rdate }" />

<c:set var="ansno" value="${answerVO.ansno }" />
<c:set var="ans" value="${answerVO.ans }" />
<c:set var="answer_rdate" value="${answerVO.rdate }" />

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
		<a href="./list_by_fcateno.do?fcateno=${fcateVO.fcateno }" class='title_link'>${questionVO.title }</a>
	</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
		<span class='menu_divide'>│</span>

		<c:if test="${questionVO.memberno eq sessionScope.memberno}">
			<a href="./create.do?questno=${questno }&now_page=${param.now_page}&fcateno=${fcateno}">질문 등록</a>
			<span class='menu_divide'>│</span>
			<a href="./update_quest.do?questno=${questno}&now_page=${param.now_page}">질문 수정</a>
			<span class='menu_divide'>│</span>
			<a href="./delete.do?questno=${questno}&now_page=${param.now_page}&fcateno=${fcateno}">질문 삭제</a>
		</c:if>

		<c:if test="${isAdmin}">
			<c:choose>
				<c:when test="${answerExist}">
					<span class='menu_divide'>│</span>
					<a href="../answer/update_answer.do?ansno=${ansno}&now_page=${param.now_page}">답변 수정</a>
					<span class='menu_divide'>│</span>
					<a href="../answer/delete.do?ansno=${ansno}&now_page=${param.now_page}">답변 삭제</a>
				</c:when>

				<c:otherwise>
					<span class='menu_divide'>│</span>
					<a href="../answer/create.do?questno=${questno}&now_page=${param.now_page}">답변 등록</a>
				</c:otherwise>
			</c:choose>
		</c:if>
	</aside>

	<div class='menu_line'></div>

	<fieldset class="fieldset_basic">
		<ul>
			<li class="li_none">
				<div style="width: 100%; word-break: break-all; margin-top: 10px;">
					<span style="font-size: 1.3em;">질문 제목 : ${title}</span>
					<span style="font-size: 0.7em;">( 등록일 : ${questionVO.rdate.substring(0, 10) } )</span>
					<br>
					<span style="font-size: 1.0em;">질문 내용 : ${quest}</span>
					<br> <br>
				</div>
				<div class='content_line'></div>
				<div style="width: 100%; word-break: break-all;">
					<span style="font-size: 1.3em; margin-right: 5px;">관리자 답변</span>
					<c:if test="${answerVO.rdate.substring(0, 10) != null}">
						<span style="font-size: 0.7em;">( 등록일 : ${answerVO.rdate.substring(0, 10)} )</span>
					</c:if>
					<c:if test="${answerVO.rdate.substring(0, 10) == null}">
						<span style="font-size: 0.7em;">(답변예정)</span>
					</c:if>
					<br>
					<span style="font-size: 1.0em;"> 답변 내용 : ${ans}</span>
					<br> <br>
				</div>
			</li>
		</ul>
	</fieldset>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
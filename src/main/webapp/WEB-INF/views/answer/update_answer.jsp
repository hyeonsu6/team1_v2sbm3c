<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="title" value="${questionVO.title }" />

<c:set var="ansno" value="${answerVO.ansno }" />
<c:set var="questno" value="${answerVO.questno }" />
<c:set var="adminno" value="${answerVO.adminno }" />
<c:set var="ans" value="${answerVO.ans }" />
<c:set var="rdate" value="${answerVO.rdate }" />

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

	<div class='title_line'>${title }>답변 수정</div>
	<aside class="aside_right"> 
		<a href="javascript:location.reload();">새로고침</a>
	</aside>
	<div class='menu_line'></div>

	<form name='frm' method='post' action='./update_answer.do'>
		<%--     <input type="hidden" name="questno" value="${questno }">
    <input type="hidden" name="ansno" value="${ansno }">
    <input type="hidden" name="now_page" value="${param.now_page }"> --%>
		<input type="hidden" name="ansno" value="${ansno }">

		<div>
			<label style="margin: 15px auto; font-size: 18px;">답변 내용</label>
			<textarea name='ans' required="required" class="form-control" rows="12" style='width: 100%;'>${ans }</textarea>
		</div>

		<div class="content_body_bottom">
			<button type="submit" class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">답변 수정</button>
			<button type="button" onclick="history.back();" class="btn btn-outline-warning btn-sm"
				style="background-color: #B8860B;">취소</button>
		</div>

	</form>

	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
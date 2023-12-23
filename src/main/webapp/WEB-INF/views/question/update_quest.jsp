<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="questno" value="${questionVO.questno }" />
<c:set var="fcateno" value="${questionVO.fcateno }" />
<c:set var="memberno" value="${questionVO.memberno }" />
<c:set var="title" value="${questionVO.title }" />
<c:set var="quest" value="${questionVO.quest }" />
<c:set var="rdate" value="${questionVO.rdate }" />

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

	<div class='title_line'>${title } > 질문 수정</div>
	<aside class="aside_right">
		<a href="./create.do?questno=${questno }&now_page=${param.now_page}&fcateno=${fcateno}">질문 등록</a>
		<span class='menu_divide'>│</span>
		<a href="javascript:location.reload();">새로고침</a>
	</aside>

	<div class='menu_line'></div>

	<form name='frm' method='post' action='./update_quest.do'>
		<input type="hidden" name="questno" value="${questno }">

		<div>
			<label style="margin: 10px;">제목</label>
			<input type='text' name='title' value='${title }' required="required" autofocus="autofocus" class="form-control"
				style='width: 100%;'>
		</div>
		<div>
			<label style="margin: 10px;">내용</label>
			<textarea name='quest' required="required" class="form-control" rows="8" style='width: 100%;'>${quest }</textarea>
		</div>

		<div class="content_body_bottom">
			<button type="submit" class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">질문 수정</button>
			<button type="button" onclick="location.href='./list_all'" class="btn btn-outline-warning btn-sm"
				style="background-color: #B8860B;">질문 목록</button>
		</div>

	</form>

	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
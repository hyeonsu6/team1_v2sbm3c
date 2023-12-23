<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival Blog Login Message</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='message'>
		<h4>관리자 로그인이 필요한 페이지입니다.</h4>
		<br> <br>
		<button type='button' onclick="location.href='/admin/login.do'" class="btn btn-outline-warning btn-sm"
			style="background-color: #B8860B;">관리자 로그인</button>
	</div>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>


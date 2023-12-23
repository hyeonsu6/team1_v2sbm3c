<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=5.0, width=device-width" />
<title>Festival Blog Member Login Message</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='message'>
		<h3>회원 로그인이 필요한 페이지입니다.</h3>
		<br> <br>
		<button type='button' onclick="location.href='/member/login.do'" class="btn btn-outline-warning btn-sm"
			style="background-color: #B8860B;">로그인</button>
		<button type='button' onclick="location.href='/member/create.do'" class="btn btn-outline-warning btn-sm"
			style="background-color: #B8860B;">회원 가입</button>
	</div>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>


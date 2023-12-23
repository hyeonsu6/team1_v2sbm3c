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

	<div class='title_line' style="text-align: left; font-size: 30px;">로그인</div>
	<div class='message'>
		<fieldset class='fieldset_basic'>
			<ul>
				<li class='li_none'>관리자 로그인에 실패했습니다.</li>
				<li class='li_none'>ID 또는 패스워드가 일치하지 않습니다.</li>
				<li class='li_none'>
					<button type="button" id="btn_retry" class="btn btn-outline-warning btn-sm" onclick="location.href='./login.do'"
						style="background-color: #B8860B;">로그인</button>
					<button type="button" id="btn_home" class="btn btn-outline-warning btn-sm" onclick="location.href='/index.do'"
						style="background-color: #B8860B;">홈으로</button>
				</li>
			</ul>
		</fieldset>
	</div>

	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>


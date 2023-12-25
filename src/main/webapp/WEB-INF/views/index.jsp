<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.2, minimum-scale=1.2, maximum-scale=10.0, width=device-width" />
<title>Festival Blog</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<!-- Fotorama -->
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="/jquery/fotorama/fotorama.css" rel="stylesheet">
<script src="/jquery/fotorama/fotorama.js"></script>
</head>

<body>
	<div class='top_img' style="width: 90%; margin-left: 75px; margin-bottom: 0px;"></div>
	<c:import url="/menu/top.do" />

	<%-- <div class='content_body'>
		<div class="login_container">
			<div class="login_image">
				<img src="/images/index_img.jpg" alt="메인 이미지">
			</div>
			<div class="login_image">
				<img src="/images/index_img.jpg" alt="메인 이미지">
			</div>
		</div>
		<jsp:include page="./menu/bottom.jsp" flush='false' />
	</div> --%>

	<div style='margin: 0px auto; width: 300px;'>
		<!-- Fotorama data-ratio="100%/66%" -->
		<div class="fotorama" data-autoplay="3000" data-nav="thumbs" data-ratio="800/520" data-width="100%">
			<img src="/images/index_img.jpg" alt="메인 이미지">
			<img src="/images/login.jpg" alt="메인 이미지">
			<img src="/images/login2.jpg" alt="메인 이미지">
		</div>
	</div>
	<jsp:include page="./menu/bottom.jsp" flush='false' />
</body>
</html>
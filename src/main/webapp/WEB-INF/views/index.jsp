<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Festival Blog</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>
<body>
	<jsp:include page="./menu/top.jsp" flush='false' />
	<div class='content_body'>
		<div class="login_container">
			<div class="login_image">
				<img src="/images/index_img.jpg" alt="메인 이미지">
			</div>
			<div class="login_image">
				<img src="/images/index_img.jpg" alt="메인 이미지">
			</div>
		</div>
		<jsp:include page="./menu/bottom.jsp" flush='false' />
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival world</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />
	<div class='title_line'>🤍🤍🤍</div>

	<!-- 좋아요 삭제 폼 -->
	<form action="./delete.do" method="post">
		<!-- 게시물 번호 및 회원 번호 -->
		<input type="hidden" name="contentsno" value="${contentsno}">
		<input type="hidden" name="memberno" value="${memberno}">

		<!-- 삭제 버튼 -->
		<button type="submit" class="btn btn-danger btn-sm">좋아요 취소</button>
	</form>
</body>
</html>

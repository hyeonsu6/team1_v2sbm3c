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

	<!-- 특정 게시물의 좋아요 수 표시 -->
	<div>
		<c:if test="${not empty likeCnt}">
			<p>게시물의 좋아요 수: ${likeCnt}</p>
		</c:if>
		<c:if test="${empty likeCnt}">
			<p>게시물의 좋아요가 없습니다.</p>
		</c:if>
	</div>

</body>
</html>

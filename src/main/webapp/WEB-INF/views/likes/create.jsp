<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival World</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />
	<div class='title_line'>🤍🤍🤍</div>

	<!-- 좋아요 등록 폼 -->
	<form action="./create.do" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
		<!-- 게시물 선택 드롭다운 메뉴 -->
		<label for="contentsno">게시물 선택:</label>
		<select id="contentsno" name="contentsno" required>
			<c:forEach var="like" items="${likesList}">
				<option value="${like.festivalVO.contentsno}">${like.festivalVO.title}</option>
			</c:forEach>
		</select>
		<!-- 예시: memberno 필드 -->
		<input type="hidden" name="memberno" value="1">

		<!-- 등록 버튼 -->
		<button type="submit" class="btn btn-dark btn-sm">좋아요</button>
	</form>

	<script>
		function validateForm() {
			// JavaScript를 사용하여 빈 문자열 체크
			var contentsno = document.getElementById("contentsno").value;
			if (contentsno === contentsno) {
				alert("게시물을 선택해주세요.");
				return false;
			}
			return true;
		}
	</script>
</body>

</html>

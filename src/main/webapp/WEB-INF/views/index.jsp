<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.2, minimum-scale=1.2, maximum-scale=10.0, width=device-width">
<title>Festival Blog</title>
<link rel="shortcut icon" href="/images/festival.png">
<link href="/css/style.css" rel="stylesheet" type="text/css">

<style type="text/css">
.index_img {
	max-width: 100%;
	max-height: 50%;
	height: auto;
	display: block;
	margin: 0 auto;
}
</style>
</head>

<body>
	<c:import url="/menu/top.do" />

	<script>
		const images = [ "/images/index_img1.png", "/images/index_img2.png",
				"/images/index_img3.png" ];
		let currentImageIndex = 0;

		function changeImage() {
			const imgElement = document.getElementById("slideshow");
			imgElement.src = images[currentImageIndex];
			currentImageIndex = (currentImageIndex + 1) % images.length;
		}

		setInterval(changeImage, 2000); // 2초마다 changeImage 함수 호출
	</script>

	<div style="text-align: center;">
		<img src="/images/index_img1.png" alt="메인 이미지" class="index_img" id="slideshow">
	</div>
	<br>

	<div class="menu_line" style="margin-top: -15px;"></div>

	<c:choose>
		<c:when test="${sessionScope.id == null}">
			<%-- 로그인 안된 경우 기본 이미지만 출력 --%>
			<div style='width: 100%; margin: 10px auto; text-align: center;'>
				<%-- /static/images/resort01.jpg --%>
				<img src='/images/index_img.jpg' style='width: 100%;'>
			</div>
		</c:when>
		<c:otherwise>
			<div style='width: 100%; margin: 30px auto; text-align: center;'>
				<%-- 로그인된 경우 추천 --%>
				<c:if test="${sessionScope.id != null}">
					<div style='width: 70%; margin: 10px auto; text-align: center;'>
						<h4>[${sessionScope.mname}]님을 위한 추천 페스티벌 카테고리</h4>
						<c:import url="/frecommend/list_by_memberno_index.do" />
					</div>

					<div style="clear: both; height: 20px;"></div>

					<div style='width: 70%; margin: 10px auto; text-align: center;'>
						<h4>[${sessionScope.mname}]님을 위한 추천 페스티벌</h4>
						<c:import url="/frecommend/recom_like.do" />
					</div>
				</c:if>
			</div>
		</c:otherwise>
	</c:choose>
	<jsp:include page="./menu/bottom.jsp" flush='false' />
</body>
</html>

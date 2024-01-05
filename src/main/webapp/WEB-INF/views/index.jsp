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
</head>

<body>
	<c:import url="/menu/top.do" />

	<a href="#" id="imageLink">
		<img src="/images/index_img1.png" id="slideshow" alt="Slideshow Image" class="index_img">
	</a>

	<script>
		const images = [ "/images/index_img1.png", "/images/index_img2.png",
				"/images/index_img3.png" ];
		const links = [
				"http://localhost:9093/festival/read.do?contentsno=13&word=&now_page=1&fcateno=11",
				"http://localhost:9093/festival/read.do?contentsno=14&word=&now_page=1&fcateno=3",
				"http://localhost:9093/festival/read.do?contentsno=15&word=&now_page=1&fcateno=7" ];

		let currentImageIndex = 0;

		function changeImage() {
			const imgElement = document.getElementById("slideshow");
			const linkElement = document.getElementById("imageLink");

			imgElement.src = images[currentImageIndex];
			linkElement.href = links[currentImageIndex];

			currentImageIndex = (currentImageIndex + 1) % images.length;
		}

		setInterval(changeImage, 2000); // 2초마다 changeImage 함수 호출
	</script>
	<br>

	<div class="menu_line" style="margin-top: -15px;"></div>

	<c:choose>
		<c:when test="${sessionScope.id == null}">
			<%-- 로그인 안된 경우 기본 이미지만 출력 --%>
			<div style='width: 90%; margin: 10px auto; text-align: center; color: #8B008B;'>
				<img src='/images/index2.png' style='width: 100%; border-radius: 10px; '>
			</div>
		</c:when>

		<c:otherwise>
			<div style='width: 100%; margin: 30px auto; text-align: center;'>
				<%-- 로그인된 경우 추천 --%>
				<c:if test="${sessionScope.id != null}">
					<div style='width: 60%; margin: 10px auto; text-align: center; color: #2e4e26;'>
						<h4>[${sessionScope.mname}]님을 위한 추천 페스티벌 카테고리</h4>
						<c:import url="/frecommend/list_by_memberno_index.do" />
					</div>

					<div style="clear: both; height: 20px;"></div>

					<div style='width: 80%; margin: 10px auto; text-align: center; color: #1E90FF;'>
						<h4>[${sessionScope.mname}]님을 위한 추천 페스티벌 TOP 5</h4>
						<c:import url="/frecommend/recom_like.do" />
					</div>

					<div style="clear: both; height: 10px;"></div>
					<div class="content_line_new"></div>
					<div style="clear: both; height: 10px;"></div>

					<div style='width: 80%; margin: 10px auto; text-align: center; color: #FF6347;'>
						<h4>[${sessionScope.mname}]님을 위한 2024 갑진년 새해 추천 페스티벌 TOP 3</h4>
						<c:import url="/frecommend/recom_like_new.do" />
					</div>
				</c:if>
			</div>
		</c:otherwise>
	</c:choose>
	<jsp:include page="./menu/bottom.jsp" flush='false' />
</body>
</html>

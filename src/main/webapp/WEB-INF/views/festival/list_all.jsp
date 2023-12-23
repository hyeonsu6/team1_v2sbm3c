<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival Blog Festival Contents</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='title_line'>[관리자] 페스티벌 콘텐츠 목록 (전체)</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
	</aside>

	<div class="menu_line"></div>

	<table>
		<colgroup>
			<col style="width: 15%;"></col>
			<col style="width: 60%;"></col>
			<col style="width: 15%;"></col>
			<col style="width: 10%;"></col>
		</colgroup>

		<thead>
			<tr style="text-align: center;">
				<th>🖼️</th>
				<th>콘텐츠</th>
				<th>등록일</th>
				<th></th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="festivalVO" items="${list }" varStatus="info">
				<c:set var="contentsno" value="${festivalVO.contentsno }" />
				<c:set var="thumb1" value="${festivalVO.thumb1 }" />

				<tr onclick="location.href='./read.do?contentsno=${contentsno}'" style="cursor: pointer; text-align: center;">
					<td>
						<c:choose>
							<c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
								<%-- 이미지인지 검사 --%>
								<%-- registry.addResourceHandler("/festival/storage/**").addResourceLocations("file:///" +  Contents.getUploadDir()); --%>
								<img src="/festival/storage/${thumb1 }" style="width: 120px; height: 90px;">
							</c:when>

							<c:otherwise>
								<!-- 이미지가 없는 경우 기본 이미지 출력: /static/festival/images/none1.png -->
								<img src="/festival/images/none1.png" style="width: 120px; height: 90px;">
							</c:otherwise>
						</c:choose>
					</td>

					<td class="td_left">
						<span>${festivalVO.title }</span>
						<br>
						<c:choose>
							<c:when test="${festivalVO.content.length() > 160 }">${festivalVO.content.substring(0, 160) }...</c:when>
							<c:otherwise>
								<span style="font-size: 0.9em;">${festivalVO.content }</span>
							</c:otherwise>
						</c:choose>
					</td>

					<td>
						<span>${festivalVO.rdate.substring(0, 10)}</span>
					</td>

					<td>
						<a href="/festival/map.do?fcateno=${fcateno }&contentsno=${contentsno}&now_page=${param.now_page}" title="지도">
							<img src="/festival/images/map.png" class="icon">
						</a>
						<a href="/festival/youtube.do?fcateno=${fcateno }&contentsno=${contentsno}&now_page=${param.now_page}" title="유튜브">
							<img src="/festival/images/youtube.png" class="icon">
						</a>
						<c:if test="${sessionScope.admin_id != null }">
							<a href="/festival/delete.do?fcateno=${fcateno }&contentsno=${contentsno}&now_page=${param.now_page}" title="삭제">
								<img src="/festival/images/delete.png" class="icon">
							</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<a href="https://korean.visitkorea.or.kr/main/main.do" class="b_menu_link">정보 제공 : 한국관광공사</a>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
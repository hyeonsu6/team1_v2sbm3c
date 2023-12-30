<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.rounded-image {
	border-radius: 5%;
}
</style>

<div style='width: 100%;'>
	<c:forEach var="festivalVO" items="${list }" varStatus="status">
		<c:set var="title" value="${festivalVO.title.trim() }" />
		<c:set var="content" value="${festivalVO.content.trim() }" />
		<c:set var="fcateno" value="${festivalVO.fcateno }" />
		<c:set var="contentsno" value="${festivalVO.contentsno }" />
		<c:set var="thumb1" value="${festivalVO.thumb1 }" />
		<c:set var="size1" value="${festivalVO.size1 }" />
		<div
			onclick="location.href='/festival/read.do?contentsno=${contentsno }&word=${param.word }&now_page=${param.now_page == null ? 1 : param.now_page }'"
			class='title_link'
			style='width: 18%; height: 190px; margin: 0.5%; padding: 0.3%; font-size: 16px; background-color: #FFA07A; text-align: center; 
			display: inline-block; vertical-align: top; border-radius: 15px; border: 7px #FF6347 ridge;'>

			<c:choose>
				<c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
					<img src="/festival/storage/${thumb1}?width=100&amp;height=140"
						style="max-width: 100%; max-height: 140px; object-fit: cover;" class="rounded-image">
				</c:when>
				<c:otherwise>
					<img src="/festival/images/none1.png" style="max-width: 100%; max-height: 140px; object-fit: cover;"
						class="rounded-image">
				</c:otherwise>
			</c:choose>

			<div style="margin-top: 10px;">
				<span style="font-size: 0.8em; color: #FFF8DC;">
					<c:choose>
						<c:when test="${title.length() > 12 }"> ${title.substring(0, 12)}...</c:when>
						<c:when test="${title.length() <= 15 }">${title}</c:when>
					</c:choose>
				</span>
			</div>
		</div>
	</c:forEach>
</div>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="title" value="${festivalVO.title }" />

<c:set var="contentsno" value="${freviewVO.contentsno }" />
<c:set var="reviewno" value="${freviewVO.reviewno }" />
<c:set var="thumb1" value="${freviewVO.thumb1 }" />
<c:set var="file1saved" value="${freviewVO.file1saved }" />
<c:set var="title" value="${freviewVO.title }" />
<c:set var="content" value="${freviewVO.content }" />
<c:set var="nickname" value="${freviewVO.nickname }" />
<c:set var="rdate" value="${freviewVO.rdate }" />
<c:set var="map" value="${freviewVO.map }" />
<c:set var="file1" value="${freviewVO.file1 }" />
<c:set var="size1_label" value="${freviewVO.size1_label }" />
<c:set var="word" value="${freviewVO.word }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=5.0, width=device-width" />
<title>Festival Blog Festival Review</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='title_line'>
		<a href="../festival/read.do?contentsno=${festivalVO.contentsno}" class='title_link'>${festivalVO.title }</a>
		>
		<a
			href="./read.do?reviewno=${reviewno}&word=${word }&now_page=${now_page == null ? 1 : now_page }&contentsno=${contentsno }"
			class='title_link'>${freviewVO.title }</a>
		> 리뷰 지도🧭 등록|수정|삭제
	</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
		<span class='menu_divide'>│</span>
		<a href="./list_by_contentsno.do?contentsno=${contentsno }">📰 리뷰 목록</a>
	</aside>

	<div style="text-align: right; clear: both;">
		<form name='frm' id='frm' method='get' action='./list_by_contentsno.do'>
			<input type='hidden' name='contentsno' value='${festivalVO.contentsno }'>
			<%-- 게시판의 구분 --%>

			<c:choose>
				<c:when test="${param.word != '' }">
					<%-- 검색하는 경우 --%>
					<input type='text' name='word' id='word' value='${param.word }' class='input_word'>
				</c:when>
				<c:otherwise>
					<%-- 검색하지 않는 경우 --%>
					<input type='text' name='word' id='word' value='' class='input_word'>
				</c:otherwise>
			</c:choose>
			<button type='submit' class="btn btn-outline-warning btn-sm"
				style="height: 30px; margin-bottom: 5px; background-color: #B8860B;">검색</button>
			<c:if test="${param.quest.length() > 0 }">
				<button type='button' class="btn btn-outline-warning btn-sm"
					style="height: 30px; margin-bottom: 5px; background-color: #B8860B;"
					onclick="location.href='./list_by_fcateno.do?fcateno=${fcateVO.fcateno}&word='">검색 취소</button>
			</c:if>
		</form>
	</div>

	<div class='menu_line'></div>
	<%--등록/수정/삭제 폼 --%>
	<form name='frm_map' method='post' action='./map.do'>
		<input type="hidden" name="reviewno" value="${param.reviewno }">

		<div>
			<label>지도 스크립트</label>
			<textarea name='map' class="form-control" rows="3" style='width: 100%;'>${freviewVO.map }</textarea>
		</div>
		<div class="content_body_bottom">
			<button type="submit" class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">지도 저장</button>
			<button type="button" onclick="frm_map.map.value=''; frm_map.submit();" class="btn btn-outline-warning btn-sm"
				style="background-color: #B8860B;">지도 삭제</button>
			<button type="button" onclick="history.back();" class="btn btn-outline-warning btn-sm"
				style="background-color: #B8860B;">취소</button>
		</div>
	</form>

	<div class="content_line"></div>
	<div style="text-align: center; font-size: 20px;">
		<div style="margin: 10px; color: #228B22;">
			[참고] 다음 지도의 등록 방법<br>
		</div>
		<img src='/festival/images/map01.jpg' style='width: 50%;'>
		<img src='/festival/images/map02.jpg' style='width: 50%;'>
		<img src='/festival/images/map03.jpg' style='width: 50%;'>
		<img src='/festival/images/map04.jpg' style='width: 50%;'>
		<img src='/festival/images/map05.jpg' style='width: 50%;'>
	</div>
	<jsp:include page="../menu/bottom.jsp" />
</body>

</html>
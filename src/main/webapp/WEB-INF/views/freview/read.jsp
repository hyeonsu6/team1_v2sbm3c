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
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Festival world</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />
	<div class='title_line'>
		<a href="./list_by_contentsno.do?contentsno=${festivalVO.contentsno }" class='title_link'>${festivalVO.title }</a>
		> 리뷰
	</div>
	<aside class="aside_left">
		<button type="submit" class="btn btn-sm"
			onclick="location.href='../festival/read.do?contentsno=${contentsno}&word=${festivalVO.word}&now_page=${festivalVO.now_page}&fcateno=${festivalVO.fcateno}'"
			style="font-weight: bold; text-align: left; background-color: #5A7696; color: #FFEFD5;">${festivalVO.title }
			보러가기 ✨</button>
	</aside>

	<aside class="aside_right">
		<%-- 회원으로 로그인해야 메뉴가 출력됨 --%>
		<c:if test="${sessionScope.mname != null }">
			<c:if test="${freviewVO.memberno eq sessionScope.memberno}">
				<a href="./update_text.do?reviewno=${reviewno}&now_page=${param.now_page}&word=${param.word }">글 수정</a>
				<span class='menu_divide'>│</span>
				<a href="./update_file.do?reviewno=${reviewno}&now_page=${param.now_page}">파일 수정</a>
				<span class='menu_divide'>│</span>
				<a href="./map.do?contentsno=${contentsno }&reviewno=${reviewno}">지도</a>
				<span class='menu_divide'>│</span>
				<a href="./delete.do?reviewno=${reviewno}&now_page=${param.now_page}&contentsno=${contentsno}">삭제</a>
				<span class='menu_divide'>│</span>
			</c:if>
		</c:if>
		<a href="./create.do?contentsno=${contentsno }">📝 리뷰 등록</a>
		<span class='menu_divide'>│</span>
		<a href="./list_by_contentsno.do?contentsno=${contentsno }">📰 리뷰 목록</a>
		<span class='menu_divide'>│</span>
		<a href="javascript:location.reload();">새로고침</a>
	</aside>


	<%-- <aside class="aside_right">
		회원으로 로그인해야 메뉴가 출력됨
		<c:if test="${sessionScope.id != null }">
			http://localhost:9093/freview/create.do?reviewno=1
      		http://localhost:9093/freview/create.do?reviewno=2
      		http://localhost:9093/freview/create.do?reviewno=3

			<a href="./update_text.do?reviewno=${reviewno}&now_page=${param.now_page}&word=${param.word }">글 수정</a>
			<span class='menu_divide'>│</span>
			<a href="./update_file.do?reviewno=${reviewno}&now_page=${param.now_page}">파일 수정</a>
			<span class='menu_divide'>│</span>
			<a href="./map.do?contentsno=${contentsno }&reviewno=${reviewno}">지도</a>
			<span class='menu_divide'>│</span>
			<a href="./delete.do?reviewno=${reviewno}&now_page=${param.now_page}&contentsno=${contentsno}">삭제</a>
			<span class='menu_divide'>│</span>
		</c:if>
		<a href="./create.do?contentsno=${contentsno }">📝 리뷰 등록</a>
		<span class='menu_divide'>│</span>
		<a href="javascript:location.reload();">새로고침</a>
	</aside> --%>

	<div style="text-align: right; clear: both;">
		<form name='frm' id='frm' method='get' action='./list_by_contentsno.do'>
			<input type='hidden' name='contentsno' value='${param.contentsno }'>
			<%-- 게시판의 구분 --%>

			<c:choose>
				<c:when test="${param.word != '' }">
					<%-- 검색하는 경우는 검색어를 출력 --%>
					<input type='text' name='word' id='word' value='${param.word }'>
				</c:when>
				<c:otherwise>
					<%-- 검색하지 않는 경우 --%>
					<input type='text' name='word' id='word' value=''>
				</c:otherwise>
			</c:choose>
			<button type='submit' class='btn btn-dark btn-sm' style="padding: 2px 8px 3px 8px; margin: 0px 0px 2px 0px;">검색</button>
			<c:if test="${param.word.length() > 0 }">
				<%-- 검색 상태하면 '검색 취소' 버튼을 출력 --%>
				<button type='button' class='btn btn-dark btn-sm' style="padding: 2px 8px 3px 8px; margin: 0px 0px 2px 0px;"
					onclick="location.href='./list_by_contentsno.do?contentsno=${param.contentsno}&word='">검색 취소</button>
			</c:if>
		</form>
	</div>

	<div class='menu_line'></div>

	<fieldset class="fieldset_basic">
		<ul>
			<li class="li_none">
				<div style="width: 100%; word-break: break-all;">
					<c:choose>
						<c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
							<%-- /static/festival/storage/ --%>
							<img src="/freview/storage/${file1saved }" style='width: 35%; float: left; margin-top: 0.5%; margin-right: 1%;'>
						</c:when>
						<c:otherwise>
							<!-- 기본 이미지 출력 -->
							<img src="/freview/images/none1.png" style='width: 50%; float: left; margin-top: 0.5%; margin-right: 1%;'>
						</c:otherwise>
					</c:choose>


					<span style="font-size: 1.7em; font-weight: bold;">${title}</span>
					<br>
					<span style="font-size: 1.0em; font-weight: bold;"> 작성자: ${nickname} </span>
					<span style="font-size: 1.0em; font-weight: bold;"> | 등록일: ${rdate.substring(0, 10)}</span>
					<br> <br>${content}
				</div>
			</li>

			<c:if test="${map.trim().length() > 0 }">
				<li class="li_none" style="clear: both; padding-top: 5px; padding-bottom: 5px;">
					<div style='text-align: center; width: 640px; height: 360px; margin: 0px auto;'>${map }</div>
				</li>
			</c:if>

			<li class="li_none" style="clear: both;">
				<div style='text-decoration: none;'>검색어(키워드): ${word }</div>
			</li>

			<li class="li_none">
				<div>
					<c:if test="${file1.trim().length() > 0 }">
            첨부 파일: <a href='/download?dir=/freview/storage&filename=${file1saved}&downname=${file1}'>${file1}</a> (${size1_label}) 
            <a href='/download?dir=/freview/storage&filename=${file1saved}&downname=${file1}'>
							<img src="/freview/images/download.png" class="icon">
						</a>
					</c:if>
				</div>
			</li>
		</ul>

		<br>
		<div class='menu_line'></div>
		<div>
			<span style="font-size: 20px; font-weight: bold;">댓글</span>
		</div>
		<div
			style='height: 120px; float: center; margin: 0.5%; padding: 0.5%; border: 1px solid #B6BBC4; border-radius: 10px;'>

			<c:if test="${isMember}">
				<div style='margin-left: 10px; font-size: 20px;'>${id }</div>
				<div
					style='color: #B6BBC4; float: center; margin: 0.1%; padding: 0.5%; border: 1px solid #FFFFFF; border-radius: 10px; margin-right: 70px;'>
					댓글을 남겨보세요</div>
				<button type='submit' class='btn btn-secondary btn-sm' style="float: right; margin-top: -8px;">등록</button>
			</c:if>
			<c:if test="${not isMember }">
				<div style='margin-top: 35px; color: #B6BBC4; text-align: center; font-size: 18px;'>로그인하여 댓글을 남겨보세요</div>
			</c:if>
		</div>

		<div style='width: 100%; border-bottom: solid 1px #D0D4CA; margin: 20px 0px 10px 0px; clear: both;'></div>

		<div
			style='color: #000000; float: center; margin: 0.1%; padding: 0.5%; border: 1px solid #FFFFFF; border-radius: 10px; margin-right: 70px;'>
			${list }</div>

	</fieldset>

	</div>


	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>


<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contentsno" value="${festivalVO.contentsno }" />

<c:set var="reviewno" value="${freviewVO.reviewno }" />
<c:set var="title" value="${freviewVO.title }" />
<c:set var="content" value="${freviewVO.content }" />
<c:set var="word" value="${freviewVO.word }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
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
		> 리뷰 수정
	</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
		<span class='menu_divide'>│</span>
		<a href="./list_by_contentsno.do?contentsno=${contentsno }">📰 리뷰 목록</a>
	</aside>

	<div style="text-align: right; clear: both;">
		<form name='frm' id='frm' method='get' action='./list_by_contentsno_search_paging.do'>
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
			<c:if test="${param.word.length() > 0 }">
				<button type='button' class="btn btn-outline-warning btn-sm"
					style="height: 30px; margin-bottom: 5px; background-color: #B8860B;"
					onclick="location.href='./list_by_fcateno.do?fcateno=${fcateVO.fcateno}&word='">검색 취소</button>
			</c:if>
		</form>
	</div>

	<div class='menu_line'></div>

	<form name='frm' method='post' action='./update_text.do'>
		<input type="hidden" name="contentsno" value="${contentsno }">
		<input type="hidden" name="reviewno" value="${reviewno }">
		<input type="hidden" name="now_page" value="${param.now_page }">

		<div>
			<label style="margin-bottom: 15px;">제목</label>
			<input type='text' name='title' value='${title }' required="required" autofocus="autofocus" class="form-control"
				style='width: 100%;'>
		</div>
		<div>
			<label style="margin-bottom: 15px;">내용</label>
			<textarea name='content' required="required" class="form-control" rows="12" style='width: 100%;'>${content }</textarea>
		</div>
		<div>
			<label style="margin-bottom: 15px;">검색어</label>
			<input type='text' name='word' value="${word }" required="required" class="form-control" style='width: 100%;'>
		</div>

		<div>
			<label style="margin-bottom: 15px;">패스워드</label>
			<input type='password' name='pwd' value='' required="required" class="form-control" style='width: 50%;'>
		</div>

		<div class="content_body_bottom">
			<button type="submit" class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">리뷰 수정</button>
			<button type="button" onclick="history.back();" class="btn btn-outline-warning btn-sm"
				style="background-color: #B8860B;">수정 취소</button>
		</div>

	</form>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>


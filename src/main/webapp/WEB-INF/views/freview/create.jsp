<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Festival Blog Festival Review</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='title_line'>
		🟡
		<a href="../festival/read.do?contentsno=${festivalVO.contentsno}" class='title_link'>${festivalVO.title }</a>
		> 리뷰 등록하기
	</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
		<span class='menu_divide'>│</span>
		<a href="./list_by_contentsno.do?contentsno=${festivalVO.contentsno }">📰 리뷰 목록</a>
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

	<form name='frm' method='post' action='./create.do?contentsno=${param.contentsno}' enctype="multipart/form-data">
		<input type="hidden" name="contentsno" value="${param.contentsno }">

		<div>
			<label style="margin-bottom: 15px;">작성자</label>
			<input type='text' name='nickname' value='' required="required" autofocus="autofocus" class="form-control"
				style='width: 100%; font-weight: bold; color: blue; margin-bottom: 15px;'>
		</div>
		<div>
			<label style="margin-bottom: 15px;">제목</label>
			<input type='text' name='title' value='' required="required" placeholder="축제 이름을 적어주세요!" autofocus="autofocus"
				class="form-control" style='width: 100%; color: #8B4513; margin-bottom: 15px;'>
		</div>
		<div>
			<label style="margin-bottom: 15px;">리뷰(후기)</label>
			<textarea name='content' required="required" class="form-control" rows="3" style='width: 100%; margin-bottom: 15px;'></textarea>
		</div>
		<div>
			<label style="margin-bottom: 15px;">검색어</label>
			<input type='text' name='word' value='' required="required" class="form-control"
				style='width: 100%; margin-bottom: 15px;'>
		</div>
		<div>
			<label style="margin-bottom: 15px;">이미지</label>
			<input type='file' class="form-control" name='file1MF' id='file1MF' value='' placeholder="파일 선택"
				style="margin-bottom: 15px;">
		</div>
		<div>
			<label style="margin-bottom: 15px;">패스워드</label>
			<input type='password' name='pwd' value='' required="required" class="form-control" style='width: 50%;'>
		</div>
		<div class="content_body_bottom">
			<button type="submit" class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">등록하기</button>
			<button type="button" onclick="location.href='./list_by_contentsno.do?contentsno=${param.contentsno}'"
				class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">리뷰 목록</button>
		</div>
	</form>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>
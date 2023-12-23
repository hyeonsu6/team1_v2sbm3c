<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contentsno" value="${festivalVO.contentsno }" />
<c:set var="fcateno" value="${festivalVO.fcateno }" />
<c:set var="title" value="${festivalVO.title }" />
<c:set var="file1" value="${festivalVO.file1 }" />
<c:set var="file1saved" value="${festivalVO.file1saved }" />
<c:set var="thumb1" value="${festivalVO.thumb1.toLowerCase() }" />
<c:set var="size1" value="${festivalVO.size1 }" />

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

	<div class='title_line'>${fcateVO.name } > ${title } > 콘텐츠 파일 수정</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
		<span class='menu_divide'>│</span>
		<a href="./create.do?fcateno=${fcateno }">콘텐츠 등록</a>
		<span class='menu_divide'>│</span>
		<a href="./list_by_fcateno.do?fcateno=${fcateno }&now_page=${param.now_page}&word=${param.word }">목록형</a>
		<span class='menu_divide'>│</span>
		<a href="./list_by_fcateno_grid.do?fcateno=${fcateno }&now_page=${param.now_page}&word=${param.word }">갤러리형</a>
	</aside>

	<div style="text-align: right; clear: both;">
		<form name='frm' id='frm' method='get' action='./list_by_fcateno_search_paging.do'>
			<input type='hidden' name='fcateno' value='${fcateVO.fcateno }'>
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
				style="height: 30px; margin-bottom: 5px; height: 30px; margin-bottom: 5px; background-color: #B8860B;">검색</button>
			<c:if test="${param.word.length() > 0 }">
				<button type='button' class="btn btn-outline-warning btn-sm"
					style="height: 30px; margin-bottom: 5px; height: 30px; margin-bottom: 5px; background-color: #B8860B;"
					onclick="location.href='./list_by_fcateno.do?fcateno=${fcateVO.fcateno}&word='">검색 취소</button>
			</c:if>
		</form>
	</div>

	<div class='menu_line'></div>

	<fieldset class="fieldset_basic">
		<ul>
			<li class="li_none">
				<div style='text-align: center; width: 30%; margin-top: 10px; float: left;'>
					<c:choose>
						<c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
							<img src="/festival/storage/${file1saved }" style='width: 90%;'>
						</c:when>
						<c:otherwise>
							<!-- 이미지가 없음 -->
							<img src="/festival/images/none1.png" style="width: 90%;">
						</c:otherwise>
					</c:choose>

				</div>

				<div style='text-align: center; width: 100%; margin-top: 10px;'>
										<br>
					<span style='font-size: 1.5em;'> 콘텐츠 이름: ${title} </span>
					<br><br>
					<form name='frm' method='POST' action='./update_file.do' enctype="multipart/form-data">
						<input type="hidden" name="contentsno" value="${contentsno }">
						<input type="hidden" name="now_page" value="${param.now_page }">
						<input type='file' name='file1MF' id='file1MF' value='' placeholder="파일 선택" style="text-align: center; margin-left: 150px;">
						<div style='text-align: center; margin: 10px auto;'>
						<br>
							<button type="submit" class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">콘텐츠 파일
								변경 처리</button>
							<button type="submit" class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">콘텐츠 파일
								삭제</button>
							<button type="button" onclick="history.back();" class="btn btn-outline-warning btn-sm"
								style="background-color: #B8860B;">삭제 취소</button>
						</div>
					</form>
				</div>
			</li>
		</ul>
	</fieldset>

	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="name" value="${fcateVO.name }" />

<c:set var="fcateno" value="${festivalVO.fcateno }" />
<c:set var="contentsno" value="${festivalVO.contentsno }" />
<c:set var="title" value="${festivalVO.title }" />
<c:set var="thumb1" value="${festivalVO.thumb1 }" />
<c:set var="file1saved" value="${festivalVO.file1saved }" />
<c:set var="content" value="${festivalVO.content }" />
<c:set var="rdate" value="${festivalVO.rdate }" />
<c:set var="youtube" value="${festivalVO.youtube }" />
<c:set var="map" value="${festivalVO.map }" />
<c:set var="file1" value="${festivalVO.file1 }" />
<c:set var="size1_label" value="${festivalVO.size1_label }" />
<c:set var="word" value="${festivalVO.word }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Festival Blog Festival Contents</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
	<c:import url="/menu/top.do" />
	<div class='title_line'>
		<a href="./list_by_fcateno.do?fcateno=${fcateVO.fcateno }" class='title_link'>${fcateVO.name }</a>
	</div>

	<aside class="aside_left">
		<button type="submit" class="btn btn-outline-warning btn-sm" style="background-color: #8B0000;"
			onclick="location.href='../freview/create.do?contentsno=${param.contentsno}'">📝 리뷰 등록하기</button>

		<button type="submit" class="btn btn-outline-warning btn-sm" style="background-color: #8B0000;"
			onclick="location.href='../freview/list_by_contentsno.do?contentsno=${param.contentsno}'">📰 리뷰 보러가기</button>
	</aside>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
		<span class='menu_divide'>│</span>
		<a href="./list_by_fcateno.do?fcateno=${fcateno }&now_page=${param.now_page}&word=${param.word }">목록형</a>
		<span class='menu_divide'>│</span>
		<a href="./list_by_fcateno_grid.do?fcateno=${fcateno }&now_page=${param.now_page}&word=${param.word }">갤러리형</a>

		<%-- 관리자로 로그인해야 메뉴가 출력됨 --%>
		<c:if test="${sessionScope.admin_id != null }">
			<%--
      http://localhost:9093/festival/create.do?fcateno=1
      http://localhost:9093/festival/create.do?fcateno=2
      http://localhost:9093/festival/create.do?fcateno=3
      --%>
			<span class='menu_divide'>│</span>
			<a href="./create.do?fcateno=${fcateno }">콘텐츠 등록</a>
			<span class='menu_divide'>│</span>
			<a href="./update_text.do?contentsno=${contentsno}&now_page=${param.now_page}&word=${param.word }">콘텐츠 수정</a>
			<span class='menu_divide'>│</span>
			<a href="./update_file.do?contentsno=${contentsno}&now_page=${param.now_page}">콘텐츠 파일 수정</a>
			<span class='menu_divide'>│</span>
			<a href="./map.do?fcateno=${fcateno }&contentsno=${contentsno}">Map</a>
			<span class='menu_divide'>│</span>
			<a href="./youtube.do?fcateno=${fcateno }&contentsno=${contentsno}">Youtube</a>
			<span class='menu_divide'>│</span>
			<a href="./delete.do?contentsno=${contentsno}&now_page=${param.now_page}&fcateno=${fcateno}">콘텐츠 삭제</a>
		</c:if>
	</aside>

	<div style="text-align: right; clear: both;">
		<form name='frm' id='frm' method='get' action='./list_by_fcateno.do'>
			<input type='hidden' name='fcateno' value='${param.fcateno }'>
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
			<button type='submit' class="btn btn-outline-warning btn-sm"
				style="height: 30px; margin-bottom: 5px; background-color: #B8860B;">검색</button>
			<c:if test="${param.word.length() > 0 }">
				<button type='button' class="btn btn-outline-warning btn-sm"
					style="height: 30px; margin-bottom: 5px; background-color: #B8860B;"
					onclick="location.href='./list_by_fcateno.do?fcateno=${fcateVO.fcateno}&word='">검색 취소</button>
			</c:if>
		</form>
	</div>

	<fieldset class="fieldset_basic">
		<ul>
			<li class="li_none">
				<div style="width: 100%; word-break: break-all;">
					<c:choose>
						<c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
							<%-- /static/festival/storage/ --%>
							<img src="/festival/storage/${file1saved }" style='width: 45%; float: left; margin-top: 0.5%; margin-right: 5%;'>
						</c:when>
						<c:otherwise>
							<!-- 기본 이미지 출력 -->
							<img src="/festival/images/none1.png" style='width: 35%; float: left; margin-top: 0.5%; margin-right: 5%;'>
						</c:otherwise>
					</c:choose>

					<span style="font-size: 1.2em; margin-right: 5px;">🟡 ${title}</span>
					<span style="font-size: 0.6em;">🔔 등록일: (${rdate.substring(0, 10)})</span>
					<!-- 좋아요 버튼 -->
					<button id="likeBtn" class="btn btn-outline-warning btn-sm"
						style="margin-left: 100px; padding: 5px 30px 5px 30px;">
						🩵
						<div id="totalLikeCount" style="color: black;"></div>
					</button>

					<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
					<script>
						$(document)
								.ready(
										function() {
											var contentsno = ${contentsno}; // 콘텐츠 번호는 적절하게 수정

											// 페이지 로딩 시 좋아요 상태 확인 및 총 좋아요 개수 가져오기
											getLikeCount();
											getTotalLikeCount();

											// 좋아요 버튼 클릭 시 이벤트 처리
											$("#likeBtn").click(function() {
												doLike();
											});

											// 좋아요 상태 확인 함수
											function getLikeCount() {
												$
														.ajax({
															type : "POST",
															url : "/festival_likes/get_likecount.do",
															data : {
																contentsno : contentsno
															},
															success : function(
																	data) {
																if (data === "1") {
																	// 좋아요가 눌려있는 상태
																	$(
																			"#likeBtn")
																			.text(
																					"좋아요 취소");
																} else {
																	// 좋아요가 안 눌려있는 상태
																	$(
																			"#likeBtn")
																			.text(
																					"좋아요");
																}
															},
															error : function() {
																console
																		.error("좋아요 상태 확인 에러");
															}
														});
											}

											// 좋아요 실행 함수
											function doLike() {
												$
														.ajax({
															type : "POST",
															url : "/festival_likes/do_like.do",
															data : {
																contentsno : contentsno
															},
															success : function() {
																// 좋아요 상태 갱신
																getLikeCount();
																// 총 좋아요 개수 갱신
																getTotalLikeCount();
															},
															error : function() {
																console
																		.error("좋아요 실행 에러");
															}
														});
											}

											// 총 좋아요 개수 확인 함수
											function getTotalLikeCount() {
												$
														.ajax({
															type : "POST",
															url : "/festival_likes/get_total_likecount.do",
															data : {
																contentsno : contentsno
															},
															success : function(
																	data) {
																// 총 좋아요 개수 업데이트
																$(
																		"#totalLikeCount")
																		.text(
																				""
																						+ data);
															},
															error : function() {
																console
																		.error("총 좋아요 개수 확인 에러");
															}
														});
											}
										});
					</script>
					<br> <br>
					<span style="font-size: 0.8em;">${content}</span>
				</div>
			</li>

			<c:if test="${youtube.trim().length() > 0 }">
				<li class="li_none" style="clear: both; padding-top: 5px; padding-bottom: 5px;"><br>
					<div style="text-align: center;">${youtube }</div></li>
			</c:if>

			<c:if test="${map.trim().length() > 0 }">
				<li class="li_none" style="clear: both; padding-top: 5px; padding-bottom: 10px;"><br>
					<div style='text-align: center; width: 640px; height: 360px; margin: 0px auto;'>${map }</div></li>
			</c:if>

			<li class="li_none" style="clear: both;">
				<div style='text-decoration: none;'>
					<br> <br> <br> <br>
					<span style="font-size: 0.4em;">검색어(키워드): ${word }</span>
				</div>
			</li>

			<li class="li_none">
				<div>
					<span style="font-size: 0.4em;">
						<c:if test="${file1.trim().length() > 0 }">
            첨부 파일: <a href='/download?dir=/festival/storage&filename=${file1saved}&downname=${file1}'
								style="color: #9ACD32;">${file1}</a> (${size1_label}) 
            <a onclick="if (confirm('이미지 다운로드 하시겠습니까?') == false ) { return false; }"
								href='/download?dir=/festival/storage&filename=${file1saved}&downname=${file1}'>
								<img src="/festival/images/download.png" style="margin-left: 10px; margin-bottom: 5px; width: 20px;">
							</a>
						</c:if>
					</span>
				</div>
			</li>
		</ul>
	</fieldset>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>


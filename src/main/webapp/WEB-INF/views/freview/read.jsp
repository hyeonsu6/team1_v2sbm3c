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
<title>Festival Blog Festival Review</title>
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
		<button type="submit" class="btn btn-outline-warning btn-sm" style="background-color: #8B0000;"
			onclick="location.href='../festival/read.do?contentsno=${contentsno}&word=${festivalVO.word}&now_page=${festivalVO.now_page}&fcateno=${festivalVO.fcateno}'">
			${festivalVO.title } 보러가기 ✨</button>
	</aside>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
		<%-- 회원으로 로그인해야 메뉴가 출력됨 --%>
		<c:if test="${sessionScope.mname != null }">
			<c:if test="${freviewVO.memberno eq sessionScope.memberno}">
				<span class='menu_divide'>│</span>
				<a href="./update_text.do?reviewno=${reviewno}&now_page=${param.now_page}&word=${param.word }">리뷰 수정</a>
				<span class='menu_divide'>│</span>
				<a href="./update_file.do?reviewno=${reviewno}&now_page=${param.now_page}">리뷰 파일 수정</a>
				<span class='menu_divide'>│</span>
				<a href="./map.do?contentsno=${contentsno }&reviewno=${reviewno}">Map</a>
				<span class='menu_divide'>│</span>
				<a href="./delete.do?reviewno=${reviewno}&now_page=${param.now_page}&contentsno=${contentsno}">리뷰 삭제</a>
				<span class='menu_divide'>│</span>
			</c:if>
		</c:if>
		<a href="./create.do?contentsno=${contentsno }">📝 리뷰 등록</a>
		<span class='menu_divide'>│</span>
		<a href="./list_by_contentsno.do?contentsno=${contentsno }">📰 리뷰 목록</a>
	</aside>

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

	<fieldset class="fieldset_basic">
		<ul style="margin-left: 230px;">
			<li class="li_none">
				<div style="width: 100%; word-break: break-all;">
					<c:choose>
						<c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
							<%-- /static/festival/storage/ --%>
							<img src="/freview/storage/${file1saved }" style='width: 40%; float: left; margin-top: 0.5%; margin-right: 5%;'>
						</c:when>
						<c:otherwise>
							<!-- 기본 이미지 출력 -->
							<img src="/freview/images/none1.png" style='width: 20%; float: left; margin-top: 0.5%; margin-right: 5%;'>
						</c:otherwise>
					</c:choose>

					<span style="font-size: 18px; margin-right: 5px;">${title}</span>
					<br>
					<span style="font-size: 12px; margin-right: 5px;"> 작성자: ${nickname} </span>
					<span style="font-size: 12px;"> | 🔔 등록일: ${rdate.substring(0, 10)}</span>
					<br> <br>
					<span style="font-size: 16px;"> ${content}</span>
				</div>
			</li>

			<c:if test="${map.trim().length() > 0 }">
				<li class="li_none" style="clear: both; padding-top: 5px; padding-bottom: 5px;"><br>
					<div style='text-align: center; width: 640px; height: 360px; margin: 0px auto;'>${map }</div></li>
			</c:if>

			<li class="li_none" style="clear: both;"><br> <span style="font-size: 0.4em;">검색어(키워드): ${word }</span></li>

			<li class="li_none">
				<div>
					<span style="font-size: 0.4em;">
						<c:if test="${file1.trim().length() > 0 }">
            첨부 파일: <a href='/download?dir=/freview/storage&filename=${file1saved}&downname=${file1}'
								style="color: #9ACD32;">${file1}</a> (${size1_label}) 
            <a onclick="if (confirm('이미지 다운로드 하시겠습니까?') == false ) { return false; }"
								href='/download?dir=/freview/storage&filename=${file1saved}&downname=${file1}'>
								<img src="/freview/images/download.png" style="margin-left: 10px; margin-bottom: 5px; width: 20px;">
							</a>
						</c:if>
					</span>
				</div>
			</li>
		</ul>

		<div class='content_line'></div>
		<form name='frm' id='frm' method='post' action='<%=request.getContextPath()%>/freview_reply/create.do'>
			<div style="margin: 20px 20px 5px 20px;">
				<span style="color: #228B22; font-size: 19px;">리뷰 댓글</span>
			</div>

			<div
				style='height: 150px; float: center; margin: 0.5%; padding: 0.5%; border: 1px solid #8B4513; border-radius: 10px;'>
				<c:if test="${isMember}">
					<div style='font-size: 16px; margin-left: 20px;'>${id }</div>
					<input type='text' name='reply' id='reply' placeholder='댓글을 남겨보세요' autofocus="autofocus"
						style='float: center; font-size: 14px; margin: 0.1%; margin-left: 20px; padding: 0.5%; border: 1px solid #FFFFFF; border-radius: 10px; width: 90%;'
						onfocus="this.style.outlineColor='rgba(182, 187, 196, 0)';">
					<input type='text' name='passwd' id='passwd' placeholder='패스워드' autofocus="autofocus"
						style='float: center; font-size: 13px; margin: 0.1%; margin-left: 20px; padding: 0.5%; border: 1px solid #FFFFFF; border-radius: 10px; width: 15%;'
						onfocus="this.style.outlineColor='rgba(182, 187, 196, 0)';">
					<button type='submit' class="btn btn-outline-warning btn-sm"
						style="background-color: #B8860B; float: right; margin-right: 10px; margin-top: 35px;">댓글 등록</button>
				</c:if>
				<c:if test="${not isMember }">
					<div style="margin-top: 50px; text-align: center;">
						<a href="../member/login.do" style="color: rgba(34, 139, 34, 0.6); font-size: 1.5em;">로그인하여 댓글을 남겨보세요.</a>
					</div>
				</c:if>
			</div>
		</form>

		<c:forEach var="replyVO" items="${list}">
			<div style='width: 100%; border-bottom: solid 1px #D0D4CA; margin: 20px 0px 10px 0px; clear: both;'></div>
			<c:if test="${replyVO.id eq id}">
				<div style='float: right;'>
					<a href="#" class="R_menu_link:link" style="color: #696969; font-size: 14px;">댓글 수정</a>
					<span class='menu_divide'>│</span>
					<a href="../freview_reply/delete.do?reviewno=${reviewno}" class="R_menu_link:link"
						style="color: #696969; font-size: 14px; margin-right: 15px;">댓글 삭제</a>
				</div>
			</c:if>
			<div
				style='float: center; font-size: 16px; margin: 0.1%; padding: 0.3%; border: 1px solid #FFFFFF; border-radius: 10px;'>
				${replyVO.id}
				<span
					style='float: center; color: #B6BBC4; color: #B6BBC4; font-size: 12px; margin: 0.1%; padding: 0.3%; border: 1px solid #FFFFFF; border-radius: 10px; margin-left: 10px;'>(${replyVO.rdate})</span>
			</div>
			<div
				style='float: center; font-size: 14px; margin: 0.1%; padding: 0.3%; border: 1px solid #FFFFFF; border-radius: 10px; margin-left: 10px;'>
				ㄴ ${replyVO.reply}</div>

		</c:forEach>
	</fieldset>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>


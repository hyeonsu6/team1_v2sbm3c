<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival Blog Question</title>
<link rel="shortcut icon" href="/images/star.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='title_line'>🟦 [Q&A] 질문 등록</div>

	<aside class="aside_right" style="margin-bottom: 10px;">
		<a href="javascript:location.reload();">새로고침</a>
	</aside>

	<div style="text-align: right; clear: both;">
		<form name='frm' id='frm' method='get' action='./list_all.do'>
			<input type='hidden' name='fcateno' value='${fcateVO.fcateno }'>
			<%-- 게시판의 구분 --%>

			<c:choose>
				<c:when test="${param.quest != '' }">
					<%-- 검색하는 경우 --%>
					<input type='text' name='quest' id='quest' value='${param.quest }' class='input_word'>
				</c:when>
				<c:otherwise>
					<%-- 검색하지 않는 경우 --%>
					<input type='text' name='quest' id='quest' value='' class='input_word'>
				</c:otherwise>
			</c:choose>
			<button type='submit' class="btn btn-outline-warning btn-sm"
				style="height: 30px; margin-bottom: 5px; height: 30px; margin-bottom: 5px; background-color: #B8860B;">검색</button>
			<c:if test="${param.quest.length() > 0 }">
				<button type='button' class="btn btn-outline-warning btn-sm"
					style="height: 30px; margin-bottom: 5px; height: 30px; margin-bottom: 5px; background-color: #B8860B;"
					onclick="location.href='./list_by_fcateno.do?fcateno=${fcateVO.fcateno}&word='">검색 취소</button>
			</c:if>
		</form>
	</div>

	<div class='menu_line'></div>

	<form name='frm' method='post' action='./create.do' enctype="multipart/form-data">
		<input type="hidden" name="fcateno" value="${param.fcateno }">

		<div>
			<label style="margin: 10px;">제목</label>
			<input type='text' name='title' value='' required="required" autofocus="autofocus" class="form-control"
				style='width: 100%;'>
		</div>
		<div>
			<label style="margin: 10px;">내용</label>
			<textarea name='quest' required="required" class="form-control" rows="8" style='width: 100%;'></textarea>
		</div>
		<div class="content_body_bottom">
			<button type="submit" class="btn btn-outline-warning btn-sm"
				style="height: 30px; margin-bottom: 5px; background-color: #B8860B;">질문 등록</button>
			<button type="button" onclick="location.href='./list_all'" class="btn btn-outline-warning btn-sm"
				style="height: 30px; margin-bottom: 5px; background-color: #B8860B;">질문 목록</button>
		</div>

	</form>

	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="replyno" value="${freview_replyVO.replyno }" />
<c:set var="reviewno" value="${freview_replyVO.reviewno }" />
<c:set var="id" value="${freview_replyVO.id }" />
<c:set var="reply" value="${freview_replyVO.reply }" />
<c:set var="passwd" value="${freview_replyVO.passwd }" />
<c:set var="rdate" value="${freview_replyVO.rdate }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival review reply</title>
<link rel="shortcut icon" href="/images/star.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='title_line'>댓글 삭제</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
	</aside>

	<div class='menu_line'></div>

	<fieldset class="fieldset_basic" style="display: flex; align-items: center; justify-content: center;">
		<ul>
			<li class="li_none">
				<div style='text-align: center; width: 100%; margin-top: 10px;'>
					<form name='frm' method='post' action='./delete.do'>
						<input type='hidden' name='replyno' value='${replyno}'>
						<input type='hidden' name='reviewno' value='${reviewno}'>
						<input type='hidden' name='now_page' value='${param.now_page}'>
						<br>
						<div style='text-align: center;'>
							<span style="color: #FF0000; font-weight: bold;">
								삭제를 진행 하시겠습니까? <br> 삭제하시면 복구 할 수 없습니다.
							</span>
							<br> <br>
							<button type="submit" class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">답변 삭제</button>
							<button type="button" onclick="history.back()" class="btn btn-outline-warning btn-sm"
								style="background-color: #B8860B;">취소</button>
						</div>
					</form>
				</div>
			</li>
		</ul>
	</fieldset>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
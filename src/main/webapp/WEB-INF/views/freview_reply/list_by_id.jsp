<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival Reply List</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

	<form name='frm' id='frm' method='get' action='/freview_reply/list_by_id.do'>
		<div class='title_line'>
			<span style="color: #228B22; font-size: 19px;">내가 쓴 댓글</span>
		</div>
	</form>

	<c:forEach var="replyVO" items="${list}" varStatus="status">
		<div style='width: 100%; border-bottom: solid 1px #D0D4CA; margin: 20px 0px 10px 0px; clear: both;'></div>
		<div
			style='float: center; font-size: 16px; margin: 0.1%; padding: 0.3%; border: 1px solid #FFFFFF; border-radius: 10px;'>
			${replyVO.id}
			<span
				style='float: center; color: #B6BBC4; font-size: 12px; margin: 0.1%; padding: 0.3%; border: 1px solid #FFFFFF; border-radius: 10px; margin-left: 10px;'>(${replyVO.rdate})</span>
		</div>
		<div id="reply_${replyVO.replyno}"
			style='float: center; font-size: 14px; margin: 0.1%; padding: 0.3%; border: 1px solid #FFFFFF; border-radius: 10px; margin-left: 10px;'>
			<a href="/freview/read.do?reviewno=${replyVO.reviewno }"> ㄴ ${replyVO.reply} </a>
		</div>
		<div id="${replyVO.reviewno}"
			style='color: #B6BBC4; float: center; font-size: 14px; margin: 0.1%; padding: 0.3%; border: 1px solid #FFFFFF; border-radius: 10px; margin-left: 10px;'>
			${titles[status.index]}</div>
	</c:forEach>

	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
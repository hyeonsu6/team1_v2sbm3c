<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival Blog Calendar</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />
	<div class='title_line' style="text-align: center;">🔔페스티벌 일정 등록</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
		<c:if test="${sessionScope.admin_id != null }">
			<span class='menu_divide'>│</span>
			<a href="./list_all.do">목록형</a>
			<span class='menu_divide'>│</span>
			<a href="./list_all_calendar.do">달력형</a>
		</c:if>
	</aside>

	<div class='menu_line'></div>

	<form name='frm' method='post' action='./create.do' enctype="multipart/form-data">
		<div>
			<label style="font-size: 18px; margin-top: 10px; margin-left: 26%;">페스티벌 이름</label>
			<input type='text' name='title' value='' required="required" autofocus="autofocus" class="form-control"
				style='width: 50%; margin-left: 25%; margin-bottom: 15px;'>


			<label style="margin-left: 26%;">페스티벌 요약</label>
			<textarea name='memo' required="required" class="form-control" rows="5"
				style='width: 50%; margin-left: 25%; margin-bottom: 15px;'></textarea>
		</div>

		<div style="text-align: center;">
			<label style="margin-right: 5px;">Start Date</label>
			<input type="date" id="calstart" name="calstart" required="required" style='margin-bottom: 20px; text-align: center;'>
			~
			<label style="margin-right: 5px;">End Date</label>
			<input type="date" id="calend" name="calend" required="required" style='text-align: center;'>
		</div>

		<div style="text-align: center;">
			<button type="submit" class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">페스티벌 일정 등록하기</button>
			<button type="button" onclick="history.back();" class="btn btn-outline-warning btn-sm"
				style="background-color: #B8860B;">취소(목록)</button>
		</div>
	</form>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>












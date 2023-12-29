<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contentsno" value="${festivalVO.contentsno }" />
<c:set var="word" value="${festivalVO.word }" />
<c:set var="now_page" value="${festivalVO.now_page }" />
<c:set var="fcateno" value="${festivalVO.fcateno }" />

<c:set var="calno" value="${calVO.calno }" />
<c:set var="title" value="${calVO.title }" />
<c:set var="memo" value="${calVO.memo }" />
<c:set var="calstart" value="${calVO.calstart }" />
<c:set var="calend" value="${calVO.calend }" />

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
	<div class='title_line' style="text-align: center;">🔔페스티벌 일정 > ${calVO.title } > 일정 조회</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
		<c:if test="${sessionScope.manager_id != null }">
			<span class='menu_divide'>│</span>
			<a href="./create.do">일정 등록</a>
			<span class='menu_divide'>│</span>
			<a href="./update.do?calno=${calno }">일정 수정</a>
			<span class='menu_divide'>│</span>
			<a onclick="if (confirm('🔴 ${title} 일정을 삭제하시겠습니까?') == false ) { return false; }"
				href='/calendar/delete.do?calno=${calno }'>일정삭제</a>
			<span class='menu_divide'>│</span>
			<a href="./list_all.do">목록형</a>
			<span class='menu_divide'>│</span>
			<a href="./list_all_calendar.do">달력형</a>
		</c:if>
	</aside>

	<div class='menu_line'></div>

	<fieldset class="fieldset_basic">
		<div style="width: 100%; word-break: break-all; text-align: center;">
			<span style="font-size: 24px; margin-right: 5px; color: #583E26"">🎈페스티벌 이름 : ${title}</span>
			<br> <br>
			<span style="font-size: 18px; margin-right: 5px; color: #A78B71">${memo}</span>
			<br> <br>
			<span style="font-size: 16px; margin-right: 5px; text-decoration: underline;">📅시작일 : ${calstart}</span>
			~
			<span style="font-size: 16px; margin-right: 5px; text-decoration: underline;">📅종료일 : ${calend}</span>
		</div>
		<br>
		<div style="text-align: center;">
			<button type="button" onclick="window.location.href='./list_all_calendar.do'" class="btn btn-outline-warning btn-sm"
				style="background-color: #B8860B;">확인</button>
		</div>
	</fieldset>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>



















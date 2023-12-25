<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Festival Blog Member</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='title_line'>[관리자 전용] 회원 삭제</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
		<span class='menu_divide'>│</span>
		<a href='./list.do'>목록</a>
	</aside>

	<div class='menu_line'></div>

	<div class='message'>
		<form name='frm' method='post' action='./delete.do'>
			<c:set var="mname" value="${memberVO.mname }" />
			<c:set var="id" value="${memberVO.id }" />

			'${mname }(${id })' 회원을 삭제하면 복구 할 수 없습니다.<br> 정말로 삭제하시겠습니까?<br>
			<input type='hidden' name='memberno' value='${memberno}'>
			<br>
			<button type="submit" class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">회원 삭제</button>
			<button type="button" onclick="location.href='./list.do'" class="btn btn-outline-warning btn-sm"
				style="background-color: #B8860B;">삭제 취소</button>
		</form>
	</div>

	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>


<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="aloginno" value="${aloginVO.aloginno }" />
<c:set var="adminno" value="${aloginVO.adminno }" />
<c:set var="ip" value="${aloginVO.ip }" />
<c:set var="logindate" value="${aloginVO.logindate }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival world</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />
	<div class='title_line'>회원 로그인 내역 삭제</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
	</aside>


	<div class='menu_line'></div>

	<fieldset class="fieldset_basic">
		<ul>
			<li class="li_none">

				<div style='text-align: center; width: 100%;'>

					<br>
					<form name='frm' method='post' action='./delete_alogin.do'>
						<input type='hidden' name='aloginno' value='${aloginno}'> <br> <br>
						<div style='text-align: center; margin: 10px auto;'>
							<span class="span_success" style="color: #800000; font-weight: bold;"> 삭제를 진행 하시겠습니까? </span>
							<br> <br> <br> <br>
							<button type="submit" class="btn btn-dark btn-sm">삭제하기</button>
							<button type="button" onclick="history.back()" class="btn btn-dark btn-sm">취소</button>
						</div>
					</form>
				</div>
			</li>
		</ul>
	</fieldset>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

	<div class='title_line'>회원 로그인 내역</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
	</aside>
	<div class="menu_line"></div>

	<table class="table table-hover">
		<colgroup>
			<col style='width: 15%;' />
			<col style='width: 15%;' />
			<col style='width: 30%;' />
			<col style='width: 20%;' />
			<col style='width: 20%;' />
		</colgroup>
		<thead>
			<tr>
				<th class="th_bs">로그인 번호</th>
				<th class="th_bs">회원 번호</th>
				<th class="th_bs">IP</th>
				<th class="th_bs">로그인 일자</th>
				<th class="th_bs">삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="mloginVO" items="${list }" varStatus="info">
				<c:set var="mloginno" value="${mloginVO.mloginno }" />


				<tr>
					<td class="td_bs">${mloginno }</td>
					<td class="td_bs">${mloginVO.memberno }</td>
					<td class="td_bs">${mloginVO.ip }</td>
					<td class="td_bs">${mloginVO.logindate.substring(0,16) }</td>
					<td class="td_bs">
						<a href="./delete.do?mloginno=${mloginno}">
							<IMG src='/login/images/delete.png' title='삭제' class="icon">
						</a>
					</td>
			</c:forEach>
		</tbody>
	</table>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
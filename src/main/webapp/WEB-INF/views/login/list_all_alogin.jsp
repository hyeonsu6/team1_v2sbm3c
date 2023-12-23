<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival Blog Admin Login List</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='title_line'>관리자 로그인 내역</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
	</aside>
	<div class="menu_line"></div>

	<table>
		<colgroup>
			<col style='width: 15%;' />
			<col style='width: 15%;' />
			<col style='width: 30%;' />
			<col style='width: 20%;' />
			<col style='width: 20%;' />
		</colgroup>
		
		<thead>
			<tr style="text-align: center;">
				<th>로그인 번호</th>
				<th>관리자 번호</th>
				<th>IP 주소</th>
				<th>로그인 일자</th>
				<th>삭제</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="aloginVO" items="${list }" varStatus="info">
				<c:set var="aloginno" value="${aloginVO.aloginno }" />
				<c:set var="adminno" value="${aloginVO.adminno }" />
				<c:set var="ip" value="${aloginVO.ip }" />
				<c:set var="logindate" value="${aloginVO.logindate }" />
				
				<tr style="text-align: center;">
					<td>${aloginno }</td>
					
					<td>${adminno }</td>
					
					<td>${ip }</td>
					
					<td>${logindate.substring(0,16) }</td>
					
					<td>
						<a href="./delete_alogin.do?aloginno=${aloginno}">
							<img src='/login/images/delete.png' title='삭제' class="icon">
						</a>
					</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
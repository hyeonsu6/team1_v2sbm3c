<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Festival Blog Member List</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='title_line'>[관리자 전용] 회원 목록</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
	</aside>

	<div class='menu_line'></div>

	<table style='width: 100%;'>
		<colgroup>
			<col style='width: 10%;' />
			<col style='width: 10%;' />
			<col style='width: 10%;' />
			<col style='width: 15%;' />
			<col style='width: 30%;' />
			<col style='width: 15%;' />
			<col style='width: 10%;' />
		</colgroup>

		<thead>
			<tr style="text-align: center;">
				<th></th>
				<th>ID</th>
				<th>성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>등록일</th>
				<th></th>
			</tr>
		</thead>

		<c:forEach var="memberVO" items="${list }">
			<c:set var="memberno" value="${memberVO.memberno}" />
			<c:set var="grade" value="${memberVO.grade}" />
			<c:set var="id" value="${memberVO.id}" />
			<c:set var="mname" value="${memberVO.mname}" />
			<c:set var="tel" value="${memberVO.tel}" />
			<c:set var="address1" value="${memberVO.address1}" />
			<c:set var="mdate" value="${memberVO.mdate}" />

			<tr style="text-align: center;">
				<td>
					<c:choose>
						<c:when test="${grade >= 1 and grade <= 10}">
							<img src='/member/images/admin.png' title="관리자" class="icon_New">
						</c:when>
						<c:when test="${grade >= 11 and grade <= 20}">
							<img src='/member/images/user.png' title="회원" class="icon_New">
						</c:when>
						<c:when test="${grade >= 40 and grade <= 49}">
							<img src='/member/images/pause.png' title="정지 회원" class="icon_New">
						</c:when>
						<c:when test="${grade == 99}">
							<img src='/member/images/x.png' title="탈퇴 회원" class="icon_New">
						</c:when>
					</c:choose>
				</td>

				<td>
					<a href="./read.do?memberno=${memberno}">${id}</a>
				</td>

				<td>
					<a href="./read.do?memberno=${memberno}">${mname}</a>
				</td>

				<td>${tel}</td>

				<td style="font-size: 13px;">
					<c:choose>
						<c:when test="${address1.length() > 15 }">${address1.substring(0, 15) }...</c:when>
						<c:otherwise>${address1}</c:otherwise>
					</c:choose>
				</td>

				<td>${mdate.substring(0, 10)}</td>
				
				<%-- 년월일 --%>
				<td>
					<a href="./lock.do?memberno=${memberno}">
						<img src='/member/images/lock.png' title='정지' class="icon">
					</a>
					<a href="./read.do?memberno=${memberno}">
						<img src='/member/images/update.png' title='수정' class="icon">
					</a>
					<a href="./delete.do?memberno=${memberno}">
						<img src='/member/images/delete.png' title='삭제' class="icon">
					</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div class='bottom_menu'>
		<button type='button' onclick="location.href='./create.do'" class="btn btn-primary btn-sm">등록</button>
		<button type='button' onclick="location.reload();" class="btn btn-primary btn-sm">새로 고침</button>
	</div>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>


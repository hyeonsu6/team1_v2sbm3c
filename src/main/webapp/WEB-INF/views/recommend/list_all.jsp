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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<c:import url="/menu/top.do" />
	<div class='title_line'>[추천] 회원 관심 페스티벌</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
	</aside>
	
	<div class="menu_line"></div>
	
	<table class="table table-hover">
		<colgroup>
			<col style='width: 25%;' />
			<col style='width: 25%;' />
			<col style='width: 25%;' />
			<col style='width: 25%' />
		</colgroup>
		<thead>
			<tr>
				<th class="th_bs">회원 이름</th>
				<th class="th_bs">추천 코드</th>
				<th class="th_bs">등록일</th>
				<th class="th_bs">삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="recommendVO" items="${list}" varStatus="info">
				<c:set var="memberno" value="${recommendVO.memberno }" />
				<tr>
					<td class="td_bs">${recommendVO.name}</td>

					<td class="td_bs">
						<c:choose>
							<c:when test="${recommendVO.fcateno eq 0}">음식(국내/해외) 페스티벌</c:when>
							<c:when test="${recommendVO.fcateno eq 1}">계절(겨울) 페스티벌</c:when>
							<c:when test="${recommendVO.fcateno eq 2}">문화관광 페스티벌</c:when>
							<c:when test="${recommendVO.fcateno eq 3}">예술(춤/무용/전통공연) 페스티벌</c:when>
							<c:when test="${recommendVO.fcateno eq 4}">체험(과학/스포츠) 페스티벌</c:when>
							<c:when test="${recommendVO.fcateno eq 5}">뮤직(재즈, K-POP) 페스티벌</c:when>
							<c:when test="${recommendVO.fcateno eq 6}">인생샷(꽃/빛) 페스티벌</c:when>
							<c:otherwise>관심 페스티벌을 알 수 없습니다.</c:otherwise>
						</c:choose>
					</td>
					<td class="td_bs">${recommendVO.rdate.substring(0, 10)}</td>
					<td class="td_bs">
						<a href="./delete.do?memberno=${memberno }" title="삭제">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>


	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
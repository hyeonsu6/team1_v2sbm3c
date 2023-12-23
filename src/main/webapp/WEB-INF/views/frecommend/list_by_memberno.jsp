<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival Blog Recommend</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
	<c:import url="/menu/top.do" />
	<div class='title_line'>추천 페스티벌</div>

	<aside class="aside_right">
		<button type="submit" class="btn btn-outline-warning btn-sm" onclick="javascript:location.reload();"
			style="background-color: #B8860B;">🔃 새로고침</button>
	</aside>
	<br>

	<div class="menu_line"></div>

	<table>
		<colgroup>
			<col style='width: 20%;' />
			<col style='width: 10%;' />
			<col style='width: 45%;' />
			<col style='width: 15%' />
			<col style='width: 10%' />
		</colgroup>

		<thead>
			<tr style="text-align: center;">
				<th>추천 번호</th>
				<th>회원 번호</th>
				<th>추천 페스티벌</th>
				<th>등록일</th>
				<th></th>
			</tr>
		</thead>
		<c:forEach var="recommendVO" items="${list }" varStatus="info">
			<c:set var="recommendno" value="${recommendVO.recommendno }" />

			<tr style="text-align: center;">
				<td>${recommendno }</td>

				<td>${recommendVO.memberno}</td>
				<td>
					<c:choose>
						<c:when test="${recommendVO.fcateno eq 1}">
							<a href="../festival/list_by_fcateno.do?fcateno=2" style="display: block;">음식(국내/해외) 페스티벌</a>
						</c:when>
						<c:when test="${recommendVO.fcateno eq 2}">
							<a href="../festival/list_by_fcateno.do?fcateno=3" style="display: block;">계절(겨울) 페스티벌</a>
						</c:when>
						<c:when test="${recommendVO.fcateno eq 3}">
							<a href="../festival/list_by_fcateno.do?fcateno=4" style="display: block;">문화관광(지역) 페스티벌</a>
						</c:when>
						<c:when test="${recommendVO.fcateno eq 4}">
							<a href="../festival/list_by_fcateno.do?fcateno=5" style="display: block;">예술(춤/무용/전통공연) 페스티벌</a>
						</c:when>
						<c:when test="${recommendVO.fcateno eq 5}">
							<a href="../festival/list_by_fcateno.do?fcateno=6" style="display: block;">체험(과학/스포츠) 페스티벌</a>
						</c:when>
						<c:when test="${recommendVO.fcateno eq 6}">
							<a href="../festival/list_by_fcateno.do?fcateno=7" style="display: block;">인생샷(꽃/빛) 페스티벌</a>
						</c:when>
						<c:when test="${recommendVO.fcateno eq 7}">
							<a href="../festival/list_by_fcateno.do?fcateno=8" style="display: block;">뮤직(재즈, K-POP) 페스티벌</a>
						</c:when>
						<c:otherwise>
							<a href="./read.do?recommendno=${recommendno}" style="display: block;">${recommendVO.fcateno}</a>
						</c:otherwise>
					</c:choose>
				</td>

				<td>${recommendVO.rdate.substring(0, 16)}</td>
				<td></td>

				<%-- <td class="td_bs">
					<a href="./delete.do?recommendno=${recommendno}" title="삭제">
						<img src="/frecommend/images/delete.png" class="icon">
					</a>
				</td> --%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
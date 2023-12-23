<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival Blog CateGory</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='title_line'>[관리자 모드] 페스티벌 카테고리</div> 

	<form name='frm' method='post' action='/fcate/create.do'>
		<br>
		<div style="text-align: center; margin-bottom: 20px;">
			<label style="margin-right: 5px;">페스티벌 카테고리 이름</label>
			<input type="text" name="name" value="" required="required" autofocus="autofocus" class="" style="width: 50%">
			<button type="submit" class="btn btn-outline-warning btn-sm"
				style="height: 30px; margin-bottom: 5px; background-color: #B8860B;">등록</button>
			<button type="button" onclick="location.href='./list_all.do'" class="btn btn-outline-warning btn-sm"
				style="height: 30px; margin-bottom: 5px; background-color: #B8860B;">목록</button>
		</div>
	</form>
	<br>
	<table>
		<colgroup>
			<col style='width: 10%;' />
			<col style='width: 40%;' />
			<col style='width: 15%;' />
			<col style='width: 15%;' />
			<col style='width: 20%;' />
		</colgroup>

		<thead>
			<tr style="text-align: center;">
				<th>순서</th>
				<th>카테고리 이름</th>
				<th>등록된 콘텐츠 수</th>
				<th>등록일</th>
				<th></th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="fcateVO" items="${list }" varStatus="info">
				<c:set var="fcateno" value="${fcateVO.fcateno }" />
				<c:set var="seqno" value="${fcateVO.seqno }" />

				<tr style="text-align: center;">
					<td>${seqno }</td>

					<td>
						<a href="../festival/list_by_fcateno.do?fcateno=${fcateno }" style="display: block;">${fcateVO.name }</a>
					</td>

					<td>${fcateVO.cnt }</td>

					<td>${fcateVO.rdate.substring(0, 10) }</td>

					<td>
						<a href="../festival/create.do?fcateno=${fcateno }" title="콘텐츠 등록">
							<img src="/fcate/images/create.png" class="icon">
						</a>
						<c:choose>
							<c:when test="${fcateVO.visible == 'Y'}">
								<a href="./update_visible_n.do?fcateno=${fcateno }" title="카테고리 공개 설정">
									<img src="/fcate/images/show.png" class="icon">
								</a>
							</c:when>
							<c:otherwise>
								<a href="./update_visible_y.do?fcateno=${fcateno }" title="카테고리 비공개 설정">
									<img src="/fcate/images/hide.png" class="icon">
								</a>
							</c:otherwise>
						</c:choose>
						<a href="./update_seqno_forward.do?fcateno=${fcateno }" title="우선 순위 높임">
							<img src="/fcate/images/increase.png" class="icon">
						</a>
						<a href="./update_seqno_backward.do?fcateno=${fcateno }" title="우선 순위 낮춤">
							<img src="/fcate/images/decrease.png" class="icon">
						</a>
						<a href="./update.do?fcateno=${fcateno }" title="수정">
							<img src="/fcate/images/update.png" class="icon">
						</a>
						<a href="./delete.do?fcateno=${fcateno }" title="삭제">
							<img src="/fcate/images/delete.png" class="icon">
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>

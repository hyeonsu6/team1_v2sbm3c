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
	<div style="padding: 20px; border: 2px solid #2F4F4F; border-radius: 10px;">
		<c:forEach var="recommendVO" items="${list }" varStatus="info">
			<tr>
				<td style="text-align: center;">
					<span style="font-size: 18px;">👇바로 보러가기 Click! Click!👇</span>
					<c:choose>
						<c:when test="${recommendVO.fcateno eq 2}">
							<a href="../festival/list_by_fcateno.do?fcateno=2"
								style="display: block; color: #008000; font-size: 20px; margin-top: 10px;"> 음식(국내/해외) 페스티벌</a>
						</c:when>
						<c:when test="${recommendVO.fcateno eq 3}">
							<a href="../festival/list_by_fcateno.do?fcateno=3"
								style="display: block; color: #008000; font-size: 20px; margin-top: 10px;">계절(겨울) 페스티벌</a>
						</c:when>
						<c:when test="${recommendVO.fcateno eq 4}">
							<a href="../festival/list_by_fcateno.do?fcateno=4"
								style="display: block; color: #008000; font-size: 20px; margin-top: 10px;">문화관광(지역) 페스티벌</a>
						</c:when>
						<c:when test="${recommendVO.fcateno eq 5}">
							<a href="../festival/list_by_fcateno.do?fcateno=5"
								style="display: block; color: #008000; font-size: 20px; margin-top: 10px;">예술(춤/무용/전통공연) 페스티벌</a>
						</c:when>
						<c:when test="${recommendVO.fcateno eq 6}">
							<a href="../festival/list_by_fcateno.do?fcateno=6"
								style="display: block; color: #008000; font-size: 20px; margin-top: 10px;">체험(과학/스포츠) 페스티벌</a>
						</c:when>
						<c:when test="${recommendVO.fcateno eq 8}">
							<a href="../festival/list_by_fcateno.do?fcateno=8"
								style="display: block; color: #008000; font-size: 20px; margin-top: 10px;">뮤직(재즈, K-POP) 페스티벌</a>
						</c:when>
						<c:when test="${recommendVO.fcateno eq 7}">
							<a href="../festival/list_by_fcateno.do?fcateno=7"
								style="display: block; color: #008000; font-size: 20px; margin-top: 10px;">인생샷(꽃/빛) 페스티벌</a>
						</c:when>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</div>
</body>
</html>
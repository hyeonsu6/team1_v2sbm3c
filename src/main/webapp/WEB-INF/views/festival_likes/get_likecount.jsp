<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Festival Blog Festival Contents</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

<div>
    <%-- 로그인 여부 확인 --%>
    <c:if test="${isMember}">
        <%-- 로그인한 경우에만 처리되는 부분 --%>
        <h2>현재 좋아요 상태: ${isLiked ? '좋아요가 눌렸습니다.' : '좋아요가 눌리지 않았습니다.'}</h2>
    </c:if>

    <c:if test="${not isMember}">
        <%-- 로그인하지 않은 경우에만 처리되는 부분 --%>
        <h2>좋아요 상태 확인 실패</h2>
        <p>로그인이 필요합니다.</p>
    </c:if>
</div>
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>
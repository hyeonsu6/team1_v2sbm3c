<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>Festival Blog Member Lockdown</title>
<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->
</head>

<body>
<c:import url="/menu/top.do" />

  <div class='title_line'>[관리자 전용] 회원 정지</div>
  <div class='menu_line'></div>
 
  <div class='message'>
    <form name='frm' method='post' action='./lock.do'>
      '${mname }(${id })' 회원을 정지하겠습니까?<br><br>       
      <input type='hidden' name='memberno' value='${memberno}'>      
      <button type="submit" class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">회원 정지</button>
      <button type="button" onclick="location.href='./list.do'" class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">정지 취소</button>
    </form>
  </div>
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>Fesrival Member Unlockdown</title>
<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->

  
</head>
<body>
<c:import url="/menu/top.do" />

  <DIV class='title_line'>회원 정지 해제</DIV>
  <div class='menu_line'></div>
 
  <div class='message'>
    <form name='frm' method='post' action='./lock.do'>
      '${mname }(${id })' 회원을 정지를 해제하겠습니까?<br><br>       
      <input type='hidden' name='memberno' value='${memberno}'>     
          
      <button type="submit" class="btn btn-primary btn-sm">정지 해제</button>
      <button type="button" onclick="location.href='./list.do'" class="btn btn-primary btn-sm">취소(목록)</button>
   
    </form>
  </div>
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>
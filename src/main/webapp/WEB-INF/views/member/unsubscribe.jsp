<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>Fesrival Unsubscribe</title>
<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  
</head>
<body>
<c:import url="/menu/top.do" />

  <DIV class='title_line'>회원 탈퇴</DIV>

  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>회원 가입</A>
    <span class='menu_divide' >│</span> 
    <A href='./list.do'>목록</A>
  </ASIDE> 
 
  <div class='menu_line'></div>
 
  <div class='message'>
    <form name='frm' method='post' action='./unsubscribe.do'>
      '${mname }(${id })' 회원을 탈퇴하면 복구 할 수 없습니다.<br><br>
      정말로 탈퇴하시겠습니까?<br><br>         
      <input type='hidden' name='memberno' value='${memberVO.memberno}'>     
          
      <button type="submit" class="btn btn-primary btn-sm">탈퇴</button>
      <button type="button" onclick="location.href='../index.do'" class="btn btn-primary btn-sm">취소(목록)</button>
   
    </form>
  </div>
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>
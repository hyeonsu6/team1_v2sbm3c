<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>Festival Blog SMS</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
 <script type="text/javascript">
  $(function(){ 
     
  });
</script>
 
</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->
<c:import url="/menu/top.do" />

  <form action="./confirm.do" method="post">
    <p>문자 메시지 전송후 처리되는 파일입니다.</p>
    예)<br>
    전송된 인증된 번호를 입력해주세요<br>
    <input type='text' name='auth_no' size='15' autofocus="autofocus">
    <button type='submit' class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">인증 확인</button> 
  </form>
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html>
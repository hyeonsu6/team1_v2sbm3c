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
  
</head>
<body>
<c:import url="/menu/top.do" />

  <div style='margin: 50px;'>
    <form name="smsForm" action="./proc.do" method="post">
      <input type="hidden" name="action" value="go"> 
      <input type="hidden" name="smsType" value="S"> <!-- 발송 타입 -->
      <input type="hidden" name="subject" value=""> <!-- 장문(LMS)인 경우(한글30자이내) -->
      
      <!-- 정상적으로 문자가 전송되고 나서 이동할 주소 -->
      <input type="hidden" name="returnurl" maxlength="64" value="./proc_next.do" size="80">
   
      <br>
      전화 번호 입력: <input type="text" name="rphone" value="010-" autofocus="autofocus"> 예) 010-0112-1112 , '-' 포함해서 입력. <br>
       <!-- 보내는 번호, SMS 서비스를 가입한 기업의 관리자 전화번호 -->
      <input type="hidden" name="sphone1" value="010"> <!-- 전화번호 첫째자리 -->
      <input type="hidden" name="sphone2" value="2722"> <!-- 전화번호 둘째자리 -->
      <input type="hidden" name="sphone3" value="9751"> <!-- 전화번호 셋째자리 -->
      <br><br>
      <input type="submit" class="btn btn-outline-warning btn-sm"
             style="background-color: #B8860B; float: right;" value="전송">이통사 정책에 따라 발신번호와 수신번호가 같은 경우
      발송되지 않습니다.
    </form>
  </div>
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>
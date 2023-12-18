<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="questno" value="${questionVO.questno }" />
<c:set var="fcateno" value="${questionVO.fcateno }" />
<c:set var="memberno" value="${questionVO.memberno }" />
<c:set var="title" value="${questionVO.title }" />
<c:set var="quest" value="${questionVO.quest }" />
<c:set var="rdate" value="${questionVO.rdate }" />

<c:set var="ansno" value="${answerVO.ansno }" />
<c:set var="ans" value="${answerVO.ans }" />
<c:set var="answer_rdate" value="${answerVO.rdate }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>Festival Question</title>
<<<<<<< HEAD
<link rel="shortcut icon" href="/images/star.png" /> <%-- /static 기준 --%>
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->
  
=======
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css"> 
>>>>>>> 3bd32260ef3d3a596ddb469553116791264949bd
</head>
<body>
<c:import url="/menu/top.do" />

  <DIV class='title_line'>
    <A href="./list_by_tcateno.do?fcateno=${fcateVO.fcateno }" class='title_link'>${tcateVO.name }</A>
  </DIV>

  <aside class="aside_right">
    <a href="./create.do?fcateno=${fcateVO.fcateno }">등록</a>
    <span class='menu_divide'>│</span>
    <a href="./update_quest.do?questno=${questno}&now_page=${param.now_page}">수정</a>
    <span class='menu_divide'>│</span>
    <a href="./delete.do?questno=${questno}&now_page=${param.now_page}&fcateno=${fcateno}">삭제</a>
    
    <c:if test="${isAdmin}">
      <span class='menu_divide'>│</span>
      <a href="../answer/create.do?questno=${questno}&now_page=${param.now_page}">답변 등록</a>
      <span class='menu_divide'>│</span>
      <a href="../answer/update.do?questno=${questno}&now_page=${param.now_page}">답변 수정</a>
      <span class='menu_divide'>│</span>
      <a href="../answer/delete.do?questno=${questno}&now_page=${param.now_page}">답변 삭제</a>
    </c:if>
    
    <span class='menu_divide'>│</span>
    <a href="javascript:location.reload();">새로고침</a>
  </aside>

  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style="width: 100%; word-break: break-all;">
          <span style="font-size: 1.5em; font-weight: bold;">${title}</span> <span style="font-size: 1em;"></span>
          <br> ${quest}
          <br><br><br> ${rdate}<br><br><br><br><br><br>
        </DIV>
        <DIV style="width: 100%; word-break: break-all;">
          <span style="font-size: 1.5em;">관리자 답변</span> <span style="font-size: 1em;"></span>
          <br>${ans}
          <br><br><br>${answer_rdate}
        </DIV>
      </li>
    </ul>
  </fieldset>
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>
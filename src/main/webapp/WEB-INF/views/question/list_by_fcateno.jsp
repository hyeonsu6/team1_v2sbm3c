<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>Festival Question</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
  
</head>
<body>
<c:import url="/menu/top.do" />

  <div class='title_line'>
    ${fcateVO.name } 질문 목록
  </div>
  
  <aside class="aside_right">
    <a href="./create.do?fcateno=${fcateVO.fcateno }">등록</a>
    <span class='menu_divide' >│</span>
    <a href="javascript:location.reload();">새로고침</a>
  </aside>
  
  <div style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_fcateno.do'>
      <input type='hidden' name='fcateno' value='${param.fcateno }'>  <%-- 게시판의 구분 --%>
    </form>
  </div>
    
  <div class="menu_line"></div> 
  
  <table class="table table-hover">
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 80%;"></col>
      <col style="width: 10%;"></col>
    </colgroup>
    <thead>
      <tr>
        <th style='text-align: center;'>제목</th>
        <th style='text-align: center;'>내용</th>
        <th style='text-align: center;'>기타</th>
      </tr>
    </thead>
    <tbody>
        <c:forEach var="questionVO" items="${list }" varStatus="info">
          <c:set var="questno" value="${questionVO.questno }" />
          <c:set var="title" value="${questionVO.title }" />
    
          <tr onclick="location.href='./read.do?questno=${questno}&now_page=${param.now_page == null ? 1 : param.now_page }&fcateno=${param.fcateno }'" style="cursor: pointer;">
            <td class="td_bs">
              <span style="font-weight: bold;">${questionVO.title }</span><br>
            </td>
            <td class="td_bs">
              <c:choose>
                <c:when test="${questionVO.quest.length() > 160 }">
                  ${questionVO.quest.substring(0, 160) }...
                </c:when>
                <c:otherwise>
                  ${questionVO.quest }
                </c:otherwise>
              </c:choose>
              (${questionVO.rdate.substring(0, 16) })
            </td>
            <td class="td_bs">
              <a href="/question/update_quest.do?questno=${questno }&tcateno=${tcateno}&now_page=${param.now_page}" title="수정"><img src="/question/images/update.png" class="icon"></a>
              <a href="/question/delete.do?questno=${questno }&tcateno=${tcateno}&now_page=${param.now_page}" title="삭제"><img src="/question/images/delete.png" class="icon"></a>
            </td>
          </tr>
        </c:forEach>
    </tbody>
      
  </table>
  
  <!-- 페이지 목록 출력 부분 시작 -->
  <DIV class='bottom_menu'>${paging }</DIV> <%-- 페이지 리스트 --%>
  <!-- 페이지 목록 출력 부분 종료 -->
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>
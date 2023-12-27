<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>Festival Blog Mail</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- /static 기준 -->
  
</head>
<body>
<c:import url="/menu/top.do" />

<div style='width: 80%; margin: 0px auto;'>
  <div class='title_line'>mail 쓰기</div>
  <form name='mailForm' method='post' action="./send_file.do" enctype="multipart/form-data">
    <table class='table_basic'>
      <colgroup>
        <col style='width: 20%;' />   <!-- 출력 순서 -->
        <col style='width: 80%;' /> <!-- 제목 -->
      </colgroup>
      <tr>
        <th class='th_basic'>받는 사람</th>
        <td class='td_left'><input type="text" name="receiver" value='받는 사람' class='input_basic' style='width: 50%;'></td>
      </tr>
      <tr>
        <th class='th_basic'>보내는 사람</th>
        <td class='td_left'><input type="text" name="from" value='보내는 사람' class='input_basic' style='width: 90%;'></td>
    </tr>
    <tr>
      <th class='th_basic'>제 목</th>
      <td class='td_left'><input type="text" name="title" value="메일 제목" class='input_basic' style='width: 90%;'></td>
    </tr>
    <tr>
      <th class='th_basic'>첨부 파일</th>
      <td class='td_left'><input type="file" name="file1MF" class='input_basic' style='width: 90%;' multiple="multiple"></td>
    </tr>
    <tr>
      <td class='td_left' colspan="2">
        <textarea name="content" rows="15"  style='width: 100%; border: #AAAAAA 1px solid;'></textarea>
      </td>
    </tr>
  </table>
   
  <div  class="bottom_menu">
    <input type="submit" value="보내기">
    <input type="button" value="취소" onclick="history.back()">
  </div>
  </form>
</div>
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>
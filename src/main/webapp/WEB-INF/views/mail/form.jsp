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
  <div class='title_line'>Mail 쓰기</div>
  <form name='mailForm' method='post' action="./send.do">
    <table style="border-collapse: separate ;
                  margin: 2px auto;
                  width: 100%;">
      <colgroup>
        <col style='width: 20%;' />   <!-- 출력 순서 -->
        <col style='width: 80%;' /> <!-- 제목 -->
      </colgroup>
      <tr>
        <th style="
            font-size: 14px;
            border: 5px solid #DDE6ED;
            border-radius: 15px;
            color: rgba(96, 114, 116, 0.6);
        ">받는 사람</th>
        <td class='td_left'><input type="text" name="receiver" value='' class='input_basic' style='width: 50%;'></td>
      </tr>
      <tr>
        <th style="
            font-size: 14px;
            border: 5px solid #DDE6ED;
            border-radius: 15px;
            color: rgba(96, 114, 116, 0.6);
            
        ">보내는 사람</th>
        <td class='td_left'><input type="text" name="from" value='' class='input_basic' style='width: 90%;'></td>
      </tr>
      <tr>
        <th style="
            font-size: 14px;
            border: 5px solid #DDE6ED;
            border-radius: 15px;
            color: rgba(96, 114, 116, 0.6);
            
        ">제 목</th>
        <td class='td_left'><input type="text" name="" value="" class='input_basic' style='width: 90%;'></td>
      </tr>
      <tr>
        <td class='td_left' colspan="2">
          <textarea name="content" rows="15"  style='width: 100%; border: #AAAAAA 1px solid;'></textarea>
        </td>
      </tr>
    </table>
   
    <div  class="bottom_menu">
      <input type="submit" class="btn btn-outline-warning btn-sm"
        style="background-color: #B8860B; float: right; margin-right: 10px;" value="보내기">
      <input type="button" type="submit" class="btn btn-outline-warning btn-sm"
        style="background-color: #B8860B; float: right; margin-right: 10px;" value="취소" onclick="history.back()">
    </div>
  </form>
  </div>
  <br>
 
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>
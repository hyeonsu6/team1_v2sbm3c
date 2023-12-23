<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival Blog Answer</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
<<<<<<< HEAD
<c:import url="/menu/top.do" />

  <div class='title_line'>답변 등록</div>
  
  <aside class="aside_right">
    <a href="../question/create.do?questno=${questionVO.questno }">등록</a>
    <span class='menu_divide' >│</span>
    <a href="javascript:location.reload();">새로고침</a>
  </aside>
  
  
  <div class='menu_line'></div>
  
  <form name='frm' method='post' action='./create.do' enctype="multipart/form-data">
    <input type="hidden" name="questno" value="${param.questno }">
    
    <div>
       <label>내용</label>
       <textarea name='ans' required="required" class="form-control" rows="12" style='width: 100%;'></textarea>
    </div>    
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-secondary btn-sm">등록</button>
      <button type="button" onclick="location.href='../question/list_all'" class="btn btn-secondary btn-sm">목록</button>
    </div>
  
  </form>
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
=======
	<c:import url="/menu/top.do" />

	<div class='title_line'>🟦 [Q&A] 답변 등록</div>

	<aside class="aside_right">
		<a href="javascript:location.reload();">새로고침</a>
	</aside>

	<div class='menu_line'></div>

	<form name='frm' method='post' action='./create.do' enctype="multipart/form-data">
		<input type="hidden" name="questno" value="${param.questno }">

		<div>
			<label style="margin: 15px auto; font-size: 18px;">답변 내용</label>
			<textarea name='ans' required="required" class="form-control" rows="12" style='width: 100%;'></textarea>
		</div>

		<div class="content_body_bottom">
			<button type="submit" class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">답변 등록</button>
			<button type="button" onclick="location.href='../question/list_all.do'" class="btn btn-outline-warning btn-sm"
				style="background-color: #B8860B;">질문 목록</button>
		</div>

	</form>

	<jsp:include page="../menu/bottom.jsp" flush='false' />
>>>>>>> d0bc0842246f13031edb214270c8b795cf29c64a
</body>
</html>
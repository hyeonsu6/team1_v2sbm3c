<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" /> 
<title>Festival Blog Member</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">

  window.onload = function() {
    document.querySelector('#id').addEventListener('keypress', (event) => {
    // document.getElementById('passwd').addEventListener('keypress', (event) => {
      if(event.key === 'Enter') {
        document.getElementById('mname').focus();
      }
    });
	    
    document.querySelector('#mname').addEventListener('keypress', (event) => {
    // document.getElementById('passwd').addEventListener('keypress', (event) => {
      if(event.key === 'Enter') {
        document.getElementById('tel').focus();
      }
    });
    
    document.querySelector('#tel').addEventListener('keypress', (event) => {
    // document.getElementById('passwd').addEventListener('keypress', (event) => {
      if(event.key === 'Enter') {
        document.getElementById('email').focus();
      }
    }); 

    document.querySelector('#email').addEventListener('keypress', (event) => {
    // document.getElementById('passwd').addEventListener('keypress', (event) => {
      if(event.key === 'Enter') {
        document.getElementById('btn_send').focus();
      }
    }); 
  }

  function send() {
    let id = document.getElementById('id');
    let id_msg = document.getElementById('id_msg');
  
    if (id.value.length == 0) {
    	id_msg.innerHTML= 'ID 입력은 필수입니다.';
    	id_msg.classList.add('span_warning');    // class 적용
    	id.focus();
  
      return false;  // 회원 가입 진행 중지
    }
      
    let mname = document.getElementById('mname');
    let mname_msg = document.getElementById('mname_msg');
  
    if (mname.value.length == 0) {
      mname_msg.innerHTML= '이름 입력은 필수입니다.';
      mname_msg.classList.add('span_warning');    // class 적용
      mname.focus();
  
      return false;  // 회원 가입 진행 중지
    }

    let tel = document.getElementById('tel');
    let tel_msg = document.getElementById('tel_msg');
  
    if (tel.value.length == 0) {
      tel_msg.innerHTML= '전화번호 입력은 필수입니다.';
      tel_msg.classList.add('span_warning');    // class 적용
      tel.focus();
  
      return false;  // 회원 가입 진행 중지
    }

    let email = document.getElementById('email');
    let email_msg = document.getElementById('email_msg');
  
    if (email.value.length == 0) {
      email_msg.innerHTML= '메일주소 입력은 필수입니다.';
      email_msg.classList.add('span_warning');    // class 적용
      email.focus();
  
      return false;  // 회원 가입 진행 중지
    }
  
    document.getElementById('frm').submit(); // required="required" 작동 안됨.
  }
    

</script>

</head>
<body>
<c:import url="/menu/top.do" />

 <div class='title_line'>비밀번호 찾기</div>
  
 <aside class="aside_right">
   <a href="javascript:location.reload();">새로고침</a>
   <span class='menu_divide'>│</span>
   <a href='./create.do'>회원 가입</a>
 </aside>
 <div class='menu_line'></div>

 <div style="width: 60%; margin: 0px auto">
   <form name='frm' id='frm' method='POST' action='./findPasswd.do' class="">
   
    <div class="form-group" style="margin-bottom: 15px;">
      <label style="margin-right: 15px;">
        아이디:
        <input type='text' class="form-control form-control-sm" name='id' id='id' value='' required="required"
          placeholder="아이디">
      </label>
      <span id='mname_msg'></span>
    </div>
   
    <div class="form-group" style="margin-bottom: 15px;">
      <label style="margin-right: 15px;">
        성명:
        <input type='text' class="form-control form-control-sm" name='mname' id='mname' value='' required="required"
          placeholder="성명">
      </label>
      <span id='mname_msg'></span>
    </div>
    
    <div class="form-group" style="margin-bottom: 15px;">
      <label style="margin-right: 15px;">
        전화 번호:
        <input type='text' class="form-control form-control-sm" name='tel' id='tel' value='' required="required"
          placeholder="전화번호">
      </label>
      예) 010-0000-0000
    </div>
    
    <div class="form-group" style="margin-bottom: 15px;">
      <label style="margin-right: 15px;">
        메일 주소:
        <input type='text' class="form-control form-control-sm" name='email' id='email' value='' required="required"
          placeholder="메일주소">
      </label>
    </div>
    
    <div class="bottom_menu">
      <button type="button" id='btn_send' onclick="send()" class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">비밀번호 찾기</button>
      <button type="button" onclick="history.back()" class="btn btn-outline-warning btn-sm" style="background-color: #B8860B;">취소</button>
    </div>
   </form>
 </div>
 
<jsp:include page="../menu/bottom.jsp" flush='false' /> 
</body>
</html>
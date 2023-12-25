<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Festival Blog Member Login Message</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">
  window.onload = ()=> {
    document.getElementById('btn_retry').addEventListener('click', () => {
      location.href="./login.do";
    });

    document.getElementById('btn_home').addEventListener('click', () => {
      location.href="./index.do";
    });
  }
</script>
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='title_line'>로그인</div>
	<div class='message'>
		<fieldset class='fieldset_basic'>
			<ul>
				<li class='li_none'>회원 로그인에 실패했습니다.</li>
				<li class='li_none'>ID 또는 패스워드가 일치하지 않습니다.</li>
				<li class='li_none'><br>
					<button type="button" id="btn_retry" class="btn btn-outline-warning btn-sm" onclick="location.href='/index.do'"
						style="background-color: #B8860B;">로그인</button>
				</li>
			</ul>
		</fieldset>
	</div>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>



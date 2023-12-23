<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival Blog Login</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='title_line'>관리자 로그인</div>

	<div class='content_body'>
		<div class="login_container">
			<div class="login_image">
				<img src="/css/images/login2.jpg" alt="로그인 이미지">
			</div>

			<div style='width: 40%; margin: 50px -50px 0px auto;'>
				<form name='frm' method='POST' action='./login.do'>
					<div class="form_input">
						<input type='text' class="form-control" name='id' id='id' value="${cookie.admin_id.value}" required="required"
							style='width: 53%;' placeholder="아이디" autofocus="autofocus">
						<label>
							<input type='checkbox' name='id_save' value='Y' ${cookie.ck_admin_id.value == 'Y' ? "checked='checked'" : "" }>
							<span style='color: #F8F8FF; font-size: 12px;'>저장</span>
						</label>
					</div>

					<div class="form_input">
						<input type='password' class="form-control" name='passwd' id='passwd' value='${cookie.admin_passwd.value}'
							required="required" style='width: 53%;' placeholder="패스워드">
						<label>
							<input type='checkbox' name='passwd_save' value='Y'
								${cookie.ck_admin_passwd.value == 'Y' ? "checked='checked'" : "" }>
							<span style='color: #F8F8FF; font-size: 12px;'>저장</span>
						</label>
					</div>
					<div class="login_bottom_menu">
						<button type="submit" class="btn btn-outline-warning btn-sm">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>


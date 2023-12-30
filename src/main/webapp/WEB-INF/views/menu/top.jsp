<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
.icon_n {
	width: 30px;
}

.top_menu_link:link, .top_menu_link:visited {
	text-decoration: none;
	color: #800000;
	font-size: 14px;
}

.top_menu_link:hover {
	text-decoration: blink;
	/* color: #2F4F4F; */
	color: #EC9704;
	font-size: 13px;
}

.navbar-brand img {
	transform: rotate(-15deg);
	transition: transform 0.5s ease-in-out;
}

.navbar-brand img:hover {
	transform: rotate(15deg);
}
</style>

<script type="text/javascript">
	function chatbot() {
		// 챗봇을 개발한 사람의 AWS IP
		// "http://localhost:5000/chatbot/?memberno=${sessionScope.memberno }"  
		// http://50.17.195.113:5000/chatbot?memberno=9
		var url = 'http://50.17.195.113:5000/chatbot?memberno=${sessionScope.memberno }';
		var win = window.open(url, '챗봇', 'width=1300px, height=850px');

		var x = (screen.width - 1300) / 2;
		var y = (screen.height - 850) / 2;

		win.moveTo(x, y); // 화면 중앙으로 이동
	}
	function recommend() {
		// 추천을 개발한 사람의 AWS IP
		// "http://localhost:8000/ais/recommend_form/?memberno=${sessionScope.memberno }"  
		var url = 'http://15.164.158.111:8000/ais/recommend_form/?memberno=${sessionScope.memberno }';
		var win = window.open(url, '추천', 'width=1300px, height=850px');

		var x = (screen.width - 1300) / 2;
		var y = (screen.height - 850) / 2;

		win.moveTo(x, y); // 화면 중앙으로 이동
	}
</script>

<div class='container_main'>
	<div style="text-align: right; margin-top: 10px; margin-right: 5px; margin-bottom: 5px;">
		<c:choose>
			<c:when test="${sessionScope.id == null}">
				<a class="nav-link top_menu_link" href="/member/login.do" style="display: inline-block;">로그인</a>
				<span style="color: #2F4F4F;">|</span>
				<a class="nav-link top_menu_link" href="/member/create.do" style="display: inline-block;">회원가입</a>
			</c:when>
			<c:otherwise>
				<a class="nav-link top_menu_link" href='/member/logout.do'>${sessionScope.id } 로그아웃</a>
			</c:otherwise>
		</c:choose>
	</div>

	<nav class="navbar navbar-expand-md navbar-dark"
		style="background-color: #FFF5EE; padding-left: 2%; border-top: 2px solid #2F4F4F; border-bottom: 3px solid #2F4F4F; border-radius: 10px;">
		<a class="navbar-brand" href="/">
			<img src='/css/images/home.png' title="시작페이지" style='display: block; padding-left: 3px;'
				class='icon_n'>
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
			aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle Navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav mr-auto">
				<%-- 게시판 목록 출력 --%>
				<c:forEach var="fcateVO" items="${list_top}">
					<c:set var="fcateno" value="${fcateVO.fcateno }" />
					<c:set var="name" value="${fcateVO.name }" />
					<li class="nav-item">
						<%-- 서브 메뉴가 없는 독립메뉴 --%> <a class="nav-link top_menu_link"
							href="/festival/list_by_fcateno.do?fcateno=${fcateVO.fcateno }&now_page=1">${fcateVO.name }</a>
					</li>
				</c:forEach>

				<li class="nav-item dropdown">
					<%-- 회원 서브 메뉴 --%> <a class="nav-link top_menu_link dropdown-toggle" data-bs-toggle="dropdown" href="#"
						style="color: #EC9704;">회원</a>
					<div class="dropdown-menu top_menu_link">
						<c:choose>
							<c:when test="${sessionScope.id == null }">
								<a class="dropdown-item top_menu_link" href="/member/create.do">회원 가입</a>
								<a class="dropdown-item top_menu_link" href="/member/findId.do">아이디 찾기</a>
								<a class="dropdown-item top_menu_link" href="/member/findPasswd.do">비밀번호 찾기</a>
							</c:when>
							<c:otherwise>
								<a class="dropdown-item top_menu_link" href="javascript: chatbot();">[문의] 챗봇</a>
								<a class="dropdown-item top_menu_link" href="javascript: recommend();">[추천] 관심분야 등록하고 추천받기</a>
								<a class="dropdown-item top_menu_link" href='/frecommend/list_by_memberno.do'>[회원] 나의 관심 페스티벌 목록</a>
								<a class="dropdown-item top_menu_link" href="/member/read.do">[회원] 가입 정보</a>
								<a class="dropdown-item top_menu_link" href="/member/read.do">[회원] 정보 수정</a>
								<a class="dropdown-item top_menu_link" href="/member/passwd_update.do">[회원] 비밀번호 변경</a>
								<a class="dropdown-item top_menu_link" href="/member/unsubscribe.do">[회원] 탈퇴</a>
								<a class="dropdown-item top_menu_link" href="/login/list_mlogin_by_memberno.do">[회원] 로그인 내역</a>
								<a class="dropdown-item top_menu_link" href="/freview_reply/list_by_id.do?id=${sessionScope.id}">[회원] 내가 쓴
									댓글</a>
							</c:otherwise>
						</c:choose>
					</div>
				</li>

				<c:choose>
					<c:when test="${sessionScope.admin_id == null }">
						<li class="nav-item"><a class="nav-link top_menu_link" href="/admin/login.do">관리자 로그인</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item dropdown">
							<%-- 관리자 서브 메뉴 --%> <a class="nav-link top_menu_link dropdown-toggle" data-bs-toggle="dropdown" href="#"
								style="color: #EC9704;">관리자</a>
							<div class="dropdown-menu top_menu_link">
								<a class="dropdown-item top_menu_link" href='/fcate/list_all.do'>[관리자] 전체 카테고리 목록</a>
								<a class="dropdown-item top_menu_link" href='/festival/list_all.do'>[관리자] 전체 컨텐츠 목록</a>
								<a class="dropdown-item top_menu_link" href="/festival/list_all_gallery.do">[관리자] 🖼️ 컨텐츠 갤러리</a>
								<a class="dropdown-item top_menu_link" href='/calendar/create.do'>[관리자] 📅 Calendar 등록</a>
								<a class="dropdown-item top_menu_link" href='/calendar/list_all.do'>[관리자] 📅 Calendar 목록</a>
								<a class="dropdown-item top_menu_link" href='/frecommend/list_all.do'>[관리자] 회원 관심 페스티벌 목록</a>
								<a class="dropdown-item top_menu_link" href='/member/list.do'>[관리자] 회원 목록</a>
								<a class="dropdown-item top_menu_link" href='/freview/list_all.do'>[관리자] 모든 리뷰</a>
								<a class="dropdown-item top_menu_link" href='/login/list_all_alogin.do'>[관리자] 로그인 내역</a>
								<a class="dropdown-item top_menu_link" href='/admin/logout.do'>[관리자] '${sessionScope.admin_id }' 로그아웃</a>
							</div>
						</li>
					</c:otherwise>
				</c:choose>

				<li class="nav-item">
					<%-- 서브 메뉴가 없는 독립메뉴 --%> <a class="nav-link top_menu_link" href="/fcate/list_all_member.do">카테고리</a>
				</li>

				<li class="nav-item">
					<%-- 서브 메뉴가 없는 독립메뉴 --%> <a class="nav-link top_menu_link" href="/question/list_all.do">Q&A 🐚</a>
				</li>

				<li class="nav-item">
					<%-- 서브 메뉴가 없는 독립메뉴 --%> <a class="nav-link top_menu_link" href="/calendar/list_all_calendar.do">📅Calendar</a>
				</li>
			</ul>
		</div>
	</nav>
	<div class='content_body'>
		<!--  내용 시작 -->
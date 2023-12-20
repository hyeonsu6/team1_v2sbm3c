<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
.icon_n {
	width: 22px;
}

.top_menu_link:link { /* 방문전 상태 */
	text-decoration: none; /* 밑줄 삭제 */
	color: #5A7696;
	font-weight: bold;
	font-size: 14px;
}

.top_menu_link:visited { /* 방문후 상태 */
	text-decoration: none; /* 밑줄 삭제 */
	color: #5A7696;
	font-weight: bold;
	font-size: 14px;
}

.top_menu_link:hover { /* A 태그에 마우스가 올라간 상태 */
	text-decoration: none; /* 밑줄 출력 */
	color: #5A7696;
	font-size: 1.05em;
	font-size: 14px;
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
	<div class='top_img'>
		<div class="top_menu_label">Festival Blog version 4.0</div>
	</div>
	<!-- <div class='top_img'></div> 종료 -->

	<nav class="navbar navbar-expand-md navbar-dark" style="background-color: #EEE8AA;">
		<a class="navbar-brand" href="/">
			<img src='/css/images/home.png' title="시작페이지" style='display: block; padding-left: 5px;' class='icon_n'>
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

				<li class="nav-item">
					<%-- 서브 메뉴가 없는 독립메뉴 --%> <a class="nav-link top_menu_link" href="/fcate/list_all_member.do">전체 카테고리 목록</a>
				</li>

				<li class="nav-item dropdown">
					<%-- 회원 서브 메뉴 --%> <a class="nav-link top_menu_link dropdown-toggle" data-bs-toggle="dropdown" href="#">회원</a>
					<div class="dropdown-menu">
						<c:choose>
							<c:when test="${sessionScope.id == null }">
								<a class="dropdown-item" href="/member/create.do">회원 가입</a>
								<a class="dropdown-item" href="#">아이디 찾기</a>
								<a class="dropdown-item" href="#">비밀번호 찾기</a>
							</c:when>
							<c:otherwise>
								<a class="dropdown-item" href="javascript: chatbot();">[문의] 챗봇</a>
								<a class="dropdown-item" href="javascript: recommend();">[추천] 관심분야 등록하고 추천받기</a>
								<a class="dropdown-item" href='#'>[회원] 나의 관심 페스티벌 목록</a>
								<a class="dropdown-item" href="/member/read.do">[회원] 가입 정보</a>
								<a class="dropdown-item" href="/member/read.do">[회원] 정보 수정</a>
								<a class="dropdown-item" href="/member/passwd_update.do">[회원] 비밀번호 변경</a>
<<<<<<< HEAD
								<a class="dropdown-item" href="/member/unsubscribe.do">[회원] 회원 탈퇴</a>
								<a class="dropdown-item" href="/login/list_all_mlogin.do">[회원] 로그인 내역</a>
=======
								<a class="dropdown-item" href="/member/unsubscribe.do">[회원] 탈퇴</a>
								<a class="dropdown-item" href="/login/list_mlogin_by_memberno.do">[회원] 로그인 내역</a>
								<a class="dropdown-item" href="#">회원 탈퇴</a>
>>>>>>> adfe04bea161e95c7f2f11da740eb5fd56f85460
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
							<%-- 관리자 서브 메뉴 --%> <a class="nav-link top_menu_link dropdown-toggle" data-bs-toggle="dropdown" href="#">관리자</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href='/fcate/list_all.do'>[전체] 카테고리 목록</a>
								<a class="dropdown-item" href='/festival/list_all.do'>[전체] 컨텐츠 목록</a>
								<a class="dropdown-item" href='/frecommend/list_all.do'>[관리자 모드] 회원 관심 페스티벌 목록</a>
								<a class="dropdown-item" href='/member/list.do'>[관리자] 회원 목록</a>
								<a class="dropdown-item" href='/alogin/list_all.do'>[관리자] 로그인 내역</a>
								<a class="dropdown-item" href="/login/list_all_mlogin.do">[회원] 로그인 내역</a>

								<a class="dropdown-item" href='/admin/logout.do'>관리자 ${sessionScope.admin_id } 로그아웃</a>
							</div>
						</li>
					</c:otherwise>
				</c:choose>

				<li class="nav-item">
					<%-- 서브 메뉴가 없는 독립메뉴 --%> <c:choose>
						<c:when test="${sessionScope.id == null}">
							<a class="nav-link top_menu_link" href="/member/login.do">회원 로그인</a>
						</c:when>
						<c:otherwise>
							<a class="nav-link top_menu_link" href='/member/logout.do'>${sessionScope.id } 로그아웃</a>
						</c:otherwise>
					</c:choose>
				</li>
				<li class="nav-item">
					<%-- 서브 메뉴가 없는 독립메뉴 --%> <a class="nav-link top_menu_link" href="/question/list_all.do">질문 목록</a>
				</li>
			</ul>
		</div>
	</nav>

	<div class='content_body'>
		<!--  내용 시작 -->
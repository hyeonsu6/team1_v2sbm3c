<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=10.0, width=device-width" />
<title>Festival Blog CateGory</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='title_line'>[관리자 모드] 페스티벌 카테고리 삭제</div>
	<br>
	<div id='panel_delete'
		style='margin: 20px auto; padding: 10px 0px 10px 0px; background-color: #FFFAFA; width: 100%; text-align: center;'>

		<form name='frm_delete' id='frm_delete' method='post' action='./delete.do'>
			<input type="hidden" name="fcateno" value="${param.fcateno }">
			<%-- 삭제할 카테고리 번호 --%>
			<c:choose>
				<c:when test="${count_by_fcateno >= 1 }">
					<%-- 자식 레코드가 있는 상황 --%>
					<div class="msg_warning">
						관련 자료 ${count_by_fcateno } 건이 발견되었습니다.<br> 관련 콘텐츠와 카테고리를 모두 삭제하시겠습니까?
					</div>

					<label style="margin-right: 5px;">관련 카테고리 이름</label> ${fcateVO.name } 
          <a href="../festival/list_by_fcateno.do?fcateno=${fcateVO.fcateno }&now_page=1" title="관련 카테고리로 이동">
						<img src='/fcate/images/link.png' class="icon">
					</a>
					<button type="submit" id='submit' class='btn btn-outline-warning btn-sm'
						style="height: 30px; margin-bottom: 5px; background-color: #B8860B;">관련 콘텐츠와 함께 카테고리 삭제</button>

				</c:when>
				<c:otherwise>
					<%-- 자식 레코드가 없는 상황 --%>
					<div class="msg_warning">페스티벌 카테고리를 삭제하면 복구할 수 없습니다.</div>
					<label style="margin-right: 10px; margin: 15px auto;">카테고리 이름</label>[ ${fcateVO.name } ]
      
          <button type="submit" id='submit' class='btn btn-outline-warning btn-sm'
						style="margin-left: 10px; height: 30px; margin-bottom: 5px; background-color: #B8860B;">삭제</button>
				</c:otherwise>
			</c:choose>

			<button type="button" onclick="location.href='/fcate/list_all.do'" class='btn btn-outline-warning btn-sm'
				style="height: 30px; margin-bottom: 5px; background-color: #B8860B;">취소</button>
		</form>
	</div>

	<table>
		<colgroup>
			<col style='width: 10%;' />
			<col style='width: 40%;' />
			<col style='width: 10%;' />
			<col style='width: 20%;' />
			<col style='width: 20%;' />
		</colgroup>

		<thead>
			<tr style="text-align: center;">
				<th class="th_bs">순서</th>
				<th class="th_bs">카테고리 이름</th>
				<th class="th_bs">등록된 콘텐츠 수</th>
				<th class="th_bs">등록일</th>
				<th class="th_bs"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="fcateVO" items="${list }" varStatus="info">
				<c:set var="fcateno" value="${fcateVO.fcateno }" />

				<tr style="text-align: center;">
					<td>${info.count }</td>

					<td>
						<a href="./read.do?fcateno=${fcateno }" style="display: block;">${fcateVO.name }</a>
					</td>

					<td>${fcateVO.cnt }</td>

					<td>${fcateVO.rdate.substring(0, 10) }</td>

					<td>
						<a href="../festival/create.do?fcateno=${fcateno }" title="콘텐츠 등록">
							<img src="/fcate/images/create.png" class="icon">
						</a>
						<c:choose>
							<c:when test="${fcateVO.visible == 'Y'}">
								<a href="./update_visible_n.do?fcateno=${fcateno }" title="카테고리 공개 설정">
									<img src="/fcate/images/show.png" class="icon">
								</a>
							</c:when>
							<c:otherwise>
								<a href="./update_visible_y.do?fcateno=${fcateno }" title="카테고리 비공개 설정">
									<img src="/fcate/images/hide.png" class="icon">
								</a>
							</c:otherwise>
						</c:choose>
						<a href="./update_seqno_forward.do?fcateno=${fcateno }" title="우선 순위 높임">
							<img src="/fcate/images/increase.png" class="icon">
						</a>
						<a href="./update_seqno_backward.do?fcateno=${fcateno }" title="우선 순위 낮춤">
							<img src="/fcate/images/decrease.png" class="icon">
						</a>
						<a href="./update.do?fcateno=${fcateno }" title="수정">
							<img src="/fcate/images/update.png" class="icon">
						</a>
						<a href="./delete.do?fcateno=${fcateno }" title="삭제">
							<img src="/fcate/images/delete.png" class="icon">
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>

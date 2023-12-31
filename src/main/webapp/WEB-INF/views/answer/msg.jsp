<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Festival Answer Message</title>
<link rel="shortcut icon" href="/images/festival.png" />
<link href="/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<c:import url="/menu/top.do" />

	<div class='title_line'>답변</div>

	<c:set var="code" value="${param.code }" />
	<c:set var="cnt" value="${param.cnt }" />
	<c:set var="ansno" value="${param.ansno }" />

	<div class='message'>
		<fieldset class='fieldset_basic'>
			<ul>
				<c:choose>
					<c:when test="${code == 'passwd_fail'}">
						<LI class='li_none'><span class="span_fail">패스워드가 일치하지 않습니다.</span></LI>
					</c:when>

					<c:when test="${code == 'create_success'}">
						<%-- Java if --%>
						<li class='li_none'><span class="span_success">새로운 답변을 등록했습니다.</span></li>
					</c:when>

					<c:when test="${code == 'check_upload_file_fail'}">
						<%-- Java if --%>
						<li class='li_none'><span class="span_fail">업로드 할 수 없는 파일 형식입니다.</span><br> <span>가능한 파일 형식[jpg,
								jpef, png, gif, txt, hwp, doc, ppt, pptx, xls, xlsx, zip, tar, gz, ipynb]</span></li>
					</c:when>

					<c:when test="${code == 'create_fail'}">
						<%-- Java if --%>
						<LI class='li_none'><span class="span_fail">새로운 답변 등록에 실패했습니다.</span></LI>
					</c:when>

					<c:when test="${code == 'create_fail_existing_answer'}">
						<%-- Java if --%>
						<LI class='li_none'><span class="span_fail">기존 답변이 이미 존재합니다. 수정 또는 삭제 후 재등록을 진행해주세요.</span></LI>
					</c:when>

					<c:when test="${code == 'update_fail'}">
						<%-- Java if --%>
						<LI class='li_none'><span class="span_fail">답변 수정에 실패했습니다.</span></LI>
					</c:when>

					<c:when test="${code == 'delete_success'}">
						<%-- Java if --%>
						<LI class='li_none'><span class="span_success">답변 삭제에 성공했습니다.</span></LI>
					</c:when>

					<c:when test="${code == 'delete_fail'}">
						<%-- Java if --%>
						<LI class='li_none'><span class="span_fail">답변 삭제에 실패했습니다.</span></LI>
					</c:when>

					<c:otherwise>
						<LI class='li_none_left'><span class="span_fail">알 수 없는 에러로 작업에 실패했습니다.</span></LI>
						<LI class='li_none_left'><span class="span_fail">다시 시도해주세요.</span></LI>
					</c:otherwise>
				</c:choose>
				<li class='li_none'><br> <c:choose>
						<c:when test="${cnt == 0 }">
							<button type='button' onclick="history.back()" class="btn btn-outline-warning btn-sm"
								style="background-color: #B8860B;">다시 시도</button>
						</c:when>
					</c:choose>
					<button type='button' onclick="location.href='/question/list_all.do?'" class="btn btn-outline-warning btn-sm"
						style="background-color: #B8860B;">답변 목록</button></li>
			</ul>
		</fieldset>
	</div>
	<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>


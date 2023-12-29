<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.2, minimum-scale=1.2, maximum-scale=10.0, width=device-width">
<title>Festival Blog</title>
<link rel="shortcut icon" href="/images/festival.png">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<style type="text/css">
.index_img {
	max-width: 100%;
	max-height: 50%;
	height: auto;
	display: block;
	margin: 0 auto;
}
</style>
</head>

<body>
	<c:import url="/menu/top.do" />

	<script>
    const images = ["/images/index_img1.png", "/images/index_img2.png", "/images/index_img3.png", "/images/index_img4.png"];
    let currentImageIndex = 0;

    function changeImage() {
        const imgElement = document.getElementById("slideshow");
        imgElement.src = images[currentImageIndex];
        currentImageIndex = (currentImageIndex + 1) % images.length;
    }

    setInterval(changeImage, 3000); // 3초마다 changeImage 함수 호출
	</script>

	<div style="text-align: center;">
		<img src="/images/index_img1.png" alt="메인 이미지" class="index_img" id="slideshow">
	</div>
	<br>

	<div class="menu_line" style="margin-top: -15px;"></div>

	<div id='calendar'></div>

	<script type="text/javascript">
	function getRandomColor() {
	    var letters = '0123456789ABCDEF';
	    var color = '#';

	    for (var i = 0; i < 6; i++) {
	        color += letters[Math.floor(Math.random() * 16)];
	    }
	    return color;
	}

	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    // 서버에서 받아온 이벤트 데이터(JSON 형식)
	    var events = [
		    <c:forEach var="event" items="${list}" varStatus="loop">
		    {
            	title: '<c:out value="${event.title}"/>',
            	start: '<c:out value="${event.calstart}"/>T00:00:00',
            	end: '<c:out value="${event.calend}"/>T23:59:59',
            	color: getRandomColor(),
            	id: '<c:out value="${event.calno}"/>' // calno를 id로 추가
        	}	<c:if test="${!loop.last}">,</c:if>
   	 		</c:forEach>
		];

	    var isAdmin = ${sessionScope.admin_id != null}; // 관리자 여부 확인

	    var calendar = new FullCalendar.Calendar(calendarEl, {
	        initialView: 'dayGridMonth',
	        headerToolbar: {
	            left: 'customPrev,customNext today',
	            center: 'title',
	            right: 'dayGridMonth,dayGridWeek,dayGridDay',
	        },

	        customButtons: {
	            customPrev: {
	                text: '<',
	                click: function() {
	                    calendar.prev();
	                }
	            },
	            customNext: {
	                text: '>',
	                click: function() {
	                    calendar.next();
	                }
	            },
	        },

	        titleFormat: function(date) {
	            return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
	        },
	        selectable: true,
	        droppable: true,
	        editable: true,
	        nowIndicator: true,
	        locale: 'ko',
	        contentHeight: 'auto',
	        events: events,
	        eventContent: function(arg) {
	            var title = arg.event.title;
	            return { html: '<div style="font-size: 10px; margin-left: 10px; color: #FF8C00;">' + title + '</div>' };
	        },
	        
	        eventClick: function(info) {
	            var calno = info.event.id; // 일정의 고유 식별자로 사용할 수 있는 값
	            window.location.href = '../calendar/read.do?calno=' + calno;
	        },
	    });

	    calendar.setOption('dateClick', function(info) {
	        if (!isAdmin) {
	            console.log('Clicked on: ' + info.dateStr);
	        } else {
	            window.location.href = '../calendar/create.do';
	        }
	    });

	    calendar.render();
	});
	</script>
	<jsp:include page="./menu/bottom.jsp" flush='false' />
</body>
</html>

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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
#calendar {
	border: 2px solid #333;
	padding: 10px;
	border-radius: 10px;
	background-color: #f0f0f0;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #800000;
	padding: 8px;
	text-align: center;
	color: #696969;
}

th {
	background-color: #FFF5EE;
	color: #800000;
	text-align: center;
}

.colToday {
	text-decoration: underline;
	font-size: 22px;
	color: #006400;
	border: 2px solid #800000;
}

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
    const images = ["/images/index_img1.jpg", "/images/index_img2.png", "/images/index_img3.png"];
    let currentImageIndex = 0;

    function changeImage() {
        const imgElement = document.getElementById("slideshow");
        imgElement.src = images[currentImageIndex];
        currentImageIndex = (currentImageIndex + 1) % images.length;
    }

    setInterval(changeImage, 3000); // 3초마다 changeImage 함수 호출
	</script>

	<div style="text-align: center;">
		<img src="/images/index_img.jpg" alt="메인 이미지" class="index_img" id="slideshow">
	</div>

	<script>
        $(function(){
            var today = new Date();
            var date = new Date();           

            $("input[name=preMon]").click(function() { // 이전달
                $("#calendar > tbody > td").remove();
                $("#calendar > tbody > tr").remove();
                today = new Date ( today.getFullYear(), today.getMonth()-1, today.getDate());
                buildCalendar();
            })
            
            $("input[name=nextMon]").click(function(){ //다음달
                $("#calendar > tbody > td").remove();
                $("#calendar > tbody > tr").remove();
                today = new Date ( today.getFullYear(), today.getMonth()+1, today.getDate());
                buildCalendar();
            })


            function buildCalendar() {   
                
                nowYear = today.getFullYear();
                nowMonth = today.getMonth();
                firstDate = new Date(nowYear,nowMonth,1).getDate();
                firstDay = new Date(nowYear,nowMonth,1).getDay(); //1st의 요일
                lastDate = new Date(nowYear,nowMonth+1,0).getDate();

                if((nowYear%4===0 && nowYear % 100 !==0) || nowYear%400===0) { //윤년 적용
                    lastDate[1]=29;
                }

                $(".year_mon").text(nowYear+"년 "+(nowMonth+1)+"월");

                for (i=0; i<firstDay; i++) { //이전월 빈칸 처리
                    $("#calendar tbody:last").append("<td></td>");
                }
                for (i=1; i <=lastDate; i++){ // 날짜 채우기
                    plusDate = new Date(nowYear,nowMonth,i).getDay();
                    if (plusDate==0) {
                        $("#calendar tbody:last").append("<tr></tr>");
                    }

                    // 날짜가 오늘인 경우 colToday 클래스 추가
                    var todayClass = "";
                    if(nowYear==date.getFullYear() && nowMonth==date.getMonth() && i==date.getDate()) {
                        todayClass = 'colToday';
                    }

                    $("#calendar tbody:last").append("<td class='date " + todayClass + "'>"+ i +"</td>");
                }
                if($("#calendar > tbody > td").length%7!=0) { //다음원 빈칸 처리
                    for(i=1; i<= $("#calendar > tbody > td").length%7; i++) {
                        $("#calendar tbody:last").append("<td></td>");
                    }
                }
            }
            buildCalendar();
        })
    </script>
</head>
<body>
	<table id="calendar" style="margin-top: 20px;">
		<thead>
			<tr style="text-align: center;">
				<th>
					<input name="preMon" type="button" value="<">
				</th>
				<th colspan="5" class="year_mon"></th>
				<th>
					<input name="nextMon" type="button" value=">">
				</th>
			</tr>
			<tr style="text-align: center;">
				<th>일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<jsp:include page="./menu/bottom.jsp" flush='false' />
</body>
</html>

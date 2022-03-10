<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<script>

// 뷰에 들어가자마자 기본 통계가 나오도록 해보기
$(document).ready(function() {
	
	$.ajax({
		url: "personalCounselData.do",
		success: function(list) {
				var chartMonths= [];
				var chartData = [];
				
				for(lists of list) {
	
					chartMonths.push(lists.pr_date);  // 가로축 데이터 
					chartData.push(lists.prCount);
				}
	
				var context = document.getElementById('myChart').getContext('2d');
				var myChart = new Chart(context, {
				    type: 'line', // 차트의 형태
				    data: { // 차트에 들어갈 데이터
				        labels: chartMonths,
				        datasets: [
				            { //데이터
				                label: '월별 개인상담 건수', //차트 제목
				                fill: true, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
				                data: chartData,  // 세로축 데이터
				                backgroundColor: [
				                	//색상
				                    'rgba(255, 99, 132, 0.2)',
				                    'rgba(54, 162, 235, 0.2)',
				                    'rgba(255, 206, 86, 0.2)',
				                    'rgba(75, 192, 192, 0.2)',
				                    'rgba(153, 102, 255, 0.2)',
				                    'rgba(255, 159, 64, 0.2)'
				                ],
				                borderColor: [
				                    //경계선 색상
				                    'rgba(255, 99, 132, 1)',
				                    'rgba(54, 162, 235, 1)',
				                    'rgba(255, 206, 86, 1)',
				                    'rgba(75, 192, 192, 1)',
				                    'rgba(153, 102, 255, 1)',
				                    'rgba(255, 159, 64, 1)'
				                ],
				                borderWidth: 1 //경계선 굵기
				            }
				            /* ,
				            {
				                label: 'test2',
				                fill: false,
				                data: [
				                    8, 34, 12, 24
				                ],
				                backgroundColor: 'rgb(157, 109, 12)',
				                borderColor: 'rgb(157, 109, 12)'
				            } */
				        ]
				    },
				    options: {
				        scales: {
				            yAxes: [
				                {
				                    ticks: {
				                        beginAtZero: true
				                    }
				                }
				            ]
				        }
				    }
				});  // mychart
	
	}});  // ajax
});  // document.ready
</script>
<body>

<div style="width: 800px; height: 800px;">
	사이트 이용 통계 
	<input type="button" id="selectPersonalCounsel" value="월별개인상담조회"><br>
	<canvas id="myChart"></canvas>
</div>



</body>

<script>
// 기본적으로 출력되는 chart에 클릭이벤트를 통해 다른 차트 조회해보기 
//$("#selectPersonalCounsel").on("click", function() {
	

</script>
</html>
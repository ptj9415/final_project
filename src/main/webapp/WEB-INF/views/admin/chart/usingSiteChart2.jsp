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
<body>
상담 통계
<br>
<select id="month">
    <option value="3" selected="selected">3개월</option>
    <option value="6">6개월</option>
    <option value="12">12개월</option>
</select>
<div style="width: 900px; height: 700px; margin-left: 50px;">
	<canvas id="myChart"></canvas>
</div>
</body>

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
				    type: 'bar', // 차트의 형태
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
				                        beginAtZero: true,
				                        max: 30  // y축 범위 조절 가능. 
				                        
				                    }
				                }
				            ]
				        }
				    }
				});  // mychart
	
		}});  // ajax
});  // document.ready

	
</script>
</html>
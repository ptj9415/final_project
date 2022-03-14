<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
매출 통계
<select id="month">
    <option value="-2">3개월</option>
    <option value="-5">6개월</option>
    <option value="-11">12개월</option>
</select>
	<div style="width: 900px; height: 700px; margin-left: 50px;" id="chartcard">
		<div id="chart">
			<br><br><br>
			<canvas id="myChart"></canvas>
		</div>
		<br>
	</div>
		<div class="chartTable">
			<table border="1">
				<thead>
					<tr>
						<th width="400px;">기간(날짜)</th>
						<th width="500px;">매출액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="list">
						<tr>
							<td>${list.pr_date }</td>
							<td>${list.prSum }원</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


</body>

<script>
$(document).ready(function() {
	
	$.ajax({
		url: "salesData.do",
		success: function(list) {
				var chartMonths= [];
				var chartData = [];
				
				for(lists of list) {
	
					chartMonths.push(lists.pr_date);  // 가로축 데이터 
					chartData.push(lists.prSum);	// 세로축 데이터
				}
						
				var context = document.getElementById('myChart').getContext('2d');
				var myChart = new Chart(context, {
				    type: 'bar', // 차트의 형태
				    data: { // 차트에 들어갈 데이터
				        labels: chartMonths,
				        datasets: [
				            { //데이터
				                label: '월별 매출 통계', //차트 제목
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
				        ]
				    },
				    options: {
				        scales: {
				            yAxes: [
				                {
				                    ticks: {
				                        beginAtZero: true,
				                        max: 500000
				                    }
				                }
				            ]
				        }
				    }
				});  // mychart
	
		}});  // ajax
});  // document.ready
	
	// 기존 차트에서 다른 범위의 값을 구할 때.
	var selectBox = document.getElementById('month');
	selectBox.addEventListener('change', selectMonth);
	function selectMonth() {
		var sendMonth = $('#month').val();
		alert("보내는 값 확인: " + sendMonth );
		
		$.ajax({
			url: "searchSalesData.do", 
			data: {
				sendMonth : sendMonth
			},
			success: function(list) {
				var chart = $("#chart");
				chart.remove();   // 기존차트 지움. 
				
				var container = $("#chartcard");
				var div = $('<div>');
				div.attr('id', 'chart');
				var canvas = $('<canvas>');
				canvas.attr('id', 'myChart');
				div.append(canvas);
				container.append(div);
				var chartMonths= [];
				var chartData = [];
				
				for(list of list){
					chartMonths.push(lists.pr_date);  // 가로축 데이터 
					chartData.push(lists.prSum);	// 세로축 데이터
				}
				
				var context = document.getElementById('myChart').getContext('2d');
				var myChart = new Chart(context, {
				    type: 'bar', // 차트의 형태
				    data: { // 차트에 들어갈 데이터
				        labels: chartMonths,
				        datasets: [
				            { //데이터
				                label: '월별 매출 통계', //차트 제목
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
				        ]
				    },
				    options: {
				        scales: {
				            yAxes: [
				                {
				                    ticks: {
				                        beginAtZero: true,
				                        max: 500000
				                    }
				                }
				            ]
				        }
				    }
				});  // mychart
	
			}});  // ajax
				
		} // End function selectMonth

</script>
</html>
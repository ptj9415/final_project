<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<style>
h3 {
	font-size: 28px;
	font-weight: bold;
}

#yellowdiv {
	color: white;
}

.small-box-footer {
	font-size: 14px;
}

.small-box h4 {
	font-size: 26px;
	margin: 10px;
}

.small-box h4:hover, .inner:hover {
	color: white;
}

#headerdiv {
	margin-bottom: 4px;
}

#headerp {
	position: relative;
	top: 7px;
	margin-left: 15px;
	font-size: 16px;
	font-weight: 600;
}

.small-box .icon {
	position: absolute;
	top: 10px;
	right: 10px;
	z-index: 0;
	font-size: 70px;
	color: rgba(0, 0, 0, 0.15);
}

.small-box .icon:hover {
color: rgba(0, 0, 0, 0.15);
}
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>
				<i class="fa fa-home"></i>HOME
			</h3>
			<div class="row">
				<div class="col-lg-3 col-xs-6">
					<div class="small-box bg-blue">
						<div class="inner">
							<h4>회원 관리</h4>
							<div class="icon">
								<ion-icon name="cellular" ></ion-icon>
							</div>
						</div>
						<a href="adminMemberList.do" class="small-box-footer">바로가기&nbsp;<i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-xs-6">
					<div class="small-box bg-green">
						<div class="inner">
							<h4>오늘의 한마디 관리</h4>
							<div class="icon">
								<ion-icon name="chatbubbles"></ion-icon>
							</div>
						</div>
						<a href="adminTodayStoryList.do" class="small-box-footer">바로가기&nbsp;<i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-xs-6">
					<div class="small-box bg-purple">
						<div class="inner">
							<h4>공지사항 관리</h4>
							<div class="icon">
								<ion-icon name="library"></ion-icon>
							</div>
						</div>
						<a href="adminNoticeList.do" class="small-box-footer">바로가기&nbsp;<i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-xs-6">
					<div class="small-box bg-red">
						<div class="inner">
							<h4>배너 관리</h4>
							<div class="icon">
								<ion-icon name="desktop"></ion-icon>
							</div>
						</div>
						<a href="adminBannerList.do" class="small-box-footer">바로가기&nbsp;<i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<div class="card" id="headerdiv">
						<p id="headerp">상담 통계</p>
					</div>
					<div class="card" id="maindiv" align="center">
						<div class="article" style="height: 350px;">
							
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card" id="headerdiv">
						<p id="headerp">상담사 통계</p>
					</div>
					<div class="card" id="maindiv">
						<div class="article" style="height: 350px;"></div>
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-6">
					<div class="card" id="headerdiv">
						<p id="headerp">사이트 이용 통계</p>
					</div>
					<div class="card" id="maindiv">
						<div class="article" style="height: 350px;">
							<!-- START 사이트 이용 통계 들어가는 부분 -->
							<div style="width: 700px; height: 250px;">
								<canvas id="myChart"></canvas>
							</div>
							<!-- END 상담 통계에 해당하는 부분 -->
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card" id="headerdiv">
						<p id="headerp">심리검사 통계</p>
					</div>
					<div class="card" id="maindiv">
						<div class="article" style="height: 350px;">
							<!-- START 매출 통계-->
							<div style="width: 700px; height: 250px;">
								<canvas id="myChart2"></canvas>
							</div>
							<!-- END 매출 통계 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

<script>
// 사이트 이용 통계 그래프
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
				                label: '최근 3개월 개인상담 건수', //차트 제목 & 메인페이지에선 디폴트 3개월
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
				                        max: 30 // y축 범위조정 가능.
				                    }
				                }
				            ]
				        }
				    }
				});  // mychart
	
	}});  // ajax
});  // document.ready
</script>
<script>
$.ajax({
	url: "salesData.do",
	success: function(list) {
			var chartMonths= [];
			var chartData = [];
			
			for(lists of list) {

				chartMonths.push(lists.pr_date);  // 가로축 데이터 
				chartData.push(lists.prSum);	// 세로축 데이터
			}
					
			var context = document.getElementById('myChart2').getContext('2d');
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
			                        max: 500000
			                        
			                    }
			                }
			            ]
			        }
			    }
			});  // mychart

	}});  // ajax
</script>
</html>
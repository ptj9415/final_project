<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
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
					<div class="small-box" style="background-color: #FFE3E3;">
						<div class="inner">
							<h4 style="color: #6B4F4F">회원 관리</h4>
							<div class="icon">
								<ion-icon name="cellular"></ion-icon>
							</div>
						</div>
						<a href="adminMemberList.do" class="small-box-footer">바로가기&nbsp;<i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-xs-6">
					<div class="small-box" style="background-color: #7FC8A9;">
						<div class="inner">
							<h4 style="color: #6B4F4F">오늘의 한마디 관리</h4>
							<div class="icon">
								<ion-icon name="chatbubbles"></ion-icon>
							</div>
						</div>
						<a href="adminTodayStoryList.do" class="small-box-footer">바로가기&nbsp;<i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-xs-6">
					<div class="small-box" style="background-color: #D7E9F7;">
						<div class="inner">
							<h4 style="color: #6B4F4F">공지사항 관리</h4>
							<div class="icon">
								<ion-icon name="library"></ion-icon>
							</div>
						</div>
						<a href="adminNoticeList.do" class="small-box-footer">바로가기&nbsp;<i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-xs-6">
					<div class="small-box" style="background-color: #F4D19B;">
						<div class="inner">
							<h4 style="color: #6B4F4F">배너 관리</h4>
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
						<p id="headerp">올해의 매출 통계</p>
					</div>
					<div class="card" id="maindiv" align="center">
						<div class="article" style="height: 350px;">
							<div class="card" id="chartcard">
								<div id=chart style="height: 350px">
									<canvas id="myChart"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card" id="headerdiv">
						<p id="headerp">지난달 매출 통계</p>
					</div>
					<div class="card" id="maindiv">
						<div class="article" style="height: 350px;">
							<div class="card" id="chartcard">
								<div id=chart style="height: 350px">
									<canvas id="myChart2"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-6">
					<div class="card" id="headerdiv">
						<p id="headerp">카테고리별 개인상담 이용률</p>
					</div>
					<div class="card" id="maindiv">
						<div class="article" style="height: 350px;">
							<div class="card" id="chartcard">
								<div id=chart style="height: 350px">
									<canvas id="myChart3"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card" id="headerdiv">
						<p id="headerp">시스템 이용 통계</p>
					</div>
					<div class="card" id="maindiv">
						<div class="article" style="height: 350px;">
							<div class="card" id="chartcard">
								<div id=chart style="height: 350px">
									<canvas id="myChart4"></canvas>
								</div>
							</div>
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
		url: 'adminHomeData1.do',
		dataType: 'json',
		success: function(data) {
			console.log(data);
			
			var mylabel = [];
			var mydata = [];
			for(datas of data) {
				mylabel.push(datas.sdate);
				mydata.push(datas.salary);
			}
				 const ctx = document.getElementById('myChart').getContext('2d');
			        const myChart = new Chart(ctx, {
			            type: 'bar',
			            data: {
			                labels: mylabel,
			                datasets: [{
			                	lineTension:0,
			                	label: '올해의 매출액',
			                    data: mydata,
			                    backgroundColor: [
			                    	'#FFD3B4',
			                    	'#FFD3B4',
			                    	'#FFD3B4'
			                    ],
			                    borderColor: [
			                    	'#FFD3B4',
			                    	'#FFD3B4',
			                    	'#FFD3B4'
			                    ],
			                    borderWidth: 2
			                }]
			            },
			            options: {
			            	plugins:{
			            		legend: {
			                		display: false
			            		}
			                },
			            	maintainAspectRatio: false,
			            	scales: {
			                    y: {
			                        beginAtZero: true
			                    }
			                }
			            }
			        });
		},
		error: function() {
			console.log('error');
		}
	});
});

$(document).ready(function() {
	$.ajax({
		url: 'adminHomeData2.do',
		dataType: 'json',
		success: function(data) {
			console.log(data);
			
			var mylabel = [];
			var mydata = [];
			for(datas of data) {
				mylabel.push(datas.s_sdate);
				mydata.push(datas.s_salary);
			}
				 const ctx = document.getElementById('myChart2').getContext('2d');
			        const myChart = new Chart(ctx, {
			            type: 'bar',
			            data: {
			                labels: mylabel,
			                datasets: [{
			                	lineTension:0,
			                	label: '지난달 매출액',
			                    data: mydata,
			                    backgroundColor: [
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA'
			                    ],
			                    borderColor: [
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA',
			                    	'#B5EAEA'
			                    ],
			                    borderWidth: 2
			                }]
			            },
			            options: {
			            	plugins:{
			            		legend: {
			                		display: false
			            		}
			                },
			            	maintainAspectRatio: false,
			            	scales: {
			                    y: {
			                        beginAtZero: true
			                    }
			                }
			            }
			        });
		},
		error: function() {
			console.log('error');
		}
	});
	
	$(document).ready(function() {		
		const ctx = document.getElementById('myChart3').getContext('2d');
		const myChart = new Chart(ctx, {
			type: 'doughnut',
			data: {
			labels: [
				'분노/우울',
				'연애/우정',
				'진로/취업',
				'결혼/육아',
				'청소년',
				'가정'
			],
			datasets: [{
				lineTension:0,
				label: '카테고리별 개인상담 이용률',
				data: [18.4, 21.1, 19.5, 12.4, 16.3, 12.3],
				backgroundColor: [
					'#98DDCA',
					'#EDF6E5',
					'#FFBCBC',
					'#F38BA0',
					'#FDEFEF',
					'#F4DFD0'
				],
				borderColor: [
					'#98DDCA',
					'#EDF6E5',
					'#FFBCBC',
					'#F38BA0',
					'#FDEFEF',
					'#F4DFD0'				                    	
				],
				borderWidth: 2
			}]
			},
				options: {
					plugins:{
						legend: {
							display: false
						},
					},
				cutoutPercentage: 60,
				            	maintainAspectRatio: false,
				            	scales: {
				                    y: {
				                        beginAtZero: true
				                    }
				                }
				            }
				        });
			});
	
	$(document).ready(function() {		
		const ctx = document.getElementById('myChart4').getContext('2d');
		const myChart = new Chart(ctx, {
			type: 'horizontalBar',
			data: {
			labels: [
				'1월',
				'2월',
				'3월'
			],
			datasets: [{
				data: [514, 391, 255],
				label: '사용자',
				backgroundColor: [
					'#98DDCA',
					'#98DDCA',
					'#98DDCA'
				],
				borderColor: [
					'#98DDCA',
					'#98DDCA',
					'#98DDCA'
				],
				borderWidth: 2
			},{
				data: [482, 530, 127],
				label: '상담사',
				backgroundColor: [
					'#FFBCBC',
					'#FFBCBC',
					'#FFBCBC'
					
				],
				borderColor: [
					'#FFBCBC',
					'#FFBCBC',
					'#FFBCBC'
				],
				borderWidth: 2
			}]
			},
				options: {

					plugins:{
						legend: {
							display: false
						},
					},
				cutoutPercentage: 60,
				            	maintainAspectRatio: false,
				            	scales: {
				            		x: {
				            			stacked: true,
				            		},
				                    y: {
				                    	stacked: true,
				                    	beginAtZero: true,
				                    }
				                }
				            }
				        });
			});
});
</script>
</html>
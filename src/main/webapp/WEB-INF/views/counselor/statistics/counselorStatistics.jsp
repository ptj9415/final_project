<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.2/chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
h3 {
	font-size: 24px;
	font-weight: 600;
}

.row {
	margin-bottom: -10px;
}

#headerp {
	position: relative;
	top: 7px;
	margin-left: 15px;
	font-size: 16px;
	font-weight: 600;
}

.minusbtn {
	float: right;
	background-color: transparent;
	border: none;
	margin-right: 15px;
}

.btndiv {
	float: right;
	width: 150px;
	margin-right: -8px;
}

#btnSearch {
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
	color: white;
	border: none;
	border-radius: 4px;
	height: 33px;
	width: 70px;
}

#clearbtn {
	background-color: white;
	color: #EB4646;
	border: 1px solid red;
	border-radius: 4px;
	height: 33px;
	width: 70px;
}

#chart {
	height: 400px;
	margin-left: 45px;
	margin-top: 45px;
}

#chartcard {
	height: 500px;
}

.status {
	display: block;
	width: 100%;
	height: calc(2.25rem + 1px);
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
	box-shadow: inset 0 0 0 transparent;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>상담 통계</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">
							검색
							<button type="button" class="minusbtn" id="minusbtn1">
								<i id="minusicon1" class="fa fa-minus"></i>
							</button>
						</p>
					</div>
				</div>
			</div>

			<div class="row" id="maindiv1">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<div class="card-header">
							<div class="row">
								<div class="col-6">
									<div class="form-group">
										<label>성별</label> <br> <select class="status"
											name="pr_type">
											<option value="all">전체</option>
											<option value="줌">줌</option>
											<option value="카카오톡">카카오톡</option>
											<option value="전화">전화</option>
										</select>
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>주제별</label> <br> <select class="status"
											name="ccg_subname">
											<option value="all">전체</option>
											<option value="분노">분노/우울</option>
											<option value="연애">연애/우정</option>
											<option value="진로">진로/취업</option>
											<option value="결혼">결혼/육아</option>
											<option value="청소년">청소년</option>
											<option value="가정">가정</option>
										</select>
									</div>
								</div>
							</div>
							<div class="btndiv">
								<button type="reset" id="clearbtn">초기화</button>
								<button type="button" id="btnSearch" onclick="clickFnc();">
									검색&nbsp;<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>

	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">
							상담 통계 조회
							<button type="button" class="minusbtn" id="minusbtn2">
								<i id="minusicon2" class="fa fa-minus"></i>
							</button>
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card" id="maindiv2">
						<div class="card-body table-responsive p-00">
							<div class="card" id="chartcard">
								<div id=chart>
									<canvas id="myChart"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
	</section>
</body>
<script>
$.ajax({
	url: 'counselorStatisticData.do',
	dataType: 'json',
	success: function(data) {
		console.log(data);
		
		var mylabel = [];
		var mydata = [];
		for(datas of data) {
			mylabel.push(datas.pr_date);
			mydata.push(datas.pr_count);
		}
			 const ctx = document.getElementById('myChart').getContext('2d');
		        const myChart = new Chart(ctx, {
		            type: 'line',
		            data: {
		                labels: mylabel,
		                datasets: [{
		                	lineTension:0,
		                    data: mydata,
		                    backgroundColor: [
		                    	'rgb(150, 178, 251)',
		                    	'rgb(150, 178, 251)',
		                    	'rgb(150, 178, 251)',
		                    	'rgb(150, 178, 251)',
		                    	'rgb(150, 178, 251)',
		                    	'rgb(150, 178, 251)',
		                    	'rgb(150, 178, 251)',
		                    	'rgb(150, 178, 251)',
		                    	'rgb(150, 178, 251)',
		                    	'rgb(150, 178, 251)',
		                    	'rgb(150, 178, 251)',
		                    	'rgb(150, 178, 251)'
		                    ],
		                    borderColor: [
		                        'rgb(150, 178, 251)',
		                        'rgb(150, 178, 251)',
		                        'rgb(150, 178, 251)',
		                        'rgb(150, 178, 251)',
		                        'rgb(150, 178, 251)',
		                        'rgb(150, 178, 251)',
		                        'rgb(150, 178, 251)',
		                        'rgb(150, 178, 251)',
		                        'rgb(150, 178, 251)',
		                        'rgb(150, 178, 251)',
		                        'rgb(150, 178, 251)',
		                        'rgb(150, 178, 251)'
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

function clickFnc() {
	var pr_type = $('select[name="pr_type"]').val();
	var ccg_subname = $('select[name="ccg_subname"]').val();
	$.ajax({
		url: 'counselorDataSearch.do',
		data: {pr_type:pr_type, ccg_subname:ccg_subname},
		success: function(data) {
			console.log(data);
			var chart = $('#chart');
			chart.remove();
				var container = $('#chartcard');
				var div = $('<div>');
				div.attr('id', 'chart');
				var canvas = $('<canvas>');
				canvas.attr('id', 'myChart');
				div.append(canvas);
				container.append(div);
				var mylabel = [];
				var mydata = [];
				
				for(datas of data) {
					mylabel.push(datas.pr_date);
					mydata.push(datas.pr_count);
				}
					 const ctx = document.getElementById('myChart').getContext('2d');
				        const myChart = new Chart(ctx, {
				            type: 'line',
				            data: {
				                labels: mylabel,
				                datasets: [{
				                	lineTension:0,
				                    data: mydata,
				                    backgroundColor: [
				                        'rgba(0, 0, 0, 0)'
				                    ],
				                    borderColor: [
				                        'rgb(150, 178, 251)'
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
}
</script>
</html>
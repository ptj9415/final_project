<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인상담 신청 step4</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script
	src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
<style>

/*calendar start*/
.sec_cal {
	width: 500px;
	margin-top: 100px;
	margin-left: 300px;
	font-family: "NotoSansR";
	height: 600px;
}

.sec_cal .cal_nav {
	display: flex;
	justify-content: center;
	align-items: center;
	font-weight: 700;
	font-size: 48px;
	line-height: 78px;
}

.sec_cal .cal_nav .year-month {
	width: 300px;
	text-align: center;
	line-height: 1;
}

.sec_cal .cal_nav .nav {
	display: flex;
	border: 1px solid #333333;
	border-radius: 5px;
}

.sec_cal .cal_nav .go-prev, .sec_cal .cal_nav .go-next {
	display: block;
	width: 50px;
	height: 78px;
	font-size: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

.sec_cal .cal_nav .go-prev::before, .sec_cal .cal_nav .go-next::before {
	content: "";
	display: block;
	width: 20px;
	height: 20px;
	border: 3px solid #000;
	border-width: 3px 3px 0 0;
	transition: border 0.1s;
}

.sec_cal .cal_nav .go-prev:hover::before, .sec_cal .cal_nav .go-next:hover::before
	{
	border-color: #ed2a61;
}

.sec_cal .cal_nav .go-prev::before {
	transform: rotate(-135deg);
}

.sec_cal .cal_nav .go-next::before {
	transform: rotate(45deg);
}

.sec_cal .cal_wrap {
	padding-top: 40px;
	position: relative;
	margin: 0 auto;
}

.sec_cal .cal_wrap .days {
	display: flex;
	margin-bottom: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #ddd;
}

.sec_cal .cal_wrap::after {
	top: 368px;
}

.sec_cal .cal_wrap .day {
	display: flex;
	align-items: center;
	justify-content: center;
	width: calc(100%/ 7);
	text-align: left;
	color: #999;
	font-size: 12px;
	text-align: center;
	border-radius: 5px
}

.current.today {
	background: #153e5429;
}

.sec_cal .cal_wrap .dates {
	display: flex;
	flex-flow: wrap;
	height: 290px;
}

.sec_cal .cal_wrap .day:nth-child(7n -1) {
	color: #3c6ffa;
}

.sec_cal .cal_wrap .day:nth-child(7n) {
	color: #ed2a61;
}

.sec_cal .cal_wrap .day.disable {
	color: #ddd;
}
/*calendar end*/
.md-stepper-horizontal {
	display: table;
	width: 100%;
	margin: 0 auto;
	background-color: #FFFFFF;
	box-shadow: 0 3px 8px -6px rgba(0, 0, 0, .50);
}

.md-stepper-horizontal .md-step {
	display: table-cell;
	position: relative;
	padding: 24px;
}

.md-stepper-horizontal .md-step:hover, .md-stepper-horizontal .md-step:active
	{
	/* background-color: rgba(0, 0, 0, 0.04); */
	
}

.md-stepper-horizontal .md-step:active {
	border-radius: 15%/75%;
}

.md-stepper-horizontal .md-step:first-child:active {
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
}

.md-stepper-horizontal .md-step:last-child:active {
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

.md-stepper-horizontal .md-step:hover .md-step-circle {
	background-color: #757575;
}

.md-stepper-horizontal .md-step:first-child .md-step-bar-left,
	.md-stepper-horizontal .md-step:last-child .md-step-bar-right {
	display: none;
}

.md-stepper-horizontal .md-step .md-step-circle {
	width: 30px;
	height: 30px;
	margin: 0 auto;
	background-color: #999999;
	border-radius: 50%;
	text-align: center;
	line-height: 30px;
	font-size: 16px;
	font-weight: 600;
	color: #FFFFFF;
}

.md-stepper-horizontal.green .md-step.active .md-step-circle {
	background-color: #00AE4D;
}

/*step1*/
.md-stepper-horizontal.orange .md-step.active .md-step-circle {
	background-color: #999999;
}
/*step2*/
.md-stepper-horizontal.orange .md-step.active .md-step-circle {
	background-color: #153e54;
}
/*step3*/
.md-stepper-horizontal.orange .md-step.active .md-step-circle {
	background-color: #999999;
}
/*step4*/
.md-stepper-horizontal.orange .md-step.active .md-step-circle {
	background-color: #153e54;
}

.md-stepper-horizontal .md-step.active .md-step-circle {
	background-color: rgb(33, 150, 243);
}

.md-stepper-horizontal .md-step.done .md-step-circle:before {
	font-family: 'FontAwesome';
	font-weight: 100;
	content: "\f00c";
}

.md-stepper-horizontal .md-step.done .md-step-circle *,
	.md-stepper-horizontal .md-step.editable .md-step-circle * {
	display: none;
}

.md-stepper-horizontal .md-step.editable .md-step-circle {
	-moz-transform: scaleX(-1);
	-o-transform: scaleX(-1);
	-webkit-transform: scaleX(-1);
	transform: scaleX(-1);
}

.md-stepper-horizontal .md-step.editable .md-step-circle:before {
	font-family: 'FontAwesome';
	font-weight: 100;
	content: "\f040";
}

.md-stepper-horizontal .md-step .md-step-title {
	margin-top: 16px;
	font-size: 16px;
	font-weight: 600;
}

.md-stepper-horizontal .md-step .md-step-title, .md-stepper-horizontal .md-step .md-step-optional
	{
	text-align: center;
	color: rgba(0, 0, 0, .26);
}

.md-stepper-horizontal .md-step.active .md-step-title {
	font-weight: 600;
	color: rgba(0, 0, 0, .87);
}

.md-stepper-horizontal .md-step.active.done .md-step-title,
	.md-stepper-horizontal .md-step.active.editable .md-step-title {
	font-weight: 600;
}

.md-stepper-horizontal .md-step .md-step-optional {
	font-size: 12px;
}

.md-stepper-horizontal .md-step.active .md-step-optional {
	color: rgba(0, 0, 0, .54);
}

.md-stepper-horizontal .md-step .md-step-bar-left,
	.md-stepper-horizontal .md-step .md-step-bar-right {
	position: absolute;
	top: 36px;
	height: 1px;
	border-top: 1px solid #DDDDDD;
}

.md-stepper-horizontal .md-step .md-step-bar-right {
	right: 0;
	left: 50%;
	margin-left: 20px;
}

.md-stepper-horizontal .md-step .md-step-bar-left {
	left: 0;
	right: 50%;
	margin-right: 20px;
}

.pb-2, .py-2 {
	margin-top: 100px;
}

#next-btn {
	width: 100px;
	height: 40px;
	border-radius: 50px;
	background-color: #153e54;
	color: white;
	border: solid 1px #153e54;
	font-size: 14px;
	cursor: pointer;
	position: relative;
}

#next-btn:hover {
	background: #fff;
	color: #153e54;
	border: solid 1px #153e54;
	transition: 0.3s ease-in-out;
	cursor: pointer;
}

#previous-btn {
	width: 100px;
	height: 40px;
	border-radius: 50px;
	background-color: #153e54;
	color: white;
	border: solid 1px #153e54;
	font-size: 14px;
	cursor: pointer;
	position: relative;
}

#previous-btn:hover {
	background: #fff;
	color: #153e54;
	border: solid 1px #153e54;
	transition: 0.3s ease-in-out;
	cursor: pointer;
}

.next-btn-field {
	margin-top: 30px;
	margin-bottom: 30px;
	padding-left: 100px;
}
/*next btn end*/

/*시간표 생성 style*/
.timediv {
	height: 400px;
	display: grid;
	grid-auto-rows: 50px;
	grid-template-columns: 120px 120px;
	margin-top:300px;
	margin-left:900px;
}

}
div.asdf {
	width: 150px;
}
/*시간표 생성 style end*/
#btn1, #btn2, #btn3, #btn4, #btn5, #btn6, #btn7, #btn8 {
	width: 80px;
	height: 40px;
	background-color: #153e54;
	border-radius: 30px;
	text-align: center;
	font-size: 14px;
	color: white;
	border: 0px;
}

#btn1:hover, #btn2:hover, #btn3:hover, #btn4:hover, #btn5:hover, #btn6:hover,
	#btn7:hover, #btn8:hover {
	width: 80px;
	height: 40px;
	border: 1px solid #153e54;
	background-color: white;
	border-radius: 30px;
	text-align: center;
	font-size: 14px;
	color: #153e54;
	transition: 300ms ease-in-out;
	cursor: pointer;
}

#btn1:disabled, #btn1[disabled] {
	border: 0px solid #999999;
	background-color: #d6d6d6;
	color: #666666;
	cursor: default;
}

#btn2:disabled, #btn2[disabled] {
	border: 0px solid #999999;
	background-color: #d6d6d6;
	color: #666666;
	cursor: default;
}

#btn3:disabled, #btn3[disabled] {
	border: 0px solid #999999;
	background-color: #d6d6d6;
	color: #666666;
	cursor: default;
}

#btn4:disabled, #btn4[disabled] {
	border: 0px solid #999999;
	background-color: #d6d6d6;
	color: #666666;
	cursor: default;
}

#btn5:disabled, #btn5[disabled] {
	border: 0px solid #999999;
	background-color: #d6d6d6;
	color: #666666;
	cursor: default;
}

#btn6:disabled, #btn6[disabled] {
	border: 0px solid #999999;
	background-color: #d6d6d6;
	color: #666666;
	cursor: default;
}

#btn7:disabled, #btn7[disabled] {
	border: 0px solid #999999;
	background-color: #d6d6d6;
	color: #666666;
	cursor: default;
}

#btn8:disabled, #btn8[disabled] {
	border: 0px solid #999999;
	background-color: #d6d6d6;
	color: #666666;
	cursor: default;
}

.total {
	width:80%;
	height: 1000px;
	display: grid;
	grid-auto-rows: 50px;
	grid-template-columns: 120px 120px;
	
}
</style>
</head>
<body>
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('resources/user/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 style="color: white">개인상담</h1>
				</div>
			</div>
		</div>

	</section>
	<div class="container">
		<div class="row justify-content-start mb-5 pb-2">
			<div
				class="col-md-4 heading-section ftco-animate fadeInUp ftco-animated">
				<span class="subheading subheading-with-line"><small
					class="pr-2 bg-white">MAEUMI</small></span>
				<h2 class="mb-4">개인상담 신청</h2>
			</div>
			<div
				class="col-md-8 pl-md-5 heading-section ftco-animate fadeInUp ftco-animated">
				<div class="pl-md-4 border-line">
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia, there live the blind texts.
						Separated they live in. A small river named Duden flows by their
						place and supplies it with the necessary regelialia. It is a
						paradisematic country, in which roasted parts of sentences fly
						into your mouth.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="md-stepper-horizontal orange">
		<div class="md-step active done">
			<div class="md-step-circle">
				<span>1</span>
			</div>
			<div class="md-step-title">step1</div>
			<div class="md-step-optional">상담 카테고리 선택</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
		<div class="md-step active editable">
			<div class="md-step-circle">
				<span>2</span>
			</div>
			<div class="md-step-title">step2</div>
			<div class="md-step-optional">상담사 선택</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
		<div class="md-step active done">
			<div class="md-step-circle">
				<span>3</span>
			</div>
			<div class="md-step-title">step3</div>
			<div class="md-step-optional">상담 방법 선택</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
		<div class="md-step active done">
			<div class="md-step-circle">
				<span>4</span>
			</div>
			<div class="md-step-title">step4</div>
			<div class="md-step-optional">상담 날짜 선택</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
	</div>

	<div class="total">
		<div class="sec_cal">
			<div class="cal_nav">
				<a href="javascript:;" class="nav-btn go-prev">prev</a>
				<div class="year-month"></div>
				<a href="javascript:;" class="nav-btn go-next">next</a>
			</div>
			<div class="cal_wrap">
				<div class="days">
					<div class="day">MON</div>
					<div class="day">TUE</div>
					<div class="day">WED</div>
					<div class="day">THU</div>
					<div class="day">FRI</div>
					<div class="day">SAT</div>
					<div class="day">SUN</div>
				</div>
				<div class="dates"></div>
			</div>
		</div>
		<form id="timeform" action="test4pg.do" method="post">
			<div class="timediv"></div>

			<input type="hidden" id="c_email" name="c_email" value="${c_email}">
			<input type="hidden" id="pr_type" name="pr_type" value="${type}">
			<input type="hidden" id="pr_price" name="pr_price" value="${price }">
			<input type="text" id="pr_date" name="pr_date" value="">
			<input type="hidden" id="pr_time" name="pr_time" value="">
			<input type="button" data-page="2" name="previous"
				class="previous action-button" value="Previous" id="previous-btn" />
			<input type="submit" data-page="2" name="next"
				class="next action-button" id="next-btn" value="신청하기" />
		</form>
	</div>
	<script>
		$('#previous-btn').click(function() {
			location.href = 'personalCounselStep3.do'
		});
		
		//calendar start
		
    $(document).ready(function () {
      calendarInit();

    });


    /*
        달력 렌더링 할 때 필요한 정보 목록 

        현재 월(초기값 : 현재 시간)
        금월 마지막일 날짜와 요일
        전월 마지막일 날짜와 요일
    */

    function calendarInit() {

      // 날짜 정보 가져오기
      var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
      var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
      var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
      var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)

      var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
      // 달력에서 표기하는 날짜 객체


      var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
      var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
      var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

      // kst 기준 현재시간
      // console.log(thisMonth);

      // 캘린더 렌더링
      renderCalender(thisMonth);

      function renderCalender(thisMonth) {

        // 렌더링을 위한 데이터 정리
        currentYear = thisMonth.getFullYear();
        currentMonth = thisMonth.getMonth();
        currentDate = thisMonth.getDate();

        // 이전 달의 마지막 날 날짜와 요일 구하기
        var startDay = new Date(currentYear, currentMonth, 0);
        var prevDate = startDay.getDate();
        var prevDay = startDay.getDay();

        // 이번 달의 마지막날 날짜와 요일 구하기
        var endDay = new Date(currentYear, currentMonth + 1, 0);
        var nextDate = endDay.getDate();
        var nextDay = endDay.getDay();
        

        // console.log(prevDate, prevDay, nextDate, nextDay);

        // 현재 월 표기
        $('.year-month').text(currentYear + '-' + (currentMonth + 1));

        // 렌더링 html 요소 생성
        calendar = document.querySelector('.dates')
        calendar.innerHTML = '';

        // 지난달
        for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
          calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
        }
        // 이번달
        for (var i = 1; i <= nextDate; i++) {
          calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '</div>'
        }
        // 다음달
        for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
          calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
        }

        // 오늘 날짜 표기
        if (today.getMonth() == currentMonth) {
          todayDate = today.getDate();
          var currentMonthDate = document.querySelectorAll('.dates .current');
          currentMonthDate[todayDate - 1].classList.add('today');
        }
        /*   test
         if(어쩌구....){
        	 
        	   $('.day.current').on('click', function () {
        	          var val = $(this).html();
        	          var c_email = $("#c_email").val();
        	       
        	          makediv(val,c_email);
        	        })
         }esle{
        	 
        	 $('.day.current').css('backgroundColor','#153e5429');
        	 $('.day.current').attr('dispaly',disabled);
         }
        test end   */
        
        
        $('.day.current').on('click', function () {
          var val = $(this).html();
          var c_email = $("#c_email").val();
          alert(c_email);
          makediv(val,c_email);
        });
      }

      // 이전달로 이동
      $('.go-prev').on('click', function () {
        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        renderCalender(thisMonth);
      });

      // 다음달로 이동
      $('.go-next').on('click', function () {
        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        renderCalender(thisMonth);
      });
    }

    function makediv(val,c_email) {
    	var yearmonth = $('.year-month').html();
    	var year = yearmonth.substr(0,4);
    	if(yearmonth.slice(-2, 5) == '-') {
    		var month = '0' + yearmonth.slice(-1);
    	} else {
    		var month = yearmonth.slice(-2);
    	}
    	if(val.length == 1) {
    		val = '0' + val;
    	}
    	var week = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat'];
    	var pr_date = year + '-' + month + '-' + val;
    	$("#pr_date").val(pr_date);
    	var cd_day = week[new Date(pr_date).getDay()];
    	var c_email = c_email;
    	$.ajax({
    		url: 'testTime.do',
    		type: 'get',
    		data: {cd_day:cd_day, c_email:c_email},
    		dataType: 'json',
    		success: function(data) {
				$('.asdf').remove();
				var timediv = $('.timediv');
				for (var i = 1; i < 9; i++) {
				let button1 = $('<div class="asdf">'+'<button id='+"btn"+ i + ' type="button" value='+(i+8) +' disabled="disabled">'+ (i+8)+'~'+(i+9)+'시' +'</button>'+'</div>');
				timediv.append(button1);
				}
				for (datas of data) {
					var time = datas.cd_time.substring(0,2);
					time = Number(time);
 					 for (var i = 1; i < 9; i++) {
					     var btns = $("#btn"+i).val();
						     if (btns == time) {
								 $("#btn"+i).attr("disabled", false);
							}
					}
/*  					var div = $('<div class="asdf">' + datas.cd_time + '</div>')
						timediv.append(div); */	 				
    			} 
					getTime(val,c_email);
    		},
    		error: function() {
    			alert('에러');
    		}
    	});
    }
    
    function getTime(val,c_email) {
    	var yearmonth = $('.year-month').html();
    	var year = yearmonth.substr(0,4);
    	if(yearmonth.slice(-2, 5) == '-') {
    		var month = '0' + yearmonth.slice(-1);
    	} else {
    		var month = yearmonth.slice(-2);
    	}
    	var week = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat'];
    	var pr_date = year + '-' + month + '-' + val;
    	var cd_day = week[new Date(pr_date).getDay()];
    	var c_email = c_email;
    	console.log('asdf');
    	$.ajax({
			url: 'testTimeselect.do',
			type: 'get',
			data: {pr_date:pr_date, c_email:c_email},
			dataType: 'json',
			success: function(data) {
				var div = $('.asdf');
				for(datas of data) {
					var pr_time = datas.pr_time.substring(0,2);
					pr_time = Number(pr_time);
 					 for (var i = 1; i < 9; i++) {
					     var btns = $("#btn"+i).val();
						     if (btns == pr_time) {
						    	 
								 $("#btn"+i).attr("disabled", true);
							}
					}
/* 					$('.asdf').each(function() {
S						if($(this).html() == datas.pr_time) {
						$(this).attr("disabled", true);	
						}
					}); */
				}
			},
			error: function() {
				alert('에러');
			}
		});
    }
    
		//calendar end
		 $("body").click(function(){
			var counselTime = event.target.value;
			if (counselTime != "신청하기") {
			$("#pr_time").val(counselTime);				
			}
		})
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.sec_cal {
	width: 360px;
	margin-right:100px;
	margin-left:100px;
	margin-top:100px;
	margin-bottom:100px;
	font-family: "NotoSansR";
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
	background: rgb(242, 242, 242);
}

.sec_cal .cal_wrap .dates {
	display: flex;
	flex-flow: wrap;
	height: 290px;
}
.dates:hover{
 	cursor:pointer;
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

/*시간표 생성 style*/
.timediv{

	background-color:#ffffff;
	width:200px;
	height:400px;
}
/*시간표 생성 style end*/
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
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
	<div class="timediv"></div>
	<script>
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
        $('.day.current').on('click', function () {
          var val = $(this).html();
          makediv(val);
        })
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

    function makediv(val) {
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
    	var cd_day = week[new Date(pr_date).getDay()];
    	var c_email = '3244509@naver.com';
    	$.ajax({
    		url: 'testTime.do',
    		type: 'get',
    		data: {cd_day:cd_day, c_email:c_email},
    		dataType: 'json',
    		success: function(data) {
				$('.asdf').remove();
    			for (datas of data) {
					var div = $('<div class="asdf">' + datas.cd_time + '</div>')
					var timediv = $('.timediv');
					timediv.append(div);					
    			}
					getTime(val);
    		},
    		error: function() {
    			alert('에러');
    		}
    	});
    }
    
    function getTime(val) {
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
    	var c_email = '3244509@naver.com';
    	console.log('asdf');
    	$.ajax({
			url: 'testTimeselect.do',
			type: 'get',
			data: {pr_date:pr_date, c_email:c_email},
			dataType: 'json',
			success: function(data) {
				var div = $('.asdf');
				for(datas of data) {
					$('.asdf').each(function() {
						if($(this).html() == datas.pr_time) {
						$(this).css('background-color', 'red');	
						}
					});
				}
			},
			error: function() {
				alert('에러');
			}
		});
    }
  </script>
</body>
</html>
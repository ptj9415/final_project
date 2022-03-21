<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Google Font: Source Sans Pro -->
		  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
		  <!-- Font Awesome -->
		  <link rel="stylesheet" href="subHomeFile/plugins/fontawesome-free/css/all.min.css">
		  <!-- fullCalendar -->
		  <link rel="stylesheet" href="subHomeFile/plugins/fullcalendar/main.css">
		  <!-- Theme style -->
		  <link rel="stylesheet" href="subHomeFile/dist/css/adminlte.min.css">
		  <!-- Select2 -->
 		  <link rel="stylesheet" href="subHomeFile/plugins/select2/css/select2.min.css">
<style>
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
	background-color: #468FB6;
}
/*step3*/
.md-stepper-horizontal.orange .md-step.active .md-step-circle {
	background-color: #999999;
}
/*step4*/
.md-stepper-horizontal.orange .md-step.active .md-step-circle {
	background-color: #468FB6;
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

*, *::before, *::after {
	box-sizing: border-box;
}

.pb-2, .py-2 {
	margin-top: 100px;
}

body {
	font-weight: 400;
	letter-spacing: 0;
	text-rendering: optimizeLegibility;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	-moz-font-feature-settings: "liga" on;
	width: 100%;
	margin-right: auto;
	margin-left: auto;
}

p {
	display: block;
	float: right;
	margin-right: 20px;
	margin-block-start: 0.5em;
	margin-block-end: 0.6em;
	margin-inline-start: 0px;
	/* margin-inline-end: 0px; */
}

img {
	height: auto;
	max-width: 100%;
	vertical-align: middle;
}

.btn {
	background-color: white;
	border: 1px solid #468FB6;
	color: #468FB6;
	padding: 0.5rem;
	text-transform: lowercase;
	border-radius: 30px;
	margin-right: auto;
	margin-left: auto;
	margin-right: 20px;
}

.btn:hover {
	transition: 0.3s ease-in-out;
	background-color: #468FB6;
	color: white;
	cursor: pointer;
}

.card__doctor {
	/* background-color: white;
    /* border: 1px solid #468FB6; */
	/* color: #468FB6; */
	/* padding: 0.5rem;  */
	text-transform: lowercase;
	border-radius: 30px;
	font-size: 0.8em;
	width: 100%;
}

.btn--block {
	display: block;
	width: 30%;
}

/*detail start*/
.row{
	margin-bottom:100px;
}
.container mt-5 {
   
    width: 80%;
    margin-right:auto;
    margin-left:auto;
    border-radius:40px;
    margin-bottom:100px;
  }
  
  .date__box {
    position: absolute;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    color: #ccc;
    border: 4px solid;
    font-weight: bold;
    padding: 5px 10px;
  }
  .date__box .date__day {
    font-size: 22px;
  }
  
  .blog-card {
    padding: 30px;
    position: relative;
  }
  .blog-card .date__box {
    opacity: 0;
    transform: scale(0.5);
    transition: 500ms ease-in-out;
  }
  .blog-card .blog-card__background,
  .blog-card .card__background--layer {
    z-index: -1;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
  }
  .blog-card .blog-card__background {
    padding: 15px;
    background: white;
  }
  .blog-card .card__background--wrapper {
    height: 80%;
    clip-path: polygon(0 0, 100% 0, 100% 80%, 0 80%);
    position: relative;
    overflow: hidden;
  }
  .blog-card .card__background--main {
    height: 100%;
    position: relative;
    transition: 300ms ease-in-out;
    background-repeat: no-repeat;
    background-size: cover;
  }
  .blog-card .card__background--layer {
    z-index: 0;
    opacity: 0;
    background: rgba(51, 51, 51, 0.9);
    transition: 300ms ease-in-out;
  }
  .blog-card .blog-card__head {
    height: 300px;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .blog-card .blog-card__info {
    z-index: 10;
    background: white;
    padding: 20px 15px;
    border-radius:40px;
  }
  .blog-card .blog-card__info h5 {
    transition: 300ms ease-in-out;
  }
  
  a.icon-link {
    color: #363738;
    transition: 200ms ease-in-out;
  }
  a.icon-link i {
    color: #468FB6;
  }
  a.icon-link:hover {
    color: #468FB6;
    text-decoration: none;
  }
  
  .btn {
    background: white;
    color: #363738;
    font-weight: bold;
    outline: none;
    box-shadow: 1px 1px 3px 0 rgba(0, 0, 0, 0.2);
    overflow: hidden;
    border-radius: 0;
    height: 50px;
    line-height: 50px;
    display: inline-block;
    padding: 0;
    border: none;
  }
  .btn:focus {
    box-shadow: none;
  }
  .btn:hover {
    background: #468FB6;
    color: #fff;
  }
  .btn.btn--with-icon {
    padding-right: 20px;
  }
  .btn.btn--with-icon i {
    padding: 0px 30px 0px 15px;
    margin-right: 10px;
    height: 50px;
    line-height: 50px;
    vertical-align: bottom;
    color: white;
    background: #468FB6;
    clip-path: polygon(0 0, 70% 0, 100% 100%, 0% 100%);
  }
  .btn.btn--only-icon {
    width: 50px;
  }
  

/*detail end*/

/*button start*/
.btn--block {
    display: block;
    width: 30%;
}
.apply-btn {
   background-color: #468FB6;
    border: 0px solid white;
    color: white;
    text-transform: lowercase;
    border-radius: 30px;
    /* margin-right: auto; */
    margin-left: auto;
    margin-right: 80px;
    padding: 0.5rem;
    width: 100px;
}
.apply-btn:hover {
   background-color: white;
    border: 1px solid #468FB6;
    color: #468FB6;
    text-transform: lowercase;
    border-radius: 30px;
    /* margin-right: auto; */
    margin-left: auto;
    margin-right: 80px;
    padding: 0.5rem;
    width: 100px;
    transition: 300ms ease-in-out;
   
}

.apply-btn:after{
	border: 0px;
}

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
	font-weight: 600;
}

#infotable {
	width: 100%;
	height: 150px;
}

#infotable>tbody>tr>th {
	width: 10%;
	text-align: center;;
}

#infotable>tbody>tr>td {
	width: 40%;
}

#gc_title {
	width: 57%;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#gc_startdate, #gc_finaldate {
	widgh: 100%;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#gc_date, #gc_time {
	widgh: 50%;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#gc_min_person, #gc_max_person {
	width: 17%;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#gc_type {
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
	width: 40%;
}

#gc_price {
	width: 45%;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#counseltable>tbody>tr>th {
	text-align: center;
	vertical-align: middle;
}

#gc_kakao {
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
	width: 40%;
}

.filebox .uploadname, .filebox .uploadname1 {
	display: inline-block;
	height: 40px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	width: 31%;
	color: #999999;
}

.filebox label {
	display: inline-block;
	padding: 7px 20px;
	color: #fff;
	vertical-align: middle;
	background-color: #999999;
	cursor: pointer;
	height: 40px;
	margin-left: 10px;
	margin-top: 8px;
}

.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

#modify2 {
	float: right;
	height: 35px;
	border: none;
	border-radius: 5px;
	background-color: #1E90FF;
	color: white;
}

#backbtn {
	float: right;
	width: 80px;
	height: 35px;
	margin-right: 10px;
	border: 1px solid red;
	border-radius: 5px;
	background-color: white;
	color: red;
}

#closebtn {
	float: right;
	height: 35px;
	margin-right: 10px;
	border: none;
	border-radius: 5px;
	background-color: red;
	color: white;
}

textarea {
	width: 40%;
	height: 6.25em;
	resize: none;
}

.mainForm{
	margin-left: 50px;
}
.myInfoForm {
	padding: 20px;
	border: 1px solid gray;
	width: 40%;
}
.myInfo {
	margin-top: 15px;
}
.changeBtn {
	width:100px;
	float: right;
}
.myInfoInput {
	border: 0px solid gray;
	width: 250px;
}
#changeCheck {
	display: none;
}
</style>
</head>
<body>
				<section class="hero-wrap hero-wrap-2">
	<img src="img/bannerimg/mypage.png" id="bannerimg">
	</section>

<div class="container">
		<div class="row justify-content-start mb-5 pb-2">
			<div
				class="col-md-4 heading-section ftco-animate fadeInUp ftco-animated">
				<span class="subheading subheading-with-line"><small
					class="pr-2 bg-white">MAEUMI</small></span>
				<h2 class="mb-4">그룹 상담 정보 조회</h2>
			</div>
			<div
				class="col-md-8 pl-md-5 heading-section ftco-animate fadeInUp ftco-animated">
				<div class="pl-md-4 border-line">
					<p>그룹 상담 정보를 보여주는 페이지입니다.</p>
			</div>
		</div>
	</div>
</div>

<section class="content">
	<div class="container-fluid">
		<br>
			<div class="row">
				<div class="col-md-1 offset-md-0"></div>
				<div class="col-md-10 offset-md-0">
					<div class="card">
						<p id="headerp">신청 정보</p>
					</div>
				</div>
			</div>
			<div class="row">
			<div class="col-1"></div>
				<div class="col-10">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<br>
							<table class="table text-nowrap" id="infotable">
								<tr>
									<th>신청 일시</th>
									<td>${glist.gr_reservedate}</td>
								</tr>
								<tr>
									<th>상태</th>
									<c:if test="${glist.gc_status eq 0 }">
											<td>신청 완료</td>
									</c:if>
									<c:if test="${glist.gc_status eq 1 }">
											<td>상담 완료</td>
									</c:if>
									<c:if test="${glist.gc_status eq 2 }">
											<td>환불 완료</td>
									</c:if>
								</tr>
								<tr>
									<th>상담 구분</th>
									<td>그룹 상담</td>
								</tr>
								<tr>
									<th>결제 금액</th>
									<td>${glist.gr_price}</td>
								</tr>
							</table>
							<br>
						</div>
					</div>
				</div>
			</div>
	</div>
</section>
<br><br><br>
<section class="content">
	<div class="container-fluid">
		<br>
			<div class="row">
				<div class="col-md-1 offset-md-0"></div>
				<div class="col-md-10 offset-md-0">
					<div class="card">
						<p id="headerp">상담 정보</p>
					</div>
				</div>
			</div>
			<div class="row">
			<div class="col-1"></div>
				<div class="col-10">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<br>
							<table class="table text-nowrap" id="infotable">
								<tr>
									<th>상담일자</th>
									<td>${glist.gc_date}</td>
								</tr>
								<tr>
									<th>시작 날짜 ~ 마감 날짜</th>
									<td>${glist.gc_startdate} ~ ${glist.gc_finaldate}</td>
								</tr>
								<tr>
									<th>상담사</th>
									<td>${glist.c_name}</td>
								</tr>
								<th>최소인원 ~ 최대인원</th>
								<td>${glist.gc_min_person}명 ~ ${glist.gc_max_person}명</td>
								<tr>
									<th>신청 인원</th>
									<td>${glist.gc_person}명</td>
								</tr>
								<tr>
									<th>상담 방식</th>
									<td>${glist.gc_type}</td>
								</tr>
								<tr>
									<th>내 용</th>
									<td>${glist.gc_report}</td>
								</tr>
							</table>
							<br>
						</div>
					</div>
				</div>
			</div>
	</div>
</section>
<br><br><br>
<%-- <button type="button" onclick="groupDetail('${glist.gc_no}','${glist.gr_no }')">환불하기</button> --%>
<button type="button" onclick="location.href='userMypages.do'">돌아가기</button>
<script>
		function groupDetail(gc_no, gr_no){
			if (confirm("환불 하시겠습니까??") == true) { 
					url = "mypageGroupDetailRefund.do";
					url = url + "?gc_no="+gc_no;
					url = url + "&gr_no="+gr_no;
					location.href = url;
			}
		}
</script>
<!-- Bootstrap 4 -->
<script src="subHomeFile/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Select2 -->
<script src="subHomeFile/plugins/select2/js/select2.full.min.js"></script>
<!-- AdminLTE App -->
<script src="subHomeFile/dist/js/adminlte.min.js"></script>
</body>
</html>
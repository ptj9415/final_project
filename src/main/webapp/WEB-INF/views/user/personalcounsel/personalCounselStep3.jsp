<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script
	src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
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

/*step3*/
input.type-btn {
	padding-left: 20px;
	padding-right: 20px;
	width: 100px;
	height: 50px;
}

div.counsel-type {
	margin-left: auto;
	margin-right: auto;
}

/*step 3end*/
.choice-btn {
	width: 70%;
	margin-right: auto;
	margin-left: auto;
	margin-top: 100px;
	margin-bottom: 100px;
	padding: 50px;
    border: 1px solid #8dacbd42;
    border-radius: 30px;
     box-shadow: 0px 0px 20px #00000040;
}

.chat-btn {
	width: 100px;
	height: 45px;
	border: 1px solid #153e54;
	background-color: white;
	border-radius: 20px;
}

.chat-img {
	width: 150px;
	height: 150px;
}

.row mt-5 pt-4{
	display:grid;
	grid-auto-rows: 50px;
	grid-template-columns: 80px 80px;
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
					<h1 style="color: white">????????????</h1>
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
				<h2 class="mb-4">???????????? ??????</h2>
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
			<div class="md-step-optional">?????? ???????????? ??????</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
		<div class="md-step active editable">
			<div class="md-step-circle">
				<span>2</span>
			</div>
			<div class="md-step-title">step2</div>
			<div class="md-step-optional">????????? ??????</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
		<div class="md-step active">
			<div class="md-step-circle">
				<span>3</span>
			</div>
			<div class="md-step-title">step3</div>
			<div class="md-step-optional">?????? ?????? ??????</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
		<div class="md-step">
			<div class="md-step-circle">
				<span>4</span>
			</div>
			<div class="md-step-title">step4</div>
			<div class="md-step-optional">?????? ?????? ??????</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
	</div>

<form id="step3" action="personalCounselStep4.do" method="post">
<!-- <form id="step3" action="personalCounselStep4.do" method="post"> -->
	<div class="choice-btn">
		<div class="row mt-5 pt-4">
		
		<c:if test="${counselorSelect.p_kakao eq 1 }">
			<div class="col-md-4 ftco-animate fadeInUp ftco-animated">
				<img src="resources/user/images/chat.PNG" class="chat-img">
				<h3 class="h4">????????????</h3>
				<input type=button class="chat-btn" value="${counselorSelect.p_kakaoprice }"><br><br>
				<input type=checkbox class="chat-btn" name="c-type" value="${counselorSelect.p_kakaoprice}/????????????">
			</div>
		</c:if>		
		<c:if test="${counselorSelect.p_zoom eq 1 }">
			
			<div class="col-md-4 ftco-animate fadeInUp ftco-animated">
				<img src="resources/user/images/zoom.png" class="chat-img">
				<h3 class="h4">???</h3>
				<input type=button class="chat-btn" value="${counselorSelect.p_zoomprice }"><br><br>
				<input type=checkbox class="chat-btn" name="c-type" value="${counselorSelect.p_zoomprice}/???">

			</div>
		</c:if>			
		<c:if test="${counselorSelect.p_phone eq 1 }">
			<div class="col-md-4 ftco-animate fadeInUp ftco-animated">
				<img src="resources/user/images/phone.png" class="chat-img">
				<h3 class="h4">??????</h3>
				<input type=button class="chat-btn" value="${counselorSelect.p_phoneprice}"><br><br>
				<input type=checkbox class="chat-btn" name="c-type" value="${counselorSelect.p_phoneprice}/??????">

			</div>
		</c:if>	
		</div>
	</div>
	<input type="hidden" name="c_email" class="btn btn-primary px-4 py-3 mt-3" value="${email}" >
	<input type="hidden" id="onecheck" name="onecheck" value="${type }"> 
	<input type="button" data-page="2" name="previous"class="previous action-button" value="Previous" id="previous-btn" />
	<input type="submit" data-page="2" name="next"
		class="next action-button" id="next-btn" value="Next" />
</form>
	<script>
		$('#previous-btn').click(function() {
			location.href = 'personalCounselStep2.do'
		});

		/*  $('#next-btn').click(function() {
			step3.submit();
			var email = document.getElementById("email").value;
			location.href = 'personalCounselStep4.do'
		});  */
		
	</script>
</body>
</html>
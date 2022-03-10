<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
<title>개인상담</title>
<style>
.hero-wrap.hero-wrap-2 .slider-text .bread {
    font-weight: 900;
    color: #fff;
}

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

.pb-2, .py-2 {
	margin-top: 100px;
}

/*arccordion start*/
@charset "UTF-8";

.card-accordion {
	position: relative;
	overflow: hidden;
	border: 1px solid #468FB6;
	border-radius: 8px;
	transition: 0.20s ease-in-out;
	margin-right: auto;
	margin-left: auto;
	width: 65%;
	color: #4f4f4f;
	border-radius: 10px;
	margin-top: 1rem;
}

.card-accordion:hover {
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.12);
}

.card-accordion .card-accordion-checkbox {
	position: absolute;
	opacity: 0;
	z-index: -1;
}

.card-accordion .card-accordion-label {
	content: "▲";
	display: block;
	padding: 20px 30px;
	color: #468FB6;
	position: relative;
	cursor: pointer;
	font-weight: bold;
}

.card-accordion .card-accordion-label::after {
	content: "▶";
	font-family: FontAwesome;
	font-size: 0.75rem;
	position: absolute;
	top: 28px;
	right: 30px;
	color: #468FB6;
	transition: 0.30s ease-in-out;
	transform-origin: center center;
}

.card-accordion .card-accordion-content {
	max-height: 0;
	opacity: 0;
	overflow: hidden;
	transition: 0.4s;
}

.card-accordion .card-accordion-content .card-accordion-content-inner {
	padding: 0px 40px 40px 40px;
}

.card-accordion input:checked ~ .card-accordion-content {
	max-height: 20em;
	opacity: 1;
	padding-left: 30px;
	padding-bottom: 20px;
	padding-top: 20px
}

.card-accordion input:checked ~ .card-accordion-label::after {
	transform: rotate(90deg);
	transition: 0.5s;
}

.mini-p {
	font-size: 0.8em;
}

.text-field {
	width: 50%;
	height: 100px;
	border: 1px solid lightgray;
	margin-top: 20px;
}

.category-detail {
	margin-top: 60px;
	margin-bottom: 100px;
}
/*arccordion end*/
/*next btn*/
#next-btn {
	width: 100px;
	height: 40px;
	border-radius: 50px;
	background-color: #468FB6;
	color: white;
	border: solid 1px #468FB6;
	font-size: 14px;
	cursor: pointer;
	position: relative;
	margin-top:20px;
	margin-bottom:20px;
	margin-right:100px;
	float:right;
}

#next-btn:hover {
	background: #fff;
	color: #468FB6;
	border: solid 1px #468FB6;
	transition: 0.3s ease-in-out;
	cursor: pointer;
}

.next-btn-field {
	margin-top: 30px;
	margin-bottom: 30px;
	padding-left: 100px;
}
/*next btn end*/
/*buttons*/
.steps .next, .steps .submit {
	float: right;
}

.steps .previous {
	float: left;
}

.steps .action-button:hover, .steps .action-button:focus, .action-button:hover,
	.action-button:focus {
	background: #fff;
	color: #468FB6;
	border: solid 1px #468FB6;
}

.steps .explanation {
	display: block;
	clear: both;
	width: 100%;
	background: #f2f2f2;
	position: relative;
	/* margin-left: -30px; */
	padding: 22px 0px;
	margin-bottom: -10px;
	border-bottom-left-radius: 3px;
	border-bottom-right-radius: 3px;
	top: 10px;
	text-align: center;
	color: #333333;
	font-size: 12px;
	font-weight: 200;
	cursor: pointer;
}


.next-btn{
	float:right;
	padding-bottom:100px;
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
		<div class="md-step">
			<div class="md-step-circle">
				<span>2</span>
			</div>
			<div class="md-step-title">step2</div>
			<div class="md-step-optional">상담사 선택</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
		<div class="md-step">
			<div class="md-step-circle">
				<span>3</span>
			</div>
			<div class="md-step-title">step3</div>
			<div class="md-step-optional">상담 방법 선택</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
		<div class="md-step">
			<div class="md-step-circle">
				<span>4</span>
			</div>
			<div class="md-step-title">step4</div>
			<div class="md-step-optional">상담 날짜 선택</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
	</div>

	<form id="step1" action="personalCounselStep2.do">

		<div class="category-detail">

			<div class="card-accordion">
				<input id="card-1" class="card-accordion-checkbox" type="checkbox">
				<label class="card-accordion-label" for="card-1">분노/우울</label>
				<div class="card-accordion-content">
					<label><input name="onecheck" type="checkbox" value="우울/불안"
						onclick="doOpenCheck(this);"> 우울/불안</label><br> 
						<label><input name="onecheck" type="checkbox" value="분노"
						onclick="doOpenCheck(this);"> 분노</label><br> <label><input
						name="onecheck" type="checkbox" value="무기력 자존감상실"
						onclick="doOpenCheck(this);"> 무기력 자존감상실</label><br> <label><input
						name="onecheck" type="checkbox" value="자살"
						onclick="doOpenCheck(this);"> 자살</label>
					<p class="mini-p">* 세부카테고리는 한 항목만 선택 가능합니다</p>
				</div>
			</div>
			<div class="card-accordion">
				<input id="card-2" class="card-accordion-checkbox" type="checkbox">
				<label class="card-accordion-label" for="card-2">사랑/우정</label>
				<div class="card-accordion-content">
					<label><input name="onecheck" type="checkbox" value="연인" onclick="doOpenCheck(this);"> 연인</label><br> 
					<label><input name="onecheck" type="checkbox" value="데이트폭력" onclick="doOpenCheck(this);"> 데이트폭력</label><br> 
					<label><input name="onecheck" type="checkbox" value="친구관계" onclick="doOpenCheck(this);"> 친구관계</label><br> 
					<label><input name="onecheck" type="checkbox" value="부부" onclick="doOpenCheck(this);"> 이별</label><br> 
					<label><input name="onecheck" type="checkbox" onclick="doOpenCheck(this);">부부관계</label>
						<!-- <input name="onecheck" class="text-field" type="text"
				placeholder="직접입력..">  -->
					<p class="mini-p">* 세부카테고리는 한 항목만 선택 가능합니다</p>

				</div>
			</div>
			<div class="card-accordion">
				<input id="card-3" class="card-accordion-checkbox" type="checkbox">
				<label class="card-accordion-label" for="card-3">진로/취업</label>
				<div class="card-accordion-content">
					<label><input name="onecheck" type="checkbox" value="진로" onclick="doOpenCheck(this);"> 진로</label><br> 
					<label><input name="onecheck" type="checkbox" value="취업준비" onclick="doOpenCheck(this);"> 취업준비</label><br> 
					<label><input name="onecheck" type="checkbox" value="동료관계" onclick="doOpenCheck(this);"> 동료관계</label><br>
					<p class="mini-p">* 세부카테고리는 한 항목만 선택 가능합니다</p>

				</div>
			</div>
			<input type="submit" data-page="2" name="next" class="next action-button" id="next-btn" value="Next" />
		</div>
			
			
	</form>
	<input type="hidden" data-page="2" name="previous"
		class="previous action-button" value="Previous" />
	


	<script>
		function doOpenCheck(chk) {
			var obj = document.getElementsByName("onecheck");
			for (var i = 0; i < obj.length; i++) {
				if (obj[i] != chk) {
					obj[i].checked = false;
				}
			}
		}

	
	</script>
</body>
</html>
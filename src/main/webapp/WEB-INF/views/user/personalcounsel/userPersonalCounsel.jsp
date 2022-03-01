<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script
	src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
<title>개인상담</title>
<style>
.tagcloud button {
	text-transform: uppercase;
	display: inline-block;
	padding: 7px 15px;
	margin-bottom: 7px;
	margin-right: 4px;
	border-radius: 15px;
	transition: .3s all ease;
	border: 1px solid #468FB6;
	font-size: 11px;
	background-color: white;
	color: #468FB6;
}

/*basic reset*/
* {
	margin: 0;
	padding: 0;
}

html {
	/* height: 100%; */
	/*Image only BG fallback*/
	/*  background: #e9e9e9; */
	
}

body {
	background: #e9e9e9;
	font-family: montserrat, arial, verdana;
	width: 100%;
	height: 30%;
	overflow-x: hidden;
}
/*form styles*/
.steps {
	width: 900px;
	margin: 50px auto;
	position: relative;
}

.steps fieldset {
	background: white;
	border: 0 none;
	border-radius: 3px;
	box-shadow: 0 17px 41px -21px rgb(0, 0, 0);
	padding: 20px 30px;
	border-top: 9px solid #468FB6;
	box-sizing: border-box;
	width: 900px;
	/*  margin: 0 10%; */
	margin-right: auto;
	margin-left: auto;

	/*stacking fieldsets above each other*/
	/*   position: absolute;  */
}
/*Hide all except first fieldset*/
.steps fieldset:not(:first-of-type) {
	display: none;
}
/*inputs*/
.steps label {
	color: #333333;
	text-align: left !important;
	font-size: 15px;
	font-weight: 200;
	padding-bottom: 7px;
	padding-top: 12px;
	display: inline-block;
}

.steps input, .steps textarea {
	outline: none;
	display: inline-block;
	width: 33%;
	margin: 0 0 20px;
	margin-left: auto;
	margin-right: auto;
	padding: 10px 15px;
	border: 1px solid #d9d9d9;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	color: #837e7e;
	font-family: "Roboto";
	-webkti-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	font-size: 14px;
	font-wieght: 400;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	-webkit-transition: all 0.3s linear 0s;
	-moz-transition: all 0.3s linear 0s;
	-ms-transition: all 0.3s linear 0s;
	-o-transition: all 0.3s linear 0s;
	transition: all 0.3s linear 0s;
	padding: 10px 15px;
}

.steps input:focus, .steps textarea:focus {
	color: #333333;
	border: 1px solid #468FB6;
}

.error1 {
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	-moz-box-shadow: 0 0 0 transparent;
	-webkit-box-shadow: 0 0 0 transparent;
	box-shadow: 0 0 0 transparent;
	position: absolute;
	left: 525px;
	margin-top: -58px;
	padding: 0 10px;
	height: 39px;
	display: block;
	color: #ffffff;
	background: #e62163;
	border: 0;
	font: 14px Corbel, "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans",
		"DejaVu Sans", "Bitstream Vera Sans", "Liberation Sans", Verdana,
		"Verdana Ref", sans-serif;
	line-height: 39px;
	white-space: nowrap;
}

.error1:before {
	width: 0;
	height: 0;
	left: -8px;
	top: 14px;
	content: "";
	position: absolute;
	border-top: 6px solid transparent;
	border-right: 8px solid #e62163;
	border-bottom: 6px solid transparent;
}

.error-log {
	margin: 5px 5px 5px 0;
	font-size: 19px;
	position: relative;
	bottom: -2px;
}

.question-log {
	margin: 5px 1px 5px 0;
	font-size: 15px;
	position: relative;
	bottom: -2px;
}

/*buttons*/
.steps .action-button, .action-button {
	width: 100px !important;
	background: #468FB6;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 30px;
	cursor: pointer;
	padding: 10px 5px;
	margin: 10px auto;
	-webkit-transition: all 0.3s linear 0s;
	-moz-transition: all 0.3s linear 0s;
	-ms-transition: all 0.3s linear 0s;
	-o-transition: all 0.3s linear 0s;
	transition: all 0.3s linear 0s;
	display: block;
}

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

/*headings*/
.fs-title {
	text-transform: uppercase;
	margin: 0 0 5px;
	line-height: 1;
	color: #468FB6;
	font-size: 18px;
	font-weight: 400;
	text-align: center;
}

.fs-subtitle {
	font-weight: normal;
	font-size: 13px;
	color: #837e7e;
	margin-bottom: 20px;
	text-align: center;
}
/*progressbar*/
#progressbar {
	margin-bottom: 30px;
	overflow: hidden;
	/*CSS counters to number the steps*/
	counter-reset: step;
	width: 100%;
	text-align: center;
}

#progressbar li {
	list-style-type: none;
	color: rgb(51, 51, 51);
	text-transform: uppercase;
	font-size: 9px;
	width: 20%;
	float: left;
	position: relative;
}

#progressbar li:before {
	content: counter(step);
	counter-increment: step;
	width: 20px;
	line-height: 20px;
	display: block;
	font-size: 10px;
	color: #333;
	background: white;
	border-radius: 3px;
	margin: 0 auto 5px auto;
}
/*progressbar connectors*/
#progressbar li:after {
	content: "";
	width: 100%;
	height: 2px;
	background: white;
	position: absolute;
	left: -50%;
	top: 9px;
	z-index: -1; /*put it behind the numbers*/
}

#progressbar li:first-child:after {
	/*connector not needed before the first step*/
	content: none;
}
/*marking active/completed steps green*/
/*The number of the step and the connector before it = green*/
#progressbar li.active:before, #progressbar li.active:after {
	background: #468FB6;
	color: white;
}

/* my modal */
.modal p {
	font-size: 15px;
	font-weight: 100;
	font-family: sans-serif;
	color: #3c3b3b;
	line-height: 21px;
}

.modal {
	position: fixed;
	top: 50%;
	left: 50%;
	width: 50%;
	max-width: 630px;
	min-width: 320px;
	height: auto;
	z-index: 2000;
	visibility: hidden;
	-moz-backface-visibility: hidden;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

.modal.modal-show {
	visibility: visible;
}

.lt-ie9 .modal {
	top: 0;
	margin-left: -315px;
}

.modal-content {
	background: #ffffff;
	position: relative;
	margin: 0 auto;
	padding: 40px;
	border-radius: 3px;
}

.modal-overlay {
	background: #000000;
	position: fixed;
	visibility: hidden;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1000;
	filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
	opacity: 0;
	-moz-transition-property: visibility, opacity;
	-o-transition-property: visibility, opacity;
	-webkit-transition-property: visibility, opacity;
	transition-property: visibility, opacity;
	-moz-transition-delay: 0.5s, 0.1s;
	-o-transition-delay: 0.5s, 0.1s;
	-webkit-transition-delay: 0.5s, 0.1s;
	transition-delay: 0.5s, 0.1s;
	-moz-transition-duration: 0, 0.5s;
	-o-transition-duration: 0, 0.5s;
	-webkit-transition-duration: 0, 0.5s;
	transition-duration: 0, 0.5s;
}

.modal-show .modal-overlay {
	visibility: visible;
	filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=60);
	opacity: 0.6;
	-moz-transition: opacity 0.5s;
	-o-transition: opacity 0.5s;
	-webkit-transition: opacity 0.5s;
	transition: opacity 0.5s;
}

/*slide*/
.modal[data-modal-effect|="slide"] .modal-content {
	filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
	opacity: 0;
	-moz-transition: all 0.5s 0;
	-o-transition: all 0.5s 0;
	-webkit-transition: all 0.5s 0;
	transition: all 0.5s 0;
}

.modal[data-modal-effect|="slide"].modal-show .modal-content {
	filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
	opacity: 1;
	-moz-transition: all 0.5s 0.1s;
	-o-transition: all 0.5s 0.1s;
	-webkit-transition: all 0.5s;
	-webkit-transition-delay: 0.1s;
	transition: all 0.5s 0.1s;
}

.modal[data-modal-effect="slide-top"] .modal-content {
	-moz-transform: translateY(-200%);
	-ms-transform: translateY(-200%);
	-webkit-transform: translateY(-200%);
	transform: translateY(-200%);
}

.modal[data-modal-effect="slide-top"].modal-show .modal-content {
	-moz-transform: translateY(0);
	-ms-transform: translateY(0);
	-webkit-transform: translateY(0);
	transform: translateY(0);
}

/* RESPONSIVE */

/* moves error logs in tablet/smaller screens */
@media ( max-width : 1000px) {
	/*brings inputs down in size */
	.steps input, .steps textarea {
		outline: none;
		display: block;
		width: 100% !important;
	}

	/*brings errors in */
	.error1 {
		left: 345px;
		margin-top: -58px;
	}
}

@media ( max-width : 675px) {
	/*mobile phone: uncollapse all fields: remove progress bar*/
	.steps {
		/* width: 675px; */
		/* margin: 50px auto; */
		margin-top: auto;
		margint-left: auto;
		margin-left: auto;
		width: 90%;
	}
	#progressbar {
		display: none;
	}

	/*move error logs */
	.error1 {
		position: relative;
		left: 0 !important;
		margin-top: 24px;
		top: -11px;
	}
	.error1:before {
		width: 0;
		height: 0;
		left: 14px;
		top: -14px;
		content: "";
		position: absolute;
		border-left: 6px solid transparent;
		border-bottom: 8px solid #e62163;
		border-right: 6px solid transparent;
	}

	/*show hidden fieldsets */
	.steps fieldset:not(:first-of-type) {
		display: block;
	}
	.steps fieldset {
		position: relative;
		width: 100%;
		margin: 0 auto;
		margin-top: 45px;
	}
	.steps .next, .steps .previous {
		display: none;
	}
	.steps .explanation {
		display: none;
	}
	.steps .submit {
		float: right;
		margin: 28px auto 10px;
		width: 100% !important;
	}
}

/* Info */
.info {
	width: 300px;
	margin: 35px auto;
	text-align: center;
	font-family: "roboto", sans-serif;
}

/* .info h1 {
  margin: 0;
  padding: 0;
  font-size: 28px;
  font-weight: 400;
  color: #333333;
  padding-bottom: 5px;
} */
.info span {
	color: #666666;
	font-size: 13px;
	margin-top: 20px;
}

.info span a {
	color: #666666;
	text-decoration: none;
}

.info span .fa {
	color: rgb(226, 168, 16);
	font-size: 19px;
	position: relative;
	left: -2px;
}

.info span .spoilers {
	color: #999999;
	margin-top: 5px;
	font-size: 10px;
}

/*arccordion start*/
@charset "UTF-8";

.card-accordion {
	position: relative;
	overflow: hidden;
	border: 1px solid #468FB6;
	border-radius: 8px;
	transition: 0.20s ease-in-out;
	margin: 15px;
	color: #4f4f4f;
	border-radius: 30px;
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
	display: block;
	padding: 20px 30px;
	color: #468FB6;
	position: relative;
	cursor: pointer;
}

.card-accordion .card-accordion-label::after {
	content: "";
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
	transform: rotate(45deg);
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

/*arccordion end*/

/*step 2*/
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

/*step 2 end*/

/*step calendar*/
#calendar {
	margin-left: auto;
	margin-right: auto;
	width: 320px;
	font-family: 'Lato', sans-serif;
}

#calendar_weekdays div {
	display: inline-block;
	vertical-align: top;
}

#calendar_content, #calendar_weekdays, #calendar_header {
	position: relative;
	width: 320px;
	overflow: hidden;
	float: left;
	z-index: 10;
}

#calendar_weekdays div, #calendar_content div {
	width: 40px;
	height: 40px;
	overflow: hidden;
	text-align: center;
	background-color: #FFFFFF;
	color: #787878;
}

#calendar_content {
	-webkit-border-radius: 0px 0px 12px 12px;
	-moz-border-radius: 0px 0px 12px 12px;
	border-radius: 0px 0px 12px 12px;
}

#calendar_content div {
	float: left;
}

#calendar_content div:hover {
	background-color: #F8F8F8;
}

#calendar_content div.blank {
	background-color: #E8E8E8;
}

#calendar_header, #calendar_content div.today {
	zoom: 1;
	filter: alpha(opacity = 70);
	opacity: 0.7;
}

#calendar_content div.today {
	color: #FFFFFF;
}

#calendar_header {
	width: 100%;
	height: 37px;
	text-align: center;
	background-color: #FF6860;
	padding: 18px 0;
	-webkit-border-radius: 12px 12px 0px 0px;
	-moz-border-radius: 12px 12px 0px 0px;
	border-radius: 12px 12px 0px 0px;
}

#calendar_header h1 {
	font-size: 1.5em;
	color: #FFFFFF;
	float: left;
	width: 70%;
}

i[class^=icon-chevron] {
	color: #FFFFFF;
	float: left;
	width: 15%;
	border-radius: 50%;
}
/*step calendar end*/
/* #Universal and Default Styles button start
–––––––––––––––––––––––––––––––––––––––––––––––––– */
html {
	box-sizing: border-box;
	font-size: 62.5%;
}

*, *:before, *:after {
	box-sizing: inherit;
}

body {
	background: #fff;
	color: #333;
	font-family: 'Barlow', sans-serif;
	font-size: 1.4rem;
	font-weight: 400;
	letter-spacing: 0.05rem;
	line-height: 1;
	margin: 0;
}

.drawer__btn__wrapper {
	margin-left: auto;
	margin-right: auto;
	margin-top: 2rem;
	max-width: 44rem;
}

.drawer__btn__container {
	display: flex;
	/* flex-wrap: wrap; */
	margin-left: -2rem;
	margin-top: -2rem;
	margin-bottom: 0.3rem;
}

.drawer__btn {
	flex-basis: 50%;
	max-width: 50%;
	padding-left: .03rem;
	padding-top: 2rem;
}

.drawer__btn span {
	cursor: pointer;
	display: block;
	font-size: 1.6rem;
	font-weight: 600;
	padding: 1.5rem 1rem;
	text-align: center;
	transition: 0.25s ease;
	width: 100px !important;
	font-weight: bold;
	border: 0 none;
	border-radius: 4px;
	cursor: pointer;
	-webkit-transition: all 0.3s linear 0s;
	-moz-transition: all 0.3s linear 0s;
	-ms-transition: all 0.3s linear 0s;
	-o-transition: all 0.3s linear 0s;
	transition: all 0.3s linear 0s;
	display: block;
	border: 1px solid #468FB6;
	color: #468FB6;
	background-color: white;
}

.drawer__btn span:hover {
	background: #468FB6;
	color: white;
}

.drawer__container {
	background: #fff;
	height: 100%;
	padding: 2rem;
	position: fixed;
	/* right: -32rem; */
	top: 0;
	transition: 0.15s ease-in;
	width: 32rem;
}

.drawer__active {
	right: 0;
}

.drawer__overlay {
	background: rgba(0, 0, 0, 0.75);
	display: none;
	position: fixed;
	height: 100%;
	top: 0;
	width: 100%;
}

.drawer__close__btn {
	color: white;
	cursor: pointer;
	display: none;
	position: absolute;
	right: 34rem;
	text-align: center;
	top: 1rem;
}

.drawer__close__btn .fa-times {
	font-size: 3rem;
	width: 100%;
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
					<h1 class="mb-2 bread">개인상담</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html"><i
								class="ion-ios-arrow-forward"></i></a></span> <span><i
							class="ion-ios-arrow-forward"></i></span>
					</p>
				</div>
			</div>
		</div>
	</section>

	<br>
	<br>



	<div class="info">

		<!-- <span> Made with <i class="fa fa-beer"></i> by <a
			href="http://www.idesignradthings.com">Ty Stelmach</a>
			<div class="spoilers">
				An app created to score your nonprofit's fundraising technique.</a>
			</div>
		</span> -->
	</div>



	<!-- Modal -info -->

	<form id="frm" class="steps" accept-charset="UTF-8"
		enctype="multipart/form-data" novalidate="">
		<ul id="progressbar">
			<li class="active">상담 키워드 선택</li>
			<li>상담방법 선택</li>
			<li>상담사 선택</li>
			<li>상담날짜 선택</li>
			<li>상담시간 선택</li>

		</ul>



		<!-- step 1 FIELD SET -->
		<fieldset>
			<h2 class="fs-title">상담 키워드 선택</h2>
			<h3 class="fs-subtitle">상담 받을 고민 키워드를 선택하세요</h3>
			<!-- Begin What's Your First Name Field -->

			<link
				href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
				rel="stylesheet">
			<div class="card-accordion">
				<input id="card-1" class="card-accordion-checkbox" type="checkbox">
				<label class="card-accordion-label" for="card-1">분노/우울</label>
				<div class="card-accordion-content">
					<label><input name="onecheck" type="checkbox" value="1"
						onclick="doOpenCheck(this);"> 우울 불안</label><br> <label><input
						name="onecheck" type="checkbox" value="2"
						onclick="doOpenCheck(this);"> 분노</label><br> <label><input
						name="onecheck" type="checkbox" value="3"
						onclick="doOpenCheck(this);"> 무기력 자존감상실</label><br> <label><input
						name="onecheck" type="checkbox" value="4"
						onclick="doOpenCheck(this);"> 자살</label>
					<p class="mini-p">* 세부카테고리는 한 항목만 선택 가능합니다</p>
				</div>
			</div>
			<div class="card-accordion">
				<input id="card-2" class="card-accordion-checkbox" type="checkbox">
				<label class="card-accordion-label" for="card-2">사랑/우정</label>
				<div class="card-accordion-content">
					<label><input name="onecheck" type="checkbox" value="5"
						onclick="doOpenCheck(this);"> 연인</label><br> <label><input
						name="onecheck" type="checkbox" value="6"
						onclick="doOpenCheck(this);"> 데이트폭력</label><br> <label><input
						name="onecheck" type="checkbox" value="7"
						onclick="doOpenCheck(this);"> 친구관계</label><br> <label><input
						name="onecheck" type="checkbox" value="8"
						onclick="doOpenCheck(this);"> 부부</label><br> <label><input
						name="onecheck" type="checkbox" onclick="doOpenCheck(this);">
						<input name="onecheck" class="text-field" type="text"
						placeholder="직접입력.."> </label>
					<p class="mini-p">* 세부카테고리는 한 항목만 선택 가능합니다</p>

				</div>
			</div>
			<div class="card-accordion">
				<input id="card-3" class="card-accordion-checkbox" type="checkbox">
				<label class="card-accordion-label" for="card-3">진로/취업</label>
				<div class="card-accordion-content">
					<label><input name="onecheck" type="checkbox" value="9"
						onclick="doOpenCheck(this);"> 진로</label><br> <label><input
						name="onecheck" type="checkbox" value="10"
						onclick="doOpenCheck(this);"> 취업준비</label><br> <label><input
						name="onecheck" type="checkbox" value="11"
						onclick="doOpenCheck(this);"> 동료관계</label><br>
					<p class="mini-p">* 세부카테고리는 한 항목만 선택 가능합니다</p>

				</div>
			</div>


			<!-- <div class="hs_firstname field hs-form-field">

				<label for="firstname-99a6d115-5e68-4355-a7d0-529207feb0b3_2983">What's
					your First Name? *</label> <input
					id="firstname-99a6d115-5e68-4355-a7d0-529207feb0b3_2983"
					name="firstname" required="required" type="text" value=""
					placeholder="" data-rule-required="true"
					data-msg-required="Please include your first name"> <span
					class="error1" style="display: none;"> <i
					class="error-log fa fa-exclamation-triangle"></i>
				</span>
			</div> -->
			<!-- End What's Your First Name Field -->

			<!-- Begin What's Your Email Field -->
			<!-- <div class="hs_email field hs-form-field">

				<label for="email-99a6d115-5e68-4355-a7d0-529207feb0b3_2983">What's
					your E-mail Address? *</label> <input
					id="email-99a6d115-5e68-4355-a7d0-529207feb0b3_2983" name="email"
					required="required" type="email" value="" placeholder=""
					data-rule-required="true"
					data-msg-required="Please enter a valid email address."> <span
					class="error1" style="display: none;"> <i
					class="error-log fa fa-exclamation-triangle"></i>
				</span>
			</div> -->
			<!-- End What's Your Email Field -->

			<!-- Begin Total Number of Constituents in Your Database Field -->
			<!-- <div
				class="hs_email field hs-form-field hs_total_number_of_constituents_in_your_database">

				<label
					for="edit-submitted-constituent-base-total-constituents total_number_of_constituents_in_your_database-99a6d115-5e68-4355-a7d0-529207feb0b3_6344">What's
					the Total Number of Constituents in your Database? *</label> <input
					id="edit-submitted-constituent-base-total-constituents"
					class="form-text hs-input"
					name="total_number_of_constituents_in_your_database"
					required="required" size="60" maxlength="128" type="number"
					value="" placeholder="" data-rule-required="true"
					data-msg-required="Please enter a valid number"> <span
					class="error1" style="display: none;"> <i
					class="error-log fa fa-exclamation-triangle"></i>
				</span>
			</div> -->

			<!-- End Total Number of Constituents in Your Database Field -->
			<input type="button" data-page="1" name="next"
				class="next action-button" value="Next" />
			<div class="explanation btn btn-small modal-trigger">
				<!-- 	//data-modal-id="modal-3" -->
				M A E U M I
			</div>
		</fieldset>



		<!-- STEP 2 FIELD SET -->
		<fieldset>
			<h2 class="fs-title">상담사 선택</h2>
			<h3 class="fs-subtitle">선택한 카테고리의 전문분야이신 상담사들중에 나와 맞는 상담사를
				찾아보세요.</h3>



			<!-- Begin Total Number of Donors in Year 1 Field -->
			<!-- <div
				class="form-item webform-component webform-component-textfield hs_total_number_of_donors_in_year_1 field hs-form-field"
				id="webform-component-acquisition--amount-1">

				<label
					for="edit-submitted-acquisition-amount-1 total_number_of_donors_in_year_1-99a6d115-5e68-4355-a7d0-529207feb0b3_6344">What
					was your number of total donors in year 1? *</label> <input
					id="edit-submitted-acquisition-amount-1" class="form-text hs-input"
					name="total_number_of_donors_in_year_1" required="required"
					size="60" maxlength="128" type="number" value="" placeholder=""
					data-rule-required="true"
					data-msg-required="Please enter a valid number"> <span
					class="error1" style="display: none;"> <i
					class="error-log fa fa-exclamation-triangle"></i>
				</span>
			</div> -->
			<!-- End Total Number of Donors in Year 1 Field -->

			<!-- Begin Total Number of Donors in Year 2 Field -->
			<!-- <div
				class="form-item webform-component webform-component-textfield hs_total_number_of_donors_in_year_2 field hs-form-field"
				id="webform-component-acquisition--amount-2">

				<label
					for="edit-submitted-acquisition-amount-2 total_number_of_donors_in_year_2-99a6d115-5e68-4355-a7d0-529207feb0b3_6344">What
					was your number of total donors in year 2? *</label> <input
					id="edit-submitted-acquisition-amount-2" class="form-text hs-input"
					name="total_number_of_donors_in_year_2" required="required"
					size="60" maxlength="128" type="number" value="" placeholder=""
					data-rule-required="true"
					data-msg-required="Please enter a valid number"> <span
					class="error1" style="display: none;"> <i
					class="error-log fa fa-exclamation-triangle"></i>
				</span>
			</div> -->
			<!-- End Total Number of Donors in Year 2 Field -->

			<!-- Begin Calc of Total Number of Donors Fields -->
			<!-- THIS FIELD IS NOT EDITABLE | GRAYED OUT -->
			<!-- <div
				class="form-item webform-component webform-component-textfield webform-container-inline hs_total_donor_percent_change field hs-form-field">

				<label
					for="edit-submitted-acquisition-percent-change total_donor_percent_change-99a6d115-5e68-4355-a7d0-529207feb0b3_6344">Total
					Donors Percent Change</label> <input
					id="edit-submitted-acquisition-percent-change"
					class="form-text hs-input" name="total_donor_percent_change"
					readonly="readonly" size="60" maxlength="128" type="text" value=""
					placeholder="0">
			</div> -->
			<!-- End Calc of Total Number of Donors Fields -->
			<input type="button" data-page="2" name="previous"
				class="previous action-button" value="Previous" /> <input
				type="button" data-page="2" name="next" class="next action-button"
				value="Next" />
			<div class="explanation btn btn-small modal-trigger"
				data-modal-id="modal-3">M A E U M I</div>
		</fieldset>



		<!-- step3 FIELD SET -->
		<fieldset>
			<h2 class="fs-title">상담방법 선택</h2>
			<h3 class="fs-subtitle">나에게 맞는 상담 방법을 선택해보세요</h3>


			<div class="counsel-type">
				<span><img class="type-btn" style="width: 100px"
					src="resources/user/images/chat.PNG"> <br> <input
					type="button" class="type-btn" value="40,000"> <img
					class="type-btn" src=""> <input type="button"
					class="type-btn"> 화상 <img class="type-btn" src=""> <input
					type="button" class="type-btn"> 전화 </span>
			</div>

			<!-- Begin Average Gift Size in Year 1 Field -->
			<!-- <div
				class="form-item webform-component webform-component-textfield hs_average_gift_size_in_year_1 field hs-form-field"
				id="edit-submitted-cultivation-amount-1 average_gift_size_in_year_1-99a6d115-5e68-4355-a7d0-529207feb0b3_3256">

				<label
					for="edit-submitted-cultivation-amount-1 average_gift_size_in_year_1-99a6d115-5e68-4355-a7d0-529207feb0b3_3256">What
					was your average gift size in year 1? *</label> <input
					id="edit-submitted-cultivation-amount-1" class="form-text hs-input"
					name="average_gift_size_in_year_1" required="required" size="60"
					maxlength="128" type="number" value="" placeholder=""
					data-rule-required="true"
					data-msg-required="Please enter a valid number"> <span
					class="error1" style="display: none;"> <i
					class="error-log fa fa-exclamation-triangle"></i>
				</span>
			</div> -->
			<!-- End Average Gift Size in Year 1 Field -->

			<!-- Begin Average Gift Size in Year 2 Field -->
			<!-- <div
				class="form-item webform-component webform-component-textfield hs_average_gift_size_in_year_2 field hs-form-field"
				id="webform-component-cultivation--amount-2">

				<label
					for="edit-submitted-cultivation-amount-2 average_gift_size_in_year_2-99a6d115-5e68-4355-a7d0-529207feb0b3_3256">What
					was your average gift size in year 2? *</label> <input
					id="edit-submitted-cultivation-amount-2" class="form-text hs-input"
					name="average_gift_size_in_year_2" required="required" size="60"
					maxlength="128" type="number" value="" placeholder=""
					data-rule-required="true"
					data-msg-required="Please enter a valid number"> <span
					class="error1" style="display: none;"> <i
					class="error-log fa fa-exclamation-triangle"></i>
				</span>
			</div>
			End Average Gift Size in Year 2 Field -->

			<!-- Begin Average Gift Size Perchent Change Field -->
			<!-- THIS FIELD IS NOT EDITABLE | GRAYED OUT -->
			<!-- <div
				class="form-item webform-component webform-component-textfield webform-container-inline hs_average_gift_size_percent_change field hs-form-field"
				id="webform-component-cultivation--percent-change1">

				<label
					for="edit-submitted-cultivation-percent-change1 average_gift_size_percent_change-99a6d115-5e68-4355-a7d0-529207feb0b3_3256">Average
					Gift Size Percent Change</label> <input
					id="edit-submitted-cultivation-percent-change1"
					class="form-text hs-input" name="average_gift_size_percent_change"
					readonly="readonly" size="60" maxlength="128" type="text" value=""
					placeholder="0">
			</div> -->
			<!-- End Average Gift Size Perchent Change Field -->
			<br> <br> <input type="button" data-page="3"
				name="previous" class="previous action-button" value="Previous" />
			<input type="button" data-page="3" name="next"
				class="next action-button" value="Next" />
			<div class="explanation btn btn-small modal-trigger"
				data-modal-id="modal-3">M A E U M I</div>
		</fieldset>



		<!-- step4 FIELD SET -->
		<fieldset>
			<h2 class="fs-title">상담시간 선택</h2>
			<h3 class="fs-subtitle">상담가능한 시간을 선택해주세요.</h3>

			<div id="calendar">
				<div id="calendar_header">
					<i class="icon-chevron-left"></i>
					<h1></h1>
					<i class="icon-chevron-right"></i>
				</div>
				<div id="calendar_weekdays"></div>
				<div id="calendar_content"></div>
			</div>


			<section class="drawer__btn__wrapper">
				<div class="drawer__btn__container">
					<div class="drawer__btn__1 drawer__btn" data-drawer="__1">
						<span>Button 1</span>
					</div>

					<div class="drawer__btn__2 drawer__btn" data-drawer="__2">
						<span>Button 2</span>
					</div>

					<div class="drawer__btn__3 drawer__btn" data-drawer="__3">
						<span>Button 3</span>
					</div>

					<div class="drawer__btn__4 drawer__btn" data-drawer="__4">
						<span>Button 4</span>
					</div>
				</div>
				<div class="drawer__btn__container">
					<div class="drawer__btn__1 drawer__btn" data-drawer="__1">
						<span>Button 1</span>
					</div>

					<div class="drawer__btn__2 drawer__btn" data-drawer="__2">
						<span>Button 2</span>
					</div>

					<div class="drawer__btn__3 drawer__btn" data-drawer="__3">
						<span>Button 3</span>
					</div>

					<div class="drawer__btn__4 drawer__btn" data-drawer="__4">
						<span>Button 4</span>
					</div>
				</div>
			</section>


			<!-- Begin Total Giving In Year 1 Field -->

			<!-- End Total Giving In Year 1 Field -->

			<!-- Begin Total Giving In Year 2 Field -->

			<!-- End Total Giving In Year 2 Field -->

			<!-- Begin Average Gift Size Percent Change Field 2 -->
			<!-- THIS FIELD IS NOT EDITABLE | GRAYED OUT -->

			<!-- End Average Gift Size Percent Change Field 2 -->
			<input type="button" data-page="4" name="previous"
				class="previous action-button" value="Previous" /> <input
				type="button" data-page="4" name="next" class="next action-button"
				value="Next" />
			<div class="explanation btn btn-small modal-trigger"
				data-modal-id="modal-3">What Is This?</div>
		</fieldset>



		<!-- step5 FIELD SET -->
		<fieldset>
			<h2 class="fs-title">Retention of your donors</h2>
			<h3 class="fs-subtitle">How long can you keep your donors and
				their donations?</h3>

			<div id="invoiceholder">

				<div id="headerimage"></div>
				<div id="invoice" class="effect2">

					<div id="invoice-top">
						<div class="logo"></div>
						<div class="info">
							<h2>Michael Truong</h2>
							<p>
								hello@michaeltruong.ca </br> 289-335-6503
							</p>
						</div>
						<!--End Info-->
						<div class="title">
							<h1>Invoice #1069</h1>
							<p>
								Issued: May 27, 2015</br> Payment Due: June 27, 2015
							</p>
						</div>
						<!--End Title-->
					</div>
					<!--End InvoiceTop-->



					<div id="invoice-mid">

						<div class="clientlogo"></div>
						<div class="info">

							<h2>이소정 상담사</h2>

							<p>
								potato@gmail.com</br> 555-555-5555</br>
						</div>

						<div id="project">
							<h2>Project Description</h2>
							<p>Proin cursus, dui non tincidunt elementum, tortor ex
								feugiat enim, at elementum enim quam vel purus. Curabitur semper
								malesuada urna ut suscipit.</p>
						</div>

					</div>
					<!--End Invoice Mid-->

					<div id="invoice-bot">

						<div id="table">
							<table>
								<tr class="tabletitle">
									<td class="item"><h2>상담 신청 내역</h2></td>
									<td class="Hours"><h2></h2></td>
									<td class="Rate"><h2></h2></td>
									<td class="subtotal"><h2></h2></td>
								</tr>

								<tr class="service">
									<td class="tableitem"><p class="itemtext">상담방식</p></td>
									<td class="tableitem"><p class="itemtext"></p></td>
									<td class="tableitem"><p class="itemtext"></p></td>
									<td class="tableitem"><p class="itemtext">채팅</td>
								</tr>

								<tr class="service">
									<td class="tableitem"><p class="itemtext">상담날짜</p></td>
									<td class="tableitem"><p class="itemtext"></p></td>
									<td class="tableitem"><p class="itemtext"></p></td>
									<td class="tableitem"><p class="itemtext">2022-03-23 수</p></td>
								</tr>

								<tr class="service">
									<td class="tableitem"><p class="itemtext">할인쿠폰</p></td>
									<td class="tableitem"><p class="itemtext"></p></td>
									<td class="tableitem"><p class="itemtext"></p></td>
									<td class="tableitem">
										<p class="itemtext"></p> <select name='coupon'>
											<option value='' selected>-- 선택 --</option>
											<option value='2000'>회원가입 축하쿠폰 (2000원)</option>
											<option value='500'>상담후기 작성 쿠폰(500원)</option>

									</select>
									</td>
								</tr>

								<tr class="service">
									<td class="tableitem"><p class="itemtext">Animation</p></td>
									<td class="tableitem"><p class="itemtext">20</p></td>
									<td class="tableitem"><p class="itemtext">$75</p></td>
									<td class="tableitem"><p class="itemtext">$1,500.00</p></td>
								</tr>

								<tr class="service">
									<td class="tableitem"><p class="itemtext">Animation
											Revisions</p></td>
									<td class="tableitem"><p class="itemtext">10</p></td>
									<td class="tableitem"><p class="itemtext">$75</p></td>
									<td class="tableitem"><p class="itemtext">$750.00</p></td>
								</tr>

								<tr class="service">
									<td class="tableitem"><p class="itemtext"></p></td>
									<td class="tableitem"><p class="itemtext">HST</p></td>
									<td class="tableitem"><p class="itemtext">13%</p></td>
									<td class="tableitem"><p class="itemtext">$419.25</p></td>
								</tr>


								<tr class="tabletitle">
									<td></td>
									<td></td>
									<td class="Rate"><h2>Total</h2></td>
									<td class="payment"><h2>$3,644.25</h2></td>
								</tr>

							</table>
						</div>
						<!--End Table-->

						<form action="https://www.paypal.com/cgi-bin/webscr" method="post"
							target="_top">
							<input type="hidden" name="cmd" value="_s-xclick"> <input
								type="hidden" name="hosted_button_id" value="QRZ7QTM9XRPJ6">
							<input type="button" id="pay-btn" name="submit" value="결제하기">
						</form>



						<div id="legalcopy">
							<a href="userPersonalCounsel.do"><input type="button"
								id="back-btn" name="submit" value="뒤로가기"></a>
						</div>

					</div>
					<!--End InvoiceBot-->
				</div>
				<!--End Invoice-->
			</div>

			<!-- End Invoice Holder-->
			<!-- Begin Total Number of Donors Who Gave in Year 1 Field -->

			<!-- <div class="drawer__overlay"></div> -->

			<!-- <section class="drawer__wrapper">
				<div class="drawer__close__btn">
							<i class="fa fa-times"></i>
				</div>

				<div class="drawer__1 drawer__container">Content Drawer 1</div>

				<div class="drawer__2 drawer__container">Content Drawer 2</div>

				<div class="drawer__3 drawer__container">Content Drawer 3</div>

				<div class="drawer__4 drawer__container">Content Drawer 4</div>
			</section> -->



			<!-- End Total Number of Donors Who Gave in Year 1 Field-->


			<!-- Begin Total Number of Donors Who Gave in Year 1 and Year 2 Field -->

			<!-- End Total Number of Donors Who Gave in Year 1 and Year 2 Field -->

			<!-- Begin Retention Rate Percent -->

			<!-- End Retention Rate Percent -->


			<!-- Begin Final Calc -->

			<!-- End Final Calc -->
			<input type="button" data-page="5" name="previous"
				class="previous action-button" value="Previous" /> <input
				id="submit" class="hs-button primary large action-button next"
				type="submit" value="Submit">
			<div class="explanation btn btn-small modal-trigger"
				data-modal-id="modal-3">What Is This?</div>
		</fieldset>
		<!-- 
		<fieldset>
			<h2 class="fs-title">It's on the way!</h2>
			<h3 class="fs-subtitle">Thank you for trying out our marketing
				grader, please go check your email for your fundraising report card
				and some helpful tips to improve it!</h3>
			<div class="explanation btn btn-small modal-trigger"
				data-modal-id="modal-3">What Is This?</div>
		</fieldset> -->
	</form>
	<script>
		/* Fundraising Grader
		 *
		 * Generic Copyright, yadda yadd yadda
		 *
		 * Plug-ins: jQuery Validate, jQuery 
		 * Easing
		 */

		$(document).ready(
				function() {
					var current_fs, next_fs, previous_fs;
					var left, opacity, scale;
					var animating;
					$(".steps").validate({
						errorClass : 'invalid',
						errorElement : 'span',
						errorPlacement : function(error, element) {
							error.insertAfter(element.next('span').children());
						},
						highlight : function(element) {
							$(element).next('span').show();
						},
						unhighlight : function(element) {
							$(element).next('span').hide();
						}
					});
					$(".next").click(
							function() {
								$(".steps").validate(
										{
											errorClass : 'invalid',
											errorElement : 'span',
											errorPlacement : function(error,
													element) {
												error.insertAfter(element.next(
														'span').children());
											},
											highlight : function(element) {
												$(element).next('span').show();
											},
											unhighlight : function(element) {
												$(element).next('span').hide();
											}
										});
								if ((!$('.steps').valid())) {
									return true;
								}
								if (animating)
									return false;
								animating = true;
								current_fs = $(this).parent();
								next_fs = $(this).parent().next();
								$("#progressbar li").eq(
										$("fieldset").index(next_fs)).addClass(
										"active");
								next_fs.show();
								current_fs.animate({
									opacity : 0
								}, {
									step : function(now, mx) {
										scale = 1 - (1 - now) * 0.2;
										/* left = (now * 50) + "%"; */
										opacity = 1 - now;
										current_fs.css({
											'transform' : 'scale(' + scale
													+ ')'
										});
										next_fs.css({
											'left' : left,
											'opacity' : opacity
										});
									},
									duration : 50,
									complete : function() {
										current_fs.hide();
										animating = false;
									},
									easing : 'easeInOutExpo'
								});
							});
					$("#submit").click(function(){
						frm.action = "personalCounselApplication.do";
						frm.submit();
						
					}
							
							/* function() {
								$(".steps").validate(
										{
											errorClass : 'invalid',
											errorElement : 'span',
											errorPlacement : function(error,
													element) {
												error.insertAfter(element.next(
														'span').children());
											},
											highlight : function(element) {
												$(element).next('span').show();
											},
											unhighlight : function(element) {
												$(element).next('span').hide();
											}
										});
								if ((!$('.steps').valid())) {
									return false;
								}
								if (animating)
									return false;
								animating = true;
								current_fs = $(this).parent();
								next_fs = $(this).parent().next();
								$("#progressbar li").eq(
										$("fieldset").index(next_fs)).addClass(
										"active");
								next_fs.show();
								current_fs.animate({
									opacity : 0
								}, {
									step : function(now, mx) {
										scale = 1 - (1 - now) * 0.2;
										left = (now * 50) + "%";
										opacity = 1 - now;
										current_fs.css({
											'transform' : 'scale(' + scale
													+ ')'
										});
										next_fs.css({
											'left' : left,
											'opacity' : opacity
										});
									},
									duration : 50,
									complete : function() {
										current_fs.hide();
										animating = false;
									},
									easing : 'easeInOutExpo'
								});
							} */);
					$(".previous").click(
							function() {
								if (animating)
									return false;
								animating = true;
								current_fs = $(this).parent();
								previous_fs = $(this).parent().prev();
								$("#progressbar li").eq(
										$("fieldset").index(current_fs))
										.removeClass("active");
								previous_fs.show();
								current_fs.animate({
									opacity : 0
								}, {
									step : function(now, mx) {
										scale = 0.8 + (1 - now) * 0.2;
										left = ((1 - now) * 50) + "%";
										opacity = 1 - now;
										current_fs.css({
											'left' : left
										});
										previous_fs.css({
											'transform' : 'scale(' + scale
													+ ')',
											'opacity' : opacity
										});
									},
									duration : 50,
									complete : function() {
										current_fs.hide();
										animating = false;
									},
									easing : 'easeInOutExpo'
								});
							});
				});
		jQuery(document)
				.ready(
						function() {
							jQuery(
									"#edit-submitted-acquisition-amount-1,#edit-submitted-acquisition-amount-2,#edit-submitted-cultivation-amount-1,#edit-submitted-cultivation-amount-2,#edit-submitted-cultivation-amount-3,#edit-submitted-cultivation-amount-4,#edit-submitted-retention-amount-1,#edit-submitted-retention-amount-2,#edit-submitted-constituent-base-total-constituents")
									.keyup(function() {
										calcTotal();
									});
						});

		function calcTotal() {
			var grade = 0;
			var donorTotal = Number(jQuery(
					"#edit-submitted-constituent-base-total-constituents")
					.val().replace(/,/g, ""));
			if (donorTotal) {
				donorTotal = parseFloat(donorTotal);
			} else {
				donorTotal = 0;
			}
			grade += getBonusDonorPoints(donorTotal);
			var acqAmount1 = Number(jQuery(
					"#edit-submitted-acquisition-amount-1").val().replace(/,/g,
					""));
			var acqAmount2 = Number(jQuery(
					"#edit-submitted-acquisition-amount-2").val().replace(/,/g,
					""));
			var acqTotal = 0;
			if (acqAmount1) {
				acqAmount1 = parseFloat(acqAmount1);
			} else {
				acqAmount1 = 0;
			}
			if (acqAmount2) {
				acqAmount2 = parseFloat(acqAmount2);
			} else {
				acqAmount2 = 0;
			}
			if (acqAmount1 > 0 && acqAmount2 > 0) {
				acqTotal = ((acqAmount2 - acqAmount1) / acqAmount1 * 100)
						.toFixed(2);
			} else {
				acqTotal = 0;
			}
			jQuery("#edit-submitted-acquisition-percent-change").val(
					acqTotal + '%');
			grade += getAcquisitionPoints(acqTotal);
			console.log(grade);
			var cultAmount1 = Number(jQuery(
					"#edit-submitted-cultivation-amount-1").val().replace(/,/g,
					""));
			var cultAmount2 = Number(jQuery(
					"#edit-submitted-cultivation-amount-2").val().replace(/,/g,
					""));
			var cultTotal = 0;
			if (cultAmount1) {
				cultAmount1 = parseFloat(cultAmount1);
			} else {
				cultAmount1 = 0;
			}
			if (cultAmount2) {
				cultAmount2 = parseFloat(cultAmount2);
			} else {
				cultAmount2 = 0;
			}
			if (cultAmount1 > 0 && cultAmount2 > 0) {
				cultTotal = ((cultAmount2 - cultAmount1) / cultAmount1 * 100)
						.toFixed(2);
			} else {
				cultTotal = 0;
			}
			jQuery("#edit-submitted-cultivation-percent-change1").val(
					cultTotal + '%');
			grade += getAcquisitionPoints(cultTotal);
			var cultAmount3 = Number(jQuery(
					"#edit-submitted-cultivation-amount-3").val().replace(/,/g,
					""));
			var cultAmount4 = Number(jQuery(
					"#edit-submitted-cultivation-amount-4").val().replace(/,/g,
					""));
			if (cultAmount3) {
				cultAmount3 = parseFloat(cultAmount3);
			} else {
				cultAmount3 = 0;
			}
			if (cultAmount4) {
				cultAmount4 = parseFloat(cultAmount4);
			} else {
				cultAmount4 = 0;
			}
			if (cultAmount3 > 0 && cultAmount4 > 0) {
				cultTotal2 = ((cultAmount4 - cultAmount3) / cultAmount3 * 100)
						.toFixed(2);
			} else {
				cultTotal2 = 0;
			}
			jQuery("#edit-submitted-cultivation-percent-change2").val(
					cultTotal2 + '%');
			grade += getAcquisitionPoints(cultTotal2);
			var retAmount1 = Number(jQuery("#edit-submitted-retention-amount-1")
					.val().replace(/,/g, ""));
			var retAmount2 = Number(jQuery("#edit-submitted-retention-amount-2")
					.val().replace(/,/g, ""));
			var retTotal = 0;
			if (retAmount1) {
				retAmount1 = parseFloat(retAmount1);
			} else {
				retAmount1 = 0;
			}
			if (retAmount2) {
				retAmount2 = parseFloat(retAmount2);
			} else {
				retAmount2 = 0;
			}
			if (retAmount1 > 0 && retAmount2 > 0) {
				retTotal = (retAmount2 / retAmount1 * 100).toFixed(2);
			} else {
				retTotal = 0;
			}
			jQuery("#edit-submitted-retention-percent-change").val(
					retTotal + '%');
			grade += getAcquisitionPoints(retTotal);
			jQuery("#edit-submitted-final-grade-grade").val(grade + ' / 400');
		}

		function getAcquisitionPoints(val) {
			if (val < 1) {
				return 0;
			} else if (val >= 1 && val < 6) {
				return 50;
			} else if (val >= 6 && val < 11) {
				return 60;
			} else if (val >= 11 && val < 16) {
				return 70;
			} else if (val >= 16 && val < 21) {
				return 75;
			} else if (val >= 21 && val < 26) {
				return 80;
			} else if (val >= 26 && val < 31) {
				return 85;
			} else if (val >= 31 && val < 36) {
				return 90;
			} else if (val >= 36 && val < 41) {
				return 95;
			} else if (val >= 41) {
				return 100;
			}
		}

		function getCultivationGiftPoints(val) {
			if (val < 1) {
				return 0;
			} else if (val >= 1 && val < 4) {
				return 50;
			} else if (val >= 4 && val < 7) {
				return 60;
			} else if (val >= 7 && val < 10) {
				return 70;
			} else if (val >= 10 && val < 13) {
				return 75;
			} else if (val >= 13 && val < 16) {
				return 80;
			} else if (val >= 16 && val < 21) {
				return 85;
			} else if (val >= 21 && val < 26) {
				return 90;
			} else if (val >= 26 && val < 51) {
				return 95;
			} else if (val >= 51) {
				return 100;
			}
		}

		function getCultivationDonationPoints(val) {
			if (val < 1) {
				return 0;
			} else if (val >= 1 && val < 6) {
				return 50;
			} else if (val >= 6 && val < 11) {
				return 60;
			} else if (val >= 11 && val < 16) {
				return 70;
			} else if (val >= 16 && val < 21) {
				return 75;
			} else if (val >= 21 && val < 26) {
				return 80;
			} else if (val >= 26 && val < 31) {
				return 85;
			} else if (val >= 31 && val < 36) {
				return 90;
			} else if (val >= 36 && val < 41) {
				return 95;
			} else if (val >= 41) {
				return 100;
			}
		}

		function getRetentionPoints(val) {
			if (val < 1) {
				return 0;
			} else if (val >= 1 && val < 51) {
				return 50;
			} else if (val >= 51 && val < 56) {
				return 60;
			} else if (val >= 56 && val < 61) {
				return 70;
			} else if (val >= 61 && val < 66) {
				return 75;
			} else if (val >= 66 && val < 71) {
				return 80;
			} else if (val >= 71 && val < 76) {
				return 85;
			} else if (val >= 76 && val < 81) {
				return 90;
			} else if (val >= 81 && val < 91) {
				return 95;
			} else if (val >= 91) {
				return 100;
			}
		}

		function getBonusDonorPoints(val) {
			if (val < 10001) {
				return 0;
			} else if (val >= 10001 && val < 25001) {
				return 10;
			} else if (val >= 25001 && val < 50000) {
				return 15;
			} else if (val >= 50000) {
				return 20;
			}
		}
		var modules = {
			$window : $(window),
			$html : $('html'),
			$body : $('body'),
			$container : $('.container'),
			init : function() {
				$(function() {
					modules.modals.init();
				});
			},
			modals : {
				trigger : $('.explanation'),
				modal : $('.modal'),
				scrollTopPosition : null,
				init : function() {
					var self = this;
					if (self.trigger.length > 0 && self.modal.length > 0) {
						modules.$body
								.append('<div class="modal-overlay"></div>');
						self.triggers();
					}
				},
				triggers : function() {
					var self = this;
					self.trigger.on('click', function(e) {
						e.preventDefault();
						var $trigger = $(this);
						self.openModal($trigger, $trigger.data('modalId'));
					});
					$('.modal-overlay').on('click', function(e) {
						e.preventDefault();
						self.closeModal();
					});
					modules.$body.on('keydown', function(e) {
						if (e.keyCode === 27) {
							self.closeModal();
						}
					});
					$('.modal-close').on('click', function(e) {
						e.preventDefault();
						self.closeModal();
					});
				},
				openModal : function(_trigger, _modalId) {
					var self = this, scrollTopPosition = modules.$window
							.scrollTop(), $targetModal = $('#' + _modalId);
					self.scrollTopPosition = scrollTopPosition;
					modules.$html.addClass('modal-show').attr(
							'data-modal-effect',
							$targetModal.data('modal-effect'));
					$targetModal.addClass('modal-show');
					modules.$container.scrollTop(scrollTopPosition);
				},
				closeModal : function() {
					var self = this;
					$('.modal-show').removeClass('modal-show');
					modules.$html.removeClass('modal-show').removeAttr(
							'data-modal-effect');
					modules.$window.scrollTop(self.scrollTopPosition);
				}
			}
		}
		modules.init();

		function doOpenCheck(chk) {
			var obj = document.getElementsByName("onecheck");
			for (var i = 0; i < obj.length; i++) {
				if (obj[i] != chk) {
					obj[i].checked = false;
				}
			}
		}
		
		
		//calendar start
	
		$(function(){
    function c(){p();
        var e=h();
        var r=0;
        var u=false;
        l.empty();
        while(!u){
            if(s[r]==e[0].weekday){
                u=true
            }else{
                l.append('<div class="blank"></div>');
                r++}}
                for(var c=0;c<42-r;c++){
                    if(c>=e.length){
                        l.append('<div class="blank"></div>')}
                        else{var v=e[c].day;
                            var m=g(new Date(t,n-1,v))?'<div class="today">':"<div>";l.append(m+""+v+"</div>")}}
                            var y=o[n-1];
                            a.css("background-color",y).find("h1").text(i[n-1]+" "+t);
                            f.find("div").css("color",y);l.find(".today").css("background-color",y);
                            d()}function h(){var e=[];for(var r=1;
                                r<v(t,n)+1;
                                r++){e.push({day:r,weekday:s[m(t,n,r)]})}return e
                            }function p(){f.empty();
                                for(var e=0;e<7;e++){
                                f.append("<div>"+s[e].substring(0,3)+"</div>")}}
                                function d(){var t;
                                    var n=$("#calendar").css("width",e+"px");
                                    n.find(t="#calendar_weekdays, #calendar_content").css("width",e+"px").find("div").css({width:e/7+"px",height:e/7+"px","line-height":e/7+"px"});
                                    n.find("#calendar_header").css({height:e*(1/7)+"px"}).find('i[class^="icon-chevron"]').css("line-height",e*(1/7)+"px")}
                                    function v(e,t){
                                        return(new Date(e,t,0)).getDate()
                                    }
                                    function m(e,t,n){
                                        return(new Date(e,t-1,n)).getDay()
                                    }function g(e){
                                        return y(new Date)==y(e)
                                    }function y(e){
                                        return e.getFullYear()+"/"+(e.getMonth()+1)+"/"+e.getDate()
                                    }function b(){var e=new Date;t=e.getFullYear()
                                        ;n=e.getMonth()+1}var e=480
                                        ;var t=2013
                                        ;var n=9
                                        ;var r=[]
                                        ;var i=["JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"];
                                        var s=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
                                        var o=["#16a085","#1abc9c","#c0392b","#27ae60","#FF6860","#f39c12","#f1c40f","#e67e22","#2ecc71","#e74c3c","#d35400","#2c3e50"];
                                        var u=$("#calendar");
                                        var a=u.find("#calendar_header");
                                        var f=u.find("#calendar_weekdays");var l=u.find("#calendar_content")
                                        ;
                                        b();
                                        c();
                                        a.find('i[class^="icon-chevron"]').on("click",function(){
                                            var e=$(this);
                                            var r=function(e){n=e=="next"?n+1:n-1;if(n<1){n=12;
                                                t--
                                            }
                                            else if(n>12){n=1;
                                                t++}c()};
                                                if(e.attr("class").indexOf("left")!=-1){
                                                    r("previous")
                                                }
                                                else{
                                                    r("next")}})})
		//calendar end
		</script>

</body>
</html>
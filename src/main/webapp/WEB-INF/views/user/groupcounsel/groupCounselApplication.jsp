<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

 google.load( "webfont", "1" );

 google.setOnLoadCallback(function() {

  WebFont.load({ custom: {

   families: [ "NanumGothic" ],

   urls: [ "http://fontface.kr/NanumGothic/css" ]

  }});

 });

</script>
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
	font-family: 'Nanum Gothic', Arial, Helvetica, sans-serif !important;
	font-size : 13px;
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

.btns {
	background-color: rgb(210 203 203 / 45%);
	border: 1px solid rgb(210 203 203 / 45%);
	color: black;
	padding: 0.5rem;
	text-transform: lowercase;
	border-radius: 30px;
	margin-right: auto;
	margin-left: auto;
	margin-right: 20px;
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

/* .cards {
	display: flex;
	flex-wrap: wrap;
	list-style: none;
	margin: 0;
	padding: 0;
}

.cards__item {
	display: flex;
	padding: 1rem;
}

@media ( min-width : 40rem) {
	.cards__item {
		width: 50%;
	}
}

@media ( min-width : 56rem) {
	.cards__item {
		width: 33.3333%;
	}
}

.card {
	background-color: white;
	border-radius: 0.25rem;
	box-shadow: 0 20px 40px -14px rgba(0, 0, 0, 0.25);
	display: flex;
	flex-direction: column;
	overflow: hidden;
}

.card:hover .card__image {
	filter: contrast(100%);
}

.card__content {
	display: flex;
	flex: 1 1 auto;
	flex-direction: column;
	padding: 1rem;
}

.cart__person {
	padding-top: 2%
}

.card__image {
	background-position: center center;
	background-repeat: no-repeat;
	background-size: cover;
	border-top-left-radius: 0.25rem;
	border-top-right-radius: 0.25rem;
	filter: contrast(70%);
	overflow: hidden;
	position: relative;
	transition: filter 0.5s cubic-bezier(0.43, 0.41, 0.22, 0.91);
}

.card__image::before {
	content: "";
	display: block;
	padding-top: 56.25%;
}

@media ( min-width : 40rem) {
	.card__image::before {
		padding-top: 66.6%;
	}
}

.card__image--flowers {
	background-image: url(https://unsplash.it/800/600?image=82);
}

.card__image--river {
	background-image: url(https://unsplash.it/800/600?image=11);
}

.card__image--record {
	background-image: url(https://unsplash.it/800/600?image=39);
}

.card__image--fence {
	background-image: url(https://unsplash.it/800/600?image=59);
}

.card__title {
	color: #696969;
	font-size: 1.25rem;
	font-weight: 300;
	letter-spacing: 2px;
	text-transform: uppercase;
	font-weight: bolder;
}

.card__text {
	flex: 1 1 auto;
	font-size: 1rem;
	font-weight: bold;
	line-height: 1.5;
	margin-bottom: 1.25rem;
}

.doctor-name {
	float: right;
}

.group-menu {
	width: 80%;
	margin-right: auto;
	margin-left: auto;
	margin-bottom: 100px;
}
#imgfix{
	width: 500px;
	height: 300px;
} */
#headerimage {
	z-index: -1;
	position: relative;
	top: -50px;
	height: 350px;
	/* background-image: url("http://michaeltruong.ca/images/invoicebg.jpg"); */
	/* -webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15),
    inset 0 -2px 4px rgba(0, 0, 0, 0.15); */
	-moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), inset 0 -2px 4px
		rgba(0, 0, 0, 0.15);
	/* box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15),
    inset 0 -2px 4px rgba(0, 0, 0, 0.15); */
	overflow: hidden;
	background-attachment: fixed;
	background-size: 1920px 80%;
	background-position: 50% -90%;
}

#invoice {
	position: relative;
	top: -290px;
	margin: 0 auto;
	width: 85%;
	background: #fff;
}

.logo {
	float: left;
	height: 60px;
	width: 60px;
	background: url(http://michaeltruong.ca/images/logo1.png) no-repeat;
	background-size: 60px 60px;
}

.clientlogo {
	float: left;
	height: 60px;
	width: 60px;
	background: url(http://michaeltruong.ca/images/client.jpg) no-repeat;
	background-size: 60px 60px;
	border-radius: 50px;
}

.info {
	display: block;
	float: left;
	margin-left: 20px;
}

.title {
	float: right;
}

.title p {
	text-align: right;
}

#project {
	margin-left: 52%;
}



.tabletitle {
	padding: 5px;
	background: #eee;
}

.service {
	border: 1px solid #eee;
}

.item {
	width: 35%;
}

.itemtext {
	font-size: 0.9em;
}

td.subtotal {
	width: 25%;
}

td.Rate {
	width: 15%;
}

td.Hours {
	width: 15%;
}

#legalcopy {
	margin-top: 30px;
}

form {
	float: right;
	margin-top: 30px;
	text-align: right;
}

.effect2 {
	position: relative;
}

.effect2:before, .effect2:after {
	z-index: -1;
	position: absolute;
	content: "";
	bottom: 15px;
	left: 10px;
	width: 50%;
	top: 80%;
	max-width: 300px;
	background: #777;
	-webkit-box-shadow: 0 15px 10px #777;
	-moz-box-shadow: 0 15px 10px #777;
	box-shadow: 0 15px 10px #777;
	-webkit-transform: rotate(-3deg);
	-moz-transform: rotate(-3deg);
	-o-transform: rotate(-3deg);
	-ms-transform: rotate(-3deg);
	transform: rotate(-3deg);
}

.effect2:after {
	-webkit-transform: rotate(3deg);
	-moz-transform: rotate(3deg);
	-o-transform: rotate(3deg);
	-ms-transform: rotate(3deg);
	transform: rotate(3deg);
	right: 10px;
	left: auto;
}

.legal {
	width: 70%;
}

.pb-3, .py-3 {
	padding-top: 60px;
}

.mb-5, .my-5 {
	margin-top:100px;
	margin-bottom:60px;
	margin-bottom: 0.3rem;
}

/*심리테라피 리스트*/

/* Lazy Load Styles */
.card-image {
	display: block;
	min-height: 20rem; /* layout hack */
	background: #fff center center no-repeat;
	background-size: cover;
	/* filter: blur(3px); */ /* blur the lowres image */
}

.card-image > img {
	display: block;
	width:300px; 
	height:500px;
	opacity: 0; /* visually hide the img element */
}
#headerimage {
	z-index: -1;
	position: relative;
	top: -50px;
	height: 400px;
	/* background-image: url("http://michaeltruong.ca/images/invoicebg.jpg"); */
	/* -webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15),
    inset 0 -2px 4px rgba(0, 0, 0, 0.15); */
	-moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), inset 0 -2px 4px
		rgba(0, 0, 0, 0.15);
	/* box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15),
    inset 0 -2px 4px rgba(0, 0, 0, 0.15); */
	overflow: hidden;
	background-attachment: fixed;
	background-size: 1920px 80%;
	background-position: 50% -90%;
}

#invoice {
	position: relative;
	top: -290px;
	margin: 0 auto;
	width: 85%;
	background: #fff;
}

.logo {
	float: left;
	height: 60px;
	width: 60px;
	background: url(http://michaeltruong.ca/images/logo1.png) no-repeat;
	background-size: 60px 60px;
}

.clientlogo {
	float: left;
	height: 60px;
	width: 60px;
	background: url(http://michaeltruong.ca/images/client.jpg) no-repeat;
	background-size: 60px 60px;
	border-radius: 50px;
}

.info {
	display: block;
	float: left;
	margin-left: 20px;
}

.title {
	float: right;
}

.title p {
	text-align: right;
}

#project {
	margin-left: 52%;
}



.tabletitle {
	padding: 5px;
	background: #eee;
}

.service {
	border: 1px solid #eee;
}

.item {
	width: 35%;
}

.itemtext {
	font-size: 0.9em;
}

td.subtotal {
	width: 25%;
}

td.Rate {
	width: 15%;
}

td.Hours {
	width: 15%;
}

#legalcopy {
	margin-top: 30px;
}

form {
	float: right;
	margin-top: 30px;
	text-align: right;
}

.effect2 {
	position: relative;
}

.effect2:before, .effect2:after {
	z-index: -1;
	position: absolute;
	content: "";
	bottom: 15px;
	left: 10px;
	width: 50%;
	top: 80%;
	max-width: 300px;
	background: #777;
	-webkit-box-shadow: 0 15px 10px #777;
	-moz-box-shadow: 0 15px 10px #777;
	box-shadow: 0 15px 10px #777;
	-webkit-transform: rotate(-3deg);
	-moz-transform: rotate(-3deg);
	-o-transform: rotate(-3deg);
	-ms-transform: rotate(-3deg);
	transform: rotate(-3deg);
}

.effect2:after {
	-webkit-transform: rotate(3deg);
	-moz-transform: rotate(3deg);
	-o-transform: rotate(3deg);
	-ms-transform: rotate(3deg);
	transform: rotate(3deg);
	right: 10px;
	left: auto;
}

.legal {
	width: 70%;
}

.pb-3, .py-3 {
	padding-top: 60px;
}

.mb-5, .my-5 {
	margin-top:100px;
	margin-bottom:60px;
	margin-bottom: 0.3rem;
}

/*심리테라피 리스트*/

/* Lazy Load Styles */
.card-image {
	display: block;
	min-height: 20rem; /* layout hack */
	background: #fff center center no-repeat;
	background-size: cover;
	/* filter: blur(3px); */ /* blur the lowres image */
}

.card-image > img {
	display: block;
	width:300px; 
	height:400px;
	opacity: 0; /* visually hide the img element */
}
/* Layout Styles */


.card-list {
	display: block;
	margin: 1rem auto;
	padding: 0;
	font-size: 0;
	text-align: center;
	list-style: none;
	width:80%;
}

.card {
    border-radius: 30px;
	display: inline-block;
	width: 430px;
	margin: 1rem;
	font-size: 1rem;
	text-decoration: none;
	overflow: hidden;
	box-shadow: 0 0 3rem -1rem rgba(0, 0, 0, 0.5);
	transition: transform 0.1s ease-in-out, box-shadow 0.1s;
	height: 750px;
}

.card:hover {
	transform: translateY(-0.5rem) scale(1.0125);
	box-shadow: 0 0.5em 3rem -1rem rgba(0, 0, 0, 0.5);
}

.card-description {
	display: block;
	padding: 2em 0.5em;
	color: #515151;
	text-decoration: none;
}

.card-description > h2 {
	margin: 0 0 0.5em;
}

/* .card-description > p {
	margin: 0;
} */
.therapy-title{
	font-weight:bold;
	font-size:20px;
}
.sub-title{
	width:80%;
	margin-right:auto;
	margin-left:auto;
}
/*심리테라피 리스트 end*/

    @import url('https://fonts.googleapis.com/css?family=Nunito');

article {
  max-width: 700px;
  margin: 0 auto;
  padding: 20px;
  box-sizing: border-box;
}

p {
  font-family: 'Nunito';
  font-size: 18px;
  color: rgba(0,0,0,.84);
  line-height: 1.60;
}

article img {
  max-width: 100%;
  display: block;
  position: relative;
  cursor:  zoom-in;
}

#detail-modal {
  justify-content: center;
  align-items: center;
  display: none;
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
}

#detail-modal img {
  display: block;
  position: relative;
  z-index: 100;
  cursor: zoom-out;
}

.bg {
  position: fixed;
  left: 0;
  top: 0;
  right: 0;
  background-color: #ffffff;
  opacity: 0;
  display: block;
  transition: opacity .3s;
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
	margin-top:20px;
	margin-bottom:20px;
	margin-right:100px;
	float:right;
}

.body-container{
	display: flex;
    align-items: center;
    flex-direction: column;
    min-height: 100vh;
}

.page-item.active .page-link {
	border: 0.5px solid #8dacbd42;
	background-color: white;
	color: #4b5b73;
	font-weight: bold;
	font-size: 14px;
	margin-top: -1px;
	border-radius:20px;
}

.page-link {
	border: 0px;
	font-size: 14px;
	color: #666666;
	margin-left: 10px;
}

#pagination>li {
	margin-right: 10px;
}

</style>
</head>
<body>
		<section class="hero-wrap hero-wrap-2">
	<img src="img/bannerimg/groupcounsel.png" id="bannerimg">
	</section>
	<div class="container">
		<div class="row justify-content-start mb-5 pb-2">
			<div
				class="col-md-4 heading-section ftco-animate fadeInUp ftco-animated">
				<span class="subheading subheading-with-line"><small
					class="pr-2 bg-white">MAEUMI</small></span>
				<h2 class="mb-4">그룹상담 신청</h2>
			</div>
			<div
				class="col-md-8 pl-md-5 heading-section ftco-animate fadeInUp ftco-animated">
				<div class="pl-md-4 border-line">
					<p>다치기 쉬운 것이 사람의 마음이지요.오랫동안 익명의 상담을<br>
					   통해 고통 가운데 있는 사람들이 정말 많음을 보게 됩니다.<br>
					   마으미 그룹 상담을 통해서 여러분의 마음을 치유해 드립니다... </p>
				</div>
			</div>
		</div>
	</div>
	<!-- 상담 진행 속도 -->
	<div class="md-stepper-horizontal orange">
		<div class="md-step active">
			<div class="md-step-circle">
				<span>1</span>
			</div>
			<div class="md-step-title">step1</div>
			<div class="md-step-optional">카테고리 및 상담사 검색</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
		<div class="md-step">
			<div class="md-step-circle">
				<span>2</span>
			</div>
			<div class="md-step-title">step2</div>
			<div class="md-step-optional">상담 디테일</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
		<div class="md-step">
			<div class="md-step-circle">
				<span>3</span>
			</div>
			<div class="md-step-title">step3</div>
			<div class="md-step-optional">결제 정보</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
		<div class="md-step">
			<div class="md-step-circle">
				<span>4</span>
			</div>
			<div class="md-step-title">step4</div>
			<div class="md-step-optional">결제 완료</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
	</div>

	<div class="group-menu">
		<br><br>
		<ul class="card-list">
		 <c:forEach items="${groupCounselList}" var="group">
	        <c:if test="${group.gc_status ne 2 }">
	        <li class="card">
	            <a href="javascript:void(0);" onclick="func('${group.gc_no}')">
	                <img style="width:430px;height:400px;" src="../fileupload/gcsumnail/${group.gc_sumnail}" alt="Psychopomp"
	                onerror="this.src='https://media.istockphoto.com/vectors/isometric-building-concept-single-on-round-base-vector-id1090958052';" />
	            </a>
	            <div class="card-description" target="_blank">
	            	<div class="therapy-title">${group.gc_title}</div>
	            	<p style="height:20px; width:400px; text-align: right;">${group.gc_name }</p>
					<p class="therapy-title" style="font-size: 20px;">⏱${group.gc_date}일 ${group.gc_time}시</p>
					<p class="therapy-title" style="font-size: 20px;">👨‍👩‍👧 정원 ${group.gc_min_person }명 - ${group.gc_max_person}명</p>
					<p class="therapy-title" style="font-size: 20px;">신청 인원 ${group.gc_person }명</p>
					<c:if test="${group.gc_max_person > group.gc_person }">
						<p class="therapy-title">
							<button style="width:90px;" id="btn" onclick="func('${group.gc_no}','${group.c_email}')" class="btn btn--block card__btn">조회하기</button>
						</p>
					</c:if>
					<c:if test="${group.gc_max_person <= group.gc_person }">
						<p class="therapy-title">
							<button style="width:90px; id="btn" onclick="func('${group.gc_no}')" class="btns btn--block card__btn" disabled>신청불가</button>
						</p>
					</c:if>
	                <%-- <p class="therapy-title">${therapyList.t_title}</p>
	                <p class="sub-title">${therapyList.t_writedate }</p>
	                <p class="sub-title">${therapyList.t_name }</p> --%>
	            </div>
	        </li>
	        </c:if>
        </c:forEach>
	  </ul>
	</div>
<br>
	<div style=" width:1200px; margin:0 auto;">
		  <ul class="pagination" style="padding-left: 540px;">
		    <%-- <li class="page-item">
		      <a class="page-link" href="userGroupCounsel.do?nowPage=${page.prev }" tabindex="-1">Previous</a>
		    </li> --%>
		    <c:forEach begin="1" end="${page.lastPage}" varStatus="status">
				<c:if test="${status.count ne page.nowPage}">
		    		<li class="page-item"><a class="page-link" href="userGroupCounsel.do?nowPage=${status.count}">${status.count}</a></li>
		   		</c:if>
		   		<c:if test="${status.count eq page.nowPage}">
					<li class="page-item active"><a class="page-link" href="userGroupCounsel.do?nowPage=${status.count}">${status.count}<span class="sr-only">(current)</span></a></li>
		   		</c:if>
		    </c:forEach>
		    <%-- <li class="page-item">
		      <a class="page-link" href="userGroupCounsel.do?nowPage=${page.next}">Next</a>
		    </li> --%>
		  </ul>
	</div>
<br><br><br><br><br>
	<script type="text/javascript">
		function func(gc_no, c_email){
			console.log(gc_no);
			location.href = "userGroup.do?gc_no="+gc_no+"&c_email="+c_email;
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인상담 신청2단계</title>
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

/*next-btn*/
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
	float: right;
}

#next-btn:hover {
	background: #fff;
	color: #153e54;
	border: solid 1px #153e54;
	transition: 0.3s ease-in-out;
	cursor: pointer;
}

.next-btn-field {
	margin-bottom: 30px;
	padding-left: 100px;
}
/*next btn end*/
#detail-view {
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

#detail-view:hover {
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

/*counselor-list*/

/*상담사 리스트 스타일*/
* {
	box-sizing: border-box;
}

.body-container {
	/* background-color: #28223f; */
	font-family: Montserrat, sans-serif;
	display: flex;
	align-items: center;
	/* justify-content: center; */
	flex-direction: column;
	min-height: 100vh;
	margin: 0;
}

h3 {
	margin: 10px 0;
}

h6 {
	margin: 5px 0;
	text-transform: uppercase;
}

p {
	font-size: 14px;
	line-height: 21px;
}

.card-container {
	/* background-color: #231e39; */
	border-radius: 30px;
	box-shadow: 0px 10px 20px -10px rgba(0, 0, 0, 0.75);
	color: #b3b8cd;
	padding-top: 30px;
	position: relative;
	width: 350px;
	max-width: 100%;
	text-align: center;
	margin: 30px;
}

.card-container .pro {
	color: #231e39;
	background-color: #febb0b;
	border-radius: 3px;
	font-size: 14px;
	font-weight: bold;
	padding: 3px 7px;
	position: absolute;
	top: 30px;
	left: 30px;
}

.card-container .round {
	border: 1px solid #153e54;
	border-radius: 50%;
	padding: 7px;
	margin-right: 40px;
}

div.buttons {
	/* margin-bottom: 15px;
	margin-top: 15px; */
	border: 1px solid #8dacbd42;
	width: 200px;
	margin-right: auto;
	margin-left: auto;
	width: 150px;
	border-radius: 30px;
}

button.primary {
	background-color: #8dacbd42;
	border: 1px solid #8dacbd42;
	border-radius: 30px;
	color: #ffffff;
	font-family: Montserrat, sans-serif;
	font-weight: 500;
	font-size: 11px;
	padding: 10px 20px;
}

.buttons {
	padding: 10px;
}

.buttons:hover {
	cursor: pointer;
	background-color: white;
	color: #153e54;
	transition: 300ms ease-in-out;
	font-weight: bold;
}

button.primary.ghost {
	background-color: transparent;
	color: #02899c;
}

.skills {
/* 	background-color: #1f1a36; */
	text-align: left;
	padding-left: 15px;
    padding-top: 10px;
    padding-bottom: 2px;
	margin-top: 5px;
}

.skills ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.skills ul li {
	border: 1px solid #153e54;
    border-radius: 20px;
    display: inline-block;
    font-size: 11px;
    margin: 0 7px 7px 0;
    padding: 7px;
    color: #153e54;
}

.grid-container {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
}

/*input[type="checkbox"] {
 	position: relative;
	width: 40px;
	height: 20px;
	-webkit-appearance: none;
	background: #c6c6c6;
	outline: none;
	border-radius: 20px;
	box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
	transition: .5%; 
}

input:checked[type="checkbox"] {
	background: #153e54;
}

input[type="checkbox"]:before {
	content: "";
	position: absolute;
	width: 20px;
	height: 20px;
	border-radius: 50%;
	top: 0;
	left: 0;
	background: #fff;
	transform: scale(1.1);
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	transition: 0.5s;
}

input:checked[type="checkbox"]:before {
	left: 20px;
} */

/*상담사 리스트 스타일 end*/

/* 검색 div */
.detail {
	border: 0.5px solid #e2e2e2;
    display: none;
    width: 90%;
    margin-right: auto;
    margin-left: auto;
    animation: fadein 1s;
    -webkit-animation: fadein 1s; /* Safari and Chrome */
    padding: 50px;
    background-color: #d3e0e742;
    border-radius: 5px 5px 30px 30px;
     box-shadow: 0 4px 4px -4px black;
     margin-bottom:30px;
     
}
@keyframes fadein {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

@-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity: 0.1;
    }
    to {
        opacity: 1;
    }
}

.searchdiv{
	margin-right:auto;
	margin-left:auto;
	margin-top:50px;
	width: 90%;
}
input#c_name:focus{
	border:1px solid #8dacbd42;
	outline:0;
	}
input#c_name{
	height: 30px;
    padding-top: 30px;
    padding-bottom: 30px;
    width: 80%;
    border: 1px solid #8dacbd42;
    margin-right: 5px;
    margin-left: 40px;
    border-radius: 30px 5px 5px 30px;
}
#detailbtn{
	
	border-radius:5px 5px 5px 5px;
	border:1px solid #8dacbd42;
	border: 1px solid #8dacbd42;
    background-color: #8dacbd42;
    margin-right: auto;
    margin-left: auto;
    margin-top: 30px;
    padding: 15px;
    border-radius: 30px
}
#detailbtn:focus{
	border:1px solid #8dacbd42;
	outline:0;
}
#detailbtn:hover{
	cursor:pointer;
	
}
.search-btn{
	border-radius: 5px 30px 30px 5px;
	border:1px solid #153e54;
	background-color:#153e54;
	width: 90px;
	padding:18px;
    text-align: center;
    color:white;
}
.category-box{
	padding:20px;
}
.choice-btn{
	margin-right:auto;
	margin-left:auto;
	padding: 20px;
    padding-left: 45%;
}
.category{
	padding-bottom:20px;
}
.counseltype{
	padding-bottom:20px;
}
.gender{
	padding-bottom:20px;
}

#detailsubmitbtn{
	margin-right:auto;
	margin-left:auto;
	width:100px;
	height:40px;
	border-radius:30px;
	background-color:#153e54;
	border:1px solid #153e54;
	color:white;
	float:right;
}
.detail-hover:hover{
	cursor:pointer;
}
#confirmbtn{
	width: 130px;
    margin: 50px;
    height: 50px;
    border-radius: 30px;
    background-color: #153e54;
    color: white;
}
#confirmbtn:hover{
	background-color:white;
	border:1px solid #153e54;
	color:#153e54;
	transition:300ms ease-in-out;
}
#confirmbtn:focus{
	border:1px solid #153e54;
	outline:0;
}

/*검색 div end*/

</style>
</head>
<body>
	<br>
	<br>
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
	<br>
	<br>

	<section>
	<div class="md-stepper-horizontal orange">
		<div class="md-step active done">
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
	
		<div class="searchdiv">
			<p style="font-size:11px; margin-left:80px;">＊ 나에게 꼭 맞는 전문 심리상담사를 찾아보세요</p>
			<input type="text" id="c_name" style="padding:31px;" placeholder="상담사 이름을 입력해주세요..">
			<button type="button"  class="search-btn"  onclick="submitbtn();">검색</button>
		</div>
		 <div class="choice-btn">
			<button type="button" id="detailbtn">카테고리별 검색</button>
		 </div>	

		<div class="detail">
			<div class="category">
			  <p style="font-weight:bold;">상담 카테고리</p>
				<span class="category-box"> 
					<input style="margin-right:10px; zoom:1.3;" type="checkbox" class="input-check" name="c_type1" value="1"  >분노/우울
				</span> 
				<span class="category-box"> 
					<input style="margin-right:10px; zoom:1.3;" type="checkbox" name="c_type2" value="1">연애/우정
				</span> 
				<span class="category-box"> 
					<input style="margin-right:10px; zoom:1.3;" type="checkbox" name="c_type3" value="1">진로/취업
				</span> 
				<span class="category-box"> 
					<input style="margin-right:10px; zoom:1.3;" type="checkbox" name="c_type4" value="1">결혼/육아
				</span> 
				<span class="category-box"> 
					<input style="margin-right:10px; zoom:1.3;" type="checkbox" name="c_type5" value="1">청소년
				</span> 
				<span class="category-box"> 
					<input style="margin-right:10px; zoom:1.3;" type="checkbox" name="c_type6" value="1">가정
				</span>
			</div>
			<div class="counseltype">
				<p style="font-weight:bold;">상담유형</p>
				<span class="category-box"> 
					<input style="margin-right:10px; zoom:1.3;"  type="checkbox" name="p_kakao" value="1">카카오톡 채팅상담
				</span> 
				<span class="category-box"> 
					<input style="margin-right:10px; zoom:1.3;" type="checkbox" name="p_zoom" value="1">zoom 화상 상담
				</span> 
				<span class="category-box"> 
					<input style="margin-right:10px; zoom:1.3;" type="checkbox" name="p_phone" value="1">전화 상담
				</span>
			</div>
			<div class="gender">
				<p style="font-weight:bold;" >성별</p>
				<input style="margin-left:20px; zoom:1.2;" type="radio" name="c_gender" id="c_gender" value="all" checked="checked">전체
				<input style="margin-right:10px; zoom:1.2;" type="radio" name="c_gender" id="c_gender" value="남성">남성
				<input style="margin-right:10px; zoom:1.2;" type="radio" name="c_gender" id="c_gender" value="여성">여성
			</div>
			<button type="button" id="detailsubmitbtn">검색</button>
		</div>
	</section>

	<!-- 상담사 리스트 두번째 시도 -->
	<div class="body-container">
		<div class="grid-container">
			<c:forEach items="${counselorList }" var="counselorList">
				<div class="card-container" >
					<div class="detail-hover" onclick="func('${counselorList.c_email}','${type}')">
					<!-- <span class="pro">전문의</span>  -->
					<img class="round" src="img/counselorpicture/asdf.png}"
						onerror="this.src='resources/user/images/errorprofile.jpg';"
						style="width: 120px" alt="user">

					<span style="display:inline-grid;">
					<h4 style="color:#153e54;">${counselorList.c_name}</h4>
					<h6 style="color:#153e54;">${counselorList.c_grade}</h6>					
					</span>
					

					<div class="skills">
						<h6 style="font-size: 12px; margin-left:10px; color:#153e54;">상담방식</h6>
						<ul>				          	
				            <c:if test="${counselorList.p_kakao eq 1}">
				            <li value="${counselorList.p_kakaoprice}">카카오톡 ${counselorList.p_kakaoprice} 원</li>
				            </c:if>
											
							<c:if test="${counselorList.p_zoom eq 1}">
							<li value="${counselorList.p_zoomprice}">줌 ${counselorList.p_zoomprice} 원</li>
							</c:if>
							
							<c:if test="${counselorList.p_phone eq 1}">
							<li value="${counselorList.p_phoneprice}">전화 ${counselorList.p_phoneprice} 원</li>
							</c:if>		
			          </ul>
					</div>
					</div>
					<%-- <div class="buttons" onclick="func('${counselorList.c_email}','${type}')">자세히 보기

					</div> --%>
					<input type="checkbox" id="check-btn" name="c_email" onclick="doOpenCheck(this);"
						class="btn btn-primary px-4 py-3 mt-3" style="zoom:2.0; margin-bottom:10px;" value="${counselorList.c_email}">
				</div>
			</c:forEach>
		</div>
		<button type="button" id="confirmbtn" >선택</button>
	</div>

	<script>
		//선택버튼
		$('#confirmbtn').on('click', function() {
			var c_email = $('input:checkbox[name="c_email"]:checked').val();
			location.href='test2pg.do?c_email='+ c_email
			console.log(c_email);
			
		});
	
		//세부검색 카테고리 div 보이기/안보이기
		$('#detailbtn').click(function() {
			if ($('.detail').css('display') == 'none') {
				$('.detail').show();
			} else if ($('.detail').css('display') != 'none') {
				$('.detail').fadeOut();
			}
		});
		
		//검색
		$(document).on('click', '#detailsubmitbtn', function(e) {
			e.preventDefault();
			var c_name = $("#c_name").val();
			var c_type1 = $("input:checkbox[name='c_type1']:checked").val();
			var c_type2 = $("input:checkbox[name='c_type2']:checked").val();
			var c_type3 = $("input:checkbox[name='c_type3']:checked").val();
			var c_type4 = $("input:checkbox[name='c_type4']:checked").val();
			var c_type5 = $("input:checkbox[name='c_type5']:checked").val();
			var c_type6 = $("input:checkbox[name='c_type6']:checked").val();
			var p_kakao = $("input:checkbox[name='p_kakao']:checked").val();
			var p_zoom = $("input:checkbox[name='p_zoom']:checked").val();
			var p_phone = $("input:checkbox[name='p_phone']:checked").val();
			var c_gender = $("input[name='c_gender']:checked").val();
			
			var url = "testpg.do"
			url = url + "?c_name=" + c_name;
			url = url + "&c_type1=" + c_type1;
			url = url + "&c_type2=" + c_type2;
			url = url + "&c_type3=" + c_type3;
			url = url + "&c_type4=" + c_type4;
			url = url + "&c_type5=" + c_type5;
			url = url + "&c_type6=" + c_type6;
			url = url + "&p_kakao=" + p_kakao;
			url = url + "&p_zoom=" + p_zoom;
			url = url + "&p_phone=" + p_phone;
			url = url + "&c_gender=" + c_gender;
			location.href = url;			
		});
		//input box 값 가져오기
		

		/* 	 	$('#detail-view').click(function(){
		 location.href = 'counselorDetail.do'
		
		 });  */

		$('#previous-btn').click(function() {
			location.href = 'userPersonalCounsel.do'
		});

		$('#next-btn').click(function() {
			/* let e_mail = $("input[name=e_mail]:checked").val();
			$("c_email").attr('value', 이메일값); */
			step2.submit();
			location.href = 'personalCounselStep3.do'
		});

		function func(c_email, type) {
			location.href = "counselorDetail.do?c_email=" + c_email
					+ "&onecheck=" + type;
		}

		function doOpenCheck(chk) {
			var obj = document.getElementsByName("c_email");
			for (var i = 0; i < obj.length; i++) {
				if (obj[i] != chk) {
					obj[i].checked = false;
				}
			}
		}

		$(".hover").mouseleave(function() {
			$(this).removeClass("hover");
		});
		
		
		function doOpenCheck(chk) {
			var obj = document.getElementsByName("c_email");
			for (var i = 0; i < obj.length; i++) {
				if (obj[i] != chk) {
					obj[i].checked = false;
				}
			}
		}
	</script>
</body>
</html>
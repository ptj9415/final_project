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
	float:right;
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
#detail-view{
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

#detail-view:hover{
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
.counselor-list {
	width: 70%;
	margin-right: auto;
	margin-left: auto;
	margint-top: 50px;
	padding-top: 100px;
	margin-bottom:100px;
}

.staff .img {
	height: 200px;
}

.col-md-6 col-lg-3 ftco-animate fadeInUp ftco-animated {
	border: solid 0.3px lightgray;
}

.btn btn-primary px-4 py-3 mt-3 {
	heigth: 30px;
}

#p_kakao_text{
	border: 0px;
	width:50%;
}

#p_zoom_text{
	border: 0px;
	width:50%;
}

#p_phone_text{
	border:0px;
	width:50%;
}

#check-btn{
	width: 100px;
    height: 50px;
    border: 1px solid #153e54;
    background-color: white;
    border-radius: 20px;
}
/*상담사 리스트 스타일*/

@import url(https://fonts.googleapis.com/css?family=Roboto:300,400);
@import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css);


figure.snip1390 {
  font-family: "Roboto", Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin: 10px;
  margin-right:20px;
  margin-left:20px;
  min-width: 230px;
  max-width: 290px;
  width: 100%;
  color: #000000;
  text-align: center;
  font-size: 16px;
  background-color: #153e54;
  padding: 30px;
  background-image: linear-gradient(
    -25deg,
    rgba(0, 0, 0, 0.2) 0%,
    rgba(255, 255, 255, 0.1) 100%
  );
  border-radius: 30px;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}
figure.snip1390 *,
figure.snip1390 *:before,
figure.snip1390 *:after {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
figure.snip1390 figcaption {
  width: 100%;
}
figure.snip1390 h2,
figure.snip1390 h4,
figure.snip1390 blockquote {
  margin: 0;
}
figure.snip1390 h2,
figure.snip1390 h4 {
  font-weight: 300;
}
figure.snip1390 h2 {
  color: #ffffff;
}
figure.snip1390 h4 {
  color: #a6a6a6;
}
figure.snip1390 blockquote {
  font-size: 1em;
  padding: 30px 20px 20px;
  margin-top: 30px;
  background-color: #ffffff;
  border-radius: 5px;
  box-shadow: inset -1.4px -1.4px 2px rgba(0, 0, 0, 0.3);
  text-align: left;
  position: relative;
  height:200px;
}

figure.snip1390 .profile {
  width: 100px;
  border-radius: 50%;
  display: inline-block;
  box-shadow: 3px 3px 20px rgba(0, 0, 0, 0.4);
  margin-bottom: 10px;
  /* border: solid 5px #a6a57a; */
}
.main-container{
	display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr;
    margin-right: auto;
    margin-left: auto;
    width: 80%;
    margin-top: 100px;
}

.type-container{
	
    display: grid;
    grid-template-columns: 4fr 4fr 2fr;
    font-size: 0.6rem;
}
/*상담사 리스트 스타일 end*/
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

<!-- 상담사리스트  -->
<div class="main-container">
	<c:forEach items="${counselorList }" var="counselorList">
        <figure class="snip1390">
                	<img src="img/counselorpicture/${counselorList.c_picturepath}" onerror="this.src='resources/user/images/errorprofile.jpg';" width="100" class="rounded-circle"> 
            <figcaption>
            	<br>
                <h4 style="color:white;">${counselorList.c_name}</h4>
                <p style="color:white;">${counselorList.c_grade}</p>
                <blockquote>
                	
                    <input type="hidden" id="p_kakao" value="${counselorList.p_kakao }">
                		
							<c:if test="${counselorList.p_kakao eq 1}">
							  	<div class="type-container">
									<input type="text" id="p_kakao_text" value="카카오톡">
									<input type="text" id="p_kakao_text" value="${counselorList.p_kakaoprice}">
									<input type="text" id="p_kakao_text" value="원">
								</div>
							</c:if>
							
							<c:if test="${counselorList.p_kakao eq 0}">
							  <div class="type-container">	
								<input type="hidden" id="p_kakao_text" value="카카오톡">
								<input type="hidden" id="p_kakao_text" value="${counselorList.p_kakaoprice}">
								<input type="hidden" id="p_kakao_text" value="원">
							  </div>
							</c:if>
							
							<br>
							<br>
							
							<input type="hidden" id="p_zoom" value="${counselorList.p_zoom }">
							
							<c:if test="${counselorList.p_zoom eq 1}">
								<div class="type-container">
								<input type="text" id="p_zoom_text" value="줌"> 
								<input type="text" id="p_zoom_text" value="${counselorList.p_zoomprice}">
								<input type="text" id="p_zoom_text" value="원">
								</div>
							</c:if>
							
							<c:if test="${counselorList.p_zoom eq 0}">
								<div class="type-container">
								<input type="hidden" id="p_zoom_text" value="줌"> 
								<input type="hidden" id="p_zoom_text" value="${counselorList.p_zoomprice}">
								<input type="hidden" id="p_zoom_text" value="원">
								</div>
							</c:if>
							
							<br>
							<br>
							
								<input type="hidden" id="p_phone" value="${counselorList.p_phone }">
								
							<c:if test="${counselorList.p_phone eq 0}">
								<div class="type-container">
								<input type="hidden" id="p_phone_text" value="전화">
								<input type="hidden" id="p_phone_text" value="${counselorList.p_phoneprice}">
								<input type="hidden" id="p_phone_text" value="원">
								</div>
							<%-- <p>전화 ${counselorList.p_phoneprice}</p> --%>
							</c:if>
							
							<c:if test="${counselorList.p_phone eq 1}">
								<div class="type-container">
								<input type="text" id="p_phone_text" value="전화">
								<input type="text" id="p_phone_text" value="${counselorList.p_phoneprice}">
								<input type="text" id="p_phone_text" value="원">
								</div>
							<%-- <p>전화 ${counselorList.p_phoneprice}</p> --%>
							</c:if>
					
						<input type="checkbox" id="check-btn" name="c_email" class="btn btn-primary px-4 py-3 mt-3" onclick="doOpenCheck(this);" value="${counselorList.c_email}" >
						<input type="button" id="detail-view" onclick="func('${counselorList.c_email}','${type}')" value="자세히 보기">

				</blockquote>
                
            </figcaption>
        </figure>
     </c:forEach>
    </div>
<!-- 상담사리스트 end -->


<!-- 원래리스트 -->
<form id="step2" action="personalCounselStep3.do" method="post">
	<div class="counselor-list">
		<div class="row">
	<c:forEach items="${counselorList }" var="counselorList">
			<div class="col-md-6 col-lg-3 ftco-animate fadeInUp ftco-animated">
				<div class="staff">
				<!-- 	<div class="img" style="background-image: url(resources/users/images/kitty.jpg);"></div> -->
					<div class="text px-4 pt-4">
						<h3>${counselorList.c_name}</h3>
						<span class="position mb-2">${counselorList.c_grade}</span>
						
							<input type="hidden" id="p_kakao" value="${counselorList.p_kakao }">
							<c:if test="${counselorList.p_kakao eq 1}">
							  <div class="type-container">
								<input type="text" id="p_kakao_text" value="카카오톡">
								<input type="text" id="p_kakao_text" value="${counselorList.p_kakaoprice}">
								<input type="text" id="p_kakao_text" value="원">
							  </div>
								
							</c:if>
							
							<c:if test="${counselorList.p_kakao eq 0}">
								<input type="hidden" id="p_kakao_text" value="카카오톡">
								<input type="hidden" id="p_kakao_text" value="${counselorList.p_kakaoprice}">
								<input type="hidden" id="p_kakao_text" value="원">
							</c:if>
							
							<br>
							<br>
							
							<input type="hidden" id="p_zoom" value="${counselorList.p_zoom }">
							
							<c:if test="${counselorList.p_zoom eq 1}">
								<input type="text" id="p_zoom_text" value="줌"> 
								<input type="text" id="p_zoom_text" value="${counselorList.p_zoomprice}">
								<input type="text" id="p_zoom_text" value="원">
							</c:if>
							
							<c:if test="${counselorList.p_zoom eq 0}">
								<input type="hidden" id="p_zoom_text" value="줌"> 
								<input type="hidden" id="p_zoom_text" value="${counselorList.p_zoomprice}">
								<input type="hidden" id="p_zoom_text" value="원">
							</c:if>
							
							<br>
							<br>
							
								<input type="hidden" id="p_phone" value="${counselorList.p_phone }">
							<c:if test="${counselorList.p_phone eq 0}">
								<input type="hidden" id="p_phone_text" value="전화">
								<input type="hidden" id="p_phone_text" value="${counselorList.p_phoneprice}">
								<input type="hidden" id="p_phone_text" value="원">
							<%-- <p>전화 ${counselorList.p_phoneprice}</p> --%>
							</c:if>
							
							<c:if test="${counselorList.p_phone eq 1}">
								<input type="text" id="p_phone_text" value="전화">
								<input type="text" id="p_phone_text" value="${counselorList.p_phoneprice}">
								<input type="text" id="p_phone_text" value="원">
							<%-- <p>전화 ${counselorList.p_phoneprice}</p> --%>
							</c:if>
					
						<input type="checkbox" id="check-btn" name="c_email" class="btn btn-primary px-4 py-3 mt-3" onclick="doOpenCheck(this);" value="${counselorList.c_email}" >
						<input type="button" id="detail-view" onclick="func('${counselorList.c_email}','${type}')" value="자세히 보기">
					</div>
				</div>
			</div>
	</c:forEach>
		</div>
		
	<input type="hidden" id="c_email" name="onecheck" value="${type }"> 
	<input type="button" data-page="2" name="previous"
		class="previous action-button" value="Previous" id="previous-btn" />
	<input type="submit" data-page="2" name="next" 
		class="next action-button" id="next-btn" value="Next" />
	</div>
</form>
<!-- 원래리스트 end -->
	<script>
	
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
		
		function counselorSelect(str){
			frm.c_email.value=str;
			frm.submit();
		};
		
		function func(c_email,type){
			location.href = "counselorDetail.do?c_email="+c_email+"&onecheck="+type;
		}
		
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
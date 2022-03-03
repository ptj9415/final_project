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
}

#next-btn:hover {
	background: #fff;
	color: #468FB6;
	border: solid 1px #468FB6;
	transition: 0.3s ease-in-out;
	cursor: pointer;
}

#previous-btn {
	width: 100px;
	height: 40px;
	border-radius: 50px;
	background-color: #468FB6;
	color: white;
	border: solid 1px #468FB6;
	font-size: 14px;
	cursor: pointer;
	position: relative;
}

#previous-btn:hover {
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

/*calendar*/
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
/*step calendar end*/
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


	<div id="calendar1"
		style="width: 480px; height: 800px; margin-top: 100px">
		<div id="calendar_header">
			<i class="icon-chevron-left"></i>
			<h1></h1>
			<i class="icon-chevron-right"></i>
		</div>
		<div id="calendar_weekdays"></div>
		<div id="calendar_content"></div>
	</div>




	<!-- <section class="drawer__btn__wrapper">
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
	</section> -->

	<input type="button" data-page="2" name="previous"
		class="previous action-button" value="Previous" id="previous-btn" />
	<input type="button" data-page="2" name="next"
		class="next action-button" id="next-btn" value="신청하기" />
	<script>
		$('#previous-btn').click(function() {
			location.href = 'personalCounselStep3.do'
		});

		$('#next-btn').click(function() {
			location.href = 'personalCounselApplication.do'
		});
		
		
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
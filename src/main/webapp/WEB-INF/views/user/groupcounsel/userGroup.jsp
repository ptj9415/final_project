<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  /* .blog-card:hover .date__box {
    opacity: 1;
    transform: scale(1); 
  }
  .blog-card:hover .card__background--main {
    transform: scale(1.2) rotate(5deg);
  }
  .blog-card:hover .card__background--layer {
    opacity: 1;
  }
  .blog-card:hover .blog-card__info h5 {
    color: #468FB6;
  } */
  
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
/*button end*/
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
					<h1 style="color: white">그룹상담</h1>
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
				<h2 class="mb-4">그룹상담 신청</h2>
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
			<div class="md-step-optional">그룹 상담 프로그램 선택</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
		<div class="md-step active editable">
			<div class="md-step-circle">
				<span>2</span>
			</div>
			<div class="md-step-title">step2</div>
			<div class="md-step-optional">그룹 상담 상세 목록</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
		<div class="md-step">
			<div class="md-step-circle">
				<span>3</span>
			</div>
			<div class="md-step-title">step3</div>
			<div class="md-step-optional">그룹 상담 결제</div>
			<div class="md-step-bar-left"></div>
			<div class="md-step-bar-right"></div>
		</div>
	</div>


	 <div class="container mt-5">
        <div class="row">
          <div class="col-12">
            <article class="blog-card">
              <div class="blog-card__background">
                <div class="card__background--wrapper">
                  <div class="card__background--main" style="background-image: url('resources/user/images/sample.jpg'); border-radius:40px">
                    <div class="card__background--layer"></div>
                  </div>
                </div>
              </div>
              <div class="blog-card__head">
                <span class="date__box">
                  <span class="date__day">${userGroup.gc_date }</span>
                  <span class="date__month">JAN</span>
                </span>
              </div>
              <div class="blog-card__info">
                <h5 style="margin-left:40px; margin-top:15px; color:#468FB6; font-weight:bold;">${userGroup.gc_title }</h5>
                <p>
                  <a href="#" class="" style="font-size:18px;">${userGroup.gc_name }</a>
                  <a href="#" class="">${userGroup.gc_price }</a>
                </p>
                 <div style="float:left"> ${userGroup.gc_infos}</div>
              </div>
            </article>
          </div>
                <button id="btn" onclick="func('${userGroup.gc_no}')" class="apply-btn">신청하기</button>
        </div>
      </div>
      <section class="detail-page">
        <div class="container mt-5">       
        	에디터 들어가는 자리.
        </div>
      </section>
      <script type="text/javascript">
		function func(gc_no){
			console.log(gc_no);
			location.href = "usergroupinvoice.do?gc_no="+gc_no;
		}
	</script>
</body>
</html>
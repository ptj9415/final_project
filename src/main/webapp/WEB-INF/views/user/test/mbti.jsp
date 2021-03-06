<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>미니 MBTI 테스트</title>
<meta name="description" content="미니 MBTI 테스트" />
<meta property="og:type" content="website" />
<meta property="og:title" content="미니 MBTI 테스트" />
<meta property="og:description" content="" />
<meta property="og:image"
	content="https://minggmbti.netlify.app/ESFJ.png" />
<meta property="og:url" content="https://minggmbti.netlify.app/" />
    <script>
        google.load( "webfont", "1" );
        google.setOnLoadCallback(function() {
         WebFont.load({ custom: {
          families: [ "NanumGothic" ],
          urls: [ "http://fontface.kr/NanumGothic/css" ]
         }});
        });
    </script>
<!--  <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
      integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
      crossorigin="anonymous"
    /> -->
<!-- 폰트 추가 -->
<!--    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
      rel="stylesheet"
    /> -->

<style>
 body, header ul li a, header h1, header h2{

font-family: 'Nanum Gothic', Arial, Helvetica, sans-serif !important;
font-size: 16px;
}

article {
	display: flex;
	flex-direction: column;
}

/* .start {
  font-family: "Nanum Pen Script", cursive;
} */
.progress {
	display: flex;
	height: 1.1rem;
	overflow: hidden;
	font-size: 0.75rem;
	background-color: #e9ecef;
	border-radius: 30px;
	border: 3px solid #e4e4e4;
}

.progress-bar {
	background-color: black;
}

.btn {
	background-color: #153e54;
	border-color: #153e54;
}

.question {
	display: none;
}

.questionMain {
	font-size: 20px;
	margin-top: 20px;
	text-align: center;
	color: rgb(58, 58, 58);
}

.result {
	display: none;
}

.subtitle {
	font-weight: bolder;
	text-align: center;
	font-size: 27px;
	margin-bottom: 50px;
}

.resulttitle {
	font-weight: bolder;
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 50px;
}

.resultcontent {
	font-size: 14px;
	margin-bottom: 100px;
}

img {
	display: block;
	margin: auto;
	width: 250px;
}

#bannerimg {
	height: 346px;
	width: 1920px;
}

.share {
	margin: 0 auto;
}

.questionMain:before {
	color: black;
	content: '"';
	font-size: 30px;
}

.questionMain:after {
	color: black;
	content: '"';
	font-size: 30px;
}

.arrow_box, .arrow_downbox {
	position: relative;
	background: #ffffff;
	/*  border: 2px solid #153e54; */
	border: 1px solid rgb(167, 167, 167);
	margin-top: 20px;
	padding: 10px;
	border-radius: 30px;
	outline: 0;
}

.arrow_box:focus {
	border: 1px solid rgb(167, 167, 167);
	outline: 0;
}

.arrow_box:hover {
	background-color: #8dacbd42;
	transition: 200ms ease-in-out;
	cursor: pointer;
}

.arrow_box:after {
	border-color: rgba(255, 255, 255, 0);
	border-top-color: #ffffff;
	border-width: 10px;
	margin-left: -10px;
}

.arrow_box:before {
	border-color: rgba(12, 14, 15, 0);
	border-top-color: #153e54;
	border-width: 13px;
	margin-left: -13px;
}

.arrow_downbox {
	position: relative;
	background: #ffffff;
	border: 1px solid rgb(167, 167, 167);
	padding: 10px;
	border-radius: 30px;
}

.arrow_downbox:focus {
	border: 1px solid rgb(167, 167, 167);
	outline: 0;
}

.arrow_downbox:hover {
	background-color: #8dacbd42;
	transition: 200ms ease-in-out;
	cursor: pointer;
}

.arrow_downbox:after {
	border-color: rgba(255, 255, 255, 0);
	border-top-color: #ffffff;
	border-width: 10px;
	margin-left: -10px;
}

.arrow_downbox:before {
	border-color: rgba(12, 14, 15, 0);
	border-top-color: #153e54;
	border-width: 13px;
	margin-left: -13px;
}

/* 버튼 이쁘게  */
@import url("https://fonts.googleapis.com/css?family=Roboto+Condensed");

.back {
	height: 200px;
	float: left;
	border: 10px;
	border-color: #ffffff;
	border-style: solid;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	padding: 0px 5px 5px 5px;
	font-family: "Nanum Pen Script", cursive;
}

.back:before {
	position: absolute;
	padding: 10px;
}

.button_base {
	margin: 0;
	border: 0;
	font-size: 18px;
	position: relative;
	top: 50%;
	left: 50%;
	margin-top: -25px;
	margin-left: -100px;
	width: 200px;
	height: 50px;
	text-align: center;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-user-select: none;
	cursor: default;
}

.button_base:hover {
	cursor: pointer;
}

.b03_skewed_slide_in {
	border-radius: 50px;
	overflow: hidden;
	border: #153e54 solid 1px;
}

.b03_skewed_slide_in div {
	position: absolute;
	text-align: center;
	width: 100%;
	height: 50px;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	padding: 10px;
}

.b03_skewed_slide_in div:hover {
	background-color: #153e54;
	color: white;
	transtion: 300ms ease-in-out;
	cursor: pointer;
}

.b03_skewed_slide_in div:nth-child(1) {
	color: #000000;
	background-color: #ffffff;
}

.b03_skewed_slide_in div:nth-child(2) {
	background-color: #153e54;
	width: 230px;
	transition: all 0.2s ease;
	-webkit-transition: all 0.2s ease;
	-moz-transition: all 0.2s ease;
	transform: translate(-250px, 0px) skewX(-30deg);
	-webkit-transform: translate(-250px, 0px) skewX(-30deg);
	-moz-transform: translate(-250px, 0px) skewX(-30deg);
}

.b03_skewed_slide_in div:nth-child(3) {
	color: #ffffff;
	left: -200px;
	transition: left 0.2s ease;
	-webkit-transition: left 0.2s ease;
	-moz-transition: left 0.2s ease;
}

.b03_skewed_slide_in:hover div:nth-child(2) {
	transition: all 0.5s ease;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	transform: translate(-15px, 0px) skewX(-30deg);
	-webkit-transform: translate(-15px, 0px) skewX(-30deg);
	-moz-transform: translate(-15px, 0px) skewX(-30deg);
}

.b03_skewed_slide_in:hover div:nth-child(3) {
	left: 0px;
	transition: left 0.30000000000000004s ease;
	-webkit-transition: left 0.30000000000000004s ease;
	-moz-transition: left 0.30000000000000004s ease;
}

#all {
	margin-top: 100px;
	margin-bottom: 200px;
	width: 50%;
	margin-right: auto;
	margin-left: auto;
}

.start-btn {
	width: 330px;
	margin-right: auto;
	margin-left: auto;
	border-radius: 30px;
	background-color: #153e54;
	color: white;
	margin-top: 50px;
}

.start-btn:hover {
	cursor: pointer;
	background-color: white;
	border: 1px solid #153e54;
	color: #153e54;
	transition: 300ms ease-in-out;
}

.pb-2, .py-2 {
	margin-top: 100px;
	margin-right: auto;
	margin-left: auto;
	width: 80%;
}

.selfesteem {
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>
<!-- banner start -->
<section class="hero-wrap hero-wrap-2">
	<img src="img/bannerimg/test.png" id="bannerimg">
</section>
<div class="container">
	<div class="row justify-content-start mb-5 pb-2">
		<div class="col-md-4 heading-section  ftco-animated">
			<span class="subheading subheading-with-line"><small
				class="pr-2 bg-white">MAEUMI</small></span>
			<h2 class="mb-4">MINI MBTI 검사</h2>
		</div>
		<div class="col-md-8 pl-md-5 heading-section  ftco-animated">
			<div class="pl-md-4 border-line">
				<p style="font-weight: bold;">나는 어떤 성향의 사람일까?
				<p style="font-size: 0.7rem">소요시간 약 10분</p>
				<br>
				<p>MBTI는 개인마다 태도와 인식, 판단 기능에서 각자 선호하는 방식의 차이를 나타내는 4가지 선호 지표로
					구성되어 있습니다.</p>
				<p>외향과 내향(E/I), 감각과 직관(S/N), 사고와 감정(T/F), 판단과 인식(J/P)
				 4가지 선호 지표를 조합하여 16가지의 성격 유형을 제시합니다</p>
			</div>
		</div>
	</div>
</div>

<!-- banner end -->
<body class="mbti-container">
	<div id="all">
		<article class="start">
			<img alt="" src="img/mbti/mbti.png"
				style="width: 500px; height: 400px;">
			<h1 class="mt-5 text-center">미니 MBTI 검사</h1>
			<button type="button" class="start-btn" style="font-size: 30px;"
				class="btn btn-primary mt-5" onclick="start();">테스트 시작하기</button>
		</article>
		<article class="question">
			<div class="progress mt-5">
				<div class="progress-bar" role="progressbar"
					style="background-color: black"></div>
			</div>

			<h2 id="title" class="questionMain">문제</h2>

			<input id="type" type="hidden" value="EI" />

			<button id="up" type="button" class="arrow_box mt-5"
				style="float: right">Primary</button>
			<button id="down" type="button" class="arrow_downbox mt-5"
				style="float: left">Primary</button>
		</article>
		<article class="result">
			<h3 id="subTitle" class="subtitle">설명</h3>
			<img id="img" class="rounded-circle mt-5" src="img/mbti/test.jpg"
				alt="item" />
			<!-- <h2 id="item" class="text-center mt-5">캐릭터 이름</h2> -->
			<h4 class="resulttitle">업무 성향</h4>
			<h5 class="resultcontent" id="workexplain" name="업무 성향"></h5>
			<h6 class="resulttitle">성격 혹은 대인관계</h6>
			<h7 class="resultcontent" id="perexplain" name="성격 혹은 대인관계"> </h7>

			<!-- <button
        style="margin-bottom: 40px"
        class="btn btn-primary mt-5"
        onclick="reset();"
      >
        다시 테스트 하기!
      </button> -->

			<div class="back">
				<div class="button_base b03_skewed_slide_in">
					<div class="reset-btn" onclick="reset();">다시 테스트 하기!</div>
				</div>
			</div>

			<!-- Go to www.addthis.com/dashboard to customize your tools -->
			<div class="share addthis_inline_share_toolbox"></div>
		</article>
	</div>
	<script type="text/javascript"
		src="//t1.daumcdn.net/kas/static/ba.min.js" async></script>
	<input type="hidden" id="EI" value="0" />
	<input type="hidden" id="SN" value="0" />
	<input type="hidden" id="TF" value="0" />
	<input type="hidden" id="JP" value="0" />
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script>
		var num = 1;
		var q = {
			1 : {
				title : "전화가 울리면 나는",
				type : "EI",
				up : "내가 먼저 받는다.",
				down : "다른 사람이 받기를 기대한다.",
			},
			2 : {
				title : "내가 주로 좋아하는 사람은",
				type : "SN",
				up : "상상력이 풍부한 사람.",
				down : "분별력이 있는 사람.",
			},
			3 : {
				title : "나는 남을 볼 때",
				type : "TF",
				up : "그 사람이 사물을 어떻게 보는가를 본다.",
				down : "그 사람의 유능한 점을 본다.",
			},
			4 : {
				title : "어제 오후 10시까지 야근하고 다음 날, 오전 업무를 하려고 한다. 어떤 일인가? ",
				type : "JP",
				up : "미리 하고 있는 개발 혹은 프로젝트",
				down : "어제 마무리하던 급한 이슈들",
			},
			5 : {
				title : "퇴근하고 집으로 가는 길, 버스정류장에 팀 사람이 보인다. ",
				type : "EI",
				up : "'은솔씨~ 퇴근하시나 보네요' 먼저 아는 척 한다.",
				down : "퇴근해서까지 팀 사람 마주치고 싶지 않다. 인사하지 않는다.",
			},
			6 : {
				title : "출퇴근 시간을 9 to 6 에서 12 to 9로 바꾸어 한 달간 시행한다고 한다.",
				type : "SN",
				up : "지금 출퇴근 시간이 좋다. 바꾸는 것 반대한다.",
				down : "뭐가 더 좋을지 모르니 바꾸는 것 찬성한다.",
			},
			7 : {
				title : "남을 평가하려면",
				type : "TF",
				up : "사람 보는 눈을 가진 몇몇 사람의 분석이 중요하다.",
				down : "많은 사람의 의견을 종합하는 것이 중요하다.",
			},
			8 : {
				title : "나는 일을 할 때",
				type : "JP",
				up : "목록을 작성하며 체크한다.",
				down : "체크는 하지만 자유롭다.",
			},
			9 : {
				title : "나는 스트레스를 받았을 때",
				type : "EI",
				up : "혼자서 좋아하는 것에 몰입한다.",
				down : "친한 사람들과 만나 떠들며 놀고 싶어한다.",
			},
			10 : {
				title : "팀원과 회의하던 도중 내가 알고 있는 것과 다르게 설명한다. 당신이 드는 생각은?",
				type : "SN",
				up : "이해가 안 가는데 뭐 맞는 말일 테니 일단 듣자.",
				down : "엥? 저게 저거라고? 왜 저거인 거지? 난 이해가 안가. 내 생각은 저게 전혀 아닌데? 물어볼까",
			},
			11 : {
				title : "같이 일하고 싶지 않은 사람은?",
				type : "TF",
				up : "이해력과 능력은 뛰어나지만 예의가 없고 부정적인 사람",
				down : "예의가 바르고 긍정적이지만 능력이 부족하여 일을 못하는 사람",
			},
			12 : {
				title : "새로운 프로젝트 맡게 되었고 기한은 한달이 주어졌다. 당신이 드는 생각은?",
				type : "JP",
				up : "한 달 동안 무슨 일이 있을지 모르니 미리미리 한다.",
				down : "한 달이나 남았으니 여유를 가지고 쉬엄쉬엄한다.",
			},
		};

		//결과
		var result = {
			ISTJ : {
				item : "청렴결백 논리주의자(ISTJ)",
				subTitle : "청렴결백 논리주의자(ISTJ)",
				workexplain : "매사에 꼼꼼하게 업무를 임하고 책임감이 강하다. 함께 일할 때 신뢰할 수 있는 사람으로서 계획한 것은 반드시 지키려는 원칙 주의자! 논리적이고 객관적이며 일처리를 할 때 냉철하고 신중하다. 다만 새로운 변화를 선호하진 않는다.",
				perexplain : "비교적 조용하고 내성적인 타입이다. 허나 자기 마음에 들어 하는 사람은 챙기고 끝까지 의리를 지키는 타입! 다만 내향적이기 때문에 다른 사람의 감정을 이해하는 능력이 조금 부족해서 남이 보내는 신호를 포착하는데 조금 어려움을 겪을 수 있다.",
				goodRel : "ESFP",
				badRel : "ENFJ",
				img : "img/mbti/ISTJ.png",
			},
			ISFJ : {
				item : "용감한 수호자(ISFJ)",
				subTitle : "용감한 수호자(ISFJ)",
				workexplain : "책임감과 인내력이 매우 강하다. 꼼꼼하고 계획적이게 일을 처리한다. 이러한 성격으로 완벽한 결과물을 내지 못하면 스트레스를 받는 완벽 주의자! 눈치가 빠르기 때문에 팀의 분위기와 성향을 빠르게 파악한다. 남한테 부탁하거나 신세 지는 것을 어려워하기 때문에 내 일은 내가 알아서 해낸다. 남들이 보기엔 거절을 잘 못하는 것으로 보여 많은 업무를 떠맡는 것 같지만 현실은 철저한 계산을 통해 내 이득을 챙긴다.",
				perexplain : "공감 능력이 뛰어나 힘들어하는 동료의 이야기를 잘 들어주지만 정작 내 얘기는 하지 않는다. 싸움, 정치질 딱 질색! 그런 상황을 보는 것 자체로도 스트레스를 받는다. 즉흥적인 일, 계획에 없던 일을 좋아하지 않기 때문에 갑작스러운 업무를 맡는 것을 싫어한다. 가장 싫어하는 것은 거짓말, 자만, 허세 그리고 시간, 감정 등 쓸모없는 낭비를 싫어한다. 조금 걱정이 많은 편이다.",
				goodRel : "INFP",
				badRel : "ESFP",
				img : "img/mbti/ISFJ.png",
			},
			INFJ : {
				item : "선의의 옹호자(INFJ)",
				subTitle : "선의의 옹호자(INFJ)",
				workexplain : "뛰어난 통찰력과 직관력을 바탕으로 함께 일하는 동료에게 선한 영향력을 끼친다. 아이디어 뱅크이기 때문에 기획하는 일에 자신 있어 한다. 지능이 높고 남들과 다른 기발하면서도 합리적인 발상을 자주 한다. 또한, 눈치가 빠른 편에 속하기 때문에 사회생활에서 한 거짓말, 가식을 간파하지만 그러려니 한다.",
				perexplain : "계획적인 것을 좋아하지만, 즉흥적인 것을 싫어하지도 않는다. 어려움에 겪은 사람을 도와주는 것을 좋아한다. 분쟁을 싫어하기 때문에 다른 사람을 욕하기보단 칭찬하는 것을 좋아한다. 남에게는 관대하지만, 본인에게는 매우 엄격하다. 평소 인내심이 많으므로 참고 참았다가 화를 표출한다.",
				goodRel : "ENTP",
				badRel : "ESTJ",
				img : "img/mbti/INFJ.png",
			},
			INTJ : {
				item : "용의주도한 전략가(INTJ)",
				subTitle : "용의주도한 전략가(INTJ)",
				workexplain : "논리적이며 창의적으로 탐구하는 것을 좋아하기 때문에 어떤 일이든 잘하는 사람이다. 문제 해결에 대한 욕구가 강하고 새로운 프로젝트를 진행하는 데 열정적이다. 무언가에 지나치게 파고드는 완벽주의 성향이 있으므로 일을 시작할 때 완벽하게 설계를 한다. 목표를 달성하기 위해 집중하기 때문에 한 가지 업무에 몰두하면 온종일 그 업무에 대해 고민하고 실현화될 때까지 전념한다. 업무 성향이 지적이기 때문에 헌신적으로 일한다.",
				perexplain : "지식에 대한 욕심이 많으므로 평소 날카로운 지적 행위 혹은 지식 축적활동으로 자존감을 얻는다. 내성적이고 진지한 편이다. 자기에 대한 확신이 강하기 때문에 관심 있는 분야를 깊게 통달할 수 있다는 자신감을 가지고 있고 이를 해낸다. 어떠한 결정을 할 때 신중한 편이며 결론을 내릴 땐 느낌과 직감이 아닌 분석과 타당한 논리를 바탕으로 결정한다. 감수성이 대체로 낮은 편 임으로 상대방이 감성적인 문제를 상의하러 오는 상황에는 어떻게 대해야 할지 몰라 당황해하는 경우가 있다.",
				goodRel : "ENFP",
				badRel : "ISFJ",
				img : "img/mbti/INTJ.png",
			},
			ISTP : {
				item : "만능 재주꾼(ISTP)",
				subTitle : "만능 재주꾼(ISTP)",
				workexplain : "상황을 파악하는 능력이 뛰어나다. 말 수가 적은 편이며 필요 이상으로 자신을 발휘하지 않기 때문에 불필요한 업무를 도맡아 하지 않는 편이다. 일에 큰 에너지를 쏟지 않는 유형이고 오히려 일을 귀찮아한다. 즉 노력은 절약하고 일의 능률은 높이는 편. 대부분 손재주가 뛰어나기 때문에 정밀을 필요로 하는 일을 남들보다 잘 해내는 편이다.",
				perexplain : "상황 적응력이 뛰어나며 상대방 기분에 장단 맞추어 주는 것을 싫어한다. 마음이 없는 소리는 하지 않는 편. 생각은 적극적인데 행동은 소극적으로 하는 편이다. 관심 분야가 아니면 일 뿐만 아니라 쳐다보지도 않는다. 즉 하고 싶은 것만 하고 하기 싫은 것은 죽어도 안 하는 편이다. 객관적인 원리를 좋아하기 때문에 수학, 과학 과목을 좋아하고 손재주가 좋다 보니 퍼즐 맞추기를 잘한다.",
				goodRel : "ESTJ",
				badRel : "INFP",
				img : "img/mbti/ISTP.jpg",
			},
			ISFP : {
				item : "호기심 많은 예술가(ISFP)",
				subTitle : "호기심 많은 예술가(ISFP)",
				workexplain : "다정하고 온화한 성격이라 평소 회사 동료들의 고민상담을 많이 들어준다. 이러한 좋은 성격으로 인해 남의 부탁을 거절하기 힘들어 남의 일을 맡게 되는 예도 있다. 회사 분위기가 경쟁하는 분위기보다는 편안한 분위기에서 더 좋은 성과를 발휘한다. 시간이 지날수록 조직에서 인정받는 스타일이며 추진력이 조금 부족한 편이다. ",
				perexplain : "많이 참는 성격으로 남에게 하고 싶은 말을 속으로 삭이는 편이다. 현재의 삶에 만족하고 즐기는 편이며 남을 잘 믿는다. 허나 나를 배신한 상대방과는 가차 없이 관계를 끊는다. 인간관계에 스트레스를 받기도 한다. 타인과 의견을 충돌하는 상황을 싫어하기 때문에 갈등을 되도록 피하려 한다. ",
				goodRel : "ENFJ",
				badRel : "ENFJ",
				img : "img/mbti/ISFP.jpg",
			},
			INFP : {
				item : "열정적인 중개자(INFP)",
				subTitle : "열정적인 중개자(INFP)",
				workexplain : "즉흥적이고 감정적인 부분이 강해서 편해 보일 수도 있지만 사실 집중력이 강하고 일 할 때 독고다이를 많이 한다. 회사 내 사람들에게 상처를 쉽게 받는 편이며 상사한테 아부할 줄 모른다. 회사 내에서 부당한 일을 당해 속 상하고 예민하더라도 겉으로는 친절하고 둥글둥글하기 때문에 아무도 그들의 속마음을 모른다. 다른 사람들로 인해 내 일이 방해될 경우 거부감을 표출하거나 혹은 참다 직장을 떠나버린다. ",
				perexplain : "개인주의기 때문에 각자만의 길을 가는 것을 좋아하고, 스스로 하는 것을 좋아하는 편이다. 이해심이 많고 적응이 빠르므로 어떤 환경이든 금방 스며든다. 타인의 감정 변화를 빠르게 눈치채고 좋아하는 사람을 기쁘게 하는 것에 즐거움을 느낀다. 허나 인간관계에서 타인에게 직접 영향을 끼치는 것을 좋아하지 않는다. 강자냐 약자냐 하면 주로 사회적 약자의 편에 스는 편이다. 이들의 모습을 보고 안타까워한다. ",
				goodRel : "ENTJ",
				badRel : "ISFP",
				img : "img/mbti/INFP.jpg",
			},
			INTP : {
				item : "논리적인 사색가(INTP)",
				subTitle : "논리적인 사색가(INTP)",
				workexplain : "회의 시간에 무뚝뚝한 편이지만 관심 있는 분야에는 누구보다 적극적으로 참여한다. 이해가 빠르고 지적 호기심이 많은 편이라 회사에서 뛰어난 역량을 발휘한다. 논리를 바탕으로 분석하고 어려운 일을 좋아한다. 쉽고 간단한 것은 싫어한다. 곰곰이 고민한 이후 결정을 내리기 때문에 이러한 침묵을 할 말이 없다는 뜻으로 받아들이는 동료도 가끔 있다. ",
				perexplain : "침착하고 인내심이 강한 사람이다. 가끔 혼자만의 시간을 통해 자신에게 집중할 시간이 필요하다. 타인의 말이나 행동을 보고 사회성을 배운다. 상황에 따라 어떻게 행동할지 배우고 연기하기 때문에 사회성이 부족하더라도 남들에겐 사회성 있게 비친다. 논리를 중요시하기 때문에 이유가 분명하지 않은 부분에 대한 강요를 불편해한다. ",
				goodRel : "ESFJ",
				badRel : "INTJ",
				img : "img/mbti/INTP.png",
			},
			ESTP : {
				item : "모험을 즐기는 사업가(ESTP)",
				subTitle : "모험을 즐기는 사업가(ESTP)",
				workexplain : "현실 감각이 뛰어나기 때문에 회사 내 이슈 발생 시 문제 해결을 빠르게 모색한다. 기본적인 유머감각을 가지고 있으므로 회사 내 누구와도 쉽게 잘 어울린다. 긴 설명을 싫어하는 편이며 순발력이 뛰어나기 때문에 갑작스러운 질문에도 대처를 잘한다. 다른 부서 사람들을 쉽게 기억하고 금방 친해진다.",
				perexplain : "생각에서 행동까지 실행해 옮기는 것이 매우 빠르므로 반대로 고민 끝에 결정하는 사람들을 조금 답답하다고 생각한다. 관심받는 것을 좋아하고 무대의 중심에 스는 걸 좋아한다. 학교 다닐 때 별명이 말썽꾸렁이라 불렸으며 촉이 매우 좋은 편이다. 이론 공부할 시간에 직접 뛰어들어 체험을 통해 경험하는 것을 더 좋아한다.",
				goodRel : "ISFJ",
				badRel : "ENFJ",
				img : "img/mbti/ESTP.jpg",
			},
			ESFP : {
				item : "자유로운 영혼의 연예인(ESFP)",
				subTitle : "자유로운 영혼의 연예인(ESFP)",
				workexplain : "흔히 말하는 성격이 좋다는 사람이기 때문에 회사 내 친한 동료가 많고 어떤 환경에서든 쉽게 적응한다. 회사 사람들이나 일어난 일에 관심이 많고 밝고 재미있는 분위기를 조성하는 분위기 메이커이다. 어려운 일이나 골치 아픈 업무는 너무 깊이 생각하지 말자는 주의이다.",
				perexplain : "평소에 크게 걱정하지 않고 살아가기 때문에 낙천적이다. 친구들과 어울리기를 좋아하기 때문에 주위에 사람이 많다. 또 이들 주위에 사람이 많은 이유는 성격이 좋기 때문이다. 이러한 이들의 동글동글한 성격과 센스가 다른 사람들로부터 편안함을 느끼고 자연스레 끌어드리게 된다. 다만 가끔 이들의 가족은 걱정이 너무 없는 이들을 오히려 걱정하기도 한다.",
				goodRel : "ISTJ",
				badRel : "ISTJ",
				img : "img/mbti/ESFP.png",
			},
			ENFP : {
				item : "재기발랄한 활동가(ENFP)",
				subTitle : "재기발랄한 활동가(ENFP)",
				workexplain : "열정적이기 때문에 문제를 빠르게 해내고 관심 있는 일은 무엇이든지 수행해낸다. 또한, 평소에 활기가 넘치고 창의적이기 때문에 새로운 업무를 맡아 일하는데 거부감이 크지 않다. 오히려 반복되는 일이 지루하다고 느낀다. 또한, 일만큼이나 주위 사람들에게도 관심을 가지기 때문에 회사 내 인간관계가 좋은 편이다.",
				perexplain : "새로운 시도나 도전을 좋아하는 편이고 계획하기보다는 그때그때 일을 처리한다. 감수성이 풍부하므로 쉽게 웃고 쉽게 운다. 이들은 사람을 기쁘게 해주는 능력이 타고났다. 이로 인해 주위에 사람들이 많이 따르고 좋게 생각한다. 인생은 즐겁게 살자 주의이며 하기 싫은 일을 시킬 때면 힘들어한다. ",
				goodRel : "INTJ",
				badRel : "ESTP",
				img : "img/mbti/ENFP.jpg",
			},
			ENTP : {
				item : "논쟁을 즐기는 변론가(ENTP)",
				subTitle : "논쟁을 즐기는 변론가(ENTP)",
				workexplain : "창의력이 풍부하고 다재다능하다. 새로운 일을 시도하는데 거부감이 없고 남들을 이끄는 팀장을 주로 맡는다. 자기주장이 뚜렷하기 때문에 더 높은 윗선과 충돌을 가질 수도 있다. 토론을 좋아하고 즐기는 편이다. ",
				perexplain : "무엇을 하든 항상 평균 이상 하는 편이다. 두뇌 회전이 빠르고 직관력을 통해 이해가 매우 빠르다. 벼락치기를 선호하는 편이고 평소에 관심 있는 부분은 공부를 전혀 하지 않아도 좋은 결과를 얻는다. 같은 이야기를 여러 번 듣는 것을 극도로 싫어한다. 허나 관심 없는 분야라도 처음 듣는 얘기는 잘 듣는다. 자존감이 높고 자기에 대한 확신이 강하다. 자신의 아이디어로 남을 이끄는 것을 좋아하지만 지나친 간섭은 오히려 하지 않는다. ",
				goodRel : "INFJ",
				badRel : "ESTJ",
				img : "img/mbti/ENTP.jpg",
			},
			ESTJ : {
				item : "엄격한 관리자(ESTJ)",
				subTitle : "엄격한 관리자(ESTJ)",
				workexplain : "현실 감각이 뛰어나고 일을 조직하고 계획하는데 탁월한 능력이 있다. 주로 지도자 역할을 맡는 편이며 일의 목표나 방향을 정하고 지시하고 결정하는 것을 좋아한다. 지시만 하는 것이 아니라 스스로 빡세게 일하는 편이다. 게으르거나 본인이 해야 할 일을 미루는 사람들을 보면 답답함을 느낀다.",
				perexplain : "평소에 부지런하기 때문에 게으르거나, 일을 잘 못 하거나, 목표가 없는 사람들을 보면 답답함을 느낀다. 허나 시간이 지날수록 그들을 이해하고 받아드리려고 노력하는 편이다. 추진력이 매우 좋고 미래의 가능성보다 현재를 중요시하는 편이다. 업무에서 좋은 성과를 내는 편이며 이들이 가장 어려워하는 것은 타인의 감정에 공감해야 하는 상황이다. ",
				goodRel : "ISFP",
				badRel : "ENFJ",
				img : "img/mbti/ESTJ.png",
			},
			ESFJ : {
				item : "사교적인 외교관(ESFJ)",
				subTitle : "사교적인 외교관(ESFJ)",
				workexplain : "동료애가 많고 친절하며 능동적으로 업무에 임한다. 다른 사람 업무를 잘 도와주고 이를 좋아한다. 정이 많으므로 일이 서툴거나 못하는 동료에게 심한 말을 하지 못하는 편이다. 상사에게 모욕을 들었을 경우 마음의 상처를 입는 경우도 있다.",
				perexplain : "공감능력과 적응력이 뛰어나기 때문에 술에 술 탄 듯, 물에 물 탄 듯 잘 살아간다. 어떻게 하면 상대방이 편할까 많이 고민한다. 미래보다는 현재에 집중하는 편이며 구체적이고 실용적인 세부 사항에 관심이 더 많은 편이다. 긴장감이 도는 업무 환경에서 스트레스를 받는 편이고 이는 주로 사람을 만나서 푸는 편이다.",
				goodRel : "INTP",
				badRel : "ENTP",
				img : "img/mbti/ESFJ.jpg",
			},
			ENFJ : {
				item : "정의로운 사회운동가(ENFJ)",
				subTitle : "정의로운 사회운동가(ENFJ)",
				workexplain : "적극적이고 책임감이 강한 성격으로 회의 때 다른 동료의 의견에 많은 관심을 가지고 동의한다. 미래의 가능성을 보고 계획을 짜는 편이다. 경쟁하거나 긴장감이 도는 업무환경을 좋아하지 않는 편이다. 성격이 급하므로 빠르게 결정을 내리는 편이다.",
				perexplain : "사람을 좋아하고 사람과의 관계를 따뜻하게 바라본다. 열정적이며 타고난 카리스마를 가지고 있다. 관심사가 다양하고 학습 속도가 빠르다. 타인에게 관심이 많은 만큼 타인의 관심을 의식하는 편이다. 이 세상은 내 중심으로 돌아간다고 생각하고 살기 좋은 환경을 만들기 위해 사람들을 설득하고 이끄는 데 자부심과 행복을 느낀다.",
				goodRel : "ISFP",
				badRel : "ISTP",
				img : "img/mbti/ENFJ.jpg",
			},
			ENTJ : {
				item : "대담한 통솔자(ENTJ)",
				subTitle : "대담한 통솔자(ENTJ)",
				workexplain : "회사 내에서 열정적이고 자기주장이 강하며 주로 지도자 위치에서 남들을 이끈다. 새로운 아이디어에 많은 관심을 가지며 사전 준비를 철저하게 하고 일을 처리하는 편이다. 주로 주도적으로 회의를 이끌어 나가는 편이다. 업무에 능숙하고 자기관리 능력이 뛰어나다. 동기들보다 가장 높은 지위거나 성공했을 확률이 높다.",
				perexplain : "활기찬 성격이며 성실한 편이다. 일하는 것을 좋아하고 어려운 도전을 거부하지 않기 때문에 사회에서 살아남기 가장 좋은 성격이다. 다만 꼰대들과 부딪히는 일이 있을 수 있다. 진취적이며 냉철한 판단으로 어려운 생황을 빠르게 해결한다. ",
				goodRel : "INFP",
				badRel : "ESFP",
				img : "img/mbti/ENTJ.png",
			},
		};
		function start() {
			$(".start").hide();
			$(".question").show();
			next();
		}

		function reset() {
			num = 1;
			$("#EI").val("");
			$("#SN").val("");
			$("#TF").val("");
			$("#JP").val("");

			$(".progress-bar").attr("style",
					"width: calc(100 / 12 * " + num + "%)");
			$(".question").show();
			$(".result").hide();
			$("#img").hide();
			$("#subTitle").hide();
			$("#workexplain").hide();
			$("#perexplain").hide();
			$("#title").html(q[num]["title"]);
			next();
		}

		//위의 버튼 클릭 시 점수 계산
		$("#up").click(function() {
			var type = $("#type").val();
			var preValue = $("#" + type).val();
			$("#" + type).val(parseInt(preValue) + 1);
			next();
		});
		$("#down").click(function() {
			next();
		});

		//버튼 클릭 시 발생하는 이벤트
		function next() {
			if (num == 13) {
				$(".question").hide();
				$(".result").show();
				$("#img").show();
				$("#subTitle").show();
				$("#workexplain").show();
				$("#perexplain").show();
				var mbti = "";
				$("#EI").val() < 2 ? (mbti += "I") : (mbti += "E");
				$("#SN").val() < 2 ? (mbti += "N") : (mbti += "S");
				$("#TF").val() < 2 ? (mbti += "F") : (mbti += "T");
				$("#JP").val() < 2 ? (mbti += "P") : (mbti += "J");
				console.log(mbti);
				$("#img").attr("src", result[mbti]["img"]);
				// $("#item").html(result[mbti]["item"]);
				$("#subTitle").html(result[mbti]["subTitle"]);
				$("#workexplain").html(result[mbti]["workexplain"]);
				$("#perexplain").html(result[mbti]["perexplain"]);
			} else {
				$(".progress-bar").attr("style",
						"width: calc(100 / 12 * " + num + "%)");
				$("#title").html(q[num]["title"]);
				$("#type").val(q[num]["type"]);
				$("#up").html(q[num]["up"]);
				$("#down").html(q[num]["down"]);
				num++;
			}
		}
	</script>
	<!-- Go to www.addthis.com/dashboard to customize your tools -->
	<script type="text/javascript"
		src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-6084dd1e2440463a"></script>
</body>
</html>

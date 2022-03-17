<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

		<title>우울증 검사</title>
<style>
.pb-2, .py-2{
	margin-top:100px;
	margin-right:auto;
	margin-left:auto;
	width:80%;
}
.selfesteem{
	margin-right:auto;
	margin-left:auto;
}
		</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="resources/user/css/default.css" />
		<link rel="stylesheet" type="text/css" href="resources/user/css/layout.css" />
		<link rel="stylesheet" type="text/css" href="resources/user/css/main.css" />
		<link rel="stylesheet" type="text/css" href="resources/user/css/footer.css" />
		<link rel="stylesheet" type="text/css" href="resources/user/css/animation.css" />
		<link rel="stylesheet" type="text/css" href="resources/user/css/qna.css" />
		<link rel="stylesheet" type="text/css" href="resources/user/css/calc.css" />
		<link rel="stylesheet" type="text/css" href="resources/user/css/result.css" />
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		<script>
			Kakao.init('da972007084fda5f2c305cef966b2dd4');
			console.log(Kakao.isInitialized());
		</script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<!-- 스크롤 자동으로 맨 위로 올라가도록 -->
		<script>
			$(function () {
				$('html, body').animate({ scrollTop: 0 }, 'fast');
			});
		</script>

		<!--GA-->
		<!-- Global site tag (gtag.js) - Google Analytics -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=G-YCJN4CFTVY"></script>
		<script>
			window.dataLayer = window.dataLayer || [];
			function gtag() {
				dataLayer.push(arguments);
			}
			gtag('js', new Date());

			gtag('config', 'G-YCJN4CFTVY');
		</script>
</head>
<body>
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('resources/user/images/todayStory.jpg');">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-2 bread">심리검사</h1>
					<br>
					<p class="breadcrumbs">
						<span class="mr-2"></span>
				
					</p>
				</div>
			</div>
		</div>

	</section>
	<div class="selfesteem">
	<div class="container">
		<div class="row justify-content-start mb-5 pb-2">
			<div
				class="col-md-4 heading-section ftco-animate fadeInUp ftco-animated">
				<span class="subheading subheading-with-line"><small
					class="pr-2 bg-white">MAEUMI</small></span>
				<h2 class="mb-4">우울증검사</h2>
			</div>
			<div
				class="col-md-8 pl-md-5 heading-section ftco-animate fadeInUp ftco-animated">
				<div class="pl-md-4 border-line">
					<p style="font-weight:bold;"> 현재 나의 우울증 상태는 어떨까?
					<p style="font-size:0.7rem">소요시간 약 5분</p>
					<br>
					<p>당신의 삶에서 태풍이 지나갔을 때 당신은 당신이 그 태풍을 어떻게 이겨냈는지도, 어떻게 생존할 수 있었는지도
					기억하지 못할 것이다.</p>
					<p>그리고, 심지어는 그 태풍이 지나간 것인지도 확실치 않을 것이다. 하지만 한가지 확실한 것이 있다.</p>
					<p>그것은 바로 당신이 그 태풍에서 벗어났을 때, 당신은 이전과는 다른 사람이 될 것이라는 것이다.</p>
				</div>
			</div>
		</div>
	</div>
	</div>


		<div id="wrap">
			<header id="header"></header>
			<section id="main" class="container">
				<div id="titleBox">
					<h1 class="mainText">
						<p>내 우울증을 알아보는 심리검사</p>
					</h1>
					<h3 class="elevatorPitch">
						<p>자신의 마음을 검사 해보세요</p>
					</h3>
					<div>
						<img src="resources/user/images/depression.png" class="main_img" />
					</div>
					<span class="time_logo"></span>
					<p>소요 시간 : 3분 내외</p>
				</div>
				<div class="start-wrap">
					<button class="start">검사하기</button>
				</div>
				
			</section>

			<section id="qna" class="container">
				<div class="status-bar">
					<div class="status"></div>
				</div>
				<div class="q box"></div>
				<div class="answer"></div>
			</section>

			<section id="result" class="container">
				<div id="score-box">
					<div class="p title"></div>
				</div>

				<div id="desc-box">
					<div class="art"></div>
					<div class="result title"></div>
					<div class="res desc"></div>
					<!-- 설명끝 -->
					<div style="padding-top: 20px; padding-bottom: 20px;">
						<ins
							class="kakao_ad_area"
							style="display: none;"
							data-ad-unit="DAN-AidHdpOeoPkU8L9l"
							data-ad-width="320"
							data-ad-height="50"
						></ins>
						<script
							type="text/javascript"
							src="//t1.daumcdn.net/kas/static/ba.min.js"
							async
						></script>
					</div>
					<!-- 이후에 추가할 것, 공유하기(혹은 복사), copyright에 대한 설명 등 -->
					<div class="hash">#심리테스트</div>
					<div class="hash">#마으미 #심리검사 #우울증테스트</div>
					<!--https://www.w3schools.com/howto/tryit.asp?filename=tryhow_js_toggle_hide_show-->
					<div id="copyright" style="display: none;">
						<p>
						</p>
					</div>
				</div>
				<div class="BottomAdd">
					<ins
						class="kakao_ad_area"
						style="display: none;"
						data-ad-unit="DAN-Awx8W8b0sjL4FCas"
						data-ad-width="320"
						data-ad-height="100"
					></ins>
					<script
						type="text/javascript"
						src="//t1.daumcdn.net/kas/static/ba.min.js"
						async
					></script>
				</div>
			</section>

			<footer id="footer">
			</footer>
		</div>
		<script src="resources/js/data.js"></script>
		<script src="resources/js/start.js"></script>
		<script src="resources/js/end.js"></script>
		<script src="resources/js/share.js"></script>
	</body>
</html>
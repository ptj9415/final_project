<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
		<title>십이간지로 알아보는 연애 유형</title>
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
						<span class="mr-2">지금 당신의 기분은 어떤가요? 오늘의 한마디를 남겨주세요!</span>
					</p>
				</div>
			</div>
		</div>
	</section>
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
						<img src="resources/img/main.png" class="main_img" />
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
					<!--https://www.w3schools.com/howto/tryit.asp?filename=tryhow_js_toggle_hide_show-->
					<div id="copyright" style="display: none;">
						<p>
							나를 알아보는 10가지 질문 by
							<a href="https://github.com/dev-dain/10-things-test">Dain Kim</a><br />
							Copyright (c) 2020 by Jaewon Lee (<a
								href="https://github.com/nani6765/ImpressionTest"
							>https://github.com/nani6765/ImpressionTest</a>)<br />
							이 사이트에 나오는 그림을 포함한 모든 컨텐츠의 상업적 이용을 금지합니다.
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
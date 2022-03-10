<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

	<div id="wrap">
			<header id="header"></header>
			<section id="main" class="container">
				<div id="titleBox">
					<h1 class="mainText">
						<p>자존감 테스트</p>
					</h1>
					<h3 class="elevatorPitch">
						<p>나의 자존감 상태는 어떨까?</p>
					</h3>
					<div>
						<img src="resources/user/img/main.png" class="main_img" />
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
					<div class="hash">#심리테스트 #연애테스트 #십이간지로 알아보는 연애 유형</div>

					<button class="btn Urlcopy" onclick="javascript:copy()">
						사이트 링크 복사하기
					</button>
					<button class="btn Kakao" onclick="javascript:createDescription()">
						카톡으로 결과 공유하기
					</button>
					<button
						class="btn Insta"
						onclick="window.open('https://www.instagram.com/wonny_sketch/')"
					>
						그림 작가 인스타 구경가기
					</button>
					<!--https://www.w3schools.com/howto/tryit.asp?filename=tryhow_js_toggle_hide_show-->
					<button class="btn Copyr" onclick="showhide()">CopyRight</button>
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
				
				<footer id="footer">
				<div class="foot">
					<span class="highlight">Kusitms 22nd.</span>
					© 2020
					<p class="author">
						Jaewon Lee, Minkyoung An, Chaewon Seo, Sangmin Lee, Juyeon Kang
					</p>
				</div>
			</footer>
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
						async></script>
				</div>
			</section>

			
		</div>
		<script src="resources/user/js/data.js"></script>
		<script src="resources/user/js/start.js"></script>
		<script src="resources/user/js/end.js"></script>
		<script src="resources/user/js/share.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>

<style>

/*배너*/
#bannerimg {
	
	
}

.banner {
	position: relative;
	width: 100;
	height: 346px;
	top: 50px;
	margin: 0 auto;
	padding: 0;
	overflow: hidden;
}

.banner ul {
	position: absolute;
	margin: 0px;
	padding: 0;
	list-style: none;
}

.banner ul li {
	float: left;
	width: 100;
	height: 346px; 
	margin : 0;
	padding: 0;
	margin: 0;
}

/*상담 start*/
.tab-wrap {
	transition: 0.3s box-shadow ease;
	border-radius: 1px;
	max-width: 90%;
	display: flex;
	flex-wrap: wrap;
	position: relative;
	list-style: none;
	background-color: #fff;
	margin: 40px 0;
	margin-right: auto;
	margin-left: auto;
	/* box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24); */
}

.tab {
	display: none;
}

.tab:checked:nth-of-type(1) ~ .tab__content:nth-of-type(1) {
	opacity: 1;
	transition: 0.5s opacity ease-in, 0.8s transform ease;
	position: relative;
	top: 0;
	z-index: 100;
	transform: translateY(0px);
	text-shadow: 0 0 0;
}

.tab:checked:nth-of-type(2) ~ .tab__content:nth-of-type(2) {
	opacity: 1;
	transition: 0.5s opacity ease-in, 0.8s transform ease;
	position: relative;
	top: 0;
	z-index: 100;
	transform: translateY(0px);
	text-shadow: 0 0 0;
}

.tab:checked:nth-of-type(3) ~ .tab__content:nth-of-type(3) {
	opacity: 1;
	transition: 0.5s opacity ease-in, 0.8s transform ease;
	position: relative;
	top: 0;
	z-index: 100;
	transform: translateY(0px);
	text-shadow: 0 0 0;
}

.tab:checked:nth-of-type(4) ~ .tab__content:nth-of-type(4) {
	opacity: 1;
	transition: 0.5s opacity ease-in, 0.8s transform ease;
	position: relative;
	top: 0;
	z-index: 100;
	transform: translateY(0px);
	text-shadow: 0 0 0;
}

.tab:checked:nth-of-type(5) ~ .tab__content:nth-of-type(5) {
	opacity: 1;
	transition: 0.5s opacity ease-in, 0.8s transform ease;
	position: relative;
	top: 0;
	z-index: 100;
	transform: translateY(0px);
	text-shadow: 0 0 0;
}

.tab:first-of-type:not(:last-of-type)+label {
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

.tab:not(:first-of-type):not(:last-of-type)+label {
	border-radius: 0;
}

.tab:last-of-type:not(:first-of-type)+label {
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
}

.tab:checked+label {
	background-color: #fff;
	box-shadow: 0 -1px 0 #fff inset;
	cursor: default;
}

.tab:checked+label:hover {
	box-shadow: 0 -1px 0 #fff inset;
	background-color: #fff;
}

.tab+label {
	border-radius: 6px 6px 0 0;
	cursor: pointer;
	display: block;
	text-decoration: none;
	font-weight: bold;
	font-size: 15px;
	color: #333;
	flex-grow: 3;
	text-align: center;
	background-color: #f2f2f2;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	text-align: center;
	transition: 0.3s background-color ease, 0.3s box-shadow ease;
	height: 70px;
	box-sizing: border-box;
	padding: 20px;
}

.tab__content {
	padding: 10px 25px;
	background-color: transparent;
	position: absolute;
	width: 100%;
	z-index: -1;
	opacity: 0;
	left: 0;
	transform: translateY(-3px);
	border-radius: 6px;
}

.container-tab {
	margin: 0 auto;
	display: block;
	max-width: 100%;
	max-height: 1000px;
}

.container-tab>*:not(.tab-wrap) {
	padding: 0 80px;
}

.counsel-title {
	margin: 0;
	margin-top: 50px;
	color: #444;
	text-align: center;
	font-weight: 400;
}

.counsel-small-title {
	margin: 0;
	color: #444;
	text-align: center;
	font-weight: 400;
	font-size: 1em;
	margin-bottom: 30px;
}

.short-section {
	font-weight: 400;
}

.counsel-text {
	line-height: 1.6;
	margin-bottom: 20px;
}
/*상담 end*/
.hide-space {
	padding: 100px;
}
</style>
</head>
<body>
<body data-aos-easing="slide" data-aos-duration="1000"
	data-aos-delay="300">
	<!-- banner start -->

	<div class="banner">
		<ul>
			<c:forEach items="${banner }" var="banner" >
				<li><img src="img/bannerimg/${banner.bn_pfilename }"
					id="bannerimg"></li>
			</c:forEach>
		</ul>
	</div>
	

	<!-- banner end -->

	<!-- 상담 tab -->
	<div class="container">
		<h1 class="hide-space"></h1>
	</div>
	<div class="container">
		<div class="row justify-content-start mb-5 pb-2">
			<div
				class="col-md-4 heading-section ftco-animate fadeInUp ftco-animated">
				<span class="subheading subheading-with-line"><small
					class="pr-2 bg-light">M A E U M I</small></span>
				<h2 class="mb-4">나에게 꼭 맞는 상담찾기</h2>
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
	<h1 class="counsel-title"></h1>
	<h2 class="counsel-small-title"></h2>

	<div class="container-tab">

		<div class="demo-section">
			<p class="counsel-text"></p>
		</div>

		<div class="tab-wrap">

			<!-- active tab on page load gets checked attribute -->
			<input type="radio" id="tab1" name="tabGroup1" class="tab" checked>
			<label for="tab1">개인상담</label> <input type="radio" id="tab2"
				name="tabGroup1" class="tab"> <label for="tab2">그룹상담</label>



			<div class="tab__content">
				<!-- <h3 class="short-section">Short Section</h3> -->

				<section class="ftco-section testimony-section bg-light">
					<div class="container">
						<div class="row justify-content-center mb-5 pb-3">
							<div class="col-md-7 heading-section ftco-animate">
								<span class="subheading subheading-with-line"><small
									class="pr-2 bg-light">MAEUMI</small></span>
								<h2 class="mb-4">마으미 회원들이 가장 많이 찾는 상담사들을 만나보세요</h2>
								<p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia, there live the blind texts.
									Separated they live in</p>
							</div>
						</div>
						<div class="row ftco-animate">
							<div class="col-md-12">
								<div class="carousel-testimony owl-carousel">
									<div class="item">
										<div class="testimony-wrap p-4 pb-5">
											<div class="user-img mb-5"
												style="background-image: url(resources/user/images/kitty.jpg)">
												<span
													class="quote d-flex align-items-center justify-content-center">
													<i class="icon-quote-left"></i>
												</span>
											</div>
											<div class="text">
												<p class="mb-5 pl-4 line">Far far away, behind the word
													mountains, far from the countries Vokalia and Consonantia,
													there live the blind texts.</p>
												<div class="pl-5">
													<p class="name">상담사명</p>
													<span class="position">CEO Founder of Commercial
														Building</span>
												</div>
											</div>
										</div>
									</div>

									<div class="item">
										<div class="testimony-wrap p-4 pb-5">
											<div class="user-img mb-5"
												style="background-image: url(resources/user/images/mymelody.jpg)">
												<span
													class="quote d-flex align-items-center justify-content-center">
													<i class="icon-quote-left"></i>
												</span>
											</div>
											<div class="text">
												<p class="mb-5 pl-4 line">Far far away, behind the word
													mountains, far from the countries Vokalia and Consonantia,
													there live the blind texts.</p>
												<div class="pl-5">
													<p class="name">Garreth Smith</p>
													<span class="position">Exterior Designer</span>
												</div>
											</div>
										</div>
									</div>
									<div class="item">
										<div class="testimony-wrap p-4 pb-5">
											<div class="user-img mb-5"
												style="background-image: url(resources/user/images/kuromi.jpg)">
												<span
													class="quote d-flex align-items-center justify-content-center">
													<i class="icon-quote-left"></i>
												</span>
											</div>
											<div class="text">
												<p class="mb-5 pl-4 line">Far far away, behind the word
													mountains, far from the countries Vokalia and Consonantia,
													there live the blind texts.</p>
												<div class="pl-5">
													<p class="name">Garreth Smith</p>
													<span class="position">Landscape Designer</span>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</section>

			</div>

			<div class="tab__content">

				<section class="ftco-section">
					<div class="container">
						<div class="row justify-content-center mb-5 pb-3">
							<div class="col-md-7 heading-section ftco-animate">
								<span class="subheading subheading-with-line"><small
									class="pr-2 bg-white">MEUMI</small></span>
								<h2 class="mb-4">마음맞는 사람들과 함께, 그룹상담</h2>
								<p>Far far away, behind the word mountains, far from the
									countries Vokalia and Consonantia, there live the blind texts.
									Separated they live in</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-lg-3 ftco-animate">
								<div class="staff">
									<div class="img"
										style="background-image: url(resources/user/images/sea.png);"></div>
									<div class="text px-4 pt-4">
										<h3>John Wilson</h3>
										<span class="position mb-2">Co-Founder / CEO</span>
										<div class="faded">
											<p>I am an ambitious workaholic, but apart from that,
												pretty simple person.</p>
											<a href="#" class="btn btn-primary px-4 py-3 mt-3">자세히 보기</a>

											<ul class="ftco-social d-flex">
											</ul>
										</div>
									</div>
								</div>
							</div>


							<div class="col-md-6 col-lg-3 ftco-animate">
								<div class="staff">
									<div class="img"
										style="background-image: url(resources/user/images/sea.png);"></div>
									<div class="text px-4 pt-4">
										<h3>David Smith</h3>
										<span class="position mb-2">Achitect</span>
										<div class="faded">
											<p>I am an ambitious workaholic, but apart from that,
												pretty simple person.</p>
											<a href="#" class="btn btn-primary px-4 py-3 mt-3">자세히 보기</a>

											<ul class="ftco-social d-flex">
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-3 ftco-animate">
								<div class="staff">
									<div class="img"
										style="background-image: url(resources/user/images/picture.png);"></div>
									<div class="text px-4 pt-4">
										<h3>그림 테라피</h3>
										<span class="position mb-2">그림으로 알아보는 나의 스트레스 상태</span>
										<div class="faded">
											<p>전문의 상담사 이소정</p>
											<P style="font-size: 12px">인원 2-6명</P>
											<a href="#" class="btn btn-primary px-4 py-3 mt-3">자세히 보기</a>

											<ul class="ftco-social d-flex">
											</ul>
										</div>
									</div>
								</div>
							</div>

							<div class="col-md-6 col-lg-3 ftco-animate">
								<div class="staff">
									<div class="img"
										style="background-image: url(resources/user/images/09ab8a84-387d-4ba4-9a0c-a4729481b584코스타리카 따라주.jpg);"></div>
									<div class="text px-4 pt-4">
										<h3>마인드 컨트롤 테라피</h3>
										<span class="position mb-2">휘몰아치는 감정을 잠재울 마인드컨트롤 그룹테라피</span>
										<div class="faded">
											<p>전문의 상담사 정아람</p>
											<P style="font-size: 12px">인원 2-4명</P>

											<a href="#" class="btn btn-primary px-4 py-3 mt-3">자세히 보기</a>
											<ul class="ftco-social d-flex">

											</ul>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</section>
			</div>


		</div>

	</div>
	<!-- 상담 tab end -->

	<!-- 마이페이지 start -->

	<section class="ftco-services">
		<div class="container">
			<div class="row justify-content-start mb-5 pb-5"></div>
			<div class="row"></div>
			<div class="row justify-content-start mt-5 py-5">
				<div class="col-md-4 heading-section ftco-animate">
					<h2 class="mb-4">**님의 마음기록</h2>
					<p>Even the all-powerful Pointing has no control about the
						blind texts it is an almost unorthographic.</p>
					<a href="#" class="btn btn-primary px-4 py-3 mt-3">자세히 보기</a>

				</div>
				<div class="col-md-8 ftco-animate">
					<div class="row d-flex">
						<div class="col-md-6 d-flex align-items-stretch">
							<div
								class="media block-6 services services-2 d-block bg-light p-4 mb-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-layers"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">**님의 MBTI</h3>
									<p>INFP</p>
								</div>
							</div>
						</div>
						<div class="col-md-6 d-flex align-items-stretch">
							<div
								class="media block-6 services services-2 d-block bg-light p-4 mb-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-layers"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">**님의 최근 상담내역</h3>
									<p>Even the all-powerful Pointing has no control about the
										blind texts it is an almost unorthographic.</p>
								</div>
							</div>
						</div>
						<div class="col-md-6 d-flex align-items-stretch">
							<div
								class="media block-6 services services-2 d-block bg-light p-4 mb-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-layers"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">**님의 최근 찜 상담사</h3>
									<p>Even the all-powerful Pointing has no control about the
										blind texts it is an almost unorthographic.</p>
								</div>
							</div>
						</div>
						<div class="col-md-6 d-flex align-items-stretch">
							<div
								class="media block-6 services services-2 d-block bg-light p-4 mb-4">
								<div
									class="icon d-flex justify-content-center align-items-center">
									<span class="flaticon-layers"></span>
								</div>
								<div class="media-body p-2 mt-3">
									<h3 class="heading">Renovation</h3>
									<p>Even the all-powerful Pointing has no control about the
										blind texts it is an almost unorthographic.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 마이페이지 end -->


	<!--  심리검사 -->

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-start mb-5 pb-2">
				<div class="col-md-4 heading-section ftco-animate">
					<span class="subheading subheading-with-line"><small
						class="pr-2 bg-light">M A E U M I</small></span>
					<h2 class="mb-4">심리검사</h2>
				</div>
				<div class="col-md-8 pl-md-5 heading-section ftco-animate">
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
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="project">
						<img src="resources/user/images/mbtiTest.jpeg" class="img-fluid"
							alt="Colorlib Template">
						<div class="text">
							<span>⏱ 소요시간 약 2분</span>
							<h3>
								<a href="project.html">MBTI 검사</a>
							</h3>
						</div>
						<a href="resources/user/images/mbtiTest.jpeg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span onclick="location.href='mbti.do'">→</span>
						</a>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="project">
						<img src="resources/user/images/selfEsteem.jpg" class="img-fluid"
							alt="Colorlib Template">
						<div class="text">
							<span>⏱ 소요시간 약 3분</span>
							<h3>자존감 검사</h3>
						</div>
						<a href="resources/user/images/personality.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span onclick="location.href='selfEsteem.do'">→</span>
						</a>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="project">
						<img src="resources/user/images/personality.jpg" class="img-fluid"
							alt="Colorlib Template">
						<div class="text">
							<span>⏱ 소요시간 약 5분</span>
							<h3>우울증 검사</h3>
						</div>
						<a href="resources/user/images/personality.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span onclick="location.href='simri.do'">→</span>
						</a>
					</div>
				</div>

				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="project">
						<img src="resources/user/images/wowool.png" class="img-fluid"
							alt="Colorlib Template">
						<div class="text">
							<span>⏱ 소요시간 약 25분</span>
							<h3>심리검사3</h3>
						</div>
						<a href="resources/user/images/wowool.png"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span>→</span>
						</a>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- 심리검사 끝 -->


	<script src="resources/user/js/jquery.min.js"></script>
	<script src="resources/user/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="resources/user/js/popper.min.js"></script>
	<script src="resources/user/js/bootstrap.min.js"></script>
	<script src="resources/user/js/jquery.easing.1.3.js"></script>
	<script src="resources/user/js/jquery.waypoints.min.js"></script>
	<script src="resources/user/js/jquery.stellar.min.js"></script>
	<script src="resources/user/js/owl.carousel.min.js"></script>
	<script src="resources/user/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/user/js/aos.js"></script>
	<script src="resources/user/js/jquery.animateNumber.min.js"></script>
	<script src="resources/user/js/bootstrap-datepicker.js"></script>
	<script src="resources/user/js/jquery.timepicker.min.js"></script>
	<script src="resources/user/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&amp;sensor=false"></script>
	<script src="resources/user/js/google-map.js"></script>
	<script src="resources/user/js/main.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
		$(document).ready(
				function() {
					var $banner = $(".banner").find("ul");

					var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
					var $bannerHeight = $banner.children().outerHeight(); // 높이
					var $length = $banner.children().length;//이미지의 갯수
					var rollingId;

					rollingId = setInterval(function() {
						rollingStart();
					}, 5000);

					function rollingStart() {
						$banner.css("width", $bannerWidth * $length + "px");
						$banner.css("height", $bannerHeight + "px");
						$banner.animate({
							left : -$bannerWidth + "px"
						}, 1500, function() {
							$(this).append(
									"<li>" + $(this).find("li:first").html()
											+ "</li>");
							$(this).find("li:first").remove();
							$(this).css("left", 0);
						});
					}
				});
	</script>

</body>
</html>
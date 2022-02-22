<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

/*상담 start*/
.tab-wrap {
	transition: 0.3s box-shadow ease;
	border-radius: 1px;
	max-width: 100%;
	display: flex;
	flex-wrap: wrap;
	position: relative;
	list-style: none;
	background-color: #fff;
	margin: 40px 0;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
}

/* .tab-wrap:hover {
	box-shadow: 0 12px 23px rgba(0, 0, 0, 0.23), 0 10px 10px
		rgba(0, 0, 0, 0.19);
} */
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
	/* box-shadow: 0 -1px 0 #eee inset; */
	border-radius: 6px 6px 0 0;
	cursor: pointer;
	display: block;
	text-decoration: none;
	font-weight:bold;
	font-size:15px;
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

/* .tab+label:hover {
	background-color: #f9f9f9;
	box-shadow: 0 1px 0 #f4f4f4 inset;
}
 */
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

/* boring stuff
  body {
    font-family: "Helvetica", sans-serif;
    color: #777;
    padding: 30px 0;
    font-weight: 300;
  } */
.container-tab {
	margin: 0 auto;
	display: block;
	max-width: 100%;
}

.container-tab>*:not(.tab-wrap) {
	padding: 0 80px;
}

.counsel-title {
	margin: 0;
	margin-top: 200px;
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
</style>
</head>
<body>
<body data-aos-easing="slide" data-aos-duration="1000"
	data-aos-delay="300">


	<!-- 베너 start -->




	<section class="home-slider js-fullheight owl-carousel bg-white">
		<div class="slider-item js-fullheight">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row d-md-flex no-gutters slider-text js-fullheight align-items-center justify-content-end"
					data-scrollax-parent="true">
					<div class="one-third order-md-last img js-fullheight"
						style="background-image: url(resources/user/images/bg_1.jpg);">
						<h3 class="vr">M A E U M I</h3>
					</div>
					<div
						class="one-forth d-flex js-fullheight align-items-center ftco-animate"
						data-scrollax=" properties: { translateY: '70%' }">
						<div class="text">
							<h1 class="mb-4">
								MENU1 <br>HERE IS THE 1ST MENU
							</h1>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia. It is a paradisematic
								country, in which roasted parts of sentences fly into your
								mouth.</p>
							<p>
								<a href="#" class="btn btn-primary px-4 py-3 mt-3">View our
									works</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="slider-item js-fullheight">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row d-flex no-gutters slider-text js-fullheight align-items-center justify-content-end"
					data-scrollax-parent="true">
					<div class="one-third order-md-last img js-fullheight"
						style="background-image: url(resources/user/images/textMessage.gif);">
						<h3 class="vr">Since - 2022</h3>
					</div>
					<div
						class="one-forth d-flex js-fullheight align-items-center ftco-animate"
						data-scrollax=" properties: { translateY: '70%' }">
						<div class="text">
							<h1 class="mb-4">텍스트 테라피</h1>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia. It is a paradisematic
								country, in which roasted parts of sentences fly into your
								mouth.</p>
							<p>
								<a href="#" class="btn btn-primary px-4 py-3 mt-3">View our
									works</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- 베너 end -->

	<!-- 상담 tab -->
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
										class="pr-2 bg-light">Testimony</small></span>
									<h2 class="mb-4">Our satisfied customer says</h2>
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
														<p class="name">Garreth Smith</p>
														<span class="position">CEO Founder of Commercial
															Building</span>
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
														<span class="position">CEO Founder of Interior
															Design</span>
													</div>
												</div>
											</div>
										</div>
										<div class="item">
											<div class="testimony-wrap p-4 pb-5">
												<div class="user-img mb-5"
													style="background-image: url(resources/userimages/mymelody.jpg)">
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
														<p class="name">Garreth Smith</p>
														<span class="position">System Analyst</span>
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

				
					<!-- <section class="hero-wrap hero-wrap-2"
						style="background-image: url('images/bg_1.jpg');"
						data-stellar-background-ratio="0.5"></section> -->

					<section class="ftco-section">
						<div class="container">
							<div class="row justify-content-center mb-5 pb-3">
								<div class="col-md-7 heading-section ftco-animate">
									<span class="subheading subheading-with-line"><small
										class="pr-2 bg-white">Expert Team</small></span>
									<h2 class="mb-4">Our Architect Team</h2>
									<p>Far far away, behind the word mountains, far from the
										countries Vokalia and Consonantia, there live the blind texts.
										Separated they live in</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 col-lg-3 ftco-animate">
									<div class="staff">
										<div class="img"
											style="background-image: url(images/team-1.jpg);"></div>
										<div class="text px-4 pt-4">
											<h3>John Wilson</h3>
											<span class="position mb-2">Co-Founder / CEO</span>
											<div class="faded">
												<p>I am an ambitious workaholic, but apart from that,
													pretty simple person.</p>
												<ul class="ftco-social d-flex">
													<li class="ftco-animate"><a href="#"><span
															class="icon-twitter"></span></a></li>
													<li class="ftco-animate"><a href="#"><span
															class="icon-facebook"></span></a></li>
													<li class="ftco-animate"><a href="#"><span
															class="icon-google-plus"></span></a></li>
													<li class="ftco-animate"><a href="#"><span
															class="icon-instagram"></span></a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								
								
								<div class="col-md-6 col-lg-3 ftco-animate">
									<div class="staff">
										<div class="img"
											style="background-image: url(images/team-4.jpg);"></div>
										<div class="text px-4 pt-4">
											<h3>David Smith</h3>
											<span class="position mb-2">Achitect</span>
											<div class="faded">
												<p>I am an ambitious workaholic, but apart from that,
													pretty simple person.</p>
												<ul class="ftco-social d-flex">
													<li class="ftco-animate"><a href="#"><span
															class="icon-twitter"></span></a></li>
													<li class="ftco-animate"><a href="#"><span
															class="icon-facebook"></span></a></li>
													<li class="ftco-animate"><a href="#"><span
															class="icon-google-plus"></span></a></li>
													<li class="ftco-animate"><a href="#"><span
															class="icon-instagram"></span></a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6 col-lg-3 ftco-animate">
									<div class="staff">
										<div class="img"
											style="background-image: url(images/staff-1.jpg);"></div>
										<div class="text px-4 pt-4">
											<h3>John Wilson</h3>
											<span class="position mb-2">Co-Founder / CEO</span>
											<div class="faded">
												<p>I am an ambitious workaholic, but apart from that,
													pretty simple person.</p>
												<ul class="ftco-social d-flex">
													<li class="ftco-animate"><a href="#"><span
															class="icon-twitter"></span></a></li>
													<li class="ftco-animate"><a href="#"><span
															class="icon-facebook"></span></a></li>
													<li class="ftco-animate"><a href="#"><span
															class="icon-google-plus"></span></a></li>
													<li class="ftco-animate"><a href="#"><span
															class="icon-instagram"></span></a></li>
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
											<h3></h3>
											<span class="position mb-2">마인드 컨트롤 테라피</span>
											<div class="faded">
												<p>전문의 상담사 정아람</p>
												<ul class="ftco-social d-flex">
													<li class="ftco-animate"><a href="#"><span
															class="icon-twitter"></span></a></li>
													<li class="ftco-animate"><a href="#"><span
															class="icon-facebook"></span></a></li>
													<li class="ftco-animate"><a href="#"><span
															class="icon-google-plus"></span></a></li>
													<li class="ftco-animate"><a href="#"><span
															class="icon-instagram"></span></a></li>
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
							<span>⏱ 소요시간 약 25분</span>
							<h3>
								<a href="project.html">MBTI 검사</a>
							</h3>
						</div>
						<a href="resources/user/images/mbtiTest.jpeg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="icon-expand"></span>
						</a>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="project">
						<img src="resources/user/images/personality.jpg" class="img-fluid"
							alt="Colorlib Template">
						<div class="text">
							<span>⏱ 소요시간 약 25분</span>
							<h3>성격검사</h3>
						</div>
						<a href="resources/user/images/personality.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="icon-expand"></span>
						</a>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="project">
						<img src="resources/user/images/selfEsteem.jpg" class="img-fluid"
							alt="Colorlib Template">
						<div class="text">
							<span>⏱ 소요시간 약 25분</span>
							<h3>자존감 검사</h3>
						</div>
						<a href="resources/user/images/selfEsteem.jpg"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="icon-expand"></span>
						</a>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="project">
						<img src="resources/user/images/wuwool.png" class="img-fluid"
							alt="Colorlib Template">
						<div class="text">
							<span>⏱ 소요시간 약 25분</span>
							<h3>우울증 검사</h3>
						</div>
						<a href="resources/user/images/wuwool.png"
							class="icon image-popup d-flex justify-content-center align-items-center">
							<span>→</span>

						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 심리검사 끝 -->




</body>
</html>
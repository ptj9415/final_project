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
	margin: 0;
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
	z-index: 0;
	transform: translateY(0px);
	text-shadow: 0 0 0;
}

.tab:checked:nth-of-type(2) ~ .tab__content:nth-of-type(2) {
	opacity: 1;
	transition: 0.5s opacity ease-in, 0.8s transform ease;
	position: relative;
	top: 0;
	z-index: 0;
	transform: translateY(0px);
	text-shadow: 0 0 0;
}

.tab:checked:nth-of-type(3) ~ .tab__content:nth-of-type(3) {
	opacity: 1;
	transition: 0.5s opacity ease-in, 0.8s transform ease;
	position: relative;
	top: 0;
	z-index: 0;
	transform: translateY(0px);
	text-shadow: 0 0 0;
}

.tab:checked:nth-of-type(4) ~ .tab__content:nth-of-type(4) {
	opacity: 1;
	transition: 0.5s opacity ease-in, 0.8s transform ease;
	position: relative;
	top: 0;
	z-index: 0;
	transform: translateY(0px);
	text-shadow: 0 0 0;
}

.tab:checked:nth-of-type(5) ~ .tab__content:nth-of-type(5) {
	opacity: 1;
	transition: 0.5s opacity ease-in, 0.8s transform ease;
	position: relative;
	top: 0;
	z-index: 0;
	transform: translateY(0px);
	text-shadow: 0 0 0;
}

.owl-dots {
	margin-right: 50px;
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

.glist-container {
	display: flex;
}

.btn btn-primary px-4 py-3 mt-3:hover {
	color: #153e54;
}

/* 퀵 메뉴 start */
.quickmenu {
	position: absolute;
	width: 90px;
	top: 70%;
	margin-top: -35px;
	right: 10px;
	margin-right: 2%;
}

.quickmenu ul {
	position: relative;
	float: left;
	width: 100%;
	display: inline-block;
	*display: inline;
}

.quickmenu ul li {
	float: left;
	width: 100%;
	text-align: center;
	display: inline-block;
	*display: inline;
}

.quickmenu ul li:last-child {
	border-bottom: 0;
}
/* 퀵 메뉴 end */
#loginbtn {
	position: absolute;
	top: 300px;
	left: 50%;
	width: 200px;
	height: 60px;
	background-color: #FFCD4A;
	transform: translate(-50%, -50%);
	background-color: #FFCD4A;
	border-radius: 5px;
	font-size: 20px;
	font-weight: bold;
}

.tabmenu {
	padding: 0;
	margin: 0;
	list-style: none;
	background-color: transparent;
}

.tabdiv {
	width: 100%;
	background-color: transparent;
}

.tabdiv ul {
	display: flex;
	background-color: transparent;
	height: 56px;
	border-bottom: 1px solid grey;
}

.tabdiv ul li {
	width: 250px;
	background-color: transparent;
}

.tabdiv ul li a {
	display: block;
	height: 55px;
	text-align: center;
	line-height: 55px;
	border-left: none;
	border-bottom: none;
	background-color: transparent;
}

/* .tabdiv ul li:first-child a { */
/* 	border-left: 1px solid black; */
/* } */
.tabdiv ul li a.on {
	position: relative;
	border-color: grey;
	height: 56px;
	background-color: rgb(238, 238, 238);
	border-top: 1px solid grey;
	border-right: 1px solid grey;
}

.staff{
height: 510px;
}

.tabdiv ul li a.on:before {
	content: "";
	position: absolute;
	left: -1px;
	top: -1px;
	width: 1px;
	height: 100%;
	background-color: grey;
	border-top: 1px solid grey;
}

.tabcontent {
	border-top: none;
	padding: 20px;
}

#counselorimgs {
	margin-left: 110px;
}

#counselornames {
	margin-left: 50px;
}
</style>
</head>
<body>
<body data-aos-easing="slide" data-aos-duration="1000"
	data-aos-delay="300">
	<!-- banner start -->

	<div class="banner">
		<ul>
			<li><img src="img/bannerimg/mainbanner1.png"></li>
			<li><img src="img/bannerimg/couponbanner.png"></li>
			<li><img src="img/bannerimg/mainbanner2.png"></li>
			<%-- 			<c:forEach items="${banner }" var="banner" > --%>
			<%-- 				<li><img src="../fileupload/bannerimg/${banner.bn_pfilename }" --%>
			<!-- 					id="bannerimg"></li> -->
			<%-- 			</c:forEach> --%>
		</ul>
	</div>


	<!-- banner end -->

	<!-- 상담 tab -->
	<div class="main2">
		<img src="img/main/main2.png">
	</div>
	<div style="background-color: white">
		<img src="img/main/main3.png">
		<div class="container-tab">
			<div class="tab-wrap">
				<div class="tabdiv">
					<ul class="tabmenu">
						<li><a href="#personalcounsel" class="on">개인상담</a></li>
						<li><a href="#groupcounsel">그룹상담</a></li>
					</ul>
					<div class="tabcontent">
						<div id="personalcounsel">
							<section class="ftco-section testimony-section">
								<div class="container">
									<div class="row ftco-animate">
										<div class="col-md-12">
											<div class="carousel-testimony owl-carousel">
												<c:forEach items="${clist }" var="clist">
													<div class="item">
														<div class="testimony-wrap p-4 pb-5">
															<div class="user-img mb-5" id="counselorimgs"
																onerror="this.src='resources/user/images/errorprofile.jpg';"
																style="background-image: url(img/counselorpicture/${clist.c_picture})">
																<span
																	class="quote d-flex align-items-center justify-content-center">
																	<i class="">♥</i>
																</span>
															</div>
															<div class="text">
																<p class="mb-5 pl-4">${clist.c_comment }</p>
																<div class="pl-5">
																	<p class="name" id="counselornames">${clist.c_name }<span class="position">(${clist.c_grade })</span></p>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</section>
						</div>
						<div id="groupcounsel">
							<section class="ftco-section">
								<div class="container">
									<div class="glist-container">
										<c:forEach items="${glist }" var="glist">
											<div class="col-md-6 col-lg-3 ftco-animate">
												<div class="staff">
													<div class="img"
														style="background-image: url(resources/user/images/selfEsteemMain.png);"></div>
													<%-- <div class="img">
									<img src="editorsumnail/${glist.gc_sumnail }"></div> --%>
													<div class="text px-4 pt-4">
														<h3>${glist.gc_title }</h3>
														<span class="position mb-2">${glist.gc_date }
															${glist.gc_time }</span>
														<div class="faded">
															<p>${glist.c_name }</p>
															<P style="font-size: 12px">인원 ${glist.gc_min_person }명
																- ${glist.gc_max_person }명</P>

															<a onclick="func('${glist.gc_no}')" style="color: white;"
																class="btn btn-primary px-4 py-3 mt-3">자세히 보기</a>
															<ul class="ftco-social d-flex">
															</ul>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<!-- 상담 tab end -->
	<div class="main4">
		<img src="img/main/main4.png">
	</div>

	<!--  심리검사 -->

	<div class="main5">
		<img src="img/main/main5.png">
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
		<br> <br>
	</div>
	<div style="position: relative;">
		<img src="img/main/mainend.png">
		<button type="button" id="loginbtn"
			onclick="location.href='loginForm.do'">로그인</button>
	</div>
	<!-- 심리검사 끝 -->

	<!-- 퀵 메뉴 start -->

	<div class="quickmenu">
		<ul>
			<li><a href="http://pf.kakao.com/_exlxkFb/chat" target='_blank'><img
					src="img/kakao/channel-chat-button.png" alt=""></a></li>
		</ul>
	</div>

	<!-- 퀵 메뉴 end -->

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
					var owl = $(".owl-dots");
					owl.attr('id','owl');
					owl.css('margin-right', '75px');
					var $banner = $(".banner").find("ul");

					var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
					var $bannerHeight = $banner.children().outerHeight(); // 높이
					var $length = $banner.children().length;//이미지의 갯수
					var rollingId;

					rollingId = setInterval(function() {
						rollingStart();
					}, 6000);

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

		function func(gc_no, c_email) {
			console.log(gc_no);
			location.href = "userGroup.do?gc_no=" + gc_no + "&c_email="
					+ c_email;
		}

		$(function() {
			$('.tabcontent > div').hide();
			$('.tabmenu a').click(function() {
				$('.tabcontent > div').hide().filter(this.hash).fadeIn();
				$('.tabmenu a').removeClass('on');
				$(this).addClass('on');
				return false;
			}).filter(':eq(0)').click();
		});
		// 퀵 메뉴

		$(document).ready(function() {
			var currentPosition = parseInt($(".quickmenu").css("top"));
			$(window).scroll(function() {
				var position = $(window).scrollTop();
				$(".quickmenu").stop().animate({
					"top" : position + currentPosition + "px"
				}, 1000);
			});
		});
	</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
.navbar-brand {
	width: 150px;
}

span.top-nav-login {
	float: right;
	padding-left: 1400px;
	color: darkgray;
}

/* drop down menu */
@import url(https://fonts.googleapis.com/css?family=Lato);

*, *:before, *:after {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 0;
	margin: 0;
	font-family: "Lato", sans-serif;
}

/*| Navigation |*/
nav {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	background: #fff;
	/*   box-shadow: 0 3px 10px -2px rgba(0, 0, 0, 0.1); */
	/*   border: 1px solid rgba(0, 0, 0, 0.1); */
}

nav ul {
	list-style: none;
	position: relative;
	float: right;
	margin-right: 100px;
	display: inline-table;
}

nav ul li {
	float: left;
	-webkit-transition: all 0.2s ease-in-out;
	-moz-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
}

nav ul li:hover {
	background: rgba(236, 236, 236, 0.329);
}

nav ul li:hover>ul {
	display: block;
}

nav ul li {
	float: left;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

nav ul li a {
	display: block;
	padding: 30px 20px;
	color: #222;
	font-size: 0.9em;
	letter-spacing: 1px;
	text-decoration: none;
	text-transform: uppercase;
}

nav ul ul {
	display: none;
	background: #fff;
	position: absolute;
	top: 100%;
	box-shadow: -3px 3px 10px -2px rgba(0, 0, 0, 0.4);
	/*   border: 1px solid rgba(0, 0, 0, 0.1); */
}

nav ul ul li {
	float: none;
	position: relative;
	width: 200px;
}

nav ul ul li a {
	padding: 15px 30px;
	/*  border-bottom: 1px solid rgba(0, 0, 0, 0.05); */
}

nav ul ul ul {
	position: absolute;
	left: 100%;
	top: 0;
}

span.top-nav-admin {
	margin-right: 10px;
}
/* drop down menu end*/
</style>

<body>

	<nav class="navbar top" id="top-nav">

		<c:if test="${empty c_email && empty email}">
			<span class="top-nav-admin"><a href="loginForm.do"
				style="margin-right: 10px; font-size: 11px; color: #153e54">?????????</a></span>
		</c:if>
		<c:if test="${not empty email}">
			<span class="top-nav-admin" style="font-size: 12px; color: #153e54">
				<i class="fa fa-user"> </i> ${nickname } ??? ??????????????? <a href="logout.do"
				style="margin-left: 10px; font-size: 11px; color: #153e54">????????????</a>
			</span>
		</c:if>
				<c:if test="${not empty c_email}">
			<span class="top-nav-admin" style="font-size: 12px; color: #153e54">
				<i class="fa fa-user"> </i> ${c_name } ??? ??????????????? <a href="logout.do"
				style="margin-left: 10px; font-size: 11px; color: #153e54">????????????</a>
			</span>
		</c:if>
		<c:if test="${c_admin eq 'A' }">
			<span class="top-nav-admin" style="font-size: 11px;"> <a
				href="adminHome.do">???????????????? ?????? ????????????</a></span>
		</c:if>
				<c:if test="${c_admin eq 'C' }">
			<span class="top-nav-admin" style="font-size: 11px;"> <a
				href="counselorMyPageMain.do">???????????????? ?????? ????????????</a></span>
		</c:if>
		<!-- <span class="top-nav-admin"><a href="counselormypage.do">counselor
				?????????????</a></span> <span class="top-nav-admin"><a href="adminbootstrap.do">admin
				???</a></span> -->
	</nav>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a href="home.do"><img src="resources/user/images/logo.png"
				class="navbar-brand"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="true" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="navbar-collapse collapse show" id="ftco-nav" style="">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="#" class="nav-link">????????????</a>
						<ul class="drop-down-menu" id="drop-first">
							<li><a href="testpg.do">????????????</a></li>
							<li><a href="userGroupCounsel.do">????????????</a></li>
						</ul></li>

					<li class="nav-item"><a href="#" class="nav-link">????????????</a>
						<ul class="drop-down-menu" id="drop-second">
							<li><a href="mbti.do">?????? MBTI ??????</a></li>
							<li><a href="selfEsteem.do">????????? ??????</a></li>
							<li><a href="simri.do">????????? ??????</a></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link">????????????</a>
						<ul class="drop-down-menu" id="drop-third">
							<li><a href="userTodayStory.do">????????? ?????????</a></li>
							<li><a href="userBoardList.do">???????????????</a></li>
							<li><a href="userTerapy.do">?????? ?????????</a></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link">????????????</a>
						<ul class="drop-down-menu" id="drop-third">
							<li><a href="userNoticeList.do">????????????</a></li>
							<li><a href="userFaq.do">FAQ</a></li>
						</ul></li>
					<!-- ??????????????? ????????? ????????? ????????? ?????? ??????????????? ???????????? ?????? ???????????? ???. -->
					<li class="nav-item"><a href="userMypages.do" class="nav-link">???????????????</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>
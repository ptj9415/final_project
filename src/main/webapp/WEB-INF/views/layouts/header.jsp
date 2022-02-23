<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
	background: rgba(0, 0, 0, 0.10);
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
/* drop down menu end*/
</style>
<!-- <div class="Header">Header</div> -->
<body>

	<nav class="navbar top" id="top-nav">
		<c:if test="${user == null }">
			<span class="top-nav-login"><a href="loginForm.do">Maeumi. 로그인</a></span>
		</c:if>
		<c:if test="${user !=null }">
			<span class="top-nav-logout"><a href="logout.do">로그아웃</a></span>
		</c:if>
		<c:if test="${user == null }">
			<span class="top-nav-join"><a href="cEmailCheck.do">상담사 회원가입</a></span>
		</c:if>
	</nav>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a href="home.do"><img src="resources/user/images/MaeumiLogo.png"
				class="navbar-brand"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="true" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			<span class="top-nav-admin"> <a href="counselormypage.do">상담사 마이페이지⚙</a></span>
			<span class="top-nav-admin"> <a href="adminbootstrap.do">⚙어드민 부트스트랩 포함한 메인페이지</a></span>
			<div class="navbar-collapse collapse show" id="ftco-nav" style="">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="#" class="nav-link">상담하기</a>
						<ul class="drop-down-menu" id="drop-first">
							<li><a href="#">개인상담</a></li>
							<li><a href="#">그룹상담</a></li>
						</ul></li>

					<li class="nav-item"><a href="#" class="nav-link">심리검사</a>
						<ul class="drop-down-menu" id="drop-second">
							<li><a href="#">MBTI 검사</a></li>
							<li><a href="#">심리검사 1</a></li>
							<li><a href="#">심리검사 2</a></li>
							<li><a href="#">심리검사 3</a></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link">커뮤니티</a>
						<ul class="drop-down-menu" id="drop-third">
							<li><a href="todayStory.do">오늘의 한마디</a></li>
							<li><a href="#">자유게시판</a></li>
							<li><a href="#">심리 테라피</a></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link">마이페이지</a></li>
					<li class="nav-item"><a href="#" class="nav-link"></a></li>
					<li class="nav-item"><a href="#" class="nav-link"></a></li>
					<!--   <li class="nav-item"><a href="#" class="nav-link">Contact</a></li> -->
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>
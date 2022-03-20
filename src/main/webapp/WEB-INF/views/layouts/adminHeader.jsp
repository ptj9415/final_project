<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#header {
	background-color: #F2CBBD;
}

#lis {
	margin-right: 20px;
}

#aa {
	text-decoration: none;
	color: inherit;
}
</style>
</head>
<body>
	<!-- Navbar -->
	<nav class="main-header navbar navbar-expand navbar-white navbar-light"
		id="header">
		<!-- Left navbar links -->
		<ul class="navbar-nav">
			<li class="nav-item d-none d-sm-inline-block"><a href="home.do"
				class="nav-link" style="color: #333; font-size: 14px;">사용자 화면으로
					이동</a></li>
		</ul>

		<!-- Right navbar links -->
		<ul class="navbar-nav ml-auto">
			<li class="nav-item dropdown" id="lis"><span
				style="color: #333; font-size: 14px;"><i class="fa fa-user"></i>${c_name }(${c_email })님
					접속을 환영합니다.</span></li>

			<li class="nav-item dropdown" id="lis"><span
				style="color: #333; font-size: 14px;"><a href="logout.do" id="aa"><i
						class="fa fa-unlock-alt"></i>로그아웃</a></span></li>
		</ul>
	</nav>
	<!-- /.navbar -->

</body>
</html>
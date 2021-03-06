<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 환영 페이지</title>
<style type="text/css">
.mainForm {
	margin-top: 200px;
}

.title {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	text-align: center;
	font-size: x-large;
}

.comment {
	margin-top: 50px;
}

button {
	margin-top: 50px;
	background-color: white;
	border: 1px solid #d2d2d2;
	border-radius: 50px;
	width: 15%;
	height: 40px;
}

.login:hover {
	background-color: #153e54;
	color:white;
	transition: 200ms ease-in-out;
}

.maeumi {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	font-size: 25px;
}
</style>
</head>
<body>
	<div class="mainForm" align="center">
		<div class="title">
			<img src="resources/user/images/doctor.png" style="width:100px;">
			<h1>WELCOME!</h1>
		</div>
		<div class="comment">
			<h4>${counselor }</h4>
			<h4>
				<span class="maeumi">Maeumi.</span> 
				
				마이페이지에서 증빙서류를 첨부하시기 바랍니다.
			</h4>
		</div>
		<div class="loginBtn">
			<button class="login" onclick="location.href='loginForm.do'">로그인 하러 가기</button>
		</div>
	</div>
<br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>
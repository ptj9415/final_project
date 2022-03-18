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
	margin-bottom: 200px;
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
	border: 1px solid #8dacbd42;
	border-radius: 50px;
	width: 15%;
	height: 50px;
}
button:hover {
            background-color: #153e54;
            color:white;
			transition: 200ms ease-in-out;
        }

.login:hover {
	background-color: #FFD2D2;
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
			<h1>Maeumi.</h1>
		</div>
		<div class="comment">
			<h4>회원가입을 환영합니다!</h4>
			<h4>
				<span class="maeumi">Maeumi.</span> 에서 마음의 위로를 받는 시간이 되시기를 바랍니다.
			</h4>
		</div>
		<div class="loginBtn">
			<button class="login" onclick="location.href='loginForm.do'">Maeumi. 로그인!</button>
		</div>
	</div>
	<br><Br><Br><Br><br>
</body>
</html>
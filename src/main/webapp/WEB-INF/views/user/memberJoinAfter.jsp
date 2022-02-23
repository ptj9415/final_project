<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.welcome {
	text-align: center;
}
button {
	width:150px;
	height:30px;
	background-color: white;
	border:1px solid gray; 
	border-radius: 50px;
	position: center;
}
.loginBtn {
	width:150px;
	height:30px;
	background-color: white;
	border:1px solid gray; 
	border-radius: 50px;
	position: center;
}
</style>
</head>
<body>
<div align="center">
	<div align="center">
		<h1>Maeumi.</h1>
	</div>
	<div class="welcome">
		<h3>${message }님 회원가입을 환영합니다.!</h3>
		<br>
		<h3>Maeumi. 에서 마음의 위로를 받는 시간이 되시기를 바랍니다.</h3>
	</div>
	<br><br>
	<div>
		<button type="button" onclick="location.href='loginForm.do'"  class="loginBtn">로그인 하기</button>
	</div>
</div>
</body>
</html>
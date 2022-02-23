<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.loginform {
	padding: 0;
	padding-top: 120px;
	/* 	font-size: 62px; */
	color: black;
	width: 450px;
	font-family: 'Karla';
	margin: 0 auto;
	/* 	text-align: center; */
}

input {
	font-family: 'Ubuntu';
	font-weight: 300;
	border: 0;
	border-bottom: 1px solid #ff5407;
	width: 100%;
	height: 36px;
	font-size: 26px;
	margin-bottom: 30px;
}

.hr {
	color: #ff5407;
}

input:focus {
	outline: none;
	box-shadow: none;
}

button {
	border: 0;
	background-color: white;
	border: 1px solid #FFDCE1;
	border-radius: 50px;
	padding: 5px;
	/* 	margin-top: 50px; */
	position: relative;
	outline: 0;
}

button:hover {
	background-color: #FFD2D2;
	border-color: white;
}

.forgot {
	background: tomato;
	color: #fff;
	float: left;
}

.login {
	background: tomato;
	color: #fff;
	float: right;
}

.belowForm {
	margin-top: 50px;
}

img {
	height: 45px;
	width: 300px;
}
</style>
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function inputCheck() {
		if (frm.email.value == "") {
			alert("이메일을 입력하세요");
			frm.email.focus();
			return false;
		} else if (frm.password.value == "") {
			alert("비밀번호를 입력하세요");
			frm.password.focus();
			return false;
		}
		frm.submit(); // 이메일이랑 비밀번호 모두 정상적으로 입력되면 값 전송
	}

	// 엔터키 입력하면 로그인 되도록 심심해서. 
	function enterLogin() {
		var keyCode = window.event.keyCode;

		if (keyCode == 13) {
			inputCheck();
		}
	}
</script>

</head>
<body>

	<div class='loginform'>
		<div style="font-size: 62px; text-align: center">Maeumi.</div>
		<br>
		<button type="button" onclick="location.href='loginForm.do'" style="float: right;">일반회원 로그인</button>
		<br><br>
		<form id="frm" action="cLogin.do" method="post">
			<input type='text' id='email' name='email' placeholder='이메일을 입력하세요'>
			<input type='password' id='password' name="password"
				placeholder='비밀번호를 입력하세요' onkeyup="enterLogin()">
		</form>
		<button type="button" class="findbtn">이메일 찾기&nbsp;&nbsp;</button>
		<button type="button" class="findbtn">비밀번호 찾기</button>
		<button type="button" onclick="inputCheck()"	
			style="float: right;">Maeumi. 로그인</button>
	</div>


	<div class="belowForm" align="center">
		<p style="font-size: 20px;">
			상담사분들의<a href="cEmailCheck.do" style="text-decoration-line: none;"> 회원가입</a>은 여기!
		</p>
	</div>
	

</body>
</html>
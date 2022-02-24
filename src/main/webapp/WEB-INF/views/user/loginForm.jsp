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
	font-size: 20px;
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

.social {
	height: 45px;
	width: 250px;
}
</style>
<script src="resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>

	<div class='loginform'>
		<div style="font-size: 62px; text-align: center">Maeumi.</div>
<!-- 		<button type="button" onclick="location.href='cLoginForm.do'" style="float: right;">상담사 로그인</button> -->
		<br>
		<form id="frm" action="login.do" method="post">
			<input type='text' id='email' name='email' placeholder='이메일을 입력하세요'>
			<input type='password' id='password' name="password"
				placeholder='비밀번호를 입력하세요' onkeyup="enterLogin()">
		</form>
		<button type="button" class="findbtn">이메일 찾기&nbsp;&nbsp;</button>
		<button type="button" class="findbtn">비밀번호 찾기</button>
		<button type="button" onclick="inputCheck()" style="float: right;">Maeumi. 로그인</button>
	</div>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>

	<div class="belowForm" align="center">
		<!--  카카오 -->
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=7ce89df312e5bede8d638ca4846b8ed2&redirect_uri=http://localhost:8000/prj/kakaoLogin.do&response_type=code">
			<img src="resources/image/kakao_login_medium_wide.png" class="social">
		</a> 
		<!-- 네이버 --> 
		<a href="naverLogin.do"> 
			&nbsp;&nbsp;<img src="resources/image/btnG_완성형.png" class="social">
		</a>
		<p style="font-size: 20px; margin-top: 20px;">
			Maeumi가 처음이신가요?<a href="termsCheck.do"
				style="text-decoration-line: none;"> 회원가입&nbsp;</a>하기
		</p>

		<p style="font-size: 20px;">
			상담사분들의<a href="cTermsCheck.do" style="text-decoration-line: none;"> 회원가입</a>은 여기!
		</p>
	</div>
	
<script type="text/javascript">
	
		function inputCheck() {
			var inputEmail = $("#email").val();
			var inputPassword = $("#password").val();
		
		if (frm.email.value == "") {
			alert("이메일을 입력하세요");
			frm.email.focus();
			return false;
		} else if (frm.password.value == "") {
			alert("비밀번호를 입력하세요");
			frm.password.focus();
			return false;
		}
		//frm.submit(); // 이메일이랑 비밀번호 모두 정상적으로 입력되면 값 전송
		$.ajax({
			type: "POST",
			url: "login.do",
			data: {
				"email" : inputEmail,
				"password" : inputPassword
			},
			dataType: "text",
			success: function(responseText) {
				if(responseText == "YES") {
					location.href ='home.do';
				} else {
					alert('이메일 혹은 비밀번호를 확인해주세요.');
					frm.password.value = "";
					frm.password.focus();
					return false;
				}	
			},
			error: function() {
				alert('오류가 발생했습니다. 관리자에게 문의해주세요.');
			}
			
		});   // ajax끝
	
	}

	// 엔터키 입력하면 로그인 되도록 심심해서. 
	function enterLogin() {
		var keyCode = window.event.keyCode;

		if (keyCode == 13) {
			inputCheck();
		}
	};

</script>
</body>
</html>
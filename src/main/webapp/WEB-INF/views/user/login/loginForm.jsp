<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*new login form */
        *, *:before, *:after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}



input, button {
  border: none;
  outline: none;
  background: none;
  font-family: "Open Sans", Helvetica, Arial, sans-serif;
}

.tip {
  font-size: 20px;
  margin: 30px auto 10px;
  text-align: center;
}

.cont {
  overflow: hidden;
  position: relative;
  width: 900px;
  height: 500px;
  margin: 0 auto 100px;
  background: #fff;
  border-radius: 40px;
  box-shadow: 0px 0px 20px #00000040;
  animation: fadein 2s;
  -moz-animation: fadein 2s; /* Firefox */
  -webkit-animation: fadein 2s; /* Safari and Chrome */
}
@keyframes fadein {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}
@-moz-keyframes fadein { /* Firefox */
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

.form {
  position: relative;
  width: 640px;
  height: 100%;
  transition: transform 1.2s ease-in-out;
  padding: 50px 30px 0;
}

.sub-cont {
  overflow: hidden;
  position: absolute;
  left: 640px;
  top: 0;
  width: 900px;
  height: 100%;
  padding-left: 260px;
  background: #fff;
  transition: transform 1.2s ease-in-out;
}
.cont.s--signup .sub-cont {
  transform: translate3d(-640px, 0, 0);
}

button {
  display: block;
  margin: 0 auto;
  width: 260px;
  height: 36px;
  border-radius: 30px;
  color: #fff;
  font-size: 15px;
  cursor: pointer;
}

.img {
  overflow: hidden;
  z-index: 2;
  position: absolute;
  left: 0;
  top: 0;
  width: 260px;
  height: 100%;
  padding-top: 360px;
}
.img:before {
  content: "";
  position: absolute;
  right: 0;
  top: 0;
  width: 380px;
  height: 100%;
  background-image: url("resources/user/images/doctor.png");
  background-size: cover;
  transition: transform 1.2s ease-in-out;
}
.img:after {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.6);
}
.cont.s--signup .img:before {
  transform: translate3d(640px, 0, 0);
}
.img__text {
  z-index: 2;
  position: absolute;
  left: 0;
  top: 50px;
  width: 100%;
  padding: 0 20px;
  text-align: center;
  color: #fff;
  margin-top:150px;
  transition: transform 1.2s ease-in-out;
}
.img__text h2 {
  margin-bottom: 10px;
  font-weight: normal;
}
.img__text p {
  font-size: 14px;
  line-height: 1.5;
}
/* .cont.s--signup .img__text.m--up {
  transform: translateX(520px);
} */
.img__text.m--in {
  transform: translateX(-520px);
}
.cont.s--signup .img__text.m--in {
  transform: translateX(0);
}
.img__btn {
  overflow: hidden;
  z-index: 2;
  position: relative;
  width: 100px;
  height: 36px;
  margin: 0 auto;
  background: transparent;
  color: #fff;
  text-transform: uppercase;
  font-size: 15px;
  cursor: pointer;
  border:1px solid white;
  border-radius:30px;
}
.img__btn:hover{
	
	color:white;
	transition:300ms ease-in-out;
	border:1px solid #153e54;
	background-color:#153e54;
	border-radius:30px;
}


/* .img__btn:after {
  content: "";
  z-index: 2;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  border: 2px solid #fff;
  border-radius: 30px;
} */
.img__btn span {
  position: absolute;
  left: 0;
  top: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  transition: transform 1.2s;
}
.img__btn span.m--in {
  transform: translateY(-72px);
}
.cont.s--signup .img__btn span.m--in {
  transform: translateY(0);
}
/* .cont.s--signup .img__btn span.m--up {
  transform: translateY(72px);
}
 */
h2 {
  width: 100%;
  font-size: 26px;
  text-align: center;
}

label {
  display: block;
  width: 260px;
  margin: 20px auto 0;
 /*  text-align: center; */
}
label span {
  font-size: 12px;
  color: #cfcfcf;
  text-transform: uppercase;
}

input {
  display: block;
  width: 100%;
 /*  margin-top: 5px;
  padding-bottom: 5px; */
  font-size: 16px;
  border-bottom: 1px solid #153e54;
  text-align: center;
}

.forgot-pass {
 /*  margin-top: 15px; */
  text-align: center;
  font-size: 12px;
  color: #cfcfcf;
}

.forgot-pass:hover{
  color:gray;
}

.submit-btn {
 /*  margin-top: 40px; */
  /* margin-bottom: 20px; */
  background: #153e54;
  text-transform: uppercase;
}
.submit-btn:hover {
  background: white;
  border: 1px solid #153e54;
  color: #153e54;
  text-transform: uppercase;
  transition: 300ms ease-in-out;
}

.nv-btn {
  background-color: #19ce60;
  color: white;
  margin-top: 10px;
  /* margin-bottom: 20px; */
}
.nv-btn span {
  font-weight: bold;
  
}
.nv-btn:hover{
    background-color: white;
    border:solid 1px #fef01b;
    color: #fef01b;
    cursor: pointer;
    transition: 300ms ease-in-out;
}
.kakao-btn {
  border: 2px solid #fef01b;
  background-color: #fef01b;
  color: #272727;
  margin-top: 10px;
 /*  margin-bottom: 20px;*/
} 
.kakao-btn span {
  font-weight: bold;
  
}
.kakao-btn:hover{
    border: 2px solid #fef01b;
    background-color: white;
    color:#272727;
    transition: 300ms ease-in-out;
}
.nv-btn:hover{
    background-color: white;
    border:solid 1px #19ce60;
    color: #19ce60;
    cursor: pointer;
    transition: 300ms ease-in-out;
}

.sign-in {
  transition-timing-function: ease-out;
}
.cont.s--signup .sign-in {
  transition-timing-function: ease-in-out;
  transition-duration: 1.2s;
  transform: translate3d(640px, 0, 0);
}

.sign-up {
  transform: translate3d(-900px, 0, 0);
}
.cont.s--signup .sign-up {
  transform: translate3d(0, 0, 0);
}

.icon-link {
  position: absolute;
  left: 5px;
  bottom: 5px;
  width: 32px;
}
.icon-link img {
  width: 100%;
  vertical-align: top;
}
.icon-link--twitter {
  left: auto;
  right: 5px;
}
.find-container{
	width: 200px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    margin-right: auto;
    margin-left: auto;
    color:
}
.find-container:hover{
	cursor:pointer;
}
/*new login form end*/
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
	border-bottom: 1px solid #153e54;
	width: 100%;
	height: 10px;
	font-size: 20px;
	margin-bottom: 30px;
}

.hr {
	color: #153e54;
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


<!-- new login form -->
  <p class="tip" style="color:white;">login</p>
<div class="cont">
  <div class="form sign-in">
    <h2 style="margin-bottom:50px;">????????? ???????????????</h2>
    <form id="frm" action="login.do" method="post">
	    <label>
	      <span>Email</span>
				<input type="text" id="email" name="email" placeholder="???????????? ???????????????" style="font-size:15px; padding-bottom:10px; padding-top:10px;">
	    </label>
	    <label>
	      <span>Password</span>
				<input type='password' id='password' name="password"
					placeholder='??????????????? ???????????????' onkeyup="enterLogin()" style="font-size:15px; padding-bottom:10px; padding-top:10px;">
	    </label>
	</form>
	<div class="find-container">
	    <p class="forgot-pass" class="findbtn" id="findEmail">????????? ??????</p> 
	    <p class="forgot-pass" class="findbtn" id="findPassword">???????????? ??????</p>
	    
	</div>
	    <button type="button" class="submit-btn" onclick="inputCheck()">LOG IN</button>
	
	
	<a href="${url }">     
    <button type="button" class="nv-btn"><span>Naver??? ????????? ??????</span></button>
    </a>
    <a href="https://kauth.kakao.com/oauth/authorize?client_id=7ce89df312e5bede8d638ca4846b8ed2&redirect_uri=http://54.180.199.178:8080/maeumi/kakaoLogin.do&response_type=code">
    <button type="button" class="kakao-btn"><span>kakaoTalk?????? ????????? ??????</span></button>
    </a>
  <p style="font-size: 18px; margin-top: 5px; text-align: center; margin-bottom:10px;" >
			Maeumi??? ???????????????????<a href="userTermsOfService.do"
				style="text-decoration-line: none; font-size:18px; font-weight:bold; color:#0086e5;"> ????????????&nbsp;</a>??????
		</p>
  
  </div>
  <div class="sub-cont">
    <div class="img">
      <div class="img__text m--up">
        <h5 style="color:white;">??????????????????????</h5>
        <p>?????? ????????????, ???????????? ?????? ?????? ???????????? ???????????????!</p>
      </div>
      <div class="img__text m--in">
        <h2>One of us?</h2>
        <p>If you already has an account, just sign in. We've missed you!</p>
      </div>
      <div class="img__btn" onclick="location.href='counselorTermsOfService.do'">
        <span class="m--up" >Sign Up</span>
        <span class="m--in">Sign In</span>
      </div>
    </div>
    <div class="form sign-up">
      <h2>Time to feel like home,</h2>
      <label>
        <span>Name</span>
        <input type="text" />
      </label>
      <label>
        <span>Email</span>
        <input type="email" />
      </label>
      <label>
        <span>Password</span>
        <input type="password" />
      </label>
      <button type="button" class="submit">Sign Up</button>
      <button type="button" class="nv-btn">Join with <span>facebook</span></button>
      <button type="button" class="kakao-btn">Join with <span>kakaoTalk</span></button>
     
    </div>
  </div>
</div>

<!-- <a href="https://dribbble.com/shots/3306190-Login-Registration-form" target="_blank" class="icon-link">
  <img src="http://icons.iconarchive.com/icons/uiconstock/socialmedia/256/Dribbble-icon.png">
</a>
<a href="https://twitter.com/NikolayTalanov" target="_blank" class="icon-link icon-link--twitter">
  <img src="https://cdn1.iconfinder.com/data/icons/logotypes/32/twitter-128.png">
</a> -->
<script>
    document.querySelector('.img__btn').addEventListener('click', function() {
  document.querySelector('.cont').classList.toggle('s--signup');
});
    
    function inputCheck() {
		var inputEmail = $("#email").val();
		var inputPassword = $("#password").val();
	
	if (frm.email.value == "") {
		alert("???????????? ???????????????");
		frm.email.focus();
		return false;
	} else if (frm.password.value == "") {
		alert("??????????????? ???????????????");
		frm.password.focus();
		return false;
	}
	//frm.submit(); // ??????????????? ???????????? ?????? ??????????????? ???????????? ??? ??????
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
				alert('????????? ?????? ??????????????? ??????????????????.');
				frm.password.value = "";
				frm.password.focus();
				return false;
			}	
		},
		error: function() {
			alert('????????? ??????????????????. ??????????????? ??????????????????.');
		}
		
	});   // ajax???
</script>
<!-- new login form end -->


	<%--  <div class='loginform'>
		<div style="font-size: 62px; text-align: center">Maeumi.</div>
<!-- 		<button type="button" onclick="location.href='cLoginForm.do'" style="float: right;">????????? ?????????</button> -->
		<br>
		<form id="frm" action="login.do" method="post">
			<input type='text' id='email' name='email' placeholder='???????????? ???????????????'>
			<input type='password' id='password' name="password"
				placeholder='??????????????? ???????????????' onkeyup="enterLogin()">
		</form>
		<button type="button" class="findbtn" id="findEmail">????????? ??????&nbsp;&nbsp;</button>
		<button type="button" class="findbtn" id="findPassword">???????????? ??????</button>
		<button type="button" onclick="inputCheck()" style="float: right;">Maeumi. ?????????</button>
	</div>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>

	<div class="belowForm" align="center">
		<!--  ????????? -->
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=7ce89df312e5bede8d638ca4846b8ed2&redirect_uri=http://localhost:8000/prj/kakaoLogin.do&response_type=code">
			<img src="resources/image/kakao_login_medium_wide.png" class="social">
		</a> 
		<!-- ????????? --> 
		<a href="${url }"> 
			&nbsp;&nbsp;<img src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" class="social">
		</a>
		<p style="font-size: 20px; margin-top: 20px;">
			Maeumi??? ???????????????????<a href="userTermsOfService.do"
				style="text-decoration-line: none;"> ????????????&nbsp;</a>??????
		</p>

		<p style="font-size: 20px;">
			??????????????????<a href="counselorTermsOfService.do" style="text-decoration-line: none;"> ????????????</a>??? ??????!
		</p>
	</div>  --%>
	
<script type="text/javascript">
	
		function inputCheck() {
			var inputEmail = $("#email").val();
			var inputPassword = $("#password").val();
		
		if (frm.email.value == "") {
			alert("???????????? ???????????????");
			frm.email.focus();
			return false;
		} else if (frm.password.value == "") {
			alert("??????????????? ???????????????");
			frm.password.focus();
			return false;
		}
		//frm.submit(); // ??????????????? ???????????? ?????? ??????????????? ???????????? ??? ??????
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
					alert('????????? ?????? ??????????????? ??????????????????.');
					frm.password.value = "";
					frm.password.focus();
					return false;
				}	
			},
			error: function() {
				alert('????????? ??????????????????. ??????????????? ??????????????????.');
			}
			
		});   // ajax???
	
	}

	// ????????? ???????????? ????????? ????????? ????????????. 
	function enterLogin() {
		var keyCode = window.event.keyCode;

		if (keyCode == 13) {
			inputCheck();
		}
	};
	
	// ????????? ?????? ????????? ??????
	$("#findEmail").on("click", function() {
	    alert("????????? ????????? ????????? ????????? ????????? ????????? ???????????????.");
		 popupOpen();
	})
	
	function  popupOpen() {
		var url= "findEmailPopup.do";    //????????? ????????? URL
		var winWidth = 500;    
	    var winHeight = 500;
	    var popupX = (window.screen.width / 2) - (800 / 2);
	    var popupY= (window.screen.height /2) - (600 / 2);
	    var popupOption= "width="+winWidth+", height="+winHeight+", left="+ popupX + ", top=" + popupY;    //????????? ??????(optoin)
		window.open(url,"",popupOption);
	}
	
	// ???????????? ?????? ????????? ??????
	$("#findPassword").on("click", function() {
		alert("????????? ????????? ????????? ????????? ???????????? ????????? ???????????????.");
		findPasswordPopupOpen();
	});
	
	function findPasswordPopupOpen() {
		var url= "findPasswordPopup.do";    //????????? ????????? URL
		var winWidth = 550;    
	    var winHeight = 500;
	    var popupX = (window.screen.width / 2) - (800 / 2);
	    var popupY= (window.screen.height /2) - (600 / 2);
	    var popupOption= "width="+winWidth+", height="+winHeight+", left="+ popupX + ", top=" + popupY;    //????????? ??????(optoin)
		window.open(url,"",popupOption);
	}
	

</script>
<br><br><br>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="resources/js/jquery-3.6.0.min.js"></script>
<style>
input {
	font-size: 12px;
    border-radius: 30px;
    border: 1px solid #d8d8d8;
    width: 250px;
    height: 30px;
    text-align: center;
}
#email {
	margin-left: 60px;
}
button {
	height: 30px;
	margin-left: 20px;
}
.inputPwd {
	width: 350px;
	font-size: 13px;
}
.inputEmail{
	margin-left: 5px;
}
.inputPhoneCheck {
	margin-right: 30px;
}
button {
	font-size: 12px;
	border-radius:30px;
	height: 30px;
	margin-left: 20px;
	background-color: #153e54;
	border:1px solid #153e54;
	color:white;
}
button:hover{
	border:1px solid #153e54;
	color:#153e54;
	background-color:white;
	transition:300ms ease-in-out;
}
#selectPasswordBtn{
	width: 20%;
}
  
#findEmail{
	font-size:11px;
	color:#8dacbd42;
}
</style>
<body>
<div align="center" class="mainForm">
	<h2>Maeumi.</h2>
	<div><h3>Maeumi. 비밀번호 찾기!</h3></div>
	<hr>
	<!-- 이메일이랑 연락처 동시에 넘기기. 하나의 ajax에서 데이터 2개 날려서 체크 -->
	<form id="frm" method="post" action="ajaxFindPassword.do">
		<div class="inputEmail">
			<input type="text" placeholder="회원님의 이메일을 입력하세요." id="email" name="email">
			&nbsp; <a href="#" id="findEmail">이메일을 잊으셨나요?</a><Br>
		</div><br>
		<div class="inputPhone">
			<input type="text" placeholder="회원님의 연락처를 '-'없이 입력해주세요." id="phone" name="phone">
			<button type="button" id="sendPhoneBtn" onclick="sendPhoneChk()">인증번호
				전송</button>
		</div><Br>
		<div class="inputPhoneCheck">
			<input type="text" placeholder="인증번호 입력" id="phoneChk"
				disabled="disabled">
			<button type="button" id="phoneChkBtn" onclick="chkPhoneBtn()">인증확인</button>
		</div>
		<hr>
		<button type="button" id="selectPasswordBtn">조회</button>
	</form>
	<br>
</div>
<div class="passwordUpdateForm" style="display:none;" align="center">
	<div class="inputForm">
        <input type="password" placeholder="영문, 숫자, 특수문자가 포함된 8~14자리를 입력하세요." id="password" name="password" class="inputPwd">
    </div>
    <br>
	 <div class="inputForm">
	     <input type="password" placeholder="비밀번호 재확인" id="passwordChk" class="inputPwd">
	 </div>
	 <br>
	<button class='updateBtn' onclick="formCheck()" style="margin: auto; display: block;">비밀번호 수정</button>
</div>
</body>
<script>

	// 이메일 찾기 팝업창 호출
	$("#findEmail").on("click", function() {
	    alert("휴대폰 인증을 완료한 계정만 이메일 찾기가 가능합니다.");
		 popupOpen();
	})
	
	function  popupOpen() {
		var url= "findEmailPopup.do";    //팝업창 페이지 URL
		var winWidth = 500;    
	    var winHeight = 400;
	    var popupX = (window.screen.width / 2) - (800 / 2);
	    var popupY= (window.screen.height /2) - (600 / 2);
	    var popupOption= "width="+winWidth+", height="+winHeight+", left="+ popupX + ", top=" + popupY;    //팝업창 옵션(optoin)
		window.open(url,"",popupOption);
	}


	//coolsms 사용하기 위한 스크립트문. 
	var code2 = "";   // 인증번호값 대입해서 비교용.
	function sendPhoneChk(){
		var inputPhoneChk = $("#phone").val();
		var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		
		if(inputPhoneChk == "" || !regPhone.test(inputPhoneChk)){
			alert("올바르지 않은 연락처입니다. 다시 입력해주세요.");
			$("#phone").focus();
			return false;
		}
		alert("인증번호 발송이 완료되었습니다. 휴대폰을 확인해주세요.")
		$.ajax({
			type: "GET",
			url: "ajaxPhoneChk.do?inputPhoneChk=" + inputPhoneChk,
			success: function(data){
				console.log("data: " + data);  // 콘솔창에서 결과값 확인용. 
				
				if(data == "error"){
					alert("인증 오류입니다. 다시 입력해주세요");
				} else {
					$("#phoneChk").attr("disabled", false);
					code2 = data;
				}
			}
		}); //ajax
	};
	
	// 휴대폰 인증번호 대조. 
	function chkPhoneBtn() {
		if( $("#phoneChk").val() == code2) {
		alert("휴대폰 인증이 완료되었습니다. 조회 버튼을 눌러주세요.");
		
	} else {
		alert("인증번호가 일치하지 않습니다. 다시 확인해주시기 바랍니다.");
		$("#phoneChk").val("");
		$("#phoneChk").focus();
	}
	};

	// ajax구문. 이메일이랑 연락처 모두 던져서 조회하기
	$("#selectPasswordBtn").on("click", function() {
		var sendEmail = $("#email").val(); // 이메일 입력한 것.
		var sendPhone = $("#phone").val(); // 휴대폰 번호 입력한 것.
		if( sendEmail == "") {
			alert("회원님의 이메일을 입력하세요");
			$("#email").focus();
		}
		
		$.ajax({
			type: "POST",
			url: "ajaxFindPassword.do",
			data: {
				sendEmail : sendEmail,
				sendPhone : sendPhone
			},
			dataType: "text",
			success: function(responseText) {
				if(responseText == "NO"){
					alert("인증 오류입니다. 관리자에게 문의하세요.");
				} else if(responseText == "MYES"){  // 멤버라면,
					alert("인증되었습니다. 새로운 비밀번호를 입력하세요");
					$(".mainForm").attr("style", "display:none;");
					$(".passwordUpdateForm").attr("style", "display:inline;");
					$(".passwordUpdateForm").attr("style", "margin-top:100px;");
				} else { // 상담사라면
					alert("인증되었습니다. 새로운 비밀번호를 입력하세요.");
					$(".mainForm").attr("style", "display:none;");
					$(".passwordUpdateForm").attr("style", "display:inline;");
					$(".passwordUpdateForm").attr("style", "margin-top:100px;");
				}
			}  // success문
			
		});  // ajax
		
		
	});
	
	function formCheck() {
		// 비밀번호 정규식 체크하는 부분. 
		var check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&^])[A-Za-z\d$@$!%*#?&^]{8,14}$/;
		var inputPwd = $("#password").val();
		if(!check.test(inputPwd)){
			alert("비밀번호가 조건식을 만족하지 않습니다. 영문, 숫자, 특수문자가 포함된 8~14자리를 입력하세요.");
			return false;
		}
		// 비밀번호 & 비밀번호확인  체크.
		if($("#password").val() != $("#passwordChk").val()){
			alert("비밀번호가 일치하지 않습니다.");
			$("#password").val("");
			$("#passwordChk").val("");
			$("#password").focus();
			return false;
		}	
		
		var sendEmail = $("#email").val();
		var sendPhone = $("#phone").val();
		var sendPassword = $("#password").val();
		
		$.ajax({
			type: "POST",
			url: "passwordUpdate.do",
			data: {
				sendEmail : sendEmail,
				sendPhone : sendPhone,
				sendPassword : sendPassword
			},
			success: function(responseText){
				if(responseText == "YES") {
						alert("비밀번호가 수정되었습니다.");
						window.opener.location.href="loginForm.do";
						window.close();
				}
			}
		})
	
	}
</script>
</html>
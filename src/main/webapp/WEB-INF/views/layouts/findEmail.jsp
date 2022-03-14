<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
}
input {
	font-size: 12px;
	border-radius:30px;
	border:1px solid #d8d8d8;
	width: 250px;
	height: 30px;
	text-align: center;
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
.inputForm2 {
	margin-right: 31px;
}
#selectEmailBtn {
	margin-top: 20px;
	width: 80px;
	height: 30px;
}
</style>
<body>
	<div align="center">

		<h2>Maeumi.</h2>
		<div><h3>Maeumi. Email 찾기!</h3></div>
		<hr>

		<img src="resources/user/images/MaeumiLogo.png" style="width:100px; margin-top:50px;">
		<div><h3 style="margin-top:20px;">Email 찾기 서비스. 비번은 알아서~</h3></div>
		<hr style="margin-top:30px;">

		<form id="frm" method="post" action="ajaxFindEmail.do">
		<div class="inputForm1">
			<input type="text" placeholder="회원님의 연락처를 '-'없이 입력해주세요." id="phone" name="phone">
			<button type="button" id="sendPhoneBtn" onclick="sendPhoneChk()">인증번호
				전송</button>
		</div><Br>
		<div class="inputForm2">
			<input type="text" placeholder="인증번호 입력" id="phoneChk"
				disabled="disabled">
			<button type="button" id="phoneChkBtn" onclick="chkPhoneBtn()">인증확인</button>
		</div>
		<hr style="margin-top:30px;">
		<button type="button" id="selectEmailBtn">조회</button>
		</form><br>
		<div id="result"></div>
	</div>
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script>
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

//ajax구문. 휴대폰 값 전송해서 조회하기.
$("#selectEmailBtn").on("click", function() {
	var sendPhone = $("#phone").val(); // 휴대폰 입력한 값을 변수에 담아서 ajax로 넘길 것이다. 
	$.ajax({
		type: "POST",
		url: "ajaxFindEmail.do",
	 	data: {
	 		"sendPhoneNum" : sendPhone
	 	},
	 	dataType: "text",
	 	success: function(responseText){
	 		if(responseText == "NO"){
	 			alert ("해당하는 이메일이 존재하지 않습니다.");
	 			//window.close();
	 		} else {
	 			alert(responseText);
	 			$("#result").html(responseText);
	 		}
	 	}
		
	});
	
})


</script>
</body>
</html>
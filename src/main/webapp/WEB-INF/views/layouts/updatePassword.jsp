<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 팝업</title>
</head>
<style>
body {
}
input {
	width: 300px;
	height: 30px;
	text-align: center;
}

#originPwd {
	margin-left: 30px;
}
#sendPwdChk {
	width: 100px;	
}
#changePwd {
	margin-right: 90px;	
	margin-top: 15px;
}
#changePwdChk {
	margin-top: 10px;
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
</style>
<body>
	<div align="center">
		<img src="resources/user/images/MaeumiLogo.png" style="width:200px; margin-top:10px;">
		<div><h3>- 비밀번호 변경 -</h3></div>
		<hr>
		<!-- 기존 비밀번호 확인 -->
		<div class="inputForm1">
			<input type="password" placeholder="현재 비밀번호를 입력하세요." id="originPwd" name="originPwd">
			<button type="button" id="sendPwdChk" name="sendPwdChk" >비밀번호 확인</button>
		</div><Br>
		
		<!-- 변경할 비밀번호 입력 -->
		<div class="inputForm2">
			<input type="password" placeholder="영문, 숫자, 특수문자가 포함된 8~14자리" id="changePwd" name="changePwd" disabled="disabled">
			<br>
			<input type="password" placeholder="비밀번호 확인" id="changePwdChk" name="changePwdChk" disabled="disabled">
			<button type="button" id="pwdChkBtn" onclick="pwdChkBtn()">변경하기</button>
		</div>
		<hr>
	</div>
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script>

	$("#sendPwdChk").on("click",function(){
			
		var sendPwd = $("#originPwd").val();  // 입력한 원래 비밀번호
		$.ajax({
			url: "ajaxPassChk.do",
			type: "POST",
			data: {
				sendPwd  : sendPwd 
			},
			dataType : "text",
			success: function(responseText){
				if( responseText == "YES"){
					alert("확인되었습니다. 변경할 비밀번호를 입력해주세요.");
					$("#changePwd").attr("disabled", false);
					$("#changePwdChk").attr("disabled", false);
					$("#changePwd").focus();
				} else {
					alert("비밀번호를 다시 입력하세요.");
					location.reload();
					return false;
				}
				
			}
		})
	});	
	
	/* 변경할 비밀번호 일치하는지 여부. */
	function pwdChkBtn() {
		
		// 먼저 정규식 체크
		var check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&^])[A-Za-z\d$@$!%*#?&^]{8,14}$/;
		var inputPwd = $("#changePwd").val();
		if (!check.test(inputPwd)) {
		    alert("비밀번호가 조건식을 만족하지 않습니다. 영문, 숫자, 특수문자가 포함된 8~14자리");
		    $("#changePwd").focus();
		    return false;
		}
		// 새로운 비밀번호 확인 체크
		if ($("#changePwd").val() != $("#changePwdChk").val()) {
		    alert("비밀번호가 일치하지 않습니다.");
		    $("#changePwd").val("");
		    $("#changePwdChk").val("");
		    $("#changePwd").focus();
		    return false;
		}
		
		$("#changePwd").attr("disabled", "disabled" );
		$("#changePwdChk").attr("disabled", "disabled" );
		
		// 실제 db업데이트 부분.
		
		$.ajax({
			url: "ajaxUpdatePassword.do",
			data: {
				inputPwd: inputPwd
			},
			dataType: "text",
			success: function(responseText){
				if(responseText == "YES"){
					alert("비밀번호가 변경되었습니다.");
					window.close();
				} 
			}
		})
		
		
	}



</script>
</body>
</html>
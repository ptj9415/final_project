<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연락처 인증</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
input {
	width: 50%;
	height: 30px;
}
button {
	margin-left: 30px;
	height: 30px;
	width: 100px;
}
#phoneChk {
	margin-left: 25px;
}
#phoneChkBtn {
	margin-right: 30px;
}
#phoneUpdateBtn {
	width: 130px;
}
</style>
<body>

<div align="center">
	<div><h2>연락처 정보 변경하기</h2></div>
	<div class="inputForm">
	    <input type="text" placeholder="인증받으실 번호를 '-' 없이 입력해주세요." id="phone" name="phone" required="required">
	    <button type="button" id="sendPhoneBtn" onclick="sendPhoneChk()">인증번호 전송</button>
	    <hr color="#FFE6E6">
	</div>
	<br>
	<div class="inputForm second">
	    <input type="text" placeholder="인증번호 입력" id="phoneChk" disabled="disabled" required="required">
	    <button type="button" id="phoneChkBtn" onclick="chkPhoneBtn()">확인</button>
	    <hr color="#FFE6E6">
	</div>
	<Br>
	<button id="phoneUpdateBtn">연락처 수정 완료</button>
</div>                
                
</body>
<script>
	//coolsms 사용하기 위한 스크립트문. 
	var code = "";   // 인증번호값 대입해서 비교용.
	
	function sendPhoneChk(){
		var inputPhoneChk = $("#phone").val();
		var regPhone = /^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/;
		
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
					code = data;
				}
			}
		}); //ajax
	};
	
	// 휴대폰 인증번호 대조. 
	function chkPhoneBtn() {
		if( $("#phoneChk").val() == code) {
		alert("휴대폰 인증 성공. 변경확인 버튼을 눌러주세요.");
		$("#phone").attr("disabled", "disabled");
		$("#phoneChk").attr("disabled", "disabled");
		
		
	} else {
		alert("인증번호가 일치하지 않습니다. 다시 확인해주시기 바랍니다.");
		$("#phoneChk").val("");
		$("#phoneChk").focus();
	}
	};
	
	// ajax 연락처 업데이트
	$("#phoneUpdateBtn").on("click", function(){
		var inputPhoneChk = $("#phone").val();
		
		$.ajax({
			url: "ajaxUpdatePhone.do",
			data: {
				inputPhoneChk : inputPhoneChk
			},
			dataType: "text",
			success: function(responseText){
				if(responseText == 'YES'){
					alert("연락처 정보가 수정되었습니다.");
					window.opener.location.reload(); // 부모창 새로고침 후 
					window.close();					// 자식 팝업창 닫기
				} else {
				alert("오류. 관리자에게 문의해주세요.");
				}
			}
		});
	});
</script>
</html>
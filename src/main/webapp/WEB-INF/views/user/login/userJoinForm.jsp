<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.joinForm {
        width: 30%;
        padding: 50px 0px;
    }

input {
            border-style: none;
    		height: 25px;
    		width: 60%;
   			border: 0 solid black;
    		background: transparent;
    		font-size: 13px;
    		margin-left:10px;
        }
input:focus {
	outline: 0;
	
}

 button {
            height: 50px;
            width: 100px;
            background-color: white;
            border: 1px solid #8dacbd42;
            border-radius: 50px;
            margin-bottom: 5px;
            font-size:13px;
            margin-left: 40px;
        }
        button:focus{
        	outline:0;
        }

.inputForm {
    margin-bottom: 25px;
}


.nonBtn {
    width: 90%;
}
.joinbtn {
            width: 120px;
             background-color: #153e54;
             color:white;
             margin-right: auto;
   			 margin-left: auto;
		}
button:hover {
            background-color: #153e54;
            color:white;
			transition: 200ms ease-in-out;
        }
        
#nicknameBtn, #sendPhoneBtn, #phoneChkBtn {
	display: inline-block;
}
#nicknameBtn {
}

#email {
	font-size: 18px;
}
#password, #passwordChk {
	margin-left: 40px;  
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	 
	function nicknameCheck() {
			var nickname = $("#nickname").val(); // 닉네임 입력값. 
			if(nickname == "" || nickname.length < 2 ){
				alert("닉네임은 2~7자리를 입력하셔야 합니다.");
				$("#nickname").focus();
				return;
			}
			$.ajax({
				url : "ajaxNicknameCheck.do",
				type: "POST",
				data:  {
					"chkNickname" : nickname  // json타입으로 전송했음.
				}, 
				dataType: "text",  // 서버로부터 받아올 데이터 형식
				success: function(data) {
					if(data =="0") { // check의값이 0인 경우, 즉 중복 닉네임이 없는 경우. 
						alert( nickname + " 는 사용할 수 있는 닉네임입니다.");
						$("#nicknameBtn").val("YES"); 
						$("#password").focus();
					} else {
						alert("중복된 닉네임입니다. 다른 닉네임을 입력해주세요.");
						$("#nickname").val("");
						$("#nickname").focus();
					}
				}
			});
	};
	
	// 회원가입 버튼 & 양식 체크.
	function formCheck(){
		if($("#nicknameBtn").val() != "YES"){
			alert("닉네임 중복체크를 해주세요");
			return false;
		}
		
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

//      // 일반회원의 연락처는 null값을 허용하기 때문에 주석처리함.
// 		if($("#phone").val() == ""){
// 			alert("연락처를 입력해주세요");
// 			$("#phone").focus();
// 			return false;
// 		}
		$("#frm").submit();
	}
	
	
	// coolsms 사용하기 위한 스크립트문. 
	var code2 = "";   // 인증번호값 대입해서 비교용.
	function sendPhoneChk(){
		
		var inputPhoneChk = $("#phone").val();
		var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		
		if(inputPhoneChk == "" || !regPhone.test(inputPhoneChk)){
			alert("올바르지 않은 연락처입니다. 다시 입력해주세요.");
			$("#phone").focus();
			return false;
		}
		alert("인증번호 발송이 완료되었습니다. 휴대폰에서 인증번호 확인을 해주세요.")
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
		alert("휴대폰 인증이 완료되었습니다. 회원가입 버튼을 눌러주세요.");
		$("#mphone").val($("#phone").val());  
				// 휴대폰 인증이 완료되면, 인증했던 번호가 전송되도록. 인증이 제대로 안 되면 hidden타입의 value값인 '미기재'가 전송. 
	} else {
		alert("인증번호가 일치하지 않습니다. 다시 확인해주시기 바랍니다.");
		$("#phoneChk").val("");
		$("#phoneChk").focus();
	}
	};
	
	
</script>
</head>
<body>
<!-- 회원가입 하는 양식 만들기-->
  <div class="mainForm" align="center">
        <div class="joinForm">
        <img src="resources/user/images/MaeumiLogo.png" style="width:200px; margin-top:10px;">
            <hr>
            <h5>본인확인이 완료되었습니다.<br> 회원가입을 계속 진행해주세요.</h5>
            <br>
            <form id="frm" action="memberJoin.do" method="post">

                <div class="inputForm">
                    <input type="text" id="email" name="email" value="${m_email }" readonly class="nonBtn" style="text-align: center">
                    <hr>
                </div>
                <div class="inputForm">
                    <input type="text" placeholder="닉네임은 2~7자리를 입력해주세요" id="nickname" name="nickname" maxlength="7">
                    <button type="button" onclick="nicknameCheck()" id="nicknameBtn" style="">중복확인</button>
                    <hr>
                </div>
                <div class="inputForm">
                    <input type="password" placeholder="비밀번호" id="password" name="password" class="nonBtn">
                    <hr>
                </div>
                <div class="inputForm">
                    <input type="password" placeholder="비밀번호 확인" id="passwordChk" class="nonBtn">
                    <hr>
                </div>
                <div class="inputForm">
                    <input type="text" placeholder="인증받으실 번호를 '-'없이 입력해주세요." id="phone">
                    <button type="button" id="sendPhoneBtn" onclick="sendPhoneChk()">인증번호 전송</button>
                    <hr>
                </div>
                <div class="inputForm">
                    <input type="text" placeholder="인증번호 입력" id="phoneChk" disabled="disabled">
                    <button type="button" id="phoneChkBtn" onclick="chkPhoneBtn()">확인</button>
                    <hr>
                </div>
                <input type="hidden" id="type" name="type" value="마으미">
                <input type="hidden" id="mphone" name="phone" value="-">
            </form>
        <button class='joinbtn' onclick="formCheck()">Maeumi.&nbsp;가입!</button>
        </div>
    </div>
</body>
</html>
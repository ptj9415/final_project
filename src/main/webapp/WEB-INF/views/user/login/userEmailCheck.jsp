<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.test {
	display: flex;
    justify-content: center;
    animation: fadein 1s;
    -webkit-animation: fadein 1s;
}
  @-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}
.mainForm {
    width: 40%;
    margin-top: 50px;
}

.comment {
	text-align: center;
	padding-top: 15px;
	padding-bottom: 15px;
	
}

input {
	margin-left: 10px;
	margin-top: 10px;
	height: 50px;
	width: 65%;
	font-size: 13px;
	padding-left: 20px;
	border: 1px solid #8dacbd42;
    border-radius: 30px;
}

input:focus{
	outline:0;
}



}

#emailSendBtn {
	width: 80px;
    height: 50px;
    border: 1px solid #8dacbd42;
    margin-left: 20px;
    margin-top: 10px;
    color:#666666;
    font-size:13px;
}

#nextBtn {
    width: 100px;
    height: 50px;
    margin-right: auto;
    margin-left: auto;
    margin-top:30px;
    margin-bottom:50px;
    border: 1px solid #153e54;
    background-color: #153e54;
    color: white;
 }
 #nextBtn:hover{
 	border: 1px solid #153e54;
 	background-color:white;
 	color:#153e54;
 	transition:200ms ease-in-out;
 }
 #nextBtn:focus{
 	outline:0;
 }
.correct {   <!--correct, incorrect 모두 인증번호 일치여부에 따라 경고색깔을 달리 표시하기 위함 --> 
	color: green;
}
.incorrect{
	color: red;
}
.clearfix{
	clear: both;
}
#mail_check_input_box_warn{
	margin-left: 10px;
}
button {
	background-color: white;
    border: 1px solid gray;
    border-radius: 50px;
}

.emailCheck{
	border:1px solid #8dacbd42;
	border-radius:20px;
}
.check-container{
	display:flex;
}
#emailSendBtn{
	width:20%;
	height:50px;
	margin-left:20px;
	margin-top:10px;
	border:1px solid #8dacbd42;
}
#emailSendBtn:hover{
	background-color:#153e54;
	border:1px solid #153e54;
	color:white;
	transition:200ms ease-in-out;
}
.checkNum{
	font-size:13px;
}
.checkNum:focus{
	outline:0;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	

$(document).ready(function() {
		
	// 인증번호 이메일 중복체크 & 인증메일 전송
	var code = "";
	$("#emailSendBtn").click(function (){
		var inputEmail = $("#inputEmail").val();  // 이메일 입력한 값. 
		if(inputEmail == "") {
			alert("이메일 주소를 입력해주세요.");
			$("#inputEmail").focus();
			return;
		}
		setTimeout('location.reload()',600000);    //테스트용 1분뒤 페이지 새로고침. 화면설계서엔 5분으로 되어있음.
		$.ajax({
			url: "ajaxEmailCheck.do",
			type: "POST",
			data: {
				"chkEmail" : inputEmail
			},
			dataType: "text",
			success: function(data) {
				if(data =="0"){ 	// 중복이메일이 없는 경우.
					alert("입력하신 메일함을 확인해주세요.");
					$("#checkNum").attr("readonly", false);
					$("#checkNum").attr("placeholder","메일함에 전송된 인증번호를 입력해주세요.");
					$.ajax({
						type: "GET",
						url: "ajaxChkNum.do?inputEmail="+ inputEmail, 
						success: function(data) {
							console.log("data: " + data);  // 콘솔창에서 num값 확인용. 
							code = data;   // 'code'변수를 통해 인증번호가 일치하는지 확인
						}	
					});
					
				} else {
					alert("중복된 메일주소입니다. 다른 이메일 주소를 입력해주세요.");
					$("#inputEmail").val("");
				}
			}
		});
	}); // 인증번호 이메일 중복체크 & 인증메일 전송끝


	// 인증번호 비교
	$("#nextBtn").click(function(){
		
		var inputCode = $("#checkNum").val();			// 사용자가 입력하는 인증번호
		var checkResult = $("#mail_check_input_box_warn"); // 비교결과
		
		if(inputCode != ""){
			if(inputCode == code) {
				alert("가입화면으로 이동합니다.");
				location.href='userJoinForm.do';
				$("#frm").submit();  // 입력한 email값을 컨트롤러로. (밑에 마지막줄에 넣으니깐 인증번호가 틀려도 가입양식으로 이동되는 이유 무엇?)
			} else {
				checkResult.html("인증번호를 다시 확인해주세요.");
				checkResult.attr("class", "incorrect");
				
			}
		} else {
			alert("이메일 인증을 해주세요.");
			$("#checkNum").focus();
		}
		
	
	});  //인증번호 비교끝
	
	
});

</script>
</head>
<body>
	 <div class="test">
        <div class="mainForm">
            <div class="title" align="center">
                <h3>이메일 인증</h3>
                <hr>
            </div>
            <div class="comment">
                <h4>고객님의 본인확인을 진행해주세요.</h4>
                <h6>Maeumi. 의 다양한 서비스 이용을 위해 본인확인이 필요합니다.</h6>
            </div>
            <div class="emailCheck" >
            	<form id="frm" action="userJoinForm.do" method="POST">
            		<div class="check-container">
	                <input type="email" placeholder="이메일을 입력해주세요" id="inputEmail" name="inputEmail" class="inputEmail">
	                <button type="button" id="emailSendBtn" >인증하기</button><br>
            		</div>
                </form>
                <input type="text" placeholder="'인증하기'를 눌러주세요." id="checkNum" class="checkNum" readonly="readonly">
                <div class="clearfix"></div>
				<span id="mail_check_input_box_warn"></span> <!-- 인증번호의 일치여부를 알려주는 경고글 역할. -->
			<br>
                <p style="font-size:15px; margin-left: 30px;">*메일이 발송되지 않은 경우 스팸메일함 등을 확인해주세요.<br>인증가능시간은 최대 5분입니다. </p>
            </div>
            <br>
            <button type="button" id="nextBtn" name="nextBtn">다음</button>
        </div>
        <div>
        	
        </div>
    </div>
    <br><br><br><br><br>
</body>
</html>
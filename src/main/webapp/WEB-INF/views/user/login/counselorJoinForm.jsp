<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        .joinForm {
            width: 40%;
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
		input#name{
			background-color:white;;
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
             
        }
        .joinbtn:hover{
        	background-color:white;
        	border:1px solid #153e54;
        	color:#153e54;
        }

        button:hover {
            background-color: #153e54;
            color:white;
			transition: 200ms ease-in-out;
        }

        #gender {
            background-color: white;
    		border: 1px solid #8dacbd42;
    		color: #666666;
    		font-size: 13px;
        }

     /*    #gender:hover {
            background-color: #8dacbd42;
            border-color: white;
        }
        
 */
 		#gender:focus{
 			outline:0;
 		}
        option {
            text-align: center;
        }

        .address_Input_1 {
            float: left;
            margin-left: 15px;
            border-bottom: 1px solid #8dacbd42;
        }

        .address_Input_2,
        .address_Input_3 {
            margin-right: 15px;
            margin-bottom: 5px;
            width: 90%;
            border-bottom: 1px solid #8dacbd42;
        }

        #addrWrap>input {
            border-bottom: 1px solid #8dacbd42;
            margin-bottom: 5px;
        }
       #pwGuide1 {
       	font-size: 13px;
       }
       .zip-container{
       		display:flex;
       		margin-left: 15px;
       		
       }
       
       .joinForm{
       	 animation: fadein 1s;
			-webkit-animation: fadein 1s; /* Safari and Chrome */
       }
        @-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}
	.check-container{
		display:flex;
	}
    </style>
    <script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        // 회원가입 버튼 & 양식 체크.
        function formCheck() {
        	
        	// 이름 체크
        	if($("#name").val() == "") {
        		alert("상담사분의 성함을 기입하세요.");
        		$("#name").focus();
        		return false;
        	} else if( $("#name").val().length < 2){
        		alert("올바르지 않은 이름 형식입니다.");
        		$("#name").focus();
        		return false;
        	}
        	// 생년월일
        	var birthReg = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
			var inputBirth = $("#birthdate").val();
        	
        	if($("#birthdate").val() == "" ){
        		alert("생년월일을 입력해주세요.");
        		$("#birthdate").focus();
        		return false;
        	} else if( !birthReg.test(inputBirth)) {
        		alert('생년월일은 다음 예와 같이 입력해주세요. ex) "1992-08-03" ');
        		$("#birthdate").focus();
        		return false;
        	}
        	
        	// 성별 체크
        	if($("#gender").val() == "") {
        		alert("성별선택을 해주세요.");
        		$("#gender").focus();
        		return false;
        	} 
        	
            // 비밀번호 정규식 체크하는 부분. 
            var check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&^])[A-Za-z\d$@$!%*#?&^]{8,14}$/;
            var inputPwd = $("#password").val();
            if (!check.test(inputPwd)) {
                alert("비밀번호가 조건식을 만족하지 않습니다. 영문, 숫자, 특수문자가 포함된 8~14자리를 입력하세요.");
                $("#password").focus();
                return false;
            }

            if ($("#password").val() != $("#passwordChk").val()) {
                alert("비밀번호가 일치하지 않습니다.");
                $("#password").val("");
                $("#passwordChk").val("");
                $("#password").focus();
                return false;
            }
            
         	//주소 체크해야 함.   도로명주소 + 상세주소의 값을 button
        	var sendAddress = "";
         	var road = $("#roadAddress").val();
         	var detail = $("#detailAddress").val();
         	sendAddress = road + detail;
         	
         	console.log("sendAddress의 값: " + sendAddress);
         	
         	if(sendAddress == ""){
        		alert("주소입력을 해주세요");
        		return false;
        	} else {
        		sendAddress = road + " / " + detail;
        		$("#address").val(sendAddress);
        	}
         	
         	
        	// 휴대폰 인증 여부 체크
        	if($("#phoneChkBtn").val() != "YES"){
        		alert("휴대폰 인증을 완료해주세요.");
        		return false;
        	}

            $("#frm").submit();
        }
        
        
        
        // coolsms 사용하기 위한 스크립트문. 
        var code2 = ""; // 인증번호값 대입해서 비교용.
        function sendPhoneChk() {

            var inputPhoneChk = $("#phone").val();
            var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

            if (inputPhoneChk == "" || !regPhone.test(inputPhoneChk)) {
                alert("올바르지 않은 연락처입니다. 다시 입력해주세요.");
                $("#phone").focus();
                return false;
            }
            alert("인증번호 발송이 완료되었습니다. 휴대폰에서 인증번호 확인을 해주세요.");
            $.ajax({
                type: "GET",
                url: "ajaxPhoneChk.do?inputPhoneChk=" + inputPhoneChk,
                success: function (data) {
                    console.log("data: " + data); // 콘솔창에서 결과값 확인용. 

                    if (data == "error") {
                        alert("인증 오류입니다. 다시 입력해주세요");
                    } else {
                        $("#phoneChk").attr("disabled", false);
                        $("#phoneChk").focus();
                        code2 = data;
                    }
                }
            }); //ajax
        };

        // 휴대폰 인증번호 대조. 
        function chkPhoneBtn() {
            if ($("#phoneChk").val() == code2) {
            	$("#phoneChkBtn").val("YES");  // formCheck()에서 체크하기 위함.
                alert("휴대폰 인증이 완료되었습니다. 회원가입 버튼을 눌러주세요.");
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
            <h3>Maeumi.</h3>
            <br>
            <hr>
            <h5>본인확인이 완료되었습니다.<br> 모든 항목에 기입해주셔야 합니다.</h5>
            <br>
            <form id="frm" action="counselorJoin.do" method="post">
                <div class="inputForm">
                    <input type="text" id="email" name="email" value="${c_email }" readonly class="nonBtn"
                        style="text-align: left; width: 60%;">
                    <input type="text" placeholder="이름" id="name" name="name" style="width: 30%;" required="required"><hr>
                </div>
                <div class="inputForm">
                	<div class="check-container">
                    <input type="text" placeholder="생년월일을 입력하세요 ex) 1992-08-03 " maxlength="10" id="birthdate" name="birthdate"
                        style="width: 60%; margin-right:30px;" required="required">
                    <select id="gender" name="gender" style="height: 50px; border-radius: 50px; width: 90px;" required="required">
                        <option value="">성별 선택</option>
                        <option value="남자" style="text-align: center;">남자</option>
                        <option value="여자">여자</option>
                    </select>
                	</div>
                    <hr>
                </div>
                <div class="inputForm">
                    <input type="password" placeholder="비밀번호    (비밀번호는 영문, 숫자, 특수문자가 포함된 8~14자리)" 
                    	id="password" name="password" class="nonBtn" required="required">
                    <hr>
                </div>
                <div class="inputForm">
                    <input type="password" placeholder="비밀번호 확인" id="passwordChk" class="nonBtn" required="required">
                    <hr>
                </div>
                <div class="inputForm" id="addrWrap">
                 <div class="zip-container">
                    <input type="text" id="postcode" placeholder="우편번호" required="required" readonly="readonly">
                    <button type="button" onclick="execDaumPostcode()">우편번호 찾기</button><br>
                 </div>
                    <input type="text" id="roadAddress" placeholder="도로명주소" style="width: 45%;" required="required" readonly="readonly">
                    <input type="text" id="jibunAddress" placeholder="지번주소" style="width: 45%;" readonly="readonly">
                    <span id="guide" style="color:#999;display:none; font-size: 13px;"></span>
                    <input type="text" id="detailAddress" placeholder="상세주소" style="width: 45%;">
                    <input type="text" id="extraAddress" placeholder="참고항목" style="width: 40%; margin-right: 25px;">
                    <input type="hidden" id="address" name="address">
                    <hr>
                </div>
	                <div class="inputForm">
                <div class="check-container">
	                    <input type="text" placeholder="인증받으실 번호를 '-' 없이 입력해주세요." style="margin-top:15px;" id="phone" name="phone" required="required">
	                    <button type="button" id="sendPhoneBtn" onclick="sendPhoneChk()">인증번호 전송</button>
	            </div>
	                    <hr>
                </div>
                <div class="inputForm">
                  <div class="check-container">
                    <input type="text" placeholder="인증번호 입력" id="phoneChk"  style="margin-top:15px;" disabled="disabled" required="required">
                    <button type="button" id="phoneChkBtn" onclick="chkPhoneBtn()">확인</button>
                   <hr>
                    </div>
                </div>
            </form>
            <button class='joinbtn' onclick="formCheck()" type="button">가입완료</button>



        </div>
    </div>

    <!--카카오 주소 연동 스크립트 부분-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        
        function execDaumPostcode() {
        		 
            new daum.Postcode({
                oncomplete: function (data) {

                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data
                            .buildingName);
                    }
                    
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣고
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("roadAddress").value = roadAddr;
                    document.getElementById("jibunAddress").value = data.jibunAddress;

                    // 부가정보가 있을 경우, 해당 필드에 넣는다.
                    if (roadAddr !== '') {
                        document.getElementById("extraAddress").value = extraRoadAddr;
                    } else {
                        document.getElementById("extraAddress").value = '';
                    }

                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if (data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                    } else if (data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                }
            }).open();
        }
    </script>
</body>

</html>
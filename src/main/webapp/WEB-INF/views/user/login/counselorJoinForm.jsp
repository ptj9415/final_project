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
    		margin-left: 40px;
        }

         #gender:hover {
            background-color: #153e54;
            color:white;
        }
        
 
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
	#email {
		font-size: 18px;
	}
	#emailInputForm {
	
	}
		   
    </style>
    <script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        // ???????????? ?????? & ?????? ??????.
        function formCheck() {
        	
        	// ?????? ??????
        	if($("#name").val() == "") {
        		alert("??????????????? ????????? ???????????????.");
        		$("#name").focus();
        		return false;
        	} else if( $("#name").val().length < 2){
        		alert("???????????? ?????? ?????? ???????????????.");
        		$("#name").focus();
        		return false;
        	}
        	// ????????????
        	var birthReg = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
			var inputBirth = $("#birthdate").val();
        	
        	if($("#birthdate").val() == "" ){
        		alert("??????????????? ??????????????????.");
        		$("#birthdate").focus();
        		return false;
        	} else if( !birthReg.test(inputBirth)) {
        		alert('??????????????? ?????? ?????? ?????? ??????????????????. ex) "1992-08-03" ');
        		$("#birthdate").focus();
        		return false;
        	}
        	
        	// ?????? ??????
        	if($("#gender").val() == "") {
        		alert("??????????????? ????????????.");
        		$("#gender").focus();
        		return false;
        	} 
        	
            // ???????????? ????????? ???????????? ??????. 
            var check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&^])[A-Za-z\d$@$!%*#?&^]{8,14}$/;
            var inputPwd = $("#password").val();
            if (!check.test(inputPwd)) {
                alert("??????????????? ???????????? ???????????? ????????????. ??????, ??????, ??????????????? ????????? 8~14????????? ???????????????.");
                $("#password").focus();
                return false;
            }

            if ($("#password").val() != $("#passwordChk").val()) {
                alert("??????????????? ???????????? ????????????.");
                $("#password").val("");
                $("#passwordChk").val("");
                $("#password").focus();
                return false;
            }
            
         	//?????? ???????????? ???.   ??????????????? + ??????????????? ?????? button
        	var sendAddress = "";
         	var road = $("#roadAddress").val();
         	var detail = $("#detailAddress").val();
         	sendAddress = road + detail;
         	
         	console.log("sendAddress??? ???: " + sendAddress);
         	
         	if(sendAddress == ""){
        		alert("??????????????? ????????????");
        		return false;
        	} else {
        		sendAddress = road + " / " + detail;
        		$("#address").val(sendAddress);
        	}
         	
         	
        	// ????????? ?????? ?????? ??????
        	if($("#phoneChkBtn").val() != "YES"){
        		alert("????????? ????????? ??????????????????.");
        		return false;
        	}

            $("#frm").submit();
        }
        
        
        
        // coolsms ???????????? ?????? ???????????????. 
        var code2 = ""; // ??????????????? ???????????? ?????????.
        function sendPhoneChk() {

            var inputPhoneChk = $("#phone").val();
            var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

            if (inputPhoneChk == "" || !regPhone.test(inputPhoneChk)) {
                alert("???????????? ?????? ??????????????????. ?????? ??????????????????.");
                $("#phone").focus();
                return false;
            }
            alert("???????????? ????????? ?????????????????????. ???????????? ????????? ????????????.");
            $.ajax({
                type: "GET",
                url: "ajaxPhoneChk.do?inputPhoneChk=" + inputPhoneChk,
                success: function (data) {
                    console.log("data: " + data); // ??????????????? ????????? ?????????. 

                    if (data == "error") {
                        alert("?????? ???????????????. ?????? ??????????????????");
                    } else {
                        $("#phoneChk").attr("disabled", false);
                        $("#phoneChk").focus();
                        code2 = data;
                    }
                }
            }); //ajax
        };

        // ????????? ???????????? ??????. 
        function chkPhoneBtn() {
            if ($("#phoneChk").val() == code2) {
            	$("#phoneChkBtn").val("YES");  // formCheck()?????? ???????????? ??????.
                alert("????????? ????????? ?????????????????????. ???????????? ????????? ???????????????.");
            } else {
                alert("??????????????? ???????????? ????????????. ?????? ?????????????????? ????????????.");
                $("#phoneChk").val("");
                $("#phoneChk").focus();
            }
        };
        
       
    </script>

</head>

<body>
    <!-- ???????????? ?????? ?????? ?????????-->
    <div class="mainForm" align="center">
        <div class="joinForm">
			<img src="resources/user/images/MaeumiLogo.png" style="width:200px; margin-top:10px;">            
            <hr>
            <h5>??????????????? ?????????????????????.<br> ?????? ????????? ?????????????????? ?????????.</h5>
            <br>
            <form id="frm" action="counselorJoin.do" method="post">
                <div class="inputForm" id="emailInputForm">
                    <input type="text" id="email" name="email" value="${c_email }" readonly class="nonBtn"
                        style="text-align: left; width: 60%; margin-left: 18px;">
                    <input type="text" placeholder="??????" id="name" name="name" style="width: 30%;" required="required"><hr>
                </div>
                <div class="inputForm">
                	<div class="check-container">
                    <input type="text" placeholder="??????????????? ??????????????? ex) 1992-08-03 " maxlength="10" id="birthdate" name="birthdate"
                        style="width: 60%; margin-top: 20px; margin-left: 40px;" required="required">
                    <select id="gender" name="gender" style="height: 50px; border-radius: 50px; width: 90px;" required="required">
                        <option value="">?????? ??????</option>
                        <option value="??????" style="text-align: center;">??????</option>
                        <option value="??????">??????</option>
                    </select>
                	</div>
                    <hr>
                </div>
                <div class="inputForm">
                    <input type="password" placeholder="????????????    (??????????????? ??????, ??????, ??????????????? ????????? 8~14??????)" 
                    	id="password" name="password" class="nonBtn" required="required">
                    <hr>
                </div>
                <div class="inputForm">
                    <input type="password" placeholder="???????????? ??????" id="passwordChk" class="nonBtn" required="required">
                    <hr>
                </div>
                <div class="inputForm" id="addrWrap">
                 <div class="zip-container">
                    <input type="text" id="postcode" placeholder="????????????"  style="margin-left: 30px;" required="required" readonly="readonly">
                    <button type="button" onclick="execDaumPostcode()">???????????? ??????</button><br>
                 </div>
                    <input type="text" id="roadAddress" placeholder="???????????????" style="width: 45%; margin-left: 25px;" required="required" readonly="readonly">
                    <input type="text" id="jibunAddress" placeholder="????????????" style="width: 45%;" readonly="readonly">
                    <span id="guide" style="color:#999;display:none; font-size: 13px;"></span>
                    <input type="text" id="detailAddress" placeholder="????????????" style="width: 45%;">
                    <input type="text" id="extraAddress" placeholder="????????????" style="width: 40%; margin-right: 25px;">
                    <input type="hidden" id="address" name="address">
                    <hr>
                </div>
	                <div class="inputForm">
                <div class="check-container">
	                    <input type="text" placeholder="??????????????? ????????? '-' ?????? ??????????????????." style="margin-top:15px; margin-left: 40px;" id="phone" name="phone" required="required">
	                    <button type="button" id="sendPhoneBtn" onclick="sendPhoneChk()">???????????? ??????</button>
	            </div>
	                    <hr>
                </div>
                <div class="inputForm">
                  <div class="check-container">
                    <input type="text" placeholder="???????????? ??????" id="phoneChk"  style="margin-top:15px; margin-left: 40px;" disabled="disabled" required="required">
                    <button type="button" id="phoneChkBtn" onclick="chkPhoneBtn()">??????</button>
                   <hr>
                    </div>
                </div>
            </form>
            <button class='joinbtn' onclick="formCheck()" type="button">????????????</button>



        </div>
    </div>

    <!--????????? ?????? ?????? ???????????? ??????-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        
        function execDaumPostcode() {
        		 
            new daum.Postcode({
                oncomplete: function (data) {

                    var roadAddr = data.roadAddress; // ????????? ?????? ??????
                    var extraRoadAddr = ''; // ?????? ?????? ??????

                    if (data.bname !== '' && /[???|???|???]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data
                            .buildingName);
                    }
                    
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // ??????????????? ?????? ????????? ?????? ????????? ??????
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("roadAddress").value = roadAddr;
                    document.getElementById("jibunAddress").value = data.jibunAddress;

                    // ??????????????? ?????? ??????, ?????? ????????? ?????????.
                    if (roadAddr !== '') {
                        document.getElementById("extraAddress").value = extraRoadAddr;
                    } else {
                        document.getElementById("extraAddress").value = '';
                    }

                    var guideTextBox = document.getElementById("guide");
                    // ???????????? '?????? ??????'??? ????????? ??????, ?????? ???????????? ????????? ?????????.
                    if (data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(?????? ????????? ?????? : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                    } else if (data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(?????? ?????? ?????? : ' + expJibunAddr + ')';
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
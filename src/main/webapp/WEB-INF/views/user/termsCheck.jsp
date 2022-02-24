<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.test {
            display: flex;
            justify-content: center;
        }

        .mainForm {
            width: 30%;
            margin-top: 50px;

        }

        .comment {
            padding-top: 15px;
            padding-bottom: 15px;
            justify-content: space-between;
            width: 100%;

        }

       

        input {
            float: left;
            width: 20px;
            height: 20px;
            margin-right: 10px;
        }

        button {
            background-color: white;
            width: 100px;
            height: 50px;
            border: 1px solid lightgray;

        }

        button:hover {
            background-color: #FFD2D2;
            border-color: white;
        }

        .subCheck {
            border: 1px solid gray;

        }

        textarea {
            border-color: gray;
            resize: none;
        }

        .info {
            width: 100%;
            height: 100%;
        }

        .allCheck>input {
            margin-top: 15px;
        }
        .subInput {
        	margin-top: 7px;
        	margin-left: 5px;
        }
        .btn {
      	  border: 1px solid lightgray;
        }
        .allCheck>input {
        	margin-left: 5px;
        }
    </style>
    <script src="resources/js/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
        	// checkbox 체킹
            $("#agree_all").click(function () {
                $("input[name='agree']").prop("checked", this.checked);
            });
            $(".subInput").click(function () {
                if ($("input[name='agree']:checked").length == 4) {
                    $("#agree_all").prop("checked", true);
                } else {
                    $("#agree_all").prop("checked", false);
                };
            });
        });
    </script>
    <script>
    // 필수항목 체크여부
    function formCheck(){
    	if($("#agree1").prop("checked") && $("#agree2").prop("checked")){
    		location.href='emailCheck.do';
    	} else {
    		alert("필수항목은 반드시 체크해주셔야 해요~");
    		return false;
    	}
    	
    	
    }
    </script>
    
    
    
<body>
   <div class="test">
        <div class="mainForm">
            <div class="title" align="center">
                <h4>매우미 약관 동의</h4>
                <hr>
            </div>
            <div class="comment">
                <div class="allCheck">
                    <input type="checkbox" name="agree_all" id="agree_all" class="checkbox">
                    <label for="agree_all">
                        <h6>Maeumi. 서비스 이용약관, 개인정보 수집 및 이용,<br>
                            유효기간 3년(선택), 프로모션 정보 수신(선택)에 <span style="font-size: larger; color: red;">모두
                                동의</span>합니다</h6>
                    </label>
                </div>

                <!-- -----------subCheck 부분--------------->
                <div class="subCheck">
                        <input type="checkbox" name="agree" value="1" id="agree1" class="subInput">
                    <label for="agree1"><span>(필수) Maeumi. 서비스 이용약관 동의</span></label>
                    <textarea class="info" cols="25" rows="5" readonly="readonly">영오님이 오늘 내 파일들을 뿌사버림ㅋ..</textarea>
                </div>

                <div class="subCheck">
                    <input type="checkbox" name="agree" value="2" id="agree2" class="subInput">
                    <label for="agree2" ><span>(필수) 개인정보 수집 및 이용 동의</span></label>
                    <textarea class="info" cols="25" rows="5" readonly="readonly">무소불위의 권력... 태준...</textarea>
                </div>
                <div class="subCheck">
                    <input type="checkbox" name="agree" value="3" id="agree3" class="subInput">
                    <label for="agree3"><span> (선택) 개인정보 유효기간을 3년으로 선택합니다</span><br>
                        <span style="font-size: small; color:darkgray;">선택하지 않으시면 1년으로 설정됩니다</span>
                    </label>
                </div>
                <div class="subCheck">
                    <input type="checkbox" name="agree" value="4" id="agree4" class="subInput">
                    <label for="agree4">
                        <span> (선택) 프로모션 정보 수신 동의</span><br>
                        <span style="font-size: small; color:darkgray;">예담에서 제공하는 각종 이벤트, 안내 등의 정보를
                            수신합니다</span>
                    </label>
                </div>
            </div>
            <div style="float: right;">
                        <button type="button" class="btn" onclick="formCheck()">가입 계속</button>
			</div>
        </div>
    </div>
</body>
</html>
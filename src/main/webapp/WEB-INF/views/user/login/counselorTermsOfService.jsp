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

        .mainForm {
            width: 40%;
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
            background-color: #153e54;
            width: 100px;
            height: 50px;
            border: 1px solid #153e54;

        }

        button:hover {
            background-color: white;
            border: 1px solid #153e54;
            transition:200ms ease-in-out;
        }

        .subCheck {
            border: 1px solid #8dacbd42;
            margin-bottom:5px;
            border-radius: 10px;
    		padding: 10px

        }

        textarea {
            border-color: #8dacbd42;
            resize: none;
            font-size:12px;
        }

        .info {
            width: 100%;
            height: 100%;
            border-radius: 10px;
    		padding: 10px;
    		border: 0;
        }

        .allCheck>input {
            margin-top: 15px;
        }
        .subInput {
        	margin-top: 7px;
        	margin-left: 5px;
        }
        .btn {
      	  border: 1px solid #153e54;
      	  background-color:#153e54;
      	  color:white;
        }
        .allCheck>input {
        	margin-left: 5px;
        }
        .next-btn{
        	
        	width: 25%;
    		margin-bottom: 50px;
    		margin-top: 30px;
    		margin-right: auto;
    		margin-left: auto;
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
    		location.href='counselorEmailCheck.do';
    	} else {
    		alert("필수항목은 반드시 체크하셔야 합니다.");
    		return false;
    	}
    	
    	
    }
    </script>
    
    
    
<body>
   <div class="test">
        <div class="mainForm">
            <div class="title" align="center">
                <h4>마으미 상담사 가입 약관 동의</h4>
                <hr>
            </div>
            <div class="comment">
                <div class="allCheck">
                    <input type="checkbox" name="agree_all" id="agree_all" class="checkbox">
                    <label for="agree_all">
                        <h6>Maeumi. 서비스 이용약관, 개인정보 수집 및 이용,<br>
                            유효기간 3년(선택), 프로모션 정보 수신(선택)에 <span style="font-size:15px; font-weight:bold; color: red;">모두
                                동의</span>합니다</h6>
                    </label>
                </div>

                <!-- -----------subCheck 부분--------------->
                <div class="subCheck">
                        <input type="checkbox" name="agree" value="1" id="agree1" class="subInput">
                    <label for="agree1"><span>(필수) Maeumi. 서비스 이용약관 동의</span></label>
                    <textarea class="info" cols="25" rows="5" readonly="readonly">제1조(목적) 이 약관은 OO 회사(전자상거래 사업자)가 운영하는 OO 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.

  ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」

제2조(정의)

  ① “몰”이란 OO 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.

  ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.

  ③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.

  ④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.

제3조 (약관 등의 명시와 설명 및 개정) 

  ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.

  ② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.

  ③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.

  ④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 

  ⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.

  ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.</textarea>
                </div>

                <div class="subCheck">
                    <input type="checkbox" name="agree" value="2" id="agree2" class="subInput">
                    <label for="agree2" ><span>(필수) 개인정보 수집 및 이용 동의</span></label>
                    <textarea class="info" cols="25" rows="5" readonly="readonly">개인정보의 처리목적
<개인정보처리자명>은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는
다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 「개인정보 보호법」
제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
1. 회원 가입 및 관리
회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용
방지, 만 14세 미만 아동의 개인정보 처리 시 법정대리인의 동의여부 확인, 각종 고지·통지, 고충처리
목적으로 개인정보를 처리합니다. 
2. 재화 또는 서비스 제공
물품배송, 서비스 제공, 계약서·청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증, 요금
결제·정산, 채권추심의 목적으로 개인정보를 처리합니다.
0. <해당 개인정보처리자의 개인정보 처리업무>
 <개인정보 처리업무에 따른 처리목적>으로 개인정보를 처리합니다. 
 개인정보의 처리 및 보유기간
① <개인정보처리자명>은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를
수집 시에 동의 받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.
② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
1. 홈페이지 회원 가입 및 관리 : 사업자/단체 홈페이지 탈퇴 시까지
다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료 시까지
1) 관계 법령 위반에 따른 수사·조사 등이 진행 중인 경우에는 해당 수사·조사 종료 시까지
2) 홈페이지 이용에 따른 채권·채무관계 잔존 시에는 해당 채권·채무관계 정산 시까지
3) <예외 사유> 시에는 <보유기간> 까지
2. 재화 또는 서비스 제공 : 재화·서비스 공급완료 및 요금결제·정산 완료시까지
다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료 시까지
1) 「전자상거래 등에서의 소비자 보호에 관한 법률」에 따른 표시·광고, 계약내용 및 이행 등 거래에
관한 기록
- 표시·광고에 관한 기록 : 6개월
- 계약 또는 청약철회, 대금결제, 재화 등의 공급기록 : 5년
- 소비자 불만 또는 분쟁처리에 관한 기록 : 3년
2) 「통신비밀보호법」에 따른 통신사실확인자료 보관
- 가입자 전기통신일시, 개시·종료시간, 상대방 가입자번호, 사용도수, 발신기지국 위치추적자료 : 1년
- 컴퓨터통신, 인터넷 로그기록자료, 접속지 추적자료 : 3개월
3) <개인정보 보유기간 근거법령 및 조문> : <보유기간></textarea>
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
                        <span style="font-size: small; color:darkgray;">마으미에서 제공하는 각종 이벤트, 안내 등의 정보를
                            수신합니다</span>
                    </label>
                </div>
            </div>
            <div class="next-btn">
                        <button type="button" class="btn" onclick="formCheck()">가입 계속</button>
			</div>
        </div>
    </div>
</body>
</html>
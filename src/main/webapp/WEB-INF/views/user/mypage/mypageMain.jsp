<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.mainForm{
	margin-left: 50px;
}
.myInfoForm {
	padding: 20px;
	border: 1px solid gray;
	width: 40%;
}
.myInfo {
	margin-top: 15px;
}
.changeBtn {
	width:100px;
	float: right;
}
.myInfoInput {
	border: 0px solid gray;
	width: 250px;
}
#changeCheck {
	display: none;
}
</style>
</head>
<body>

<!-- 개인정보 수정영역  -->
<section>		
<div class="mainForm">
	<h3>개인 정보</h3>
	
	<div class="myInfoForm">
		<div class="myInfo Email">
			이메일&nbsp;&nbsp; <input type="text" id="email" class="myInfoInput" disabled="disabled" value="${member.m_email }">	(${member.m_type })
			
			<br> 	 	
		</div>
		
		<div class="myInfo mynickname">
			닉네임&nbsp;&nbsp;
			<input type="text" class="myInfoInput" id="nickname" name="nickname" value="${member.m_nickname }" readonly="readonly"> 
			<input type="button" class="changeBtn" id="changeBtn" onclick="nicknameChanged()" value="닉네임 변경">
			<input type="button" class="changeBtn" id="changeCheck" value="적용">
			<br>
			<script>
				
			</script>
		</div>
		
		<div class="myInfo myphone">
			연락처&nbsp;&nbsp; <input type="text" class="myInfoInput" value="${member.m_phone }">
			<input type="button" class="changeBtn" id="phoneChkBtn" value="연락처 수정">
			<br>
		</div>
		
		<div class="myInfo mypassword">
			<input type="button" id="changePwdBtn" value="비밀번호 변경" > &nbsp;&nbsp; 
			<input type="button" id="memberLeave" value="회원탈퇴">
		</div>
		<input type="hidden" id="pwdvalue" value="${member.m_type }">
	</div>
</div>
	<!-- 결국 이메일이랑, 가입유형으로 구분해야 한다.  
	카카오로 로그인을 하든, 네이버로 로그인을 하든, 일반회원으로 로그인을 하든 
	기본적으로 세션값을 부여해서 이메일일과 가입유형에 대한 세션값을 준다.
	그리고 컨트롤러를 통해서 그 세션값을 가져와서 쿼리를 날려 해당 유저의 모든 정보를 추출해서
	그 정보를 mypage로 전달한다. 
	-->

</section>



<br><br><br>
</body>
<script>
	 /* 가입유형이 '마으미'인 회원들만 비밀번호 변경 버튼 출력하기 */
	 $(document).ready(function(){
		 if ( $("#pwdvalue").val() != '마으미' ) {
			 $("#changePwdBtn").hide();
			 $("#memberLeave").hide();
		 }
	 });

	 
	/* =========닉네임 변경============ */
	
	// 메소드chain 숙지하기. 동일한 것들 연달아서 적용가능.
	var myNickname = $("#nickname").val();
	function nicknameChanged() {
			$("#nickname").attr("readonly", false)
						  .attr("placeholder", "변경할 닉네임을 입력하세요.")
						  .val('')
						  .focus();
			$("#changeBtn").hide();
			$("#changeCheck").css("display", "block");
	}
	
	// 닉네임 변경 시키기
	$("#changeCheck").on("click",function(){
		var sendNickname = $("#nickname").val();
		
		if( $("#nickname").val() == '' ){
			alert("변경할 닉네임을 입력하세요");
			$("#nickname").focus();
		} else {
			$.ajax({  // 닉네임 변경 호출
				url: "ajaxUpdateNickname.do",
				type: "POST",
				data: {
					sendNickname : sendNickname
				},
				dataType : "text",
				success: function(responseText) {
						if(responseText == 'YES') {
							alert("닉네임이 변경되었습니다.");
							$("#changeBtn").show();
							$("#changeCheck").css("display", "none");
						}
				}
			});		
		}
	});
	
	
	/* =======휴대폰번호 등록하기========== */
	
	/* 연락처 인증 팝업창  호출 */
	$("#phoneChkBtn").on("click", function() {
		 phonePopupOpen();
	});
	
	function  phonePopupOpen() {
		var url= "phoneChkPopup.do";    //팝업창 페이지 URL
		var winWidth = 500;    
	    var winHeight = 400;
	    var popupX = (window.screen.width / 2) - (800 / 2);
	    var popupY= (window.screen.height /2) - (600 / 2);
	    var popupOption= "width="+winWidth+", height="+winHeight+", left="+ popupX + ", top=" + popupY;    //팝업창 옵션(optoin)
		window.open(url,"",popupOption);
	};
	
	
	/* =======비밀번호 변경 팝업창 호출========= */
	$("#changePwdBtn").on("click", function() {
		 popupOpen();
	})
	
	function  popupOpen() {
		var url= "passwordPopup.do";    //팝업창 페이지 URL
		var winWidth = 500;    
	    var winHeight = 400;
	    var popupX = (window.screen.width / 2) - (800 / 2);
	    var popupY= (window.screen.height /2) - (600 / 2);
	    var popupOption= "width="+winWidth+", height="+winHeight+", left="+ popupX + ", top=" + popupY;    //팝업창 옵션(optoin)
		window.open(url,"",popupOption);
	}
	
	// 회원탈퇴 처리 => 상태값 F로 변경, session만료시키고, home.do로 이동시키기
	$("#memberLeave").on("click", function() {
		var memberLeaveCheck = confirm("정말 Maeumi.를 떠나시겠습니까..? \n탈퇴하면 1달 동안은 재가입이 어렵습니다.");
		if(memberLeaveCheck) {
			var sendEmail = $("#email").val(); 
			$.ajax({
				type: "POST",
				url: "ajaxMemberLeave.do",
				data: {
					sendEmail : sendEmail
				},
				success: function(responseText){
					if(responseText == "YES") {
						alert("탈퇴처리 되었습니다.");
						location.href='home.do';
					}
				}
			})
		}
		
	});
	
</script>
</html>
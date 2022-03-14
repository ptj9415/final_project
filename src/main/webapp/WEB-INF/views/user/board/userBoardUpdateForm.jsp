<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.wrap2 {
	border-style: none;
	width: 80%;
	margin-right: auto;
	margin-left: auto;
	margin-top: 80px;
	margin-bottom: 400px;
}

#b_title {
    width: 100%;
    resize: none;
    border: none;
    font-size: 30px;
    margin-bottom: 0px;
    height: 70px;
}
  
#b_content {
  	width: 100%;
  	height : 700px;
    resize: none;
    border: none;
    font-size: 13px;
}

textarea:focus {
    outline: none;
}


.subject:focus {
    outline: none;
}

.user_btn {
	margin-top: 13px;
	float: right;
	font-size: 13px;
	font-weight: bold;
}

button {
	height : 30px;
	width : 80px;
	margin-left: 20px;
	border: 1px solid black;
	background-color: white;
	color: black;
	border: 1px solid black;
	margin-top: 30px;
	font-size: 13px;
}

button:hover {
	background-color: black;
	color: white;
}

.topDiv {
	float:right;
}
</style>
</head>
<body>
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('img/bannerimg/faqBanner2.png'); height: 350px;"
		data-stellar-background-ratio="0.5"></section>
		
	<form id="frm" action="userBoardUpdate.do" method="post">
		<div class="wrap2" align="center">
				<textarea id="b_title" name="b_title">${boardSelect.b_title}</textarea>
					<hr align="left"width: 90%>
					<div class="topDiv">
					<!-- vo에 담긴 거 가지고 오려면 칼럼이랑 name이랑 같아야 함ㅋ -->
					<select style="width: 100px" id="select2" class="subject"
					name="b_subject">
					<option value="" disabled selected>선택</option>
					<option value="연애" <c:if test="${boardSelect.b_subject eq '연애' }">selected</c:if>>연애</option>
					<option value="취업/진로" <c:if test="${boardSelect.b_subject eq '취업/진로' }">selected</c:if>>취업/진로</option>
					<option value="직장" <c:if test="${boardSelect.b_subject eq '직장' }">selected</c:if>>직장</option>
					<option value="성추행" <c:if test="${boardSelect.b_subject eq '성추행' }">selected</c:if>>성추행</option>
					<option value="육아" <c:if test="${boardSelect.b_subject eq '육아' }">selected</c:if>>육아</option>
					<option value="대인관계" <c:if test="${boardSelect.b_subject eq '대인관계' }">selected</c:if>>대인관계</option>
					<option value="외모" <c:if test="${boardSelect.b_subject eq '외모' }">selected</c:if>>외모</option>
					<option value="가족" <c:if test="${boardSelect.b_subject eq '가족' }">selected</c:if>>가족</option>
					<option value="학업/고시" <c:if test="${boardSelect.b_subject eq '학업/고시' }">selected</c:if>>학업/고시</option>
					<option value="금전/사업" <c:if test="${boardSelect.b_subject eq '금전/사업' }">selected</c:if>>금전/사업</option>
					<option value="성생활" <c:if test="${boardSelect.b_subject eq '성생활' }">selected</c:if>>성생활</option>
					<option value="이별/이혼" <c:if test="${boardSelect.b_subject eq '이별/이혼' }">selected</c:if>>이별/이혼</option>
					<option value="중독" <c:if test="${boardSelect.b_subject eq '중독' }">selected</c:if>>중독</option>
					<option value="성소수자" <c:if test="${boardSelect.b_subject eq '성소수자' }">selected</c:if>>성소수자</option>
					<option value="자아/성격" <c:if test="${boardSelect.b_subject eq '자아/성격' }">selected</c:if>>자아/성격</option>
					<option value="해외생활" <c:if test="${boardSelect.b_subject eq '해외생활' }">selected</c:if>>해외생활</option>
					<option value="우울/불안" <c:if test="${boardSelect.b_subject eq '우울/불안' }">selected</c:if>>우울/불안</option>
				</select>&nbsp; &nbsp; &nbsp; &nbsp; <label>
				<c:if test="${boardSelect.b_anony eq 'F' }">
				<input type="checkbox"
					id="anony" name="anony"></c:if>
					<c:if test="${boardSelect.b_anony eq 'T' }">
				<input type="checkbox"
					id="anony" name="anony" checked></c:if> 닉네임 비공개 &nbsp; </label>
					<input type="hidden" id="b_anony" name="b_anony">
			</div>
			<div>
				<textarea
					id="b_content" name="b_content"> ${boardSelect.b_content}</textarea>
			</div>
			<div>
				<input type="hidden" name="b_no" id="b_no"
					value="${boardSelect.b_no}">
			</div>
		<button style="margin-right: 5px;" type="button" id="button"
			onclick="location.href='userBoardList.do'">돌아가기</button>
		<button type="submit" id="submit">등록하기</button>
		</div>
	</form>
	<br>
	<br>
	<br>
	<br>
	<br>

	<script>
		// 글쓴이 익명, 댓글 상담사 체크 여부
		$('#anony').change(function() {
			if ($('#anony').is(':checked')) {
				$('#b_anony').val('T');
			} else {
				$('#b_anony').val('F');
			}
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
.wrap2 {
	border: 1px solid black;
	padding-top: 20px;
	padding-bottom: 30px;
	width: 1400px;
	height: 900px;
}

th, td {
	border: 1px solid #3C3C8C;
	height: 30px;
}

button {
	margin-left: 20px;
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	border: 1px solid skyblue;
	margin-top: 30px;
}

button:hover {
	background-color: skyblue;
	color: white;
	'
}
</style>
</head>
<body>
	<form id="frm" action="userBoardUpdate.do" method="post">
		<div class="wrap2" align="center">
			<div class="titleDiv" style="border-bottom: 1px solid black">
				<textarea style="text-align: left; margin-left: 20px; border: none; width: 820px;" id="b_title" name="b_title">${boardSelect.b_title}</textarea>
				<br>
				<select id="select2" style="width: 100px" class="subject" name="b_subject"><!-- vo에 담긴 거 가지고 오려면 칼럼이랑 name이랑 같아야 함ㅋ -->
							<option value="" disabled selected>선택</option>
							<option>연애</option>
							<option>취업/진로</option>
							<option>직장</option>
							<option>성추행</option>
							<option>육아</option>
							<option>대인관계</option>
							<option>외모</option>
							<option>가족</option>
							<option>학업/고시</option>
							<option>금전/사업</option>
							<option>성생활</option>
							<option>이별/이혼</option>
							<option>중독</option>
							<option>성소수자</option>
							<option>자아/성격</option>
							<option>해외생활</option>
							<option>우울/불안</option>
					</select>&nbsp; &nbsp; &nbsp; &nbsp; 
					<label><input type="checkbox" id="anony" name="anony"> 닉네임 비공개 &nbsp; </label>
					<input type="hidden" id="b_anony" name="b_anony" value="F">
					<label><input type="checkbox" id="onlyco" name="onlyco"> 상담사만 댓글 작성 가능 </label>
					<input type="hidden" id="b_onlyco" name="b_onlyco" value="F">
			</div>
			<div>
				<textarea
					style="border: border: none; height: 400px; width: 820px; margin-top: 20px;"
					id="b_content" name="b_content" > ${boardSelect.b_content}</textarea></div>
				<div>
					<input type="hidden" name="b_no" id="b_no"
						value="${boardSelect.b_no}">
				</div>
			</div>
		<button type="button" id="button"
			style="float: right; margin-right: 120px; margin-top: 20px"
			onclick="location.href='userBoardList.do'">돌아가기</button>
		<button type="submit" id="submit"
			style="float: right; margin-top: 20px">등록하기</button>
	</form>
	<br>
	<br>
	<br>
	<br>
	<br>

<script>

// 글쓴이 익명, 댓글 상담사 체크 여부
$('#anony').change( function() {
	if($('#anony').is(':checked')) {
		$('#b_anony').val('T');
	} else {
		$('#b_anony').val('F');
	}
});

$('#onlyco').change( function() {
	if($('#onlyco').is(':checked')) {
		$('#b_onlyco').val('T');
	} else {
		$('#b_onlyco').val('F');
	}
});
</script>
</body>
</html>
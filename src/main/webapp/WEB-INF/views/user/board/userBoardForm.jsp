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
	margin-bottom: 100px;
}

#b_title {
	width: 100%;
	resize: none;
	border: none;
	font-size: 30px;
	margin-bottom: 0px;
}

#b_content {
	width: 100%;
	height: 700px;
	resize: none;
	border: none;
	font-size: 13px;
}

textarea:focus {
	outline: none;
}

#b_content::placeholder {
	font-size: 15px;
	color: #dededf;
}

#b_title::placeholder {
	font-size: 30px;
	color: #dededf;
}

.subject:focus {
	outline: none;
}

.subject {
	margin-right: 20px;
}

.user_btn {
	margin-top: 13px;
	float: right;
	font-size: 13px;
	font-weight: bold;
}

button {
	height: 30px;
	width: 80px;
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
	float: right;
}
</style>
</head>
<body>
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('img/bannerimg/faqBanner2.png'); height: 350px;"
		data-stellar-background-ratio="0.5"></section>

	<form id="frm" action="userBoardResister.do" method="post">
		<div class="wrap2" align="center">
			<textarea id="b_title" name="b_title" placeholder="제목을 적어주세요.">${boardSelect.b_title}</textarea>
			<hr align="left"width: 90%>
			<div class="topDiv">
				<select style="width: 100px" id="select2" class="subject"
					name="b_subject">
					<!-- vo에 담긴 거 가지고 오려면 칼럼이랑 name이랑 같아야 함ㅋ -->
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
				</select>&nbsp; <label><input type="checkbox" id="anony" name="anony">
					닉네임 비공개 &nbsp; </label> <input type="hidden" id="b_anony" name="b_anony"
					value="F">
			</div>
			<div>
				<textarea id="b_content" name="b_content"
					placeholder="당신의 이야기를 들려주세요!">${boardSelect.b_content}</textarea>
			</div>

			<button type="submit" id="submit" style="margin-right: 5px;">등록하기</button>
			<button type="button" id="button"
				onclick="location.href='userBoardList.do'">돌아가기</button>

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
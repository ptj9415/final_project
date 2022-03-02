<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wrap2 {
	border: 1px solid #9282CD;
	padding-top: 20px;
	padding-bottom: 30px;
	width: 900px;
}

th, td {
	border: 1px solid #3C3C8C;
	height: 30px;
	margin-right: 20px;
}

button {
	width: 70px;
	height: 26px;
}
</style>
</head>
<body>
	<form id="frm" action="userBoardResister.do" method="post">
		<div class="wrap2" align="center">
			<table>
				<thead>
					<tr>
						<th style="border-style: none">제 목</th>

						<td><input type="text" id="b_title" name="b_title" size="98" style="border-style: none"></td>
					</tr>
				</thead>
				<tbody>
					<th style="border-style: none">주제</th>
					<td><select id="select2" style="width: 100px" class="subject" name="b_subject"><!-- vo에 담긴 거 가지고 오려면 칼럼이랑 name이랑 같아야 함ㅋ -->
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
					</select>&nbsp; 
					<label><input type="checkbox" name="" value=""> 닉네임 비공개 &nbsp;  </label>
					<label><input type="checkbox" name="" value=""> 상담사만 댓글 작성 가능 </label>
					</td>
					
					<tr>
						<th style="border-style: none"></th>
						<td><textarea rows="11" cols="100" id="b_content"
								name="b_content" style="border-style: none"></textarea></td>
					</tr>
				</tbody>
			</table>
		</div>
		<button type="submit" id="button"
			style="float: right; margin-top: 20px">글쓰기</button>
		<button type="button" id="button"
			style="float: right; margin-top: 20px"
			onclick="location.href='userBoardList.do'">돌아가기</button>
	</form>
	<br><br>
</body>
</html>
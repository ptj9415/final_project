<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wrap {
	border: 1px solid #9282CD;
	padding-top: 20px;
	padding-bottom: 30px;
	width: 1400px;
}

th, td {
	border: 1px solid #3C3C8C;
	height: 30px;
}

button {
	width: 70px;
	height: 26px;
}
</style>
</head>
<body>
	<h2>FAQ 등록</h2>
	<div
		style="border: 1px solid; width: 1400px; padding-bottom: 10px; padding-top: 10px; margin-bottom: 10px">FAQ
		등록</div>
			<form id="frm" action="adminFaqResister.do" method="post">
	<div class="wrap" align="center">
		<table>
			<thead>
				<tr>
					<th style="width: 150px">제 목</th>
					<td><input type="text"
						id="f_title" name="f_title" size="98"></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th style="width: 150px">내 용</th>
					<td><textarea rows="11"
							cols="100" id="f_subject" name="f_subject"></textarea></td>
				</tr>
			</tbody>
		</table>
	</div>
		<button type="button" id="button" style="float: right; margin-right: 120px; margin-top: 20px" onclick="location.href='adminFaqList.do'">돌아가기</button>
		<button type="submit" id="button" style="float: right;  margin-top: 20px" >등록하기</button>
		</form>
</body>
</html>
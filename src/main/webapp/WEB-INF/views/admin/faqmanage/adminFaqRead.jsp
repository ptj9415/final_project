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
.wrap {
	border: 1px solid #9282CD;
	padding-top: 20px;
	padding-bottom: 30px;
	width: 1400px;
	height: 500px;
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
	<h2>FAQ 상세보기</h2>
	<div
		style="border: 1px solid; width: 1400px; padding-bottom: 10px; padding-top: 10px; margin-bottom: 10px">FAQ
		상세보기</div>
	<div class="wrap" align="center">
		<table>
			<thead>
				<tr>
					<th style="width: 200px">제 목</th>
					<td colspan="3" width="100px"><input type="text"
						style="border: none; width: 540px" id="f_title" name="f_title"
						value="${faqRead.f_title}" readonly></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th style="width: 200px; height: 400px;">내 용</th>
					<td colspan="3"><input type="text"
						style="border: none; height: 400px; width: 820px" id="f_subject"
						name="f_subject" value="${faqRead.f_subject}" readonly></td>
				</tr>
			</tbody>
		</table>
	</div>
	<button type="button" id="button"
		style="float: right; margin-right: 500px; margin-top: 20px"
		onclick="location.href='faqList.do'">돌아가기</button>
	<input type="hidden" name="f_no" id="f_no" value="${faqRead.f_no}">
</body>
</html>
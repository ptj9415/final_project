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
	<h2>자유게시판 상세보기</h2>
	<div
		style="border: 1px solid; width: 1400px; padding-bottom: 10px; padding-top: 10px; margin-bottom: 10px">자유게시판
		게시글 상세보기</div>
	<div class="wrap" align="center">
		<table>
			<thead>
				<tr>
					<th style="width: 200px">제 목</th>
					<td colspan="5" width="100px"><input type="text"
						style="border: none; width: 540px" id="b_title" name="b_title"
						value="${boardRead.b_title}" readonly></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th width="100px">작성자</th>
					<td width="100px">${boardRead.c_name}</td>
					<th width="100px">작성일</th>
					<td width="100px">${boardRead.b_wdate}</td>
					<th width="100px">조회수</th>
					<td width="100px">${boardRead.b_cnt}</td>
				</tr>
				<tr>
				<tr>
					<th style="width: 100px; height: 400px;">내 용</th>
					<td colspan="5"><input type="text"
						style="border: none; height: 400px; width: 820px" id="b_content"
						name="b_content" value="${boardRead.b_content}" readonly></td>
				</tr>
			</tbody>
		</table>
	</div>
	<button type="button" id="button"
		style="float: right; margin-right: 500px; margin-top: 20px"
		onclick="location.href='adminBoardList.do'">돌아가기</button>
	<input type="hidden" name="f_no" id="f_no" value="${boardRead.b_no}">
</body>
</html>
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

#button {
	margin-left: 20px;
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	border: 1px solid skyblue;
	margin-top: 30px;
}

#button:hover {
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
				<h3 style="text-align: left; margin-left: 20px;">${boardRead.b_title}</h3>
				<a style="float: right; margin-right: 20px;">${boardRead.b_wdate}
					| ${boardRead.c_name} | ${boardRead.b_hit}</a> <br>
			</div>
			<div>
				<pre
					style="border: 1px solid black; height: 400px; width: 820px; margin-top: 20px;"
					id="b_content" name="b_content">${boardRead.b_content}</pre>
				<div>
					<input type="hidden" name="b_no" id="b_no"
						value="${boardRead.b_no}">
				</div>
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

</body>
</html>
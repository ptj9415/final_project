<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>자유게시판 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
.btn1 {
	margin-right: -4px;
}

.btn2 {
	margin-left: -3px;
}

.btn1, .btn2, .filterinput, .button {
	margin-left: 20px;
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	border: 1px solid skyblue;
	margin-top: 30px;
}

.btn1:hover, .btn2:hover, .button:hover {
	background-color: skyblue;
	color: white;
	'
}

.all {
	display: inline-block;
	justify-content: center;
}

#insertbtn {
	width: 70px;
	height: 30px;
	margin-left: 980px;
	margin-bottom: 20px;
}
</style>

</head>
<body>
	<div class="all">
		<form name="search" style="margin-top: 90px;">
			<table>
				<tbody>
					<tr>
						<td><input type="text" class="filterinput" name="f_title"
							id="f_title" style="width: 900px" placeholder="게시글 제목을 입력하세요."></td>
						<td>
							<button type="button" name="" id="" onclick="" class="btn2"
								style="float: right">상세 검색</button>
							<button type="button" name="submit" id="submit" class="btn1"
								onclick="clickFnc()">검색</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div class="m-4">
		<div class="insertbtndiv">
			<button type="button" class="button" id="insertbtn" name="insertbtn"
				onclick="location.href='userBoardForm.do'">글쓰기</button>
		</div>
		<div class="row">
			<c:forEach items="${board}" var="board">
				<div class="col-6"
					onclick="location.href='userBoardRead.do?b_no=${board.b_no}';">
					<div class="card border-primary mb-4">
						<div class="card-body text-primary">
							<p class="card-text">${board.b_subject}</p>
							<h5 class="card-title">${board.b_title}</h5>
							<p class="card-text">${board.b_content}</p>
							<c:choose>
								<c:when test="${board.b_anony eq 'F' }">
									<p class="card-text" style="text-align: right;">${board.m_nickname}</p>
								</c:when>
								<c:otherwise>
									<p class="card-text" style="text-align: right;">익명</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
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
</head>
<body>
	<div class="m-4">
		<div class="row">
			<c:forEach items="${board}" var="board">
				<div class="col-6">
					<div class="card border-primary mb-4">
						<div class="card-body text-primary">
							<h5 class="card-title">${board.b_title}</h5>
							<p class="card-text">${board.b_content}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
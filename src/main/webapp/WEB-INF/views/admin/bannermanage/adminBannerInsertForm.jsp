<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h3>배너 등록</h3>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 offset-md-0">
				<div class="card">
					<p id="headerp">배너 등록</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body table-responsive p-00">
					<form id="bannerinsertfrm" action="adminBannerInsert.do" method="post" enctype="multipart/form-data">
						<table class="table table-hover text-nowrap" id="membertable">
							<tr>
								<th>이름</th>
								<td><input type="text" id="bn_name" name="bn_name"></td>
							</tr>
							<tr>
								<th>파일첨부</th>
								<td><input multiple="multiple" type="file" id="filename" name="filename"
					accept="image/*" onchange="setThumbnail(event);">
								</td>
							</tr>
							<tr>
								<th>주제</th>
								<td><input type="text" id="bn_title" name="bn_title"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><input type="text" id="bn_subject" name="bn_subject"></td>
							</tr>
						</table>
						<button type="submit">등록</button>
						<button type="button" id="back" name="back" onclick="location.href='adminBannerList.do'">돌아가기</button>
						</form>
						<br>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
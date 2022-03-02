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
	<h3>${banner.bn_name }관리</h3>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 offset-md-0">
				<div class="card">
					<p id="headerp">상담사 목록</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body table-responsive p-00">
					<form id="bannerupdatefrm" action="adminBannerUpdate.do" method="post">
						<table class="table table-hover text-nowrap" id="membertable">
							<tr>
								<th>이름</th>
								<td><input type="text" id="bn_name" name="bn_name" value="${banner.bn_name }"></td>
							</tr>
							<tr>
								<th>파일첨부</th>
								<td><input type="text" id="bn_filename" name="bn_filename" value="${banner.bn_filename }">
								<input type="text" id="bn_pfilename" name="bn_pfilename" value="${banner.bn_pfilename }">
								</td>
							</tr>
							<tr>
								<th>주제</th>
								<td><input type="text" id="bn_title" name="bn_title" value="${banner.bn_title }"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><input type="text" id="bn_subject" name="bn_subject" value="${banner.bn_subject }"></td>
							</tr>
						</table>
						<input type="hidden" id="bn_no" name="bn_no" value="${banner.bn_no }">
						<button type="submit">수정</button>
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
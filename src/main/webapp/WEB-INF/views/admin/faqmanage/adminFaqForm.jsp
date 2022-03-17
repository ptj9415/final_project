<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h3 {
	font-size: 24px;
	font-weight: 600;
}

.row {
	margin-bottom: -10px;
}

#faqtable>tbody>tr {
	border-bottom: 0.5px solid rgb(222, 226, 230);
}

#faqtable>tbody>tr>th {
	width: 13%;
	background-color: rgb(245, 245, 245);
	text-align: center;
	vertical-align: middle;
}

#headerp {
	position: relative;
	top: 7px;
	margin-left: 15px;
	font-weight: 600;
}

#f_title {
	width: 40%;
	border: 0.5px solid rgb(210, 210, 210);
}

textarea {
	width: 40%;
	height: 6.25em;
	resize: none;
	border: 0.5px solid rgb(210, 210, 210);
}

#submitbtn {
	float: right;
	width: 80px;
	height: 35px;
	border: none;
	border-radius: 5px;
	background-color: #1E90FF;
	color: white;
}

#backbtn {
	float: right;
	width: 80px;
	height: 35px;
	margin-right: 10px;
	border: 1px solid red;
	border-radius: 5px;
	background-color: white;
	color: red;
}
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>FAQ 등록</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">FAQ 등록</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<form id="frm" action="adminFaqResister.do" method="post">
								<table class="table text-nowrap" id="faqtable">
									<tr>
										<th>제목</th>
										<td><input type="text" id="f_title" name="f_title" style="width: 1200px;"></td>
									</tr>
									<tr>
										<th>내용</th>
										<td><textarea rows="11"  id="f_subject" name="f_subject" style="width: 1200px;" ></textarea></td>
									</tr>
								</table>
								<div class="btndiv">
									<button type="submit" id="submitbtn">등록</button>
									<button type="button" id="backbtn"
										onclick="location.href='adminFaqList.do'">돌아가기</button>
								</div>
							</form>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
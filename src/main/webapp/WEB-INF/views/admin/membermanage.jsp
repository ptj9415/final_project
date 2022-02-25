<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
h3 {
	font-size: 19px;
}

.btndiv {
	float: right;
	width: 150px;
	margin-right: -8px;
}

#searchbtn {
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
	color: white;
	border: none;
	border-radius: 4px;
	height: 33px;
	width: 70px;
}

#clearbtn {
	background-color: white;
	color: #EB4646;
	border: 1px solid red;
	border-radius: 4px;
	height: 33px;
	width: 70px;
}

.status {
	display: block;
	width: 100%;
	height: calc(2.25rem + 1px);
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
	box-shadow: inset 0 0 0 transparent;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

#membertable {
	text-align: center;
}

#membertable>thead {
border-top: 1px solid black;
}
</style>
</head>
<body class="hold-transition sidebar-mini">
	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>일반회원 관리</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">검색</p>
					</div>
				</div>
			</div>
			<form action="memberlistsearch.do">
				<div class="row">
					<div class="col-md-12 offset-md-0">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col-6">
										<div class="form-group">
											<label>닉네임</label> <br> <input type="text"
												class="form-control" name="m_nickname"
												placeholder="닉네임을 입력해주세요.">
										</div>
									</div>

									<div class="col-6">
										<div class="form-group">
											<label>이메일</label> <br> <input type="text"
												class="form-control" name="m_email"
												placeholder="이메일을 입력해주세요.">
										</div>
									</div>

									<div class="col-6">
										<div class="form-group">
											<label>연락처</label> <br> <input type="text"
												class="form-control" name="m_phone"
												placeholder="연락처를 입력해주세요.">
										</div>
									</div>
									<div class="col-6">
										<div class="form-group">
											<label>상태</label> <select class="status" name="m_status">
												<option value="all">전체</option>
												<option value="T">가입중</option>
												<option value="F">탈퇴</option>
											</select>
										</div>
									</div>
								</div>
								<div class="btndiv">
									<button type="reset" id="clearbtn">초기화</button>
									<button type="submit" id="searchbtn">
										검색&nbsp;<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
	<br>

	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">회원 목록</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<table class="table table-hover text-nowrap" id="membertable">
								<thead>
									<tr>
										<th>닉네임</th>
										<th>이메일</th>
										<th>연락처</th>
										<th>보유쿠폰</th>
										<th>상태</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>모코코</td>
										<td>mokoko@naver.com</td>
										<td>010-5008-2740</td>
										<td>2개</td>
										<td>가입</td>
										<td><button type="button" id="managebtn">관리</button></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
		
	</script>
</body>
</html>
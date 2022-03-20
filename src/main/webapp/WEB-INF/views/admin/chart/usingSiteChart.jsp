<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>상담사 관리</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">
							검색
							<button type="button" class="minusbtn" id="minusbtn1">
								<i id="minusicon1" class="fa fa-minus"></i>
							</button>
						</p>
					</div>
				</div>
			</div>

			<div class="row" id="maindiv1">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<div class="card-header">
							<div class="row">
								<div class="col-6">
									<div class="form-group">
										<label>이름</label> <br> <input type="text"
											class="form-control" id="c_name" placeholder="이름을 입력해주세요.">
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>성별</label> <select class="	status" id="c_gender">
											<option value="all">전체</option>
											<option value="남성">남성</option>
											<option value="여성">여성</option>
										</select>
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>상담사 등급</label> <select class="	status" id="c_grade">
											<option value="all">전체</option>
											<option value="심리상담사">심리상담사</option>
											<option value="전문상담사">전문상담사</option>
											<option value="정신과의사">정신과의사</option>
										</select>
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>생년월일</label> <br> <input type="date"
											class="form-control" id="c_birthdate">
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>이메일</label> <br> <input type="text"
											class="form-control" id="c_email" placeholder="이메일을 입력해주세요.">
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>연락처</label> <br> <input type="text"
											class="form-control" id="c_phone" placeholder="연락처를 입력해주세요.">
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>주소</label> <br> <input type="text"
											class="form-control" id="c_address" placeholder="주소를 입력해주세요.">
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>상태</label> <select class="	status" id="c_status">
											<option value="all">전체</option>
											<option value="가입">가입</option>
											<option value="탈퇴">탈퇴</option>
										</select>
									</div>
								</div>
							</div>
							<div class="btndiv">
								<button type="reset" id="clearbtn">초기화</button>
								<button type="button" id="btnSearch">
									검색&nbsp;<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>

	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">
							상담사 목록
							<button type="button" class="minusbtn" id="minusbtn2">
								<i id="minusicon2" class="fa fa-minus"></i>
							</button>
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card" id="maindiv2">
						<div class="card-body table-responsive p-00">
							<div id=chart>
								<canvas id="myChart"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
	</section>
	
		<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">
							상담사 목록
							<button type="button" class="minusbtn" id="minusbtn2">
								<i id="minusicon2" class="fa fa-minus"></i>
							</button>
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card" id="maindiv2">
						<div class="card-body table-responsive p-00">

						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
	</section>
</body>
<script>
</script>
</html>
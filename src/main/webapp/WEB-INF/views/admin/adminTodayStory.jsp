<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin Today Story</title>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="subHomeFile/plugins/fontawesome-free/css/all.min.css">
<!-- Select2 -->
<link rel="stylesheet"
	href="subHomeFile/plugins/select2/css/select2.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="subHomeFile/dist/css/adminlte.min.css">



<!-- modal -->


<!-- SweetAlert2 -->
<link rel="stylesheet"
	href="subHomeFile/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
<!-- Toastr -->
<link rel="stylesheet"
	href="subHomeFile/dist/css/adminlte.min.css/plugins/toastr/toastr.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="subHomeFile/dist/css/adminlte.min.css">
<!-- modal end -->
<style>
#subject-height {
	height: 100px;
}

.container-fluid {
	margin-top: 30px;
}

#submit-btn {
	float: right;
}

th#th-no {
	width: 15px;
}

th#th-title {
	/* background-color:gray; */
	width: 300px;
}

th#th-subject {
	width: 400px%;
}

th#th-numChange {
	width: 20px;
}

th#th-management {
	width: 200px;
}

/*paging*/
.pagination {
	margin-left: 750px;
	display: table;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	border: 0.5px #9c836a;
}

.pageNum {
	width: 40px;
	height: 30px;
	text-align: center;
	color: #9c836a;
	cursor: pointer;
	line-height: 30px;
}

span.pageNum.first.clickable {
	padding: 10px;
}

span.pageNum.back.clickable {
	padding: 10px;
}

span.pageNum.clickable.active {
	padding: 10px;
}

span.pageNum.clickable {
	padding: 10px;
}

span.pageNum.next.clickable {
	padding: 10px;
}

span.pageNum.last.clickable {
	padding: 10px;
}

.pageNum:hover {
	background-color: #7c6c5c;
}

/*paging end*/
</style>


</head>

<body class="hold-transition sidebar-mini">
	<!-- 어드민 부트스트랩에 적용 되있어서 빼야됨-->

	<!-- Content Wrapper. Contains page content -->
	<!-- 어드민 부트스트랩 적용한 곳에 들어 있음 이부분은 제거해야됨-->
	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<h1 class="text-left display-5">오늘의 한마디 관리</h1>
			<br>
			<h2 class="text-left display-5">검색</h2>
			<form action="enhanced-results.html">
				<div class="row">
					<div class="col-md-12 offset-md-0">
						<div class="card">
							<!-- 하얀색 바 표시 시작-->
							<div class="card-header">
								<div class="row">




									<div class="col-12">
										<div class="form-group">
											<label>주제</label> <input type="text"
												class="form-control form-control-lg"
												placeholder="Type your keywords here">
										</div>
									</div>


									<div class="col-12">
										<div class="form-group">
											<label>글귀</label> <input type="text"
												class="form-control form-control-lg"
												placeholder="Type your keywords here">
										</div>
									</div>
									<button type="button" class="btn btn-lg btn-default">초기화</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="submit" class="btn btn-lg btn-default">
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


	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>오늘의 한마디 주제</h1>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
		<span type="button" class="btn btn-lg btn-default" id="submit-btn">다중등록(excel)&nbsp;</span>
		<span type="button" class="btn btn-default" id="submit-btn"
			data-toggle="modal" data-target="#modal-lg">등록&nbsp;</span>
		<!--  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-lg">
                  Launch Large Modal
                </button> -->
	</section>

	<!-- modal contents start -->

	<!-- /.modal -->

	<div class="modal fade" id="modal-lg">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Today Story</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- general form elements -->
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">오늘의 한마디 등록</h3>
						</div>
						<!-- /.card-header -->
						<!-- form start -->
						<form>
							<div class="card-body">
								<div class="form-group">
									<label for="exampleInputEmail1">주제</label> <input type="text"
										class="form-control" id="subject-height"
										placeholder="주제를 입력하세요..">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">글귀</label> <input
										type="text" class="form-control" id="subject-height"
										placeholder="글귀를 입력하세요..">
								</div>

								<!--  <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                  </div> -->
							</div>
							<!-- /.card-body -->

							<!--  <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div> -->
						</form>
					</div>
					<!-- /.card -->
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary">등록</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!-- modal contents end -->
	<!-- form end -->
	<br>
	<br>

	<!-- Main content -->
	<section class="content">
		<!-- 메인 컨텐츠-->
		<div class="container-fluid">
			<!-- 메인 밑 메인 컨텐츠-->
			<div class="row">
				<div class="col-12">
					<div class="card">
						<!-- 하얀색 바 표시 시작-->
						<div class="card-header">
							<h3 class="card-title">오늘의 한마디 주제 관리</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th id="th-no">NO</th>
										<th id="th-title">주제</th>
										<th id="th-subject">글귀</th>
										<th id="th-numChange">순서변경</th>
										<th id="th-management" style="text-align: center">관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${adminTodayStoryList }"
										var="adminTodayStoryList">
										<tr>
											<td>${adminTodayStoryList.sc_no }</td>
											<td>${adminTodayStoryList.sc_title }</td>
											<td>${adminTodayStoryList.sc_subject }</td>
											<td><span class="tag tag-success">-</span></td>
											<td><span type="button" class="btn btn-default"
												id="submit-btn">수정&nbsp;</span> <span type="button"
												class="btn btn-default" id="submit-btn">삭제&nbsp;</span></td>
										</tr>

									</c:forEach>


								</tbody>
							</table>
							<!-- paging -->
							<div class="btnContent">
								<div class="pagination" id="pagination">페이지 영역</div>
							</div>
							<!-- paging end -->
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->

	</section>


	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Control sidebar content goes here -->
	</aside>
	<!-- /.control-sidebar -->

	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="subHomeFile/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="subHomeFile/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Select2 -->
	<script src="subHomeFile/plugins/select2/js/select2.full.min.js"></script>
	<!-- AdminLTE App -->
	<script src="subHomeFile/dist/js/adminlte.min.js"></script>
	 <script src ="https://code.jquery.com/jquery-1.11.2.js"></script>

	<script>
		//paging 처리

		
		
		
		$(function() {
			$('.select2').select2()
		});
	</script>
</body>
</html>
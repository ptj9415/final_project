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

/* font 예시 */
@font-face {
	font-family: 'InfinitySans-RegularA1';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'InfinitySans-RegularA1';
}

.card-title {
	padding-top: 20px;
	font-weight: bold;
}

.card {
	width: 90%;
	margin-right: auto;
	margin-left: auto;
}

table {
	font-size: 14px;
}

#subject-height {
	height: 100px;
}

.container-fluid {
	margin-top: 30px;
}

#submit-btn {
	float: right;
	font-size:3px;
	margin-right: 3px;
    
}

#updatesubmit-btn{
	float: right;
	font-size:3px;
	margin-right: 3px;
	background-color:#81a3c5;
}

#deletesubmit-btn{
	float: right;
	font-size:3px;
	margin-right: 3px;
	background-color:#eea7a0;
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

.row mb-2 {
	float: right;
}
.col-sm-6{
	max-width: 100%;
    margin-top: 50px;
}
/*삭제버튼*/

/*삭제버튼 end*/
/*paging*/

/*paging end*/
</style>


</head>

<body class="hold-transition sidebar-mini">
	<!-- 어드민 부트스트랩에 적용 되있어서 빼야됨-->

	<!-- Content Wrapper. Contains page content -->
	<!-- 어드민 부트스트랩 적용한 곳에 들어 있음 이부분은 제거해야됨-->
	<!-- Main content -->
	<!-- <section class="content">
		<div class="container-fluid">
			<h1 class="text-left display-5">오늘의 한마디 관리</h1>
			<br>
			<h2 class="text-left display-5">검색</h2>
			<form>
				<div class="row">
					<div class="col-md-12 offset-md-0">
						<div class="card">
							하얀색 바 표시 시작
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
 -->

	<!-- Content Header (Page header) -->
	<!-- <section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2"></div>
		</div>
		/.container-fluid
				<span type="button" class="btn btn-lg btn-default" id="submit-btn">다중등록(excel)&nbsp;</span>



		 <button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-lg">
                  Launch Large Modal
                </button>
	</section> -->

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
						<form id="frm" method="post">
							<div class="card-body">
								<div class="form-group">
									<label for="exampleInputEmail1">주제</label> <input type="text"
										style="height: 100px" class="form-control" id="sc_title"
										name="sc_title" placeholder="주제를 입력하세요..">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">글귀</label> <input
										type="text" style="height: 100px" class="form-control"
										id="sc_title" name="sc_subject" placeholder="글귀를 입력하세요..">
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
					<button type="button" class="btn btn-primary" id="submit"
						name="submit">등록</button>
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
						<div class="col-sm-6">
							 	<h3 class="card-title">오늘의 한마디 주제 관리</h3>
							<span type="button" class="btn btn-default" id="submit-btn"
								 data-toggle="modal" data-target="#modal-lg">등록&nbsp;</span>
							<span type="button" class="btn btn-default" id="submit-btn"
								data-toggle="modal" data-target="#doublemodal-lg">다중등록(excel)&nbsp;</span>
						</div>
						<!-- 하얀색 바 표시 시작-->
						<div class="card-header">
						

						</div>
						<!-- /.card-header -->
						<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap"
								style="font-size: 12px">
								<thead>
									<tr style="background-color: #b0c4de3b">
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
											<td>
												<!-- <span type="button" class="btn btn-default"
												id="submit-btn">수정&nbsp;</span>  --> <!-- <span type="button"
												class="btn btn-default" id="submit-btn" data-toggle="modal"
												data-target="#updatemodal-lg">수정&nbsp;</span>  --> <span
												type="button" style="font-size: 12px"
												class="btn btn-default" id="updatesubmit-btn" data-toggle="modal"
												onclick="updateFnc(${adminTodayStoryList.sc_no})">수정&nbsp;</span>
												<span type="button" style="font-size: 12px"
												class="btn btn-default" id="deletesubmit-btn"
												onclick="deleteFnc('${adminTodayStoryList.sc_no}')">삭제</span>
											</td>
										</tr>

									</c:forEach>


								</tbody>
							</table>


							<!-- 수정 modal start -->
							<div class="modal fade" id="updatemodal-lg" style="display: none">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">Today Story</h4>
											<button type="button" class="close" data-dismiss="modal"
												id="area-hidden" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<!-- general form elements -->
											<div class="card card-primary">
												<div class="card-header">
													<h3 class="card-title">목록 조회 하기</h3>
												</div>
												<!-- /.card-header -->
												<!-- form start -->
												<form id="updateFrm" method="post">
													<div class="card-body">
														<div class="form-group">
															<label for="exampleInputEmail1">주제</label>
															<textarea type="text" style="height: 100px"
																class="form-control" id="sc_title" name="sc_title"> ${adminTodayStorySelect.sc_title }
														</textarea>
														</div>
														<div class="form-group">
															<label for="exampleInputPassword1">글귀</label>
															<textarea type="text" style="height: 100px"
																class="form-control" id="sc_subject" name="sc_subject">${adminTodayStorySelect.sc_subject }
															</textarea>

															<input type="hidden" style="height: 100px"
																class="form-control" id="sc_no" name="sc_no">
														</div>

													</div>

												</form>
											</div>
											<!-- /.card -->
										</div>
										<div class="modal-footer justify-content-between">
											<button type="button" class="btn btn-default" id="close-btn"
												data-dismiss="modal">닫기</button>
											<button type="button" class="btn btn-primary"
												id="updateSubmit" name="updateSubmit">등록</button>
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							<!-- /.modal -->
							<!-- modal contents end -->
							<!-- form end -->
							<!-- 수정 modal end -->


							<!-- paging -->
							 <nav aria-label="...">
				  				<ul class="pagination">
				    				<li class="page-item">
				      				<a class="page-link" href="adminTodayStoryList.do?nowPage=${page.prev }" tabindex="-1">Previous</a>
				    			</li>
				    	 <c:forEach begin="1" end="${page.lastPage}" varStatus="status">
								<c:if test="${status.count ne page.nowPage}">
				    			<li class="page-item"><a class="page-link" href="adminTodayStoryList.do?nowPage=${status.count}">${status.count}</a></li>
				   			</c:if>
				   			<c:if test="${status.count eq page.nowPage}">
								<li class="page-item active"><a class="page-link" href="adminTodayStoryList.do?nowPage=${status.count}">${status.count}<span class="sr-only">(current)</span></a></li>
				   			</c:if>
				   		 </c:forEach>
				    			<li class="page-item">
				     				<a class="page-link" href="adminTodayStoryList.do?nowPage=${page.next}">Next</a>
				    			</li>
				  			 </ul>
							</nav>
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
	<script src="https://code.jquery.com/jquery-1.11.2.js"></script>

	<script>
		//paging 처리

		//modal
		$(function() {
			$('.select2').select2()
		});

		//글 등록 제출
		$(function() {
			$("#submit").click(function() {
				frm.action = "adminTodayStoryRegister.do";
				frm.submit();

			});

		});

		//삭제
		function deleteFnc(sc_no) {
			if (confirm("정말 삭제하시겠습니까?") == true) {

				$.ajax({
					url : 'adminTodayStoryDelete.do',

					data : {
						sc_no : sc_no
					},
					dataType : "text",
					success : function(responseText) {
						console.log(responseText);
						alert("삭제가 완료되었습니다.");
						location.href = "adminTodayStoryList.do";
					},
					error : function() {
						alert("error! 관리자에게 문의하세요");
					}

				});

			} else {
				return;
			}

		}
		
		//수정 
		$(function(){
			$("#updateSubmit").click(function(){
				
				updateFrm.action="adminTodayStoryUpdate.do";
				updateFrm.submit();
				alert("수정이 완료되었습니다.");
			});
		});
		
	
		//수정테스트
		function updateFnc(sc_no) {
			console.log('수정버튼');
			
			let textarea3 = document.querySelectorAll('#sc_no')[0];
			textarea3.value = sc_no;
			
			
			let textarea = document.querySelectorAll('#sc_title')[2];
			let title = event.target.closest('tr').childNodes[3].innerHTML;
			textarea.value = title;
			
			let textarea2 = document.querySelectorAll('#sc_subject')[0];
			
			let subject = event.target.closest('tr').childNodes[5].innerHTML;
			textarea2.value = subject;
			
			
			
			console.log(title);
			console.log(subject);
			
			
			console.log(sc_no);
			
			
			$.ajax({
				url : 'adminTodayStoryUpdateForm.do',

				data : {
					sc_no : sc_no
				},
				dataType : "text",
				success : function(responseText) {
					console.log(responseText);
				/* 	$('#updatemodal-lg').attr('data-target','#updatemodal-lg'); */
					 $("#updatemodal-lg").attr("class", "modal fade show");
					$("#updatemodal-lg").attr("style", "display:block");
					
					/* alert('test중');  */
					//모달을 띄워줘
		
					
				},
				error : function() {
					alert("error! 관리자에게 문의하세요");
					location.href = "adminTodayStory.do";
				}

			});
			
		}
					
					
					document.getElementById('area-hidden').onclick = function(){
						
						 $("#updatemodal-lg").fadeOut();
					} 
					
					document.getElementById('close-btn').onclick = function(){
						
						 $("#updatemodal-lg").fadeOut();
					} 
						
	</script>
</body>
</html>
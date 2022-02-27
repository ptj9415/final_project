<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Toastr -->
    <link rel="stylesheet" href="subHomeFile/plugins/toastr/toastr.min.css">

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

/*삭제버튼*/

/*삭제버튼 end*/
/*paging*/

/*paging end*/
</style>    
</head>
<body class="hold-transition sidebar-mini">
	<!-- Main content -->
    <section class="content">
        <div class="container-fluid">
          <h1 class="text-left display-5"> 그룹 상담 관리 - 신청자 확인</h1><br>
            <h2 class="text-left display-5">검색</h2>
            <form action="enhanced-results.html">
                <div class="row">
                    <div class="col-md-12 offset-md-0">
                      <div class="card"> <!-- 하얀색 바 표시 시작-->
                        <div class="card-header">  
                          <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>닉네임</label><br>
                                    <input type="text" class="form-control form-control-lg" placeholder="Type your keywords here">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label>이메일</label><br>
                                    <input type="text" class="form-control form-control-lg" placeholder="Type your keywords here">
                                </div>
                            </div>
                            <div class="col-6">        
                                <div class="form-group">
                                    <label>신청일</label><br>
                                    <input type="date" placeholder="Type your keywords here">
                                </div>
                            </div>
                            <div class="col-6">        
                                <div class="form-group">
                                    <label>상태</label>
                                    <select class="select2"  multiple="multiple" data-placeholder="전체" style="width: 100%;">
                                        <option>이 것은</option>
                                        <option>뭘까요?</option>
                                        <option>???</option>
                                    </select>
                                </div>
                             </div>
                                <button type="button" class="btn btn-lg btn-default">초기화</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="submit" class="btn btn-lg btn-default">검색&nbsp;<i class="fa fa-search"></i></button>
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
              <h1>신청자목록</h1>
            </div>
          </div>
        </div><!-- /.container-fluid -->
     </section>

    
      <!-- Main content -->
      <section class="content"> <!-- 메인 컨텐츠-->
        <div class="container-fluid"> <!-- 메인 밑 메인 컨텐츠-->
          <div class="row">
            <div class="col-12">
              <div class="card"> <!-- 하얀색 바 표시 시작-->
                <div class="card-header">
                  <h3 class="card-title">Responsive Hover Table</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">
                  <table class="table table-hover text-nowrap">
                    <thead>
                      <tr>
                        <th>닉네임</th>
                        <th>이메일</th>
                        <th>신청일</th>
                        <th>상태</th>
                        <th>신청내용</th>
                        <th>관리</th>
                      </tr>
                    </thead>
                    <tbody>
                     <c:forEach items="${group}" var="groups">
                      <tr>
                        <td>${groups.m_nickname}</td>
                        <td>${groups.m_email}</td>
                        <td>${groups.gr_reservedate}</td>
                        <c:if test="${groups.gr_status eq '0'}">
                        <td>신청완료</td>
                        </c:if>
                        <c:if test="${groups.gr_status eq '1'}">
                        <td>취소</td>
                        </c:if>
						<td><span type="button" style="font-size: 12px" class="btn btn-default" id="submit-btn" data-toggle="modal"
							onclick="selectSubject(${groups.gr_no})">조회</span></td>
                        <td><span type="button" style="font-size: 12px" class="btn btn-default" id="submit-btn"
							onclick="deleteFnc('${groups.gr_no}','${groups.c_email }')">취소</span></td>
                      </tr>
                     </c:forEach>
                    </tbody>
                  </table>
                  
                  	<!-- 조회 modal start -->
							<div class="modal fade" id="updatemodal-lg" style="display: none">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">신청 내용 조회</h4>
											<button type="button" class="close" data-dismiss="modal"  id="area-hidden"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<!-- general form elements -->
											<div class="card card-primary">
												<div class="card-header">
													<h3 class="card-title">신청 내용 조회</h3>
												</div>
												<!-- /.card-header -->
												<!-- form start -->
													<div class="card-body">
														<br>
							                          <textarea type="text" style="height: 100px"
															class="form-control" id="editProjectName" name="editProjectName">
													  </textarea>
													</div>
											</div>
											<!-- /.card -->
										</div>
										<div class="modal-footer justify-content-between">
											<button type="button" class="btn btn-default" id="close-btn"
												data-dismiss="modal">닫기</button>
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
					
					<!-- 삭제 modal start -->
							<div class="modal fade" id="deletemodal-lg" style="display: none">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">상담 취소 하기</h4>
											<button type="button" class="close" data-dismiss="modal"  id="area-hidden1"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<!-- general form elements -->
											<div class="card card-primary">
												<div class="card-header">
													<h3 class="card-title">상담 취소 사유</h3>
												</div>
												<!-- /.card-header -->
												<!-- form start -->
												<form id="updateFrm" method="post">
													<div class="card-body">
														<div class="form-group">
															<label for="exampleInputEmail1">상담 취소</label>
															<textarea type="text" style="height: 100px"
																class="form-control" id="gr_refund" name="gr_refund">
															</textarea>
															<input type="hidden" id="gr_no" name="gr_no">
															<input type="hidden" id="c_email" name="c_email" value="${email}">
														</div>
													  </div>
													</form>
												</div>
											</div>
											<!-- /.card -->
											<div class="modal-footer justify-content-between">
													<button type="button" class="btn btn-default" id="close-btn1"
														data-dismiss="modal">닫기</button>
													<button type="button" class="btn btn-primary"
													id="updateSubmit" name="updateSubmit">삭제</button>
											</div>
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
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
          </div>
          <!-- /.row -->
        <!-- /.container-fluid -->
      </section>
      <!-- jQuery -->
	  <script src="subHomeFile/plugins/jquery/jquery.min.js"></script>
	  <!-- Bootstrap 4 -->
	  <script src="subHomeFile/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>
    $(function () {
      $('.select2').select2()
    });
    
    function selectSubject(gr_no){
		$.ajax({
			url : 'selectFunc.do',
			data : { gr_no : gr_no },
			dataType : "json",
			success : function (data){
				$("#updatemodal-lg").attr("class", "modal fade show");
				$("#updatemodal-lg").attr("style", "display:block");
				$("#editProjectName").val(data.gr_subject);
			}
			
		});
		document.getElementById('area-hidden').onclick = function(){
			
			 $("#updatemodal-lg").fadeOut();
		} 
		
		document.getElementById('close-btn').onclick = function(){
			
			 $("#updatemodal-lg").fadeOut();
		} 
		
    }
    $(function(){
    	$("#updateSubmit").click(function(){
    		updateFrm.action="upDateService.do";
    		updateFrm.submit();
    		alert("수정이 완료되었습니다.");
    		
    	});
    });
    
    function deleteFnc(gr_no, c_email){
    	if (confirm("정말 취소하시겠습니까?") == true) {
    		$.ajax({
    			url : 'deleteFunc.do',
    			data : { gr_no : gr_no},
    			dataType : "text",
    			success : function (data){
    				$("#deletemodal-lg").attr("class", "modal fade show");
    				$("#deletemodal-lg").attr("style", "display:block");
					$("#gr_no").val(gr_no);    				
    			}
    			
    		});
    	}
    }
	document.getElementById('area-hidden1').onclick = function(){
		
		 $("#deletemodal-lg").fadeOut();
	} 
	
	document.getElementById('close-btn1').onclick = function(){
		
		 $("#deletemodal-lg").fadeOut();
	} 
    
</script>
</body>
</html>
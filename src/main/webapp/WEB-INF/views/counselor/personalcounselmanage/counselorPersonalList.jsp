<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 상담 관리</title>
<style>

.form-text!important{
	display: block;
    width: 100%;
    height: calc(2.25rem + 2px);
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
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

.counsel-date!important{
	display: block;
    width: 100%;
    height: calc(2.25rem + 2px);
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
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
} 


.btndiv {
	float: right;
	width: 150px;
	margin-right: -8px;
}

.search-btn {
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

.reset-btn {
	background-color: white;
	color: #EB4646;
	border: 1px solid red;
	border-radius: 4px;
	height: 33px;
	width: 70px;
}

</style>
</head>

<body class="hold-transition sidebar-mini">
	<!-- Main content -->
        <section class="content">
        <div class="container-fluid">
          <br>
          <h1 class="text-left display-5">&nbsp;개인 상담 관리</h1><br>
            <h2 class="text-left display-5">&nbsp;&nbsp;&nbsp;검색</h2><br>
            <form id="frm2" name="frm2" action="groupsearchmanage.do">
                <div class="row">
                <!-- 검색 기능 시작. -->
                    <div class="col-md-12 offset-md-0">
                      <div class="card"> <!-- 하얀색 바 표시 시작-->
                        <div class="card-header">  
                          <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>닉네임 </label><br>
                                    <input type="text" name="nickname" class="form-control" value="">
                                   
                                </div>
                            </div>

                          
                             <div class="col-6">        
                                <div class="form-group">
                                    <label>상담방식</label>
                                    <select name="gc_type" data-placeholder="전체"  class="form-control">
                                        <option value="null">전체</option>
                                        <option value="카톡">카카오톡</option>
                                        <option value="줌">줌</option>
                                        <option value="전화">전화</option>
                                    </select>
                                </div>
                            </div>
                            
                              <div class="col-6">        
                                <div class="form-group">
                                    <label>상담일자 </label><br>
                                    <input type="date" name="gc_date" style="width:200px" class="form-control" placeholder="Type your keywords here">
                             		-
                             		<input type="date" name="gc_date" style="width:200px" class="form-control" placeholder="Type your keywords here">
                             		
                                </div>
                            </div>
                            
                            <div class="col-6">        
                                <div class="form-group">
                                    <label>상태 </label>
                                    <select name="gc_status" data-placeholder="전체" class="form-control" style="height: 40px; width: 100%;">
                                        <option value="null">전체</option>
                                        <option value="0">신청 완료</option>
                                        <option value="1">상담 완료</option>
                                        <option value="2">환불 완료</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label>이메일 </label>
                                    <input type="text" name="gc_title" class="form-control" placeholder="Type your keywords here">
                                </div>
                            </div>
                           </div>
                          
                                <button type="reset" class="reset-btn">초기화</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="submit" class="search-btn">검색&nbsp;<i class="fa fa-search"></i></button>
                         </div>
                        </div>
                    </div>
                </div>
            </form>
          </div>
    </section>
    <br>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>개인 상담 내역</h1>
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
                <h3 class="card-title"></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      <th>모집일</th>
                      <th>상담일</th>
                      <th>상담명</th>
                      <th>상담방식</th>
                      <th>신청/모집인원</th>
                      <th>신청자 관리</th>
                      <th>상태</th>
                      <th>관리</th>
                    </tr>
                  </thead>
                  <tbody>
                   <c:forEach items="${groupCounsel}" var="group">
                    <tr>
                      <td>${group.gc_startdate}~${group.gc_finaldate}</td>
                      <td>${group.gc_date}</td>
                      <td>${group.gc_title}</td>
                      <td>${group.gc_type }</td>
                      <td>${group.gc_person}/${group.gc_max_person }</td>
                      <td><button id="sel1" name="sel1" onclick="location.href='counselorGroupApply.do?c_email=${group.c_email}'" style="font-size: 12px" class="btn btn-default">조회</button></td>
                      <c:if test="${group.gc_status eq 0 }">
                      <td>진행 중</td>
                      </c:if>
                      <c:if test="${group.gc_status eq 1 }">
                      <td>상담 완료</td>
                      </c:if>
                      <td>
                      <form id="frm" method="post" action="counselorGroupDetail.do">
                      <input type="hidden" name="gc_no" id="gc_no" value="${group.gc_no}">
                      <button type="submit" id="sel2" name="sel2" style="font-size: 12px" class="btn btn-default">조회</button>
                      </form>                      
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
                <br>
                <!-- 페이지 네이션 -->
                <c:if test="${gc_title == null}">
		       <nav aria-label="...">
				  <ul class="pagination">
				    <li class="page-item">
				      <a class="page-link" href="counselorGroupList.do?nowPage=${page.prev }" tabindex="-1">Previous</a>
				    </li>
				    <c:forEach begin="1" end="${page.lastPage}" varStatus="status">
						<c:if test="${status.count ne page.nowPage}">
				    		<li class="page-item"><a class="page-link" href="counselorGroupList.do?nowPage=${status.count}">${status.count}</a></li>
				   		</c:if>
				   		<c:if test="${status.count eq page.nowPage}">
							<li class="page-item active"><a class="page-link" href="counselorGroupList.do?nowPage=${status.count}">${status.count}<span class="sr-only">(current)</span></a></li>
				   		</c:if>
				    </c:forEach>
				    <li class="page-item">
				      <a class="page-link" href="counselorGroupList.do?nowPage=${page.next}">Next</a>
				    </li>
				  </ul>
				</nav>
				</c:if>
				
				<!-- 페이지 네이션 끝 -->
				<!-- 검색 및 페이징 끝. -->		
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
      <!-- jQuery -->
<script src="subHomeFile/plugins/jquery/jquery.min.js"></script>
      <script>
    $(function () {
      $('.select2').select2()
    });
</script>
</body>
</html>
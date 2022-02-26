<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="hold-transition sidebar-mini">
	<!-- Main content -->
        <section class="content">
        <div class="container-fluid">
          <br>
          <h1 class="text-left display-5">&nbsp;그룹 상담 관리</h1><br>
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
                                    <label>모집일 : </label><br>
                                    <input type="date" name="gc_startdate" style="width: 350px; height:40px;" placeholder="Type your keywords here">
                                    ~
                                    <input type="date" name="gc_finaldate" style="width: 350px; height:40px;" placeholder="Type your keywords here">
                                </div>
                            </div>

                            <div class="col-6">        
                                <div class="form-group">
                                    <label>상담일 : </label><br>
                                    <input type="date" name="gc_date" style="width: 400px; height:40px;"  placeholder="Type your keywords here">
                                </div>
                            </div>

                             <div class="col-6">        
                                <div class="form-group">
                                    <label>상담방식 : </label>
                                    <select name="gc_type" data-placeholder="전체" style="height: 40px; width: 100%;">
                                        <option value="null">전체</option>
                                        <option value="카톡">카카오톡</option>
                                        <option value="줌">줌</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-6">        
                                <div class="form-group">
                                    <label>상태 : </label>
                                    <select name="gc_status" data-placeholder="전체" style="height: 40px; width: 100%;">
                                        <option value="null">전체</option>
                                        <option value="0">모집 중</option>
                                        <option value="1">상담 완료</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label>상담명 : </label>
                                    <input type="text" name="gc_title" class="form-control" placeholder="Type your keywords here">
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
    <br>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>내 그룹 상담 목록</h1>
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
                      <td><button id="sel1" name="sel1" onclick="location.href='selapplication.do?c_email=${group.c_email}'" style="font-size: 12px" class="btn btn-default">조회</button></td>
                      <c:if test="${group.gc_status eq 0 }">
                      <td>진행 중</td>
                      </c:if>
                      <c:if test="${group.gc_status eq 1 }">
                      <td>상담 완료</td>
                      </c:if>
                      <td>
                      <form id="frm" method="post" action="seldetail.do">
                      <input type="hidden" name="c_email" id="c_email" value="${group.c_email}">
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
				      <a class="page-link" href="groupcounselmanage.do?nowPage=${page.prev }" tabindex="-1">Previous</a>
				    </li>
				    <c:forEach begin="1" end="${page.lastPage}" varStatus="status">
						<c:if test="${status.count ne page.nowPage}">
				    		<li class="page-item"><a class="page-link" href="groupcounselmanage.do?nowPage=${status.count}">${status.count}</a></li>
				   		</c:if>
				   		<c:if test="${status.count eq page.nowPage}">
							<li class="page-item active"><a class="page-link" href="groupcounselmanage.do?nowPage=${status.count}">${status.count}<span class="sr-only">(current)</span></a></li>
				   		</c:if>
				    </c:forEach>
				    <li class="page-item">
				      <a class="page-link" href="groupcounselmanage.do?nowPage=${page.next}">Next</a>
				    </li>
				  </ul>
				</nav>
				</c:if>
				<%-- <c:if test="${gc_date != null or gc_startdate != null or gc_finaldate != null or gc_title != null}">
		        <nav aria-label="...">
				  <ul class="pagination">
				    <li class="page-item">
				      <a class="page-link" href="groupsearchmanage.do?nowPage=${page.prev }" tabindex="-1">Previous</a>
				    </li>
				    <c:forEach begin="1" end="${page.lastPage}" varStatus="status">
						<c:if test="${status.count ne page.nowPage}">
				    		<li class="page-item"><a class="page-link" href="groupsearchmanage.do?nowPage=${status.count}">${status.count}</a></li>
				   		</c:if>
				   		<c:if test="${status.count eq page.nowPage}">
							<li class="page-item active"><a class="page-link" href="groupsearchmanage.do?nowPage=${status.count}">${status.count}<span class="sr-only">(current)</span></a></li>
				   		</c:if>
				    </c:forEach>
				    <li class="page-item">
				      <a class="page-link" href="groupsearchmanage.do?nowPage=${page.next}">Next</a>
				    </li>
				  </ul>
				</nav>
				</c:if> --%>
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
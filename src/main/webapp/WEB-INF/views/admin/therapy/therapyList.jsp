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
          <h1 class="text-left display-5">&nbsp;칼럼 관리</h1><br>
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
                                    <label>작성자 : </label><br>
                                    <input type="text" name="gc_" class="form-control" placeholder="Type your keywords here">
                                </div>
                            </div>

                            <div class="col-6">        
                                <div class="form-group">
                                     <label>주제 : </label>
                                    <select name="gc_type" data-placeholder="전체" style="height: 40px; width: 100%;">
                                        <option value="null">전체</option>
                                        <option value="카톡">카카오톡</option>
                                        <option value="줌">줌</option>
                                    </select>
                                </div>
                            </div>

                             <div class="col-6">        
                                <div class="form-group">
                                    <label>제목 : </label>
                                    <input type="text" name="t_title" class="form-control" placeholder="Type your keywords here">
                                </div>
                            </div>
                            <div class="col-6">        
                                <div class="form-group">
                                    <label>작성일 : </label>
                                   <input type="text" name="t_writedate" class="form-control" placeholder="Type your keywords here">
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
            <h1>게시판 목록</h1>
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
                <h3 class="card-title">심리 테라피 목록</h3>
                <button type="button" class="btn btn-lg btn-default" onclick="location.href='therapyInsert.do'">등록</button>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                     <th>작성자</th>
                      <th>제목</th>
                      <th>작성일</th>
                      <th>관리</th>
                    </tr>
                  </thead>
                  <tbody>
                   <c:forEach items="${therapy}" var="therapys">
                    <tr>
                      <td>${therapys.t_name}</td>
                      <td>${therapys.t_title}</td>
                      <td>${therapys.t_writedate}</td>
                      <td><button id="sel1" name="sel1" onclick="location.href='therapyUpdate.do?t_no=${therapys.t_no}'" style="font-size: 12px" class="btn btn-default">수정</button></td>
                      <td>
                      <form id="frm" method="post" action="therapyDelete.do">
                      <input type="hidden" name="t_no" id="t_no" value="${therapys.t_no}">
                      <button type="submit" id="sel2" name="sel2" style="font-size: 12px; float:left" class="btn btn-default">삭제</button>
                      </form>                      
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
                <br>

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
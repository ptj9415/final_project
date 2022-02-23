<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <h1 class="text-left display-5"> 그룹 상담 관리</h1><br>
            <h2 class="text-left display-5">검색</h2>
            <form action="enhanced-results.html">
                <div class="row">
                    <div class="col-md-12 offset-md-0">
                      <div class="card"> <!-- 하얀색 바 표시 시작-->
                        <div class="card-header">  
                          <div class="row">
                              <!-- 옵션-->
                             <!-- <div class="col-6">        
                                <div class="form-group">
                                    <label>Result Type:</label>
                                    <select class="select2" multiple="multiple" data-placeholder="Any" style="width: 100%;">
                                        <option>Text only</option>
                                        <option>Images</option>
                                        <option>Video</option>
                                    </select>
                                </div>
                            </div> -->
                             <!-- 옵션-->
                            <!-- <div class="col-3">
                                <div class="form-group">
                                    <label>Sort Order:</label>
                                    <select class="select2" style="width: 100%;">
                                        <option selected>ASC</option>
                                        <option>DESC</option>
                                    </select>
                                </div>
                            </div> -->
                              <!-- 옵션-->
                            <!-- <div class="col-3">
                                <div class="form-group">
                                    <label>Order By:</label>
                                    <select class="select2" style="width: 100%;">
                                        <option selected>Title</option>
                                        <option>Date</option>
                                    </select>
                                </div>
                            </div> -->
                            <div class="col-6">
                                <div class="form-group">
                                    <label>모집일</label><br>
                                    <input type="date" class="form form-control-lg" placeholder="Type your keywords here">
                                    ~
                                    <input type="date" class="form form-control-lg" placeholder="Type your keywords here">
                                </div>
                            </div>

                            <div class="col-6">        
                                <div class="form-group">
                                    <label>상담일</label><br>
                                    <input type="date" class="form form-control-lg" placeholder="Type your keywords here">
                                </div>
                            </div>

                             <div class="col-6">        
                                <div class="form-group">
                                    <label>상담방식</label>
                                    <select class="select2" multiple="multiple" data-placeholder="전체" style="width: 100%;">
                                        <option>카카오톡</option>
                                        <option>줌</option>
                                    </select>
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
                            <div class="col-12">
                                <div class="form-group">
                                    <label>상담명</label>
                                    <input type="text" class="form-control form-control-lg" placeholder="Type your keywords here">
                                </div>
                            </div>
                                <button type="button" class="btn btn-lg btn-default">초기화</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="submit" class="btn btn-lg btn-default">검색&nbsp;<i class="fa fa-search"></i></button>
                        </div>
                        <!-- 검색-->
                        <!-- <div class="form-group">
                            <div class="input-group input-group-lg">
                                <input type="search" class="form-control form-control-lg" placeholder="Type your keywords here" value="Lorem ipsum">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-lg btn-default">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </div> -->
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
              <h1>상담이력</h1>
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
                        <th>ID</th>
                        <th>User</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Reason</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>183</td>
                        <td>John Doe</td>
                        <td>11-7-2014</td>
                        <td><span class="tag tag-success">Approved</span></td>
                        <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                      </tr>
                      <tr>
                        <td>219</td>
                        <td>Alexander Pierce</td>
                        <td>11-7-2014</td>
                        <td><span class="tag tag-warning">Pending</span></td>
                        <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                      </tr>
                      <tr>
                        <td>657</td>
                        <td>Bob Doe</td>
                        <td>11-7-2014</td>
                        <td><span class="tag tag-primary">Approved</span></td>
                        <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                      </tr>
                      <tr>
                        <td>175</td>
                        <td>Mike Doe</td>
                        <td>11-7-2014</td>
                        <td><span class="tag tag-danger">Denied</span></td>
                        <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                      </tr>
                    </tbody>
                  </table>
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
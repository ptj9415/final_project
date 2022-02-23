<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin Today Story </title>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="subHomeFile/plugins/fontawesome-free/css/all.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="subHomeFile/plugins/select2/css/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="subHomeFile/dist/css/adminlte.min.css">
</head>

<body class="hold-transition sidebar-mini">
<!-- 어드민 부트스트랩에 적용 되있어서 빼야됨-->

  <!-- Content Wrapper. Contains page content -->
  <!-- 어드민 부트스트랩 적용한 곳에 들어 있음 이부분은 제거해야됨-->
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
          <h1 class="text-left display-5"> 오늘의 한마디 관리</h1><br>
            <h2 class="text-left display-5">검색</h2>
            <form action="enhanced-results.html">
                <div class="row">
                    <div class="col-md-12 offset-md-0">
                      <div class="card"> <!-- 하얀색 바 표시 시작-->
                        <div class="card-header">  
                          <div class="row">

                         
                                         
                         
                            <div class="col-12">
                                <div class="form-group">
                                    <label>주제</label>
                                    <input type="text" class="form-control form-control-lg" placeholder="Type your keywords here">
                                </div>
                            </div>
                            
                            
                            <div class="col-12">
                                <div class="form-group">
                                    <label>글귀</label>
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
              <h1>오늘의 한마디 주제</h1>
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
                        <th>NO</th>
                        <th>주제</th>
                        <th>글귀</th>
                        <th>순서변경</th>
                        <th>관리</th>
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


  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
		
<!-- ./wrapper -->

<!-- jQuery -->
<script src="subHomeFile/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="subHomeFile/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Select2 -->
<script src="subHomeFile/plugins/select2/js/select2.full.min.js"></script>
<!-- AdminLTE App -->
<script src="subHomeFile/dist/js/adminlte.min.js"></script>
<script>
    $(function () {
      $('.select2').select2()
    });
</script>
</body>
</html>
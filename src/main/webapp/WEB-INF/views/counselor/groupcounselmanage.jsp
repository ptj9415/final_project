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
          <br>
          <br>
          <h1 class="text-left display-5">&nbsp;그룹 상담 관리</h1><br><br><br> 
            <h2 class="text-left display-5">&nbsp;&nbsp;&nbsp;검색</h2>
            <br>
            <form action="enhanced-results.html">
                <div class="row">
                    <div class="col-md-12 offset-md-0">
                      <div class="card"> <!-- 하얀색 바 표시 시작-->
                        <div class="card-header">  
                          <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label>모집일 : </label><br>
                                    <input type="date" style="width: 350px; height:40px;" placeholder="Type your keywords here">
                                    ~
                                    <input type="date" style="width: 350px; height:40px;" placeholder="Type your keywords here">
                                </div>
                            </div>

                            <div class="col-6">        
                                <div class="form-group">
                                    <label>상담일 : </label><br>
                                    <input type="date" style="width: 400px; height:40px;"  placeholder="Type your keywords here">
                                </div>
                            </div>

                             <div class="col-6">        
                                <div class="form-group">
                                    <label>상담방식 : </label>
                                    <select class="select2" multiple="multiple" data-placeholder="전체" style="width: 100%;">
                                        <option>카카오톡</option>
                                        <option>줌</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-6">        
                                <div class="form-group">
                                    <label>상태 : </label>
                                    <select class="select2"  multiple="multiple" data-placeholder="전체" style="width: 100%;">
                                        <option>모집중</option>
                                        <option>상담 완료</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label>상담명 : </label>
                                    <input type="text" class="form-control" placeholder="Type your keywords here">
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
                      <th>신청방식</th>
                      <th>신청/모집인원</th>
                      <th>신청자 관리</th>
                      <th>상태</th>
                      <th>관리</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>ffff</td>
                      <td>fff</td>
                      <td>ffff</td>
                      <td>ffff</td>
                      <td>ffff</td>
                      <td>ffff</td>
                      <td><button>버튼</button></td>
                      <td>ffff</td>
                      <td><button>버튼</button></td>
                    </tr>
                    <tr>
                      <td>ffff</td>
                      <td>fff</td>
                      <td>ffff</td>
                      <td>ffff</td>
                      <td>ffff</td>
                      <td>ffff</td>
                      <td><button>버튼</button></td>
                      <td>ffff</td>
                      <td><button>버튼</button></td>
                    </tr>
                    <tr>
                      <td>ffff</td>
                      <td>fff</td>
                      <td>ffff</td>
                      <td>ffff</td>
                      <td>ffff</td>
                      <td>ffff</td>
                      <td><button>버튼</button></td>
                      <td>ffff</td>
                      <td><button>버튼</button></td>
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
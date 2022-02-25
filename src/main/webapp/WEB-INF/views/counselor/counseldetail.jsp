<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    th{
     height: 80px; width: 300px; 
     text-align: center;
     font-size: 20px;
    }
    td{
        text-align: center;
        font-size: 20px;
    }
</style>
</head>
<body>
	 <!-- Main content -->
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                     <br><br>
                        <h1>그룹상담관리-나의 자존감을 쑥쑥 성장시켜요</h1>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <section class="content">
            <div class="container-fluid">
            <br><br>
               <h2 class="text-left display-5">개요</h2>
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                              <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th>Rendering</th><td>ffefefefefef</td>
                                        <th>Browser</th><td>feffefefefef</td>
                                    </tr>
                                    <tr>
                                        <th>Platform(s)</th><td>fefefeffff</td>
                                        <th>Engine version</th><td>fefwefefewf</td>
                                    </tr>
                                    <tr>
                                        <th colspan="1">CSS grade</th><td colspan="3">efefewffef</td>
                                    </tr>
                                </tbody>
                              </table>
                            </div>
                            <!-- /.card-body -->
                          </div>
                          <!-- /.card -->
                    </div>
                </div>
            </div>
        </section>
    
    <section class="content">
        <div class="container-fluid">
         <br><br><br>
            <h2 class="text-left display-5">검색</h2>
            <form action="enhanced-results.html">
                <div class="row">
                    <div class="col-md-12 offset-md-0">
                      <div class="card"> <!-- 하얀색 바 표시 시작-->
                        <div class="card-header">  
                          <div class="row">
                            <div class="col-6">        
                                <div class="form-group">
                                    <label>상담카테고리</label>
                                    <select class="select2" multiple="multiple" data-placeholder="전체" style="width: 100%;">
                                        <option>카카오톡</option>
                                        <option>줌</option>
                                    </select>
                                </div>
                             </div>

                             <div class="col-12">        
                                <div class="form-group">
                                    <label>상담내용</label>
                                    <textarea style="height: 150px;" class="form-control form-control-lg" placeholder="Type your keywords here"></textarea>
                                </div>
                             </div>

                            <div class="col-12">        
                                <div class="form-group">
                                    <label>상담결과</label>
                                    <textarea style="height: 150px;" class="form-control form-control-lg" placeholder="Type your keywords here"></textarea>
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
    <!-- jQuery -->
<script src="subHomeFile/plugins/jquery/jquery.min.js"></script>
<script>
    $(function () {
      $('.select2').select2()
    });
</script>
</body>
</html>
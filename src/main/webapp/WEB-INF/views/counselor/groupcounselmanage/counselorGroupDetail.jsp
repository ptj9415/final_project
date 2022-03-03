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
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                            <br>
                            <h2 class="text-left display-5">개요</h2>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                              <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th>모집일</th><td>${detail.gc_startdate}~${detail.gc_finaldate }</td>
                                        <th>상담일</th><td>${detail.gc_date } : ${detail.gc_time }</td>
                                    </tr>
                                    <tr>
                                        <th>상담방식</th><td>${detail.gc_type }</td>
                                        <th>상담비용</th><td>${detail.gc_price }원</td>
                                    </tr>
                                    <tr>
                                        <th colspan="1">상담명</th><td colspan="3">${detail.gc_title}</td>
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
            <form action="detailinsert.do">
                <div class="row">
                    <div class="col-md-12">
                      <div class="card"> <!-- 하얀색 바 표시 시작-->
                          <div class="row">
                             <div class="col-12">
                             <br>
                             <div class="card-header">  
	                             <h2 class="text-left display-5">검색</h2>
                        	</div>
                             <div class="card-body">
                                <div class="form-group">
                                	<br>
                                    <label>상담내용</label>
                                    <textarea style="height: 150px;" class="form-control form-control-lg" placeholder="Type your keywords here" id="gc_report" name="gc_report"></textarea>
                                </div>
                             </div>

                           <div class="card-body">    
                                <div class="form-group">
                                    <label>상담결과</label>
                                    <textarea style="height: 150px;" class="form-control form-control-lg" placeholder="Type your keywords here" id="gc_result" name="gc_result"></textarea>
                                </div>
                            </div>
                            	<input type="hidden" id="gc_no" name="gc_no" value="${detail.gc_no}">
                                <button type="submit" class="btn btn-lg btn-default">등록</i></button>
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
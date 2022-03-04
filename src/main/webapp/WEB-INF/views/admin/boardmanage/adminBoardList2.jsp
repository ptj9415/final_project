<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
h3 {
   font-size: 19px;
}

.btndiv {
   float: right;
   width: 150px;
   margin-right: -8px;
}

#btnSearch {
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

#clearbtn {
   background-color: white;
   color: #EB4646;
   border: 1px solid red;
   border-radius: 4px;
   height: 33px;
   width: 70px;
}

.status {
   display: block;
   width: 100%;
   height: calc(2.25rem + 1px);
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
   transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

#membertable {
   text-align: center;
}

#membertable {
   border-top: 1px solid black;
   border-bottom: 1px solid black;
}

#managebtn {
   background-color: #1E90FF;
   color: white;
   border: none;
   border-radius: 4px;
   color: white;
   border: none;
   border-radius: 4px;
   height: 30px;
   width: 65px;
}
</style>
</head>
<body class="hold-transition sidebar-mini">
   <!-- Main content -->
   <section class="content">
      <div class="container-fluid">
         <br>
         <h3>일반회원 관리</h3>
         <br>
         <div class="row">
            <div class="col-md-12 offset-md-0">
               <div class="card">
                  <p id="headerp">검색</p>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-md-12 offset-md-0">
               <div class="card">
                  <div class="card-header">
                     <div class="row">
                        <div class="col-6">
                           <div class="form-group">
                              <label>닉네임</label> <br> <input type="text"
                                 class="form-control" id="m_nickname"
                                 placeholder="닉네임을 입력해주세요.">
                           </div>
                        </div>

                        <div class="col-6">
                           <div class="form-group">
                              <label>이메일</label> <br> <input type="text"
                                 class="form-control" id="b_email" placeholder="이메일을 입력해주세요.">
                           </div>
                        </div>

                        <div class="col-6">
                           <div class="form-group">
                              <label>날짜</label> <br> <input type="date"
                                 class="form-control" id="b_wdate" placeholder="연락처를 입력해주세요.">
                           </div>
                        </div>
                        <div class="col-6">
                           <div class="form-group">
                              <label>주제</label> <select class="status" id="b_subject">
                                 <option value="all">전체</option>
                                 <option value="가입">가입</option>
                                 <option value="탈퇴">탈퇴</option>
                              </select>
                           </div>
                        </div>
                     </div>
                     <div class="btndiv">
                        <button type="reset" id="clearbtn">초기화</button>
                        <button type="button" id="btnSearch">
                           검색&nbsp;<i class="fa fa-search"></i>
                        </button>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <br>

   <section class="content">
      <div class="container-fluid">
         <div class="row">
            <div class="col-md-12 offset-md-0">
               <div class="card">
                  <p id="headerp">게시글 목록</p>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-12">
               <div class="card">
                  <div class="card-body table-responsive p-00">
                     <span>(총 ${pagination.listCnt }건 중 ${pagination.start } ~
                        ${pagination.end }건)</span> <select class="paging" name="searchType"
                        id="listSize" onchange="page(1)">
                        <option value="10"
                           <c:if test="${pagination.getListSize() == 10 }">selected="selected"</c:if>>10건
                           보기</option>
                        <option value="15"
                           <c:if test="${pagination.getListSize() == 15 }">selected="selected"</c:if>>15건
                           보기</option>
                        <option value="20"
                           <c:if test="${pagination.getListSize() == 20 }">selected="selected"</c:if>>20건
                           보기</option>
                     </select> <br>
                     <br>
                     <table class="table table-hover text-nowrap" id="membertable">
                        <thead>
                           <tr>
                              <th>닉네임</th>
                              <th>이메일</th>
                              <th>연락처</th>
                              <th>보유쿠폰</th>
                              <th>상태</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach items="${board }" var="board">
                              <tr>
                                 <td>${board.m_nickname }</td>
                                 <td>${board.b_email }</td>
                                 <td>${board.b_wdate }</td>
                                 <td>2개</td>
                                 <td>${board.b_subject }</td>
                                 </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                     <br>
                     <div id="paginationBox" class="pagination1">
                        <ul class="pagination">
                           <c:if test="${pagination.prev}">
                              <li class="page-item"><a class="page-link" href="#"
                                 onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
               ,'${search.m_nickname}', '${search.b_email}', '${search.b_wdate}', '${search.b_subject}')">이전</a></li>
                           </c:if>
                           <c:forEach begin="${pagination.startPage}"
                              end="${pagination.endPage}" var="MemberNo">

                              <li
                                 class="page-item <c:out value="${pagination.page == BoardNo ? 'active' : ''}"/> ">
                                 <a class="page-link" href="#"
                                 onClick="fn_pagination('${BoardNo}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}','${search.m_nickname}', '${search.b_email}', '${search.b_wdate}', '${search.b_subject}')">
                                    ${BoardNo} </a>
                              </li>
                           </c:forEach>
                           <c:if test="${pagination.next}">

                              <li class="page-item"><a class="page-link" href="#"
                                 onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
               ,'${search.m_nickname}', '${search.b_email}', '${search.b_wdate}', '${search.b_subject}')">다음</a></li>
                           </c:if>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>

   <script>
      function fn_prev(page, range, rangeSize, listSize, m_nickname, b_email,
            b_subject, b_wdate) {

         var page = ((range - 2) * rangeSize) + 1;
         var range = range - 1;

         var url = "adminBoardList2.do";
         url = url + "?page=" + page;
         url = url + "&range=" + range;
         url = url + "&listSize=" + listSize;
         url = url + "&m_nickname=" + m_nickname;
         url = url + "&b_email=" + b_email;
         url = url + "&b_subject=" + b_subject;
         url = url + "&b_wdate=" + b_wdate;
         location.href = url;
      }

      function fn_pagination(page, range, rangeSize, listSize, m_nickname, b_email,
            b_subject, b_wdate) {

         var url = "adminBoardList2.do";
         url = url + "?page=" + page;
         url = url + "&range=" + range;
         url = url + "&listSize=" + listSize;
         url = url + "&m_nickname=" + m_nickname;
         url = url + "&b_email=" + b_email;
         url = url + "&b_subject=" + b_subject;
         url = url + "&b_wdate=" + b_wdate;
         location.href = url;
      }

      function fn_next(page, range, rangeSize, listSize, m_nickname, b_email,
            b_subject, b_wdate) {
         var page = parseInt((range * rangeSize)) + 1;
         var range = parseInt(range) + 1;
         var url = "adminBoardList2.do";
         url = url + "?page=" + page;
         url = url + "&range=" + range;
         url = url + "&listSize=" + listSize;
         url = url + "&m_nickname=" + m_nickname;
         url = url + "&b_email=" + b_email;
         url = url + "&b_subject=" + b_subject;
         url = url + "&b_wdate=" + b_wdate;
         location.href = url;
      }

      function page(Paging) {
         var startPage = Paging;
         var listSize = $("#listSize option:selected").val();

         if (listSize == 10) {
            var url = "adminMemberList.do?startPage=" + startPage
                  + "&listSize=" + listSize
         } else if (listSize == 15) {
            var url = "adminMemberList.do?startPage=" + startPage
                  + "&listSize=" + listSize
         } else if (listSize == 20) {
            var url = "adminMemberList.do?startPage=" + startPage
                  + "&listSize=" + listSize
         } 
         location.href = url;
      }

      $(document).on('click', '#btnSearch', function(e) {
         e.preventDefault();

         var url = "adminBoardList2.do";
         url = url + "?m_nickname=" + $('#m_nickname').val();
         url = url + "&b_email=" + $('#b_email').val();
         url = url + "&b_wdate=" + $('#b_wdate').val();
         url = url + "&b_subject=" + $('select[id="b_subject"]').val();
         location.href = url;
      });
   </script>
</body>
</html>
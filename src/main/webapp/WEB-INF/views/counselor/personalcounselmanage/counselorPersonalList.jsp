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

#boardTable {
	text-align: center;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.button:hover {
	background-color: #1E90FF;
	color: white;
	transition: 300ms ease-in-out;
}

.button {
	width:80px;
	margin-left: 20px;
	border: 1px solid #1E90FF;
	background-color: rgba(0, 0, 0, 0);
	color: #1E90FF;
	padding: 5px;
	border-radius: 5px;
}


.select2-container--default .select2-selection--single{
	/* border: 1px solid #ced4da; */
}

#select2{
	width:200px;
}
</style>
</head>
<body class="hold-transition sidebar-mini">
	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>개인상담 관리</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">검색</p>
					</div>
				</div>
			</div>
			<div class="row" >
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<div class="card-header">
							<div class="row">
								<div class="col-6">
									<div class="form-group" id="form_apply">
										<label>닉네임</label> <br> <input type="text" name="m_nickname"
											class="form-control" id="m_nickname"
											placeholder="회원 닉네임 입력..">
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label>상담방식</label><br> 
										<select id="pr_type" name="pr_type" class="form-control">
											<option value="all">전체</option>
											<option value="카카오톡">카카오톡</option>
											<option value="줌">줌</option>
											<option value="전화">전화</option>
										</select>
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label>상담주제</label><br> 
										<select id="ccg_subname" name="ccg_subname"  class="form-control">
											<option value="all">전체</option>
											<option value="취업준비">취업준비</option>
											<option value="동료관계">동료관계</option>
											<option value="진로">진로</option>
										</select>
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label>상담일</label> <br> <input type="date" name="pr_date"
											id="pr_date" class="form-control">
									</div>
								</div>
								
								<div class="col-6">
									<div class="form-group">
										<label>상태</label><br> <select id="pr_status" name="pr_status"  class="form-control">
											<option value="all">전체</option>
											<option value="0">결제완료</option>
											<option value="1">상담완료</option>
											<option value="2">환불완료</option>
										</select>
									</div>
								</div>
							</div>
									<div class="btndiv">
										<button type="reset" id="clearbtn" onclick="form_reset();">초기화</button>
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
						<p id="headerp">개인상담 목록</p>
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
							</select> <br> <br>
							<table class="table table-hover text-nowrap" id="boardTable">
								<thead>
									<tr>
										<th style="width: 70px">no</th>
										<th style="width: 100px">닉네임</th>
										<th style="width: 200px">상담일자</th>
										<th style="width: 150px">상담주제</th>
										<th style="width: 100px">상담방식</th>
										<th style="width: 100px">상태</th>
										<th style="width: 100px">상세보기</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${personalCounel }" var="personalCounsel">
										<tr>
											<td>${personalCounsel.pr_no }</td>
											<td>${personalCounsel.m_nickname }</td>
											<td>${personalCounsel.pr_date }</td>
											<td>${personalCounsel.ccg_subname }</td>
											<td>${personalCounsel.pr_type }</td>
										<c:if test="${empty personalCounsel.pr_status}">
											<td></td>
										</c:if>
										<c:if test="${personalCounsel.pr_status eq 0}">
											<td>결제완료</td>
										</c:if>	
										<c:if test="${personalCounsel.pr_status eq 1}">
											<td>상담완료</td>
										</c:if>
										<c:if test="${personalCounsel.pr_status eq 2 }">
											<td>취소완료</td>
										</c:if>
											
											<td >
												 <button type="button" id="button" class="button" onclick="location.href='counselorPersonalDetail.do?pr_no=${personalCounsel.pr_no }';">상세보기</button>
											</td>
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
					,'${search.m_nickname}', '${search.pr_date}', '${search.pr_status}','${search.pr_type}', '${search.ccg_subname}' )">이전</a></li>
									</c:if>
									<c:forEach begin="${pagination.startPage}"
										end="${pagination.endPage}" var="personalCounselNo">

										<li
											class="page-item <c:out value="${pagination.page == personalCounselNo ? 'active' : ''}"/> ">
											<a class="page-link" href="#"
											onClick="fn_pagination('${personalCounselNo}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}','${search.m_nickname}', '${search.pr_date}', '${search.pr_status}', '${search.pr_type}','${search.ccg_subname}')">
												${personalCounselNo} </a>
										</li>
									</c:forEach>
									<c:if test="${pagination.next}">

										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					,'${search.m_nickname}', '${search.pr_date}', '${search.pr_status}', '${search.pr_type}','${search.ccg_subname}')">다음</a></li>
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
	
		//검색 초기화 처리 안할래
		function form_reset() {
		 	$("#form_apply").reset();
   			 //document.getElementById("form_apply").reset();

				}
	
	
		// 페이징 처리
		
		function fn_prev(page, range, rangeSize, listSize, m_nickname, pr_date, pr_status, pr_type, ccg_subname) {

		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;

		var url = "counselorPersonalList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&listSize=" + listSize;
		url = url + "&m_nickname=" + m_nickname;
		url = url + "&pr_date=" + pr_date;
		url = url + "&pr_status=" + pr_status;
		url = url + "&pr_type=" + pr_type;
		url = url + "&ccg_subname=" + ccg_subname;
		location.href = url;
	}

		function fn_pagination(page, range, rangeSize, listSize, m_nickname, pr_date, pr_status, pr_type,ccg_subname) {

			var url = "counselorPersonalList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&m_nickname=" + m_nickname;
			url = url + "&pr_date=" + pr_date;
			url = url + "&pr_status=" + pr_status;
			url = url + "&pr_type=" + pr_type;
			url = url + "&ccg_subname=" + ccg_subname;
			location.href = url;
	}

		function fn_next(page, range, rangeSize, listSize, m_nickname, pr_date, pr_status, pr_type, ccg_subname) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var url = "counselorPersonalList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&listSize=" + listSize;
		url = url + "&m_nickname=" + m_nickname;
		url = url + "&pr_date=" + pr_date;
		url = url + "&pr_status=" + pr_status;
		url = url + "&pr_type=" + pr_type;
		url = url + "&ccg_subname=" + ccg_subname;
		location.href = url;
	}

		function page(Paging) {
		var startPage = Paging;
		var listSize = $("#listSize option:selected").val();

		if (listSize == 10) {
			var url = "counselorPersonalList.do?startPage=" + startPage
					+ "&listSize=" + listSize
		} else if (listSize == 15) {
			var url = "counselorPersonalList.do?startPage=" + startPage
					+ "&listSize=" + listSize
		} else if (listSize == 20) {
			var url = "counselorPersonalList.do?startPage=" + startPage
					+ "&listSize=" + listSize
		}
		location.href = url;
	}

		$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();

		var url = "counselorPersonalList.do";
		url = url + "?m_nickname=" + $('#m_nickname').val();
		url = url + "&pr_date=" + $('[name=pr_date]').val();
		url = url + "&pr_status=" + $('#pr_status').val();
		url = url + "&pr_type=" + $('#pr_type').val();
		url = url + "&ccg_subname=" + $('#ccg_subname').val();
		location.href = url;
		console.log(url);

	});
		
		
	
		
		// select 2
		$(document).ready(function() {
			$("#select2").select2();
		});
		
	</script>
</body>
</html>
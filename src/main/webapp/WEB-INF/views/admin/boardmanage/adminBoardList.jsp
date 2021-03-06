<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style>
h3 {
	font-size: 24px;
	font-weight: 600;
}

.row {
	margin-bottom: -10px;
}

#headerp {
	position: relative;
	top: 7px;
	margin-left: 15px;
	font-weight: 600;
}

.minusbtn {
	float: right;
	background-color: transparent;
	border: none;
	margin-right: 15px;
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

#boardTable>thead {
background-color: rgb(245, 245, 245);
}
	
}
#boardTable>tbody>tr>td {
	vertical-align: middle;
	
}

#detailbtn {
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
	height: 30px;
}

#deletebtn {
	background-color: #EB4646;
	color: white;
	border: none;
	border-radius: 4px;
	height: 30px;
}

.select2-container .select2-selection--single {
	height: 38px;
	border: 0.5px solid rgb(206, 212, 218);
}

/* 삭제 Swal 디자인  */
#swal2-title {
	font-size: 25px;
}

#swal2-content {
	font-size: 15px;
}

.swal2-header {
	height: 200px;
}

.swal2-actions {
	font-size: 12px;
	height: 80px;
	width: 300px;
	height: 80px;
}

.swal2-actions button {
	height: 30px;
	width: 80px;
}

</style>
</head>
<body class="hold-transition sidebar-mini">
	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>자유게시판 관리</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">
							검색
							<button type="button" class="minusbtn" id="minusbtn1">
								<i id="minusicon1" class="fa fa-minus"></i>
							</button>
						</p>
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
										<label>작성자</label> <br> <input type="text"
											class="form-control" id="m_nickname"
											placeholder="작성자를 입력해주세요.">
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label>주제</label><br> <select id="select2" name="select2"
											style="width: 100%; height: 38px;">
											<option value="all">전체</option>
											<option value="연애">연애</option>
											<option value="취업/진로">취업/진로</option>
											<option value="직장">직장</option>
											<option value="성추행">성추행</option>
											<option value="육아">육아</option>
											<option value="대인관계">대인관계</option>
											<option value="외모">외모</option>
											<option value="가족">가족</option>
											<option value="학업/고시">학업/고시</option>
											<option value="금전/사업">금전/사업</option>
											<option value="성생활">성생활</option>
											<option value="이별/이혼">이별/이혼</option>
											<option value="중독">중독</option>
											<option value="성소수자">성소수자</option>
											<option value="자아/성격">자아/성격</option>
											<option value="해외생활">해외생활</option>
											<option value="우울/불안">우울/불안</option>
										</select>
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label>제목</label> <br> <input type="text"
											class="form-control" id="b_title" placeholder="제목을 입력해주세요.">
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>작성일</label> <br> <input type="date" name="b_wdate"
											id="b_wdate" class="form-control">
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
						<p id="headerp">
							자유게시판 목록
							<button type="button" class="minusbtn" id="minusbtn2">
								<i id="minusicon2" class="fa fa-minus"></i>
							</button>
						</p>
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
							<table class="table text-nowrap" id="boardTable">
								<thead>
									<tr>
										<th style="width: 150px">작성자</th>
										<th style="width: 150px">주제</th>
										<th style="width: 500px">제목</th>
										<th style="width: 300px">작성일</th>
										<th style="width: 250px">관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${board}" var="board">
										<tr>
											<td>${board.m_nickname}</td>
											<td>${board.b_subject}</td>
											<td>${board.b_title}</td>
											<td>${board.b_wdate}</td>
											<!-- 수정 / 삭제 부분은 클릭 안되게  -->
											<td onclick="event.cancelBubble=true;">
												<button type="button" name="detailbtn" id="detailbtn"
													class="button" onclick="location.href='adminBoardRead.do?b_no=${board.b_no}';">상세보기</button>
												<button type="button" name="deletebtn" id="deletebtn"
													class="button" onclick="deleteFnc('${board.b_no}')">삭제</button>
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
					,'${search.m_nickname}', '${search.b_subject}', '${search.b_title}','${search.b_wdate}')">이전</a></li>
									</c:if>
									<c:forEach begin="${pagination.startPage}"
										end="${pagination.endPage}" var="boardNo">

										<li
											class="page-item <c:out value="${pagination.page == boardNo ? 'active' : ''}"/> ">
											<a class="page-link" href="#"
											onClick="fn_pagination('${boardNo}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}','${search.m_nickname}', '${search.b_subject}', '${search.b_title}', '${search.b_wdate}')">
												${boardNo} </a>
										</li>
									</c:forEach>
									<c:if test="${pagination.next}">

										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					,'${search.m_nickname}', '${search.b_subject}', '${search.b_title}', '${search.b_wdate}')">다음</a></li>
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
	
	
		// 페이징 처리
		
		function fn_prev(page, range, rangeSize, listSize, m_nickname, b_subject, b_title, b_wdate) {

		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;

		var url = "adminBoardList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&listSize=" + listSize;
		url = url + "&m_nickname=" + m_nickname;
		url = url + "&b_subject=" + b_subject;
		url = url + "&b_title=" + b_title;
		url = url + "&b_wdate=" + b_wdate;
		location.href = url;
	}

		function fn_pagination(page, range, rangeSize, listSize, m_nickname, b_subject, b_title, b_wdate) {

		var url = "adminBoardList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&listSize=" + listSize;
		url = url + "&m_nickname=" + m_nickname;
		url = url + "&b_subject=" + b_subject;
		url = url + "&b_title=" + b_title;
		url = url + "&b_wdate=" + b_wdate;
		location.href = url;
	}

		function fn_next(page, range, rangeSize, listSize, m_nickname, b_subject, b_title, b_wdate) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "adminBoardList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&listSize=" + listSize;
		url = url + "&m_nickname=" + m_nickname;
		url = url + "&b_subject=" + b_subject;
		url = url + "&b_title=" + b_title;
		url = url + "&b_wdate=" + b_wdate;
		location.href = url;
	}

		function page(Paging) {
		var startPage = Paging;
		var listSize = $("#listSize option:selected").val();

		if (listSize == 10) {
			var url = "adminBoardList.do?startPage=" + startPage
					+ "&listSize=" + listSize
		} else if (listSize == 15) {
			var url = "adminBoardList.do?startPage=" + startPage
					+ "&listSize=" + listSize
		} else if (listSize == 20) {
			var url = "adminBoardList.do?startPage=" + startPage
					+ "&listSize=" + listSize
		}
		location.href = url;
	}

		$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();

		var url = "adminBoardList.do";
		url = url + "?m_nickname=" + $('#m_nickname').val();
		url = url + "&b_subject=" + $('[name=select2]').val();
		url = url + "&b_title=" + $('#b_title').val();
		url = url + "&b_wdate=" + $('#b_wdate').val();
		location.href = url;
		console.log(url);

	});
		
		
		
		// 삭제 (디자인적용)
		
		function deleteFnc(b_no){
			Swal.fire({
			  title: '정말 삭제하시겠습니까?',
			  text: '삭제 후에는 복구가 불가능합니다.',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#1E90FF',
			  cancelButtonColor: '#EB4646',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.value) {
	              //"삭제" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
				$.ajax({
					url : "boardDelete.do",
					type : "post",
					data : {
						b_no : b_no
					},
					dataType : "text",
					success : function(responseText) {
						location.reload();
					},
					error : function() {
						alert("삭제 실패")
					}
				})
			  }
			})
		}
		
		
		// select 2
		$(document).ready(function() {
			$("#select2").select2();
			$('#select2').css('height', '38px');
		});
		
	</script>
</body>
</html>
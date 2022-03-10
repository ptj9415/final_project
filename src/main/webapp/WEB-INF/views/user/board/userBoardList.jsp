<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>자유게시판 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>


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

.btn1 {
	margin-right: -4px;
}

.btn2 {
	margin-left: -3px;
}

.btn1, .btn2, .filterinput, .button {
	margin-left: 20px;
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	border: 1px solid skyblue;
	margin-top: 30px;
}

.btn1:hover, .btn2:hover, .button:hover {
	background-color: skyblue;
	color: white;
	'
}

.all {
	display: inline-block;
	justify-content: center;
}

#insertbtn {
	width: 70px;
	height: 30px;
	margin-left: 980px;
	margin-bottom: 20px;
}
</style>

</head>
<body class="hold-transition sidebar-mini">
	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
				<div class="col-md-12 offset-md-0">
								<div class="col-6">
									<div class="form-group">
										<input type="text" class="filterinput" id="b_title"
											placeholder="제목을 입력하세요.">
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
		</div>
	</section>

	<br>

	<section class="content">
		<div class="row">
			<div class="col-12">
					<div class="card-body table-responsive p-00">
						<div class="m-4">
							<div class="insertbtndiv">
								<button type="button" class="button" id="insertbtn"
									name="insertbtn" onclick="location.href='userBoardForm.do'">글쓰기</button>
							</div>
							<div class="row">
								<c:forEach items="${board}" var="board">
									<div class="col-6"
										onclick="location.href='userBoardRead.do?b_no=${board.b_no}';">
										<div class="card border-primary mb-4">
											<div class="card-body text-primary">
												<p class="card-text">${board.b_subject}</p>
												<h5 class="card-title">${board.b_title}</h5>
												<p class="card-text">${board.b_content}</p>
												<c:choose>
													<c:when test="${board.b_anony eq 'F' }">
														<p class="card-text" style="text-align: right;">${board.m_nickname}</p>
													</c:when>
													<c:otherwise>
														<p class="card-text" style="text-align: right;">익명</p>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<br>
						<div id="paginationBox" class="pagination1">
							<ul class="pagination">
								<c:if test="${pagination.prev}">
									<li class="page-item"><a class="page-link" href="#"
										onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
				,'${search.b_title }'">이전</a></li>
								</c:if>
								<c:forEach begin="${pagination.startPage}"
									end="${pagination.endPage}" var="boardNo">

									<li
										class="page-item <c:out value="${pagination.page == boardNo ? 'active' : ''}"/> ">
										<a class="page-link" href="#"
										onClick="fn_pagination('${boardNo}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}','${search.b_title}')">
											${boardNo} </a>
									</li>
								</c:forEach>
								<c:if test="${pagination.next}">

									<li class="page-item"><a class="page-link" href="#"
										onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}','${search.b_title }'
				)">다음</a></li>
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
		
		function fn_prev(page, range, rangeSize, listSize, b_title) {

		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;

		var url = "userBoardList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&listSize=" + listSize;
		url = url + "&b_title=" + b_title;
		location.href = url;
	}

		function fn_pagination(page, range, rangeSize, listSize, b_title) {

		var url = "userBoardList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&listSize=" + listSize;
		url = url + "&b_title=" + b_title;
		location.href = url;
	}

		function fn_next(page, range, rangeSize, listSize, b_title) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "userBoardList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&listSize=" + listSize;
		url = url + "&b_title=" + b_title;
		location.href = url;
	}

		$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();

		var url = "userBoardList.do";
		url = url + "?b_title=" + $('#b_title').val();
		location.href = url;
		console.log(url);

	});
		
	
	</script>
</body>
</html>
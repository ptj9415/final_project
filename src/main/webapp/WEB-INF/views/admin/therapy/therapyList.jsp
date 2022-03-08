<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
h3 {
	font-size: 24px;
	font-weight: 600;
}

.row {
	margin-bottom: -10px;
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

#therapytable {
	text-align: center;
}

#therapytable {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

#therapytable>thead>tr>th {
	background-color: rgb(245, 245, 245);
}

#headerp {
	position: relative;
	top: 7px;
	margin-left: 15px;
	font-size: 16px;
	font-weight: 600;
}

.minusbtn {
	float: right;
	background-color: transparent;
	border: none;
	margin-right: 15px;
}

.insertbtn {
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
	height: 30px;
	float: right;
}

#sel1 {
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
	height: 30px;
	width: 65px;
}

#sel2 {
	background-color: #EB4646;
	color: white;
	border: none;
	border-radius: 4px;
	height: 30px;
	width: 65px;
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
			<h3>심리테라피 관리</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">
							검색
							<button type="button" class="minusbtn" id="minusbtn1">
								<i id="minusicon1" class="fa fa-minus"></i>
							</button>
						</p>
					</div>
				</div>
			</div>
			<div class="row" id="maindiv1">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<div class="card-header">
							<div class="row">
								<div class="col-6">
									<div class="form-group">
										<label>제목</label> <br> <input type="text"
											class="form-control" id="t_title" placeholder="제목을 입력해주세요.">
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label>작성자</label> <br> <input type="text"
											class="form-control" id="t_name" placeholder="작성자를 입력해주세요.">
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
					<div class="card" id="headerdiv">
						<p id="headerp">
							심리테라피 목록
							<button type="button" class="minusbtn" id="minusbtn2">
								<i id="minusicon2" class="fa fa-minus"></i>
							</button>
						</p>
					</div>
				</div>
			</div>
			<div class="row" id="maindiv2">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<c:choose>
								<c:when test="${pagination.listCnt lt pagination.end }">
									<span>(총 ${pagination.listCnt }건 중 ${pagination.start }
										~ ${pagination.listCnt }건)</span>
								</c:when>
								<c:otherwise>
									<span>(총 ${pagination.listCnt }건 중 ${pagination.start }
										~ ${pagination.end }건)</span>
								</c:otherwise>
							</c:choose>
							&nbsp;&nbsp;&nbsp;<select class="paging" name="searchType"
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
							</select>
							<button type="button" class="insertbtn"
								onclick="location.href='therapyInsertForm.do'">심리테라피 등록</button>
							<br> <br>
							<table class="table text-nowrap" id="therapytable">
								<thead>
									<tr>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th style="width: 150px;">관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${therapy}" var="therapys">
										<tr>
											<td>${therapys.t_title}</td>
											<td>${therapys.t_name}</td>
											<td>${therapys.t_writedate}</td>
											<td><button id="sel1" name="sel1"
													onclick="location.href='therapyUpdateForm.do?t_no=${therapys.t_no}'">수정</button>
												<button id="sel2" name="sel2"
													onclick="delfunc('${therapys.t_no}')">삭제</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br>
							<div id="paginationBox" class="pagination1" style="float: right;">
								<ul class="pagination">
									<c:if test="${pagination.prev}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					,'${search.t_name}', '${search.t_title}')">이전</a></li>
									</c:if>
									<c:forEach begin="${pagination.startPage}"
										end="${pagination.endPage}" var="TherapyNo">

										<li
											class="page-item <c:out value="${pagination.page == TherapyNo ? 'active' : ''}"/> ">
											<a class="page-link" href="#"
											onClick="fn_pagination('${TherapyNo}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}','${search.t_name}', '${search.t_title}')">
												${TherapyNo} </a>
										</li>
									</c:forEach>
									<c:if test="${pagination.next}">

										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					,'${search.t_name}', '${search.t_title}')">다음</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
	</section>

	<!-- jQuery -->
	<script>
		$('#minusbtn1').click(function() {
			if ($('#maindiv1').css('display') == 'none') {
				$('#maindiv1').show();
				$('#minusicon1').attr('class', 'fa fa-minus');
			} else if ($('#maindiv1').css('display') != 'none') {
				$('#maindiv1').hide();
				$('#minusicon1').attr('class', 'fa fa-plus');
			}
		});
		
		$('#minusbtn2').click(function() {
			if ($('#maindiv2').css('display') == 'none') {
				$('#maindiv2').show();
				$('#minusicon2').attr('class', 'fa fa-minus');
			} else if ($('#maindiv2').css('display') != 'none') {
				$('#maindiv2').hide();
				$('#minusicon2').attr('class', 'fa fa-plus');
			}
		});


		$(function() {
			$('.select2').select2()
		});

		function delfunc(t_no) {
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
				$.ajax({
					url : 'therapyDelete.do',
					data : {
						t_no : t_no
					},
					dataType : 'text',
					success : function(data) {
						console.log(data);
						location.reload();
					},
					error : function() {
						alert('error 삭제 실패');
					}
				});
			}
			});
		}

		function fn_prev(page, range, rangeSize, listSize, t_name, t_title) {

			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;

			var url = "admintherapy.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&t_name=" + t_name;
			url = url + "&t_title=" + t_title;
			location.href = url;
		}

		function fn_pagination(page, range, rangeSize, listSize, t_name,
				t_title) {

			var url = "admintherapy.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&t_name=" + t_name;
			url = url + "&t_title=" + t_title;
			location.href = url;
		}

		function fn_next(page, range, rangeSize, listSize, t_name, t_title) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "admintherapy.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&t_name=" + t_name;
			url = url + "&t_title=" + t_title;
			location.href = url;
		}

		function page(Paging) {
			var startPage = Paging;
			var listSize = $("#listSize option:selected").val();

			if (listSize == 10) {
				var url = "admintherapy.do?startPage=" + startPage
						+ "&listSize=" + listSize
			} else if (listSize == 15) {
				var url = "admintherapy.do?startPage=" + startPage
						+ "&listSize=" + listSize
			} else if (listSize == 20) {
				var url = "admintherapy.do?startPage=" + startPage
						+ "&listSize=" + listSize
			}
			location.href = url;
		}

		$(document).on('click', '#btnSearch', function(e) {
			e.preventDefault();

			var url = "admintherapy.do";
			url = url + "?t_name=" + $('#t_name').val();
			url = url + "&t_title=" + $('#t_title').val();
			location.href = url;

		});
	</script>
</body>
</html>
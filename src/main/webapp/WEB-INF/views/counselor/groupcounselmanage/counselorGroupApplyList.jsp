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

#membertable>thead>tr>th {
	background-color: rgb(245, 245, 245);
}

#managebtn, #subjectbtn {
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
	height: 30px;
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
</style>
</head>
<body class="hold-transition sidebar-mini">
	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>신청자 관리</h3>
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
										<label>닉네임</label> <br> <input type="text"
											class="form-control" id="m_nickname"
											placeholder="닉네임을 입력해주세요.">
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>이메일</label> <br> <input type="text"
											class="form-control" id="m_email" placeholder="이메일을 입력해주세요.">
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>신청일</label> <br> <input type="date"
											class="form-control" id="gr_reservedate">
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label>상태</label> <select class="	status" id="gr_status">
											<option value="all">전체</option>
											<option value="가입">가입</option>
											<option value="탈퇴">탈퇴</option>
										</select>								
										<input type="hidden" id="gc_no" name="gc_no" value="${gc_no }">		
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
							신청자 목록
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
							&nbsp;&nbsp;&nbsp;<select class="paging" name="searchType" id="listSize"
								onchange="page(1)">
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
							<table class="table text-nowrap" id="membertable">
								<thead>
									<tr>
										<th>닉네임</th>
										<th>이메일</th>
										<th>신청일</th>
										<th>상태</th>
										<th>신청내용</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${apply }" var="apply">
										<tr>
											<td>${apply.m_nickname }</td>
											<td>${apply.m_email }</td>
											<td>${apply.gr_reservedate }</td>
											<c:if test="${apply.gr_status eq 0 }">
												<td>신청 완료</td>
											</c:if>
											<c:if test="${apply.gr_status eq 1 }">
												<td>신청 취소</td>
											</c:if>
											<td><button type="button" id="subjectbtn" data-toggle="modal" data-target="#modal-lg" data-reason="${apply.gr_subject }">신청내용</button>											
											</td>
											<td><button type="button" class="managebtn"
													id="managebtn" name="${apply.m_nickname }"
													onclick="delfunc('${apply.gr_no}')">신청취소</button></td>
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
					,'${search.gc_no}', '${search.m_nickname}', '${search.m_email}', '${search.gr_reservedate}', '${search.gr_status}')">이전</a></li>
									</c:if>
									<c:forEach begin="${pagination.startPage}"
										end="${pagination.endPage}" var="GroupapplyNo">

										<li
											class="page-item <c:out value="${pagination.page == GroupapplyNo ? 'active' : ''}"/> ">
											<a class="page-link" href="#"
											onClick="fn_pagination('${GroupapplyNo}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}','${search.gc_no}','${search.m_nickname}', '${search.m_email}', '${search.m_phone}', '${search.m_type}')">
												${GroupapplyNo} </a>
										</li>
									</c:forEach>
									<c:if test="${pagination.next}">

										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}','${search.gc_no}'
					,'${search.m_nickname}', '${search.m_email}', '${search.gr_reservedate}', '${search.gr_status}')">다음</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<!-- 모달시작 -->
	<div class="modal fade" id="modal-lg">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">신청 내용</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">신청 내용 확인</h3>
						</div>
						<div class="card-body">
							<div class="form-group">
								<input type="text" style="height: 100px" class="form-control"
									id="gr_subject" name="gr_subject" value="">
							</div>
						</div>						
					</div>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	</section>

	<script>
	$(document).on('click', '#subjectbtn', function() {
		var gr_subject = $(this).data('reason');
		$('#gr_subject').val(gr_subject);
	});
	
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

		function fn_prev(page, range, rangeSize, listSize, gc_no, m_nickname, m_email,
				gr_reservedate, gr_status) {

			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;

			var url = "counselorGroupApplyList.do";
			url = url + "?gc_no" + gc_no;
			url = url + "&page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&m_nickname=" + m_nickname;
			url = url + "&m_email=" + m_email;
			url = url + "&gr_reservedate=" + gr_reservedate;
			url = url + "&gr_status=" + gr_status;
			location.href = url;
		}

		function fn_pagination(page, range, rangeSize, listSize, gc_no, m_nickname,
				m_email, gr_reservedate, gr_status) {

			var url = "counselorGroupApplyList.do";
			url = url + "?gc_no" + gc_no;
			url = url + "&page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&m_nickname=" + m_nickname;
			url = url + "&m_email=" + m_email;
			url = url + "&gr_reservedate=" + gr_reservedate;
			url = url + "&gr_status=" + gr_status;
			location.href = url;
		}

		function fn_next(page, range, rangeSize, listSize, gc_no, m_nickname, m_email,
				gr_reservedate, gr_status) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "counselorGroupApplyList.do";
			url = url + "?gc_no" + gc_no;
			url = url + "&page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&m_nickname=" + m_nickname;
			url = url + "&m_email=" + m_email;
			url = url + "&gr_reservedate=" + gr_reservedate;
			url = url + "&gr_status=" + gr_status;
			location.href = url;
		}

		function page(Paging) {
			var startPage = Paging;
			var listSize = $("#listSize option:selected").val();

			if (listSize == 10) {
				var url = "counselorGroupApplyList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			} else if (listSize == 15) {
				var url = "counselorGroupApplyList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			} else if (listSize == 20) {
				var url = "counselorGroupApplyList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			}
			location.href = url;
		}

		$(document).on('click', '#btnSearch', function(e) {
			e.preventDefault();

			var url = "counselorGroupApplyList.do";
			url = url + "?gc_no=" + $('#gc_no').val();
			url = url + "&m_nickname=" + $('#m_nickname').val();
			url = url + "&m_email=" + $('#m_email').val();
			url = url + "&gr_reservedate=" + $('#gr_reservedate').val();
			url = url + "&gr_status=" + $('#gr_status').val();
			location.href = url;

		});
		
		function delfunc(gr_no){
			if (confirm("신청 취소를 하시겠습니까??") == true) { 
				$.ajax({
					type :"post",
					url : "upDateService.do",
					data : { gr_no : gr_no },
					success : function(){
						alert("신청을 취소했습니다.");
						location.reload();
					},error : function (){
						alert("신청 취소가 실패 되었습니다.");
					}
				});
			}
		}
	</script>
</body>
</html>
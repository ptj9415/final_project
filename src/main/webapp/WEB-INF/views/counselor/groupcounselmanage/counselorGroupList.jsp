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

#gc_startdate, #gc_finaldate {
	width: 30%;
}

#membertable {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	text-align: center;
}

#membertable>thead>tr>th {
	background-color: rgb(245, 245, 245);
}

#sel1, #sel2 {
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
	color: white;
	height: 30px;
}
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>그룹상담 관리</h3>
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
										<label>상담명</label> <br> <input type="text"
											class="form-control" name="gc_title" id="gc_title">
									</div>
								</div>


								<div class="col-6">
									<div class="form-group">
										<label>상담방식</label> <br> <select name="gc_type"
											class="form-control" id="gc_type">
											<option value="all">전체</option>
											<option value="카카오톡">카카오톡</option>
											<option value="줌">줌</option>
											<option value="전화">전화</option>
										</select>
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>상담일</label> <br> <input type="date" name="gc_date"
											class="form-control" id="gc_date">
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>상태</label> <br> 
										<select name="gc_status"
											class="form-control" id="gc_status">
											<option value="all">전체</option>
											<option value="0">모집 중</option>
											<option value="1">상담 완료</option>
											<option value="2">폐지</option>
										</select>
									</div>
								</div>
							</div>
							<div class="btndiv">
								<button type="reset" id="clearbtn" onclick="resetbtn()">초기화</button>
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
							그룹상담 목록
							<button type="button" class="minusbtn" id="minusbtn2">
								<i id="minusicon2" class="fa fa-minus"></i>
							</button>
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card" id="maindiv2">
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
							</select> <br> <br>
							<table class="table text-nowrap" id="membertable">
								<thead>
									<tr>
										<th>상담명</th>
										<th>상담방식</th>
										<th>모집일</th>
										<th>상담일</th>
										<th>신청인원/모집인원</th>
										<th>신청자 관리</th>
										<th>상태</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${groupCounsel}" var="group">
										<tr>
											<td>${group.gc_title}</td>
											<td>${group.gc_type }</td>
											<td>${group.gc_startdate}~${group.gc_finaldate}</td>
											<td>${group.gc_date}</td>
											<td>${group.gc_person}/${group.gc_max_person }</td>
											<td><button id="sel1" name="sel1"
													onclick="location.href='counselorGroupApplyList.do?gc_no=${group.gc_no}'">관리</button></td>
											<c:if test="${group.gc_status eq 0 }">
												<td>진행 중</td>
											</c:if>
											<c:if test="${group.gc_status eq 1 }">
												<td>상담 완료</td>
											</c:if>
											<c:if test="${group.gc_status eq 2 }">
												<td>폐지</td>
											</c:if>
											<td><input type="hidden" name="gc_no" id="gc_no"
												value="${group.gc_no}"> <c:if
													test="${group.gc_status eq '0' }">
													<button type="submit" id="sel2" name="sel2"
														onclick="location.href='counselorGroupInfo.do?gc_no=${group.gc_no}'">정보수정</button>
												</c:if> <c:if test="${group.gc_status eq '1' }">
													<button type="submit" id="sel2" name="sel2"
														onclick="location.href='counselorGroupDetail.do?gc_no=${group.gc_no}'">상담일지
														작성</button>
												</c:if> <c:if test="${group.gc_status eq '2' }">
													-
												</c:if></td>
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
					, '${search.gc_date}', '${search.gc_type}', '${search.gc_status}', '${search.gc_title}')">이전</a></li>
									</c:if>
									<c:forEach begin="${pagination.startPage}"
										end="${pagination.endPage}" var="GroupCounselNo">

										<li
											class="page-item <c:out value="${pagination.page == GroupCounselNo ? 'active' : ''}"/> ">
											<a class="page-link" href="#"
											onClick="fn_pagination('${GroupCounselNo}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}','${search.gc_date}', '${search.gc_type}', '${search.gc_status}', '${search.gc_title}')">
												${GroupCounselNo} </a>
										</li>
									</c:forEach>
									<c:if test="${pagination.next}">

										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					,'${search.gc_date}', '${search.gc_type}', '${search.gc_status}', '${search.gc_title}')">다음</a></li>
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
		function fn_prev(page, range, rangeSize, listSize, gc_date, gc_type,
				gc_status, gc_title) {

			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;

			var url = "counselorGroupList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&gc_date=" + gc_date;
			url = url + "&gc_type=" + gc_type;
			url = url + "&gc_status=" + gc_status;
			url = url + "&gc_title=" + gc_title;
			location.href = url;
		}

		function fn_pagination(page, range, rangeSize, listSize, gc_date,
				gc_type, gc_status, gc_title) {

			var url = "counselorGroupList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&gc_date=" + gc_date;
			url = url + "&gc_type=" + gc_type;
			url = url + "&gc_status=" + gc_status;
			url = url + "&gc_title=" + gc_title;
			location.href = url;
		}

		function fn_next(page, range, rangeSize, listSize, gc_date, gc_type,
				gc_status, gc_title) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "counselorGroupList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&gc_date=" + gc_date;
			url = url + "&gc_type=" + gc_type;
			url = url + "&gc_status=" + gc_status;
			url = url + "&gc_title=" + gc_title;
			location.href = url;
		}

		function page(Paging) {
			var startPage = Paging;
			var listSize = $("#listSize option:selected").val();

			if (listSize == 10) {
				var url = "counselorGroupList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			} else if (listSize == 15) {
				var url = "counselorGroupList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			} else if (listSize == 20) {
				var url = "counselorGroupList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			}
			location.href = url;
		}

		$(document).on('click', '#btnSearch', function(e) {
			e.preventDefault();

			var url = "counselorGroupList.do";
			url = url + "?gc_date=" + $('#gc_date').val();
			url = url + "&gc_type=" + $('select[id="gc_type"]').val();
			url = url + "&gc_status=" + $('select[id="gc_status"]').val();
			url = url + "&gc_title=" + $('#gc_title').val();
			location.href = url;
		});

		function resetbtn(){
			$("#gc_title").val('');
			$("#gc_type option:eq(0)").prop("selected",true);
			$("#gc_date").val('');
			$("#gc_status option:eq(0)").prop("selected",true);
		}
	</script>
</body>
</html>
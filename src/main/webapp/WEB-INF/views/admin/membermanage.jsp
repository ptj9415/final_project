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

#membertable>thead {
	border-top: 1px solid black;
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
											class="form-control" id="m_email" placeholder="이메일을 입력해주세요.">
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>연락처</label> <br> <input type="text"
											class="form-control" id="m_phone" placeholder="연락처를 입력해주세요.">
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label>상태</label> <select class="	status" id="m_type">
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
						<p id="headerp">회원 목록</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<select class="form-control form-control-sm" name="searchType"
								id="listSize" onchange="page(1)">
								<option value="10"
									<c:if test="${pagination.getListSize() == 10 }">selected="selected"</c:if>>10개</option>
								<option value="15"
									<c:if test="${pagination.getListSize() == 15 }">selected="selected"</c:if>>15개</option>
								<option value="20"
									<c:if test="${pagination.getListSize() == 20 }">selected="selected"</c:if>>20개</option>
							</select>
							<table class="table table-hover text-nowrap" id="membertable">
								<thead>
									<tr>
										<th>닉네임</th>
										<th>이메일</th>
										<th>연락처</th>
										<th>보유쿠폰</th>
										<th>상태</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${member }" var="member">
										<tr>
											<td>${member.m_nickname }</td>
											<td>${member.m_email }</td>
											<td>${member.m_phone }</td>
											<td>2개</td>
											<td>${member.m_type }</td>
											<td><button type="button" class="managebtn"
													id="managebtn" name="${member.m_nickname }">관리</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div id="paginationBox" class="pagination1">
								<ul class="pagination">
									<c:if test="${pagination.prev}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					,'${search.m_nickname}', '${search.m_email}', '${search.m_phone}', '${search.m_type}')">이전</a></li>
									</c:if>
									<c:forEach begin="${pagination.startPage}"
										end="${pagination.endPage}" var="MemberNo">

										<li
											class="page-item <c:out value="${pagination.page == MemberNo ? 'active' : ''}"/> ">
											<a class="page-link" href="#"
											onClick="fn_pagination('${MemberNo}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}','${search.m_nickname}', '${search.m_email}', '${search.m_phone}', '${search.m_type}')">
												${MemberNo} </a>
										</li>
									</c:forEach>
									<c:if test="${pagination.next}">

										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					,'${search.m_nickname}', '${search.m_email}', '${search.m_phone}', '${search.m_type}')">다음</a></li>
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
		function fn_prev(page, range, rangeSize, listSize, m_nickname, m_email,
				m_phone, m_type) {

			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;

			var url = "membermanage.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&m_nickname=" + m_nickname;
			url = url + "&m_email=" + m_email;
			url = url + "&m_phone=" + m_phone;
			url = url + "&m_type=" + m_type;
			location.href = url;
		}

		function fn_pagination(page, range, rangeSize, listSize, m_nickname,
				m_email, m_phone, m_type) {

			var url = "membermanage.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&m_nickname=" + m_nickname;
			url = url + "&m_email=" + m_email;
			url = url + "&m_phone=" + m_phone;
			url = url + "&m_type=" + m_type;
			location.href = url;
		}

		function fn_next(page, range, rangeSize, listSize, m_nickname, m_email,
				m_phone, m_type) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "membermanage.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&m_nickname=" + m_nickname;
			url = url + "&m_email=" + m_email;
			url = url + "&m_phone=" + m_phone;
			url = url + "&m_type=" + m_type;
			location.href = url;
		}

		function page(testId) {
			var startPage = testId;
			var listSize = $("#listSize option:selected").val();

			if (listSize == 10) {
				var url = "membermanage.do?startPage=" + startPage
						+ "&listSize=" + listSize
			} else if (listSize == 15) {
				var url = "membermanage.do?startPage=" + startPage
						+ "&listSize=" + listSize
			} else if (listSize == 20) {
				var url = "membermanage.do?startPage=" + startPage
						+ "&listSize=" + listSize

			}
			location.href = url;
		}

		$(document).on('click', '#btnSearch', function(e) {
			e.preventDefault();
// 			var url1 = $('#m_nickname').val();
// 			if (url1 == '') {
// 				url1 = 'all';
// 			}

// 			var url2 = $('#m_email').val();
// 			if (url2 == '') {
// 				url2 = 'all';
// 			}

// 			var url3 = $('#m_phone').val();
// 			if (url3 == '') {
// 				url3 = 'all';
// 			}

// 			var url4 = $('select[id="m_type"]').val();

// 			alert(url1 + " + " + url2 + " + " + url3 + " + " + url4);

			var url = "membermanage.do";
			url = url + "?m_nickname=" + $('#m_nickname').val();
			url = url + "&m_email=" + $('#m_email').val();
			url = url + "&m_phone=" + $('#m_phone').val();
			url = url + "&m_type=" + $('select[id="m_type"]').val();
			location.href = url;
			console.log(url);

		});
	</script>
</body>
</html>
+<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<style>
.topTitle {
	font-size: 25px;
	font-weight: bold color: #757a76;
	width: 80%;
	margin-right: auto;
	margin-left: auto;
	margin-top: 100px;
}

.wrap2 {
	border-style: none;
	width: 80%;
	margin-right: auto;
	margin-left: auto;
	margin-top: 30px;
	margin-bottom: 250px;
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

#noticeTable {
	text-align: center;
	border-bottom: 1px solid #E3E5E6;
}

}
#noticeTable>tbody>tr>td {
	vertical-align: middle;
}

button {
	height: 40px;
    width: 80px;
    border: 1px solid #153e54;
    background-color: #153e54;
    color: white;
    border: 1px solid black;
    font-size: 13px;
    border-radius: 3px 20px 20px 3px;
    border: 1px solid #8dacbd42;
}

button:hover {
	background-color: black;
	color: white;
}

.filterinput {
	width: 45%;
	height: 30px;
}

.page-item.active .page-link {
	border: 0.5px solid #8dacbd42;
	background-color: white;
	color: #4b5b73;
	font-weight: bold;
	font-size: 14px;
	margin-top: -1px;
	border-radius:20px;
}

.page-link {
	border: 0px;
	font-size: 14px;
	color: #666666;
	margin-left: 10px;
}

.searchDiv {
	height: 100px;
	margin-top: 30px;
	margin-bottom: 150px;
}

#btnSearch, #clearbtn {
	display: inline-block;
	margin-bottom: 2px;
	padding-top: 3px;
}

td, tr {
	height: 30px;
}

.form-group {
	margin-top: 70px;
	display: inline-block;
	margin-right: 2px;
}

input::placeholder {
 	font-size: 15px;
 	color: #dededf;
}
#noticeTitle:hover{
	cursor: pointer;
}
</style>
</head>
<body class="hold-transition sidebar-mini">

	<!-- 배너 -->
				<section class="hero-wrap hero-wrap-2">
	<img src="img/bannerimg/notice.png" id="bannerimg">
	</section>

	<div class="topTitle">
		<a>공지사항</a>
	</div>
	
	<div class="wrap2">
		<table class="table text-nowrap" id="noticeTable">
			<tbody>
				<tr>
					<th width="100">글 번호</th>
					<th width="100">말머리</th>
					<th width="300">작성자</th>
					<th width="100">제 목</th>
					<th width="200">작성일자</th>
					<th width="100">조회수</th>
					<th width="100">첨부파일</th>
				</tr>
				<c:forEach items="${notice }" var="notice">
					<tr onclick="userNoticeRead(${notice.n_no})">
						<td>${notice.n_no}<input type="hidden" class="colorChanged"
							value="${notice.n_status }"></td>
						<td>${notice.n_category }</td>
						<td>${notice.n_writer }</td>
						<td id="noticeTitle">${notice.n_title }</td>
						<td><fmt:parseDate value="${notice.n_writedate}"
								var="noticeDate" pattern="yyyy-MM-dd" /> <fmt:formatDate
								value="${noticeDate}" pattern="yyyy-MM-dd" /></td>
						<td>${notice.n_hit }</td>
						<td>${notice.n_filename }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<form action="userNoticeRead.do" id="frm" method="post">
			<input type="hidden" name="no" id="no">
		</form>
		<br>
		<div id="paginationBox" class="pagination1"
			style="float: right; position: relative; left: -50%; margin-top: 50px;">
			<ul class="pagination">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}', '${search.n_title}', '${search.n_category}')">이전</a></li>
				</c:if>
				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="NoticeNo">
					<li
						class="page-item <c:out value="${pagination.page == NoticeNo ? 'active' : ''}"/> ">
						<a class="page-link" href="#"
						onClick="fn_pagination('${NoticeNo}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}','${search.n_title}', '${search.n_category}')">
							${NoticeNo} </a>
					</li>
				</c:forEach>
				<c:if test="${pagination.next}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}' ,'${search.n_title}', '${search.n_category}')">다음</a></li>
				</c:if>
			</ul>
		</div>
		
		<div class="row">
		<div class="col-md-12 offset-md-0">
			<div style="width: 100%; margin-top: 90px;">
				<div style="margin-left: 20%;">
					<span class="form-group"> 
						<input type="text" class="filterinput" id="n_title" style="border-radius: 20px 3px 3px 20px; border:1px solid #8dacbd42; width: 600px; height: 40px;" placeholder=" 제목을 입력하세요.">
					</span> 
					<span id="right">
						<span class="form-group"> 
							<select id="n_category" name="n_category" style="width: 90px; height: 40px; font-size: 15px; border:1px solid #8dacbd42; ">
									<option value="all">전체</option>
									<option value="긴급">긴급</option>
									<option value="이벤트">이벤트</option>
									<option value="공지">공지</option>
							</select>
						</span> 
						<span class="searchdiv">
							<button type="reset" id="clearbtn" style=" border: 1px solid black; border-radius:0px;">초기화</button>
							<button type="button" id="btnSearch">검색</button>
						</span>
					</span>
				</div>
			</div>
		</div>
	</div>
	
	</div>




	<script>
		//고정게시글 색상변경 id값으로 고정값 비교. => '고정'이면 부모요소 tr에 배경색 부여
		if ($(".colorChanged").val() == '고정') {
			$("input[value='고정']").parent().parent().css('background',
					'#F4F9FC ');
		}

		// 검색창 항목들 초기화시킴
		$("#clearbtn").on("click", function() {
			$("#n_title").val("");
			$("#n_category").val("");
		});

		// 공지사항 조회하기 (userNoticeRead)
		function userNoticeRead(str) {
			frm.no.value = str;
			frm.submit();
		};

	

		function fn_prev(page, range, rangeSize, listSize, n_title, n_category) {

			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;

			var url = "userNoticeList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&n_title=" + n_title;
			url = url + "&n_category=" + n_category;
			location.href = url;
		};

		function fn_pagination(page, range, rangeSize, listSize, n_title,
				n_category) {

			var url = "userNoticeList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&n_title=" + n_title;
			url = url + "&n_category=" + n_category;
			location.href = url;
		};

		function fn_next(page, range, rangeSize, listSize, n_title, n_category) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "userNoticeList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&n_title=" + n_title;
			url = url + "&n_category=" + n_category;
			location.href = url;
		};

		
		$(document).on('click', '#btnSearch', function(e) {
			e.preventDefault();

			var url = "userNoticeList.do";
			url = url + "?n_title=" + $('#n_title').val();
			url = url + "&n_category=" + $('#n_category').val();
			location.href = url;

		});
		
	</script>
</body>
</html>
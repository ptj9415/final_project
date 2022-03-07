<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://kit.fontawesome.com/f124f87943.js" crossorigin="anonymous"></script>
<style>
.container-fluid {
	width: 70%;
}
.btndiv > button {
	width:8%;
}
#n_category {
	width: 30%;
}
#readTd:hover {
	cursor: pointer;
}
</style>
</head>
<body class="hold-transition sidebar-mini">
	<!-- 화면 상단 이미지-->
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('resources/user/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-2 bread">공지 사항</h1>
					<p class="breadcrumbs">

						<span class="mr-2"><i class="ion-ios-arrow-forward"></i>
						</span> <br> <br> <span>${todaySelect.sc_subject}</span> <br>
						<br>

					</p>

			
					
					<!-- modal btn -->

		<span type="button" class="btn btn-default" id="submit-btn"
			data-toggle="modal" data-target="#modal-lg">등록&nbsp;</span>
					<!-- modal btn -->

				</div>
			</div>
		</div>
	</section>
	

	<!-- 공지사항 검색 영역-->
	<section>
		<div class="container-fluid">
			<br>
			<h3>공지 사항</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">
							검색
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
										<label>말머리</label> <br>
											<select class="status" id="n_category">
												<option value="all">전체</option>
												<option value="긴급">긴급</option>
												<option value="이벤트">이벤트</option>
												<option value="공지">공지</option>											
											</select>
									</div>
									<div class="form-group">
										<label>제목</label> <br> <input type="text"
											class="form-control" id="n_title"
												placeholder="제목을 입력해주세요.">
									</div>
								</div>
							</div>
							<div class="btndiv" >
								<button type="reset" id="clearbtn">초기화</button>
								<button type="button" id="btnSearch">검색</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	
	
	<!-- 공지사항 게시글-->
	<section>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">
							공지사항 목록
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
							</select>
							 <br> <br>
							<table class="table table-hover text-nowrap" id="membertable">
								<thead>
									<tr>
										<th>글번호</th>
										<th>작성자</th>
										<th>말머리</th>
										<th>제목</th>
										<th>작성일</th>
										<th>조회수</th>
										<th>첨부파일</th>
									</tr>
								</thead>
								<tbody>
									<!--  관리자가 고정한 게시글은 색깔을 tr의 전체적인 배경색을 변경해서 구분해야 한다 -->
									<c:forEach items="${notice }" var="notice">
										<tr class="noticeTr">
											<td>${notice.n_no}<input type="hidden" class="colorChanged" value="${notice.n_status }"></td>  <!-- rownum으로 가져와야 할 듯. 아니면 지우거나 -->
											<td>${notice.n_writer }</td>
											<td>${notice.n_category }</td>
											<td id="readTd" onclick="userNoticeRead(${notice.n_no})">${notice.n_title }</td>
											<td>${notice.n_writedate }</td>
											<td id="hit">${notice.n_hit }</td>
											<td>${notice.n_filename }</td> <!-- 있으면 아이콘으로 교체?  -->	
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- 공지사항 조회할 때 넘어갈 폼값. -->
							<form action="userNoticeRead.do" id="frm" method="post"> 
            					<input type="hidden" name="no" id="no">
            				</form>
							<br>
							<div id="paginationBox" class="pagination1" style="float: right;">
								<ul class="pagination">
									<c:if test="${pagination.prev}"> 
										<li class="page-item"><a class="page-link" href="#"	onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}', '${search.n_title}', '${search.n_category}')">이전</a></li>
									</c:if>
									<c:forEach begin="${pagination.startPage}" 
										end="${pagination.endPage}" var="NoticeNo">
										<li class="page-item <c:out value="${pagination.page == NoticeNo ? 'active' : ''}"/> ">
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<script>
	//고정게시글 색상변경 id값으로 고정값 비교. => '고정'이면 부모요소 tr에 배경색 부여
	if( $(".colorChanged").val() == '고정' ){
		$("input[value='고정']").parent().parent().css('background', '#FDF5E6');
	}

	// 검색창 항목들 초기화시킴
	 $("#clearbtn").on("click", function() {
		 $("#n_title").val("");
		 $("#n_category").val("");
	 });
	 

	// 공지사항 조회하기 (userNoticeRead)
	function userNoticeRead(str){
		frm.no.value = str;
		alert(frm.no.value);  // 값이 제대로 갔는지 체크
		frm.submit();
	};

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
	}

	function fn_pagination(page, range, rangeSize, listSize, n_title, n_category) {

		var url = "userNoticeList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&listSize=" + listSize;
		url = url + "&n_title=" + n_title;
		url = url + "&n_category=" + n_category;
		location.href = url;
	}

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
	}

	function page(Paging) {
		var startPage = Paging;
		var listSize = $("#listSize option:selected").val();

		if (listSize == 10) {
			var url = "userNoticeList.do?startPage=" + startPage
					+ "&listSize=" + listSize
		} else if (listSize == 15) {
			var url = "userNoticeList.do?startPage=" + startPage
					+ "&listSize=" + listSize
		} else if (listSize == 20) {
			var url = "userNoticeList.do?startPage=" + startPage
					+ "&listSize=" + listSize
		}
		location.href = url;
	}

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
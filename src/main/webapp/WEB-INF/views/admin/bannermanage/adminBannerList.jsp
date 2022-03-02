<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h3>배너 관리</h3>

	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">배너 목록</p>
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
							</select> 
							<button type="button" id="insertbtn" name="insertbtn" onclick="location.href='adminBannerInsertForm.do'">등록</button>
							<br> <br>
							<table class="table table-hover text-nowrap" id="membertable">
								<thead>
									<tr>
										<th>배너명</th>
										<th>파일명</th>
										<th>주제</th>
										<th>내용</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${banner }" var="banner">
										<tr>
											<td>${banner.bn_name }</td>
											<td>${banner.bn_filename }</td>
											<td>${banner.bn_title }</td>
											<td>${banner.bn_subject }</td>
											<td><button type="button" class="managebtn"
													id="managebtn" onclick="location.href='adminBannerDetail.do?bn_no=${banner.bn_no}';">관리</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br>
							<div id="paginationBox" class="pagination1">
								<ul class="pagination">
									<c:if test="${pagination.prev}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}')">이전</a></li>
									</c:if>
									<c:forEach begin="${pagination.startPage}"
										end="${pagination.endPage}" var="BannerNo">
										<li
											class="page-item <c:out value="${pagination.page == BannerNo ? 'active' : ''}"/> ">
											<a class="page-link" href="#"
											onClick="fn_pagination('${BannerNo}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}')">
												${BannerNo} </a>
										</li>
									</c:forEach>
									<c:if test="${pagination.next}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}')">다음</a></li>
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
		function fn_prev(page, range, rangeSize, listSize) {

			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;

			var url = "adminBannerList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			location.href = url;
		}

		function fn_pagination(page, range, rangeSize, listSize) {

			var url = "adminBannerList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			location.href = url;
		}

		function fn_next(page, range, rangeSize, listSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "adminBannerList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			location.href = url;
		}

		function page(Paging) {
			var startPage = Paging;
			var listSize = $("#listSize option:selected").val();

			if (listSize == 10) {
				var url = "adminBannerList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			} else if (listSize == 15) {
				var url = "adminBannerList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			} else if (listSize == 20) {
				var url = "adminBannerList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			}
			location.href = url;
		}
	</script>

</body>
</html>
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

#managebtn {
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
	height: 30px;
	width: 65px;
}

#deletebtn {
	background-color: #EB4646;
	color: white;
	border: none;
	border-radius: 4px;
	height: 30px;
	width: 65px;
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

#banneraddbtn {
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
	height: 30px;
	width: 90px;
}
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>배너 관리</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">
							배너 목록
							<button type="button" class="minusbtn" id="minusbtn1">
								<i id="minusicon1" class="fa fa-minus"></i>
							</button>
						</p>
					</div>
				</div>
			</div>
			<div class="row" id="maindiv1">
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
							<button type="button" id="banneraddbtn" name="insertbtn"
								onclick="location.href='adminBannerInsertForm.do'"
								style="float: right;">배너 등록</button>
							<br>
							<br>
							<table class="table table-hover text-nowrap" id="membertable">
								<thead>
									<tr>
										<th>배너명</th>
										<th>파일명</th>
										<th>주제</th>
										<th>내용</th>
										<th style="width: 150px;">관리</th>
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
													id="managebtn"
													onclick="location.href='adminBannerDetail.do?bn_no=${banner.bn_no}';">수정</button>
												<button type="button" class="deletebtn" id="deletebtn"
													onclick="deleteFnc('${banner.bn_no}');">삭제</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br>
							<div id="paginationBox" class="pagination1" style="float: right;">
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
	<br>

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

		function deleteFnc(bn_no) {
			if (confirm("정말 삭제하시겠습니까?") == true) {

				$.ajax({
					url : "adminDeleteBanner.do",
					type : "post",
					data : {
						bn_no : bn_no
					},
					dataType : "json",
					success : function(data) {
						console.log("삭제가 완료되었습니다.");
						location.reload();
					},
					error : function(data) {
						console.log("오류가 발생하였습니다. 관리자에게 문의해주세요.");
						location.reload();
					}

				});
			} else {
				return;
			}
		}
	</script>
</body>
</html>
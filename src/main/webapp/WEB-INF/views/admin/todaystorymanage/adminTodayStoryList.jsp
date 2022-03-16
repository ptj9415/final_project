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
textarea {
	resize: none;
}

.maintitle {
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

#todaystorytable {
	text-align: center;
}

#todaystorytable {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

#todaystorytable>thead>tr>th {
	background-color: rgb(245, 245, 245);
}

#submit-btn {
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
	float: right;
}

#updatesubmit-btn {
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
}

#deletesubmit-btn {
	background-color: #EB4646;
	color: white;
	border: none;
	border-radius: 4px;
}
</style>
</head>
<body>
	<!-- 등록 모달 시작 -->
	<div class="modal fade" id="modal-lg">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Today Story</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">오늘의 한마디 등록</h3>
						</div>
						<form id="frm" method="post">
							<div class="card-body">
								<div class="form-group">
									<label for="exampleInputEmail1">주제</label> <input type="text"
										style="height: 100px" class="form-control" id="sc_title"
										name="sc_title" placeholder="주제를 입력하세요..">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">글귀</label> <input
										type="text" style="height: 100px" class="form-control"
										id="sc_title" name="sc_subject" placeholder="글귀를 입력하세요..">
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="submit"
						name="submit">등록</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 등록 모달 끝 -->

	<section class="content">
		<div class="container-fluid">
			<br>
			<h3 class="maintitle">오늘의 한마디 관리</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">
							오늘의 한마디 목록
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
							</select> <span type="button" class="btn btn-default" id="submit-btn"
								data-toggle="modal" data-target="#modal-lg">등록</span> <br>
							<br>
							<table class="table text-nowrap" id="todaystorytable">
								<thead>
									<tr>
										<th>no</th>
										<th>주제</th>
										<th>글귀</th>
										<th style="width: 150px;">관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${adminTodayStoryList }"
										var="adminTodayStoryList">
										<tr>
											<td style="vertical-align: middle;">${adminTodayStoryList.sc_no }</td>
											<td style="vertical-align: middle;">${adminTodayStoryList.sc_title }</td>
											<td style="vertical-align: middle;">${adminTodayStoryList.sc_subject }</td>
											<td><span type="button" class="btn btn-default"
												id="updatesubmit-btn" data-toggle="modal"
												onclick="updateFnc(${adminTodayStoryList.sc_no})">수정</span>
												<span type="button" class="btn btn-default"
												id="deletesubmit-btn"
												onclick="deleteFnc('${adminTodayStoryList.sc_no}')">삭제</span>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<!-- 수정 모달 시작 -->
							<div class="modal fade" id="updatemodal-lg" style="display: none">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">Today Story</h4>
											<button type="button" class="close" data-dismiss="modal"
												id="area-hidden" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<div class="card card-primary">
												<div class="card-header">
													<h3 class="card-title">오늘의 한마디 수정</h3>
												</div>
												<form id="updateFrm" method="post">
													<div class="card-body">
														<div class="form-group">
															<label for="exampleInputEmail1">주제</label>
															<textarea type="text" style="height: 100px"
																class="form-control" id="sc_title" name="sc_title"> ${adminTodayStorySelect.sc_title }
														</textarea>
														</div>
														<div class="form-group">
															<label for="exampleInputPassword1">글귀</label>
															<textarea type="text" style="height: 100px"
																class="form-control" id="sc_subject" name="sc_subject">${adminTodayStorySelect.sc_subject }
															</textarea>

															<input type="hidden" style="height: 100px"
																class="form-control" id="sc_no" name="sc_no">
														</div>
													</div>
												</form>
											</div>
										</div>
										<div class="modal-footer justify-content-between">
											<button type="button" class="btn btn-default" id="close-btn"
												data-dismiss="modal">닫기</button>
											<button type="button" class="btn btn-primary"
												id="updateSubmit" name="updateSubmit">수정</button>
										</div>
									</div>
								</div>
							</div>
							<!-- 수정 모달 끝 -->
							<br>
							
						<!-- 페이징 -->
						<div id="paginationBox" class="pagination1" style="float: right;">
								<ul class="pagination">
									<c:if test="${pagination.prev}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}')">이전</a></li>
									</c:if>
									<c:forEach begin="${pagination.startPage}"
										end="${pagination.endPage}" var="StoryNo">
										<li
											class="page-item <c:out value="${pagination.page == StoryNo ? 'active' : ''}"/> ">
											<a class="page-link" href="#"
											onClick="fn_pagination('${StoryNo}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}')">
												${StoryNo} </a>
										</li>
									</c:forEach>
									<c:if test="${pagination.next}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}')">다음</a></li>
									</c:if>
								</ul>
							</div>
						<!-- 페이징 end -->
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

			var url = "adminTodayStoryList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			location.href = url;
		}

		function fn_pagination(page, range, rangeSize, listSize) {

			var url = "adminTodayStoryList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			location.href = url;
		}

		function fn_next(page, range, rangeSize, listSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "adminTodayStoryList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			location.href = url;
		}

		function page(Paging) {
			var startPage = Paging;
			var listSize = $("#listSize option:selected").val();

			if (listSize == 10) {
				var url = "adminTodayStoryList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			} else if (listSize == 15) {
				var url = "adminTodayStoryList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			} else if (listSize == 20) {
				var url = "adminTodayStoryList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			}
			location.href = url;
		}

		//글 등록 제출
		$(function() {
			$("#submit").click(function() {
				frm.action = "adminTodayStoryRegister.do";
				frm.submit();

			});

		});

		//삭제
		function deleteFnc(sc_no) {
			if (confirm("정말 삭제하시겠습니까?") == true) {
				$.ajax({
					url : 'adminTodayStoryDelete.do',
					data : {sc_no : sc_no},
					dataType : "text",
					success : function(responseText) {
						console.log(responseText);
						alert("삭제가 완료되었습니다.");
						location.href = "adminTodayStoryList.do";
					},
					error : function() {
						alert("error! 관리자에게 문의하세요");
					}
				});
			} else {
				return;
			}
		}
		
		//수정 
		$(function(){
			$("#updateSubmit").click(function(){
				
				updateFrm.action="adminTodayStoryUpdate.do";
				updateFrm.submit();
				alert("수정이 완료되었습니다.");
			});
		});
		
	
		//수정테스트
		function updateFnc(sc_no) {	
			let textarea3 = document.querySelectorAll('#sc_no')[0];
			textarea3.value = sc_no;			
			
			let textarea = document.querySelectorAll('#sc_title')[2];
			let title = event.target.closest('tr').childNodes[3].innerHTML;
			textarea.value = title;
			alert(title)
			
			let textarea2 = document.querySelectorAll('#sc_subject')[0];
			
			let subject = event.target.closest('tr').childNodes[3].innerHTML;
			textarea2.value = subject; 	
			
			$.ajax({
				url : 'adminTodayStoryUpdateForm.do',

				data : {sc_no : sc_no},
				dataType : "text",
				success : function(responseText) {
					console.log(responseText);
				/* 	$('#updatemodal-lg').attr('data-target','#updatemodal-lg'); */
					 $("#updatemodal-lg").attr("class", "modal fade show");
					$("#updatemodal-lg").attr("style", "display:block");					
				},
				error : function() {
					alert("error! 관리자에게 문의하세요");
					location.href = "adminTodayStory.do";
				}

			});
			
		}					
		document.getElementById('area-hidden').onclick = function(){
			$("#updatemodal-lg").fadeOut();
		} 
		document.getElementById('close-btn').onclick = function(){
			$("#updatemodal-lg").fadeOut();
		} 
	</script>
</body>
</body>
</html>
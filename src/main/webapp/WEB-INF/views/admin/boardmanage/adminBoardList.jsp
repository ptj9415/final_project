<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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

#boardTable {
	text-align: center;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.button:hover {
	background-color: skyblue;
	color: white;
}

.button {
	margin-left: 20px;
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	border: 1px solid skyblue;
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

}

.button:hover {
	background-color: skyblue;
	color: white;
}

.button {
	margin-left: 20px;
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	border: 1px solid skyblue;
}

.color:hover {
	background: linear-gradient(to left, #BEAEE2, #F7DBF0);
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

select option[value=""][disabled] {
	display: none;
}
}
</style>
</head>
<body class="hold-transition sidebar-mini">

	<div style="border: 1px solid; width: 1400px; padding-bottom: 10px; padding-top: 10px; margin-bottom: 10px">검색</div>
		<form name="search">
			<table>
				<tbody>
					<tr>
						<th width="200px">작성자</th>
						<td><input type="text" class="filterinput" name="b_email"
							id="b_email" style="width: 550px" placeholder="입력하세요."></td>

						<th width="200px">주제</th>
						<td><select id="select2" style="width: 550px" class="subject">
								<option value="" disabled selected>선택</option>
								<option>연애</option>
								<option>취업/진로</option>
								<option>직장</option>
								<option>성추행</option>
								<option>육아</option>
								<option>대인관계</option>
								<option>외모</option>
								<option>가족</option>
								<option>학업/고시</option>
								<option>금전/사업</option>
								<option>성생활</option>
								<option>이별/이혼</option>
								<option>중독</option>
								<option>성소수자</option>
								<option>자아/성격</option>
								<option>해외생활</option>
								<option>우울/불안</option>
						</select></td>
					</tr>
					<tr>
						<th width="200px">제목</th>
						<td><input type="text" class="filterinput" name="b_title"
							id="b_title" style="width: 550px" placeholder="입력하세요."></td>
						<th width="200px">작성일</th>
						<td><input type="date" class="filterinput" name="b_wdate"
							id="b_wdate" style="width: 550px"></td>

					</tr>
				</tbody>
			</table>
			<br>
			<button type="button" name="submit" id="submit" onclick="clickFnc()"
				style="float: right">검색</button>
			<button type="reset" name="replace" id="replace" style="float: right">초기화</button>
		</form>


		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12 offset-md-0">
						<div class="card">
							<p id="headerp">자유게시판 관리</p>
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
								</select> <br> <br>
								<table class="table table-hover text-nowrap" id="boardTable">
									<thead>
										<tr>
											<th style="width: 150px">작성자</th>
											<th style="width: 150px">주제</th>
											<th style="width: 500px">제목</th>
											<th style="width: 300px">작성일</th>
											<th style="width: 250px">관리</th>
										</tr>
									</thead>
									<tbody id="dbtbody">
										<c:forEach items="${board}" var="board">
											<tr class="color"
												onclick="location.href='adminBoardRead.do?b_no=${board.b_no}';">
												<td>${board.c_name}</td>
												<td>${board.b_subject}</td>
												<td>${board.b_title}</td>
												<td>${board.b_wdate}</td>
												<!-- 삭제 부분은 클릭 안되게  -->
												<td onclick="event.cancelBubble=true;">
													<button type="button" name="delete" id="delete" class="button"
														onclick="deleteFnc('${board.b_no}')">삭제</button></td>
												</td>
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
											end="${pagination.endPage}" var="boardNo">

											<li
												class="page-item <c:out value="${pagination.page == faqNo ? 'active' : ''}"/> ">
												<a class="page-link" href="#"
												onClick="fn_pagination('${boardNo}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}')">
													${boardNo} </a>
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

			var url = "adminBoardList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			location.href = url;
		}

		function fn_pagination(page, range, rangeSize, listSize) {

			var url = "adminBoardList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			location.href = url;
		}

		function fn_next(page, range, rangeSize, listSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "adminBoardList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			location.href = url;
		}

		function page(Paging) {
			var startPage = Paging;
			var listSize = $("#listSize option:selected").val();

			if (listSize == 10) {
				var url = "adminBoardList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			} else if (listSize == 15) {
				var url = "adminBoardList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			} else if (listSize == 20) {
				var url = "adminBoardList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			}
			location.href = url;
		}


		
		
		// 삭제 (디자인적용)
		function deleteFnc(b_no){
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
	              //"삭제" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
				$.ajax({
					url : "boardDelete.do",
					type : "post",
					data : {
						b_no : b_no
					},
					dataType : "text",
					success : function() {
						location.href = "adminBoardList.do";
					},
					error : function() {
						alert("삭제 실패")
					}
				})
			  }
			})
		}
		
		// 검색
		function clickFnc() {
			var b_email = $('#b_email').val();
			var wdate = $('#b_wdate').val();
			var b_title = $('#b_title').val();
			var b_subject = $('.subject').val();
			
			console.log(b_email);
			console.log(b_title);
			console.log(b_subject);
			console.log(wdate);
			if(wdate != "") {
			var a = wdate.substr(2,2);
			var b = wdate.substr(5,2);
			var c = wdate.substr(8,2);
			var b_wdate = a + "-" + b + "-" + c;
			} else {
				var b_wdate = "null";
			}
			
			if(b_subject == null) {
				console.log('null');
			}
			console.log(b_wdate);
			$.ajax({
				url : "boardSearch.do",
				type : "get",
				data : {b_email : b_email , b_subject : b_subject, b_title : b_title, b_wdate : b_wdate},
				dataType : "json",
				success : function(data) {
					for(datas of data) {
						console.log(datas.b_email);
						console.log(datas.b_wdate);
						console.log(datas.b_title);
						console.log(datas.b_subject);
					}
				},
				error : function() {
					alert('오류입니다');
				}
			});
		}
		
		// select 2
		$(document).ready(function() { 
			$("#select2").select2(); 
		});
		
		$('#replace').on('click', function() {
			$('.subject').select2('val', '선택');
		});
	</script>
</body>
</html>
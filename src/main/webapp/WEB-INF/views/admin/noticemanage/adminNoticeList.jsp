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
#readTd:hover{
	cursor: pointer;
}

#membertable {
	text-align: center;
}

#membertable {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

#managebtn {
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
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
}

.minusbtn {
	float: right;
	background-color: transparent;
	border: none;
	margin-right: 15px;
}
.noticeBtn {
	float: right;
}
</style>
<script>
// 검색창 항목들 초기화시킴
$(document).ready(function(){
	 $("#clearbtn").on("click", function() {
		 $("#n_title").val("");
		 $("#n_category").val("");
	 });
 
});
</script>
</head>
<body class="hold-transition sidebar-mini">
	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>공지사항 관리</h3>
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
											class="form-control" id="n_title"
											placeholder="제목을 입력해주세요.">
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label>말머리</label> <select class="status" id="n_category">
											<option value="all">전체</option>
											<option value="긴급">긴급</option>
											<option value="이벤트">이벤트</option>
											<option value="공지">공지</option>											
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
					<div class="card" id="headerdiv">
						<p id="headerp">
							공지사항 목록
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
							</select>
							<div class="noticeBtn">
								 <button id="allDelete" >일괄 삭제</button>
	              			     <button onclick="location.href='adminNoticeForm.do'">공지사항 작성</button>
							</div>
							 <br> <br>
							<table class="table table-hover text-nowrap" id="membertable">
								<thead>
									<tr>
										<th><input type="checkbox"  id="allCheck"/></th>
										<th>작성자</th>
										<th>말머리</th>
										<th>제목</th>
										<th>작성일</th>
										<th>고정여부</th>
										<th>관리</th>
										<th>고정게시물 설정</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${notice }" var="notice">
										<tr>
										<td><input type="checkbox"  name="check" data-partNum="${notice.n_no }"></td>
										<td>${notice.n_writer }</td>
										<td>${notice.n_category }</td>
										<td id="readTd" onclick="noticeRead(${notice.n_no})">${notice.n_title }</td>
										<td>${notice.n_writedate }</td>
										<td id="status">${notice.n_status }</td>
										<td>
											<button type="button" onclick="noticeUpdate('${notice.n_no}')">수정</button>
											<button type="button" onclick="noticeDelete('${notice.n_no}')">삭제</button>
										</td>											
											<td>
												<button type="button" class="managebtn"	id="statusBtn" onclick="statusBtn('${notice.n_no}' , '${notice.n_status }')">
													<c:if test="${notice.n_status == '고정'}">고정 취소</c:if>
													<c:if test="${notice.n_status != '고정'}">고정 등록</c:if>
												</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- 공지사항 조회할 때 넘어갈 폼값. -->
							<form action="noticeRead.do" id="frm" method="post"> 
            					<input type="hidden" name="no" id="no">
            				</form>
            				<!-- 공지사항 수정할 때 넘어갈 폼값 -->
            				<form action="noticeUpdate.do" id="frm2" method="post"> 
            					<input type="hidden" name="updateNo" id="updateNo">
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
	
		// 공지사항 고정 처리. ajax처리. 글번호와 고정상태 두 값을 매개변수로 보낸다.
		function statusBtn(num, status){
				var statusNum = num; 
				var statusVal = status;
				alert("글번호: " + statusNum + ", 고정상태: " + statusVal);
				$.ajax({
					url: "statusUpdate.do",
					data: {
						statusNum : statusNum,
						statusVal : statusVal
					},
					dataType: "text",
					success: function(responseText){
						if(responseText == "YES"){  // 성공한 경우.
							alert("처리완료");
							location.reload();
						}
						
					} // success문
					
				}); // ajax끝
				
		}
		
	
		// 체크박스 전체 선택/해제
		$("#allCheck").on("click", function() {
			if($("#allCheck").prop("checked")) {
				$("input[name='check']").prop("checked", true);
			} else {
				$("input[name='check']").prop("checked", false);
			}
		});	
		
		// 체크박스 하나라도 체크해제 => allCheck버튼도 해제되도록.
		$("input[name='check']").on("click", function() {
			$("#allCheck").prop("checked", false);
		});
		
		
		// 공지사항 조회하기 (noticeRead)
		function noticeRead(str){
			frm.no.value = str;
			alert(frm.no.value);  // 값이 제대로 갔는지 체크
			frm.submit();
		};
		
		// 공지사항 수정하기 (noticeUpdate)
		function noticeUpdate(str) {
			frm2.updateNo.value = str;
			alert(frm2.updateNo.value);  // 대상이 맞는지 체크.
			frm2.submit();
		};
		
		// 공지사항 삭제하기. ajax로 처리
		function noticeDelete(str) {
			var deleteNum = str;
			$.ajax({
				url: "noticeDelete.do",
				data: {
					deleteNum : deleteNum
				},
				type: "POST",
				dataType: "text",
				success: function(responseText){
					if(responseText == "YES"){
						alert("정상적으로 삭제되었습니다.");
						location.reload();
					} 
				}
			});  //ajax끝
		};
		
		//선택삭제 구현
		$("#allDelete").on("click", function() {
			var confirmCheck = confirm("선택하신 것을 모두 삭제하시겠습니까?");
			
			if(confirmCheck){
				var checkAry = new Array();   // 체크한 것을 담을 리스트변수 선언.
				
				$("input[name='check']:checked").each(function(){
					checkAry.push($(this).attr("data-partNum"));    // 체크했던 것들을 리스트 변수 checkAry에 모두 담는다.
				});
				
				//이제 ajax처리를 통해 삭제시킨다. 
				$.ajax({
					url: "ajaxCheckDelete.do",
					type: "post",
					data: {  sendCheck : checkAry},
					success: function(responseText){
						
						if(responseText == 1) {
							alert("삭제되었습니다.");
							location.href = 'adminNoticeList.do';
						} else {
							alert("삭제실패");
						}
					}
				});  //ajax끝
			}
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

		function fn_prev(page, range, rangeSize, listSize, n_title, n_category) {

			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;

			var url = "adminNoticeList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&listSize=" + listSize;
			url = url + "&n_title=" + n_title;
			url = url + "&n_category=" + n_category;
			location.href = url;
		}

		function fn_pagination(page, range, rangeSize, listSize, n_title, n_category) {

			var url = "adminNoticeList.do";
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
			var url = "adminNoticeList.do";
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
				var url = "adminNoticeList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			} else if (listSize == 15) {
				var url = "adminNoticeList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			} else if (listSize == 20) {
				var url = "adminNoticeList.do?startPage=" + startPage
						+ "&listSize=" + listSize
			}
			location.href = url;
		}

		$(document).on('click', '#btnSearch', function(e) {
			e.preventDefault();

			var url = "adminNoticeList.do";
			url = url + "?n_title=" + $('#n_title').val();
			url = url + "&n_category=" + $('#n_category').val();
			location.href = url;

		});
	</script>
</body>
</html>
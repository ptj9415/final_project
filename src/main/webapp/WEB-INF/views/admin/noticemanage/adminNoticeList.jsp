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

#readTd:hover {
	cursor: pointer;
}

#membertable {
	text-align: center;
}

#membertable {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

#membertable>thead>tr {
	background-color: rgb(245, 245, 245);
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
	font-size: 16px;
	font-weight: 600;
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

#deleteallbtn, #deletebtn {
	background-color: #EB4646;
	color: white;
	border: none;
	border-radius: 4px;
	height: 30px;
}

#noticeaddbtn, #updatebtn {
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
	height: 30px;
}

#statusBtn {
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
	height: 30px;
}

</style>
<script>
// ????????? ????????? ???????????????
$(document).ready(function(){
	 $("#clearbtn").on("click", function() {
		 $("#n_title").val("");
		 $("#n_category").val("all");
	 });
 
});
</script>
</head>
<body class="hold-transition sidebar-mini">
	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>???????????? ??????</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">
							??????
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
										<label>??????</label> <br> <input type="text"
											class="form-control" id="n_title" placeholder="????????? ??????????????????.">
									</div>
								</div>
								<div class="col-6">
									<div class="form-group">
										<label>?????????</label> <select class="status" id="n_category">
											<option value="all">??????</option>
											<option value="??????">??????</option>
											<option value="?????????">?????????</option>
											<option value="??????">??????</option>
										</select>
									</div>
								</div>
							</div>
							<div class="btndiv">
								<button type="reset" id="clearbtn">?????????</button>
								<button type="button" id="btnSearch">
									??????&nbsp;<i class="fa fa-search"></i>
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
							???????????? ??????
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
									<span>(??? ${pagination.listCnt }??? ??? ${pagination.start }
										~ ${pagination.listCnt }???)</span>
								</c:when>
								<c:otherwise>
									<span>(??? ${pagination.listCnt }??? ??? ${pagination.start }
										~ ${pagination.end }???)</span>
								</c:otherwise>
							</c:choose>
							&nbsp;&nbsp;&nbsp;<select class="paging" name="searchType"
								id="listSize" onchange="page(1)">
								<option value="10"
									<c:if test="${pagination.getListSize() == 10 }">selected="selected"</c:if>>10???
									??????</option>
								<option value="15"
									<c:if test="${pagination.getListSize() == 15 }">selected="selected"</c:if>>15???
									??????</option>
								<option value="20"
									<c:if test="${pagination.getListSize() == 20 }">selected="selected"</c:if>>20???
									??????</option>
							</select>
							<div class="noticeBtn">
								<button id="deleteallbtn">?????? ??????</button>
								<button id="noticeaddbtn"
									onclick="location.href='adminNoticeForm.do'">???????????? ??????</button>
							</div>
							<br> <br>
							<table class="table text-nowrap" id="membertable">
								<thead>
									<tr>
										<th><input type="checkbox" id="allCheck" /></th>
										<th>?????????</th>
										<th>?????????</th>
										<th>??????</th>
										<th>?????????</th>
										<th>????????????</th>
										<th>??????</th>
										<th>??????????????? ??????</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${notice }" var="notice">
										<tr>
											<td><input type="checkbox" name="check"
												data-partNum="${notice.n_no }"></td>
											<td>${notice.n_writer }</td>
											<td>${notice.n_category }</td>
											<td>${notice.n_title }</td>
											<td>${notice.n_writedate }</td>
											<td id="status">${notice.n_status }</td>
											<td>
												<button type="button" id="updatebtn"
													onclick="location.href='noticeUpdate.do?n_no=${notice.n_no}'">??????</button>
												<button type="button" id="deletebtn"
													onclick="noticeDelete('${notice.n_no}')">??????</button>
											</td>
											<td>
												<button type="button" class="managebtn" id="statusBtn"
													onclick="statusBtn('${notice.n_no}' , '${notice.n_status }')">
													<c:if test="${notice.n_status == '??????'}">?????? ??????</c:if>
													<c:if test="${notice.n_status != '??????'}">?????? ??????</c:if>
												</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br>
							<div id="paginationBox" class="pagination1" style="float: right;">
								<ul class="pagination">
									<c:if test="${pagination.prev}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}', '${search.n_title}', '${search.n_category}')">??????</a></li>
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
											onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}' ,'${search.n_title}', '${search.n_category}')">??????</a></li>
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
	
		// ???????????? ?????? ??????. ajax??????. ???????????? ???????????? ??? ?????? ??????????????? ?????????.
		function statusBtn(num, status){
				var statusNum = num; 
				var statusVal = status;
				$.ajax({
					url: "statusUpdate.do",
					data: {
						statusNum : statusNum,
						statusVal : statusVal
					},
					dataType: "text",
					success: function(responseText){
						if(responseText == "YES"){  // ????????? ??????.
							alert("????????????");	
							location.reload();
						}
						
					} // success???
					
				}); // ajax???
				
		}
		
	
		// ???????????? ?????? ??????/??????
		$("#allCheck").on("click", function() {
			if($("#allCheck").prop("checked")) {
				$("input[name='check']").prop("checked", true);
			} else {
				$("input[name='check']").prop("checked", false);
			}
		});	
		
		// ???????????? ???????????? ???????????? => allCheck????????? ???????????????.
		$("input[name='check']").on("click", function() {
			$("#allCheck").prop("checked", false);
		});

		
		// ???????????? ????????????. ajax??? ??????
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
						alert("??????????????? ?????????????????????.");
						location.reload();
					} 
				}
			});  //ajax???
		};
		
		//???????????? ??????
		$("#deleteallbtn").on("click", function() {
			var confirmCheck = confirm("???????????? ?????? ?????? ?????????????????????????");
			
			if(confirmCheck){
				var checkAry = new Array();   // ????????? ?????? ?????? ??????????????? ??????.
				
				$("input[name='check']:checked").each(function(){
					checkAry.push($(this).attr("data-partNum"));    // ???????????? ????????? ????????? ?????? checkAry??? ?????? ?????????.
				});
				
				//?????? ajax????????? ?????? ???????????????. 
				$.ajax({
					url: "ajaxCheckDelete.do",
					type: "post",
					data: {  sendCheck : checkAry},
					success: function(responseText){
						
						if(responseText == 1) {
							alert("?????????????????????.");
							location.href = 'adminNoticeList.do';
						} else {
							alert("????????????");
						}
					}
				});  //ajax???
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
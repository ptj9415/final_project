<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
	font-weight: 600;
}

#boardtable>tbody>tr {
	border-bottom: 0.5px solid rgb(222, 226, 230);
}

#boardtable>tbody>tr>th {
	width: 13%;
	background-color: rgb(245, 245, 245);
	text-align: center;
	vertical-align: middle;
}

#deletebtn {
	background-color: #EB4646;
	color: white;
	border: none;
	border-radius: 4px;
	height: 35px;
	float: right;
}

#deletebtn:hover {
	background-color: white;
	color: #EB4646;
	border: 1px solid #EB4646;
	border-radius: 4px;
	height: 35px;
	float: right;
	transition: 300ms ease-in-out;
}

#updatebtn {
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
	height: 35px;
	float: right;
	width: 120px;
	margin-right: 10px;
}

#updatebtn:hover {
	background-color: white;
	color: #1E90FF;
	border: 1px solid #1E90FF;
	border-radius: 4px;
	height: 35px;
	float: right;
	transition: 300ms ease-in-out;
	width: 120px;
	margin-right: 10px;
}

#backbtn {
	background-color: white;
	color: #EB4646;
	border: 1px solid #EB4646;
	border-radius: 4px;
	height: 35px;
	float: left;
	margin-right: 10px;
}

#backbtn:hover {
	background-color: #EB4646;
	color: white;
	border-radius: 4px;
	height: 35px;
	float: left;
	margin-right: 10px;
	transition: 300ms ease-in-out;
}

#updatesubmit-btn{
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
	height: 35px;
	float: right;
	width: 124px;
	margin-right: 10px;
}

#updatesubmit-btn:hover{
	background-color: white;
	color: #1E90FF;
	border: 1px solid #1E90FF;
	border-radius: 4px;
	height: 35px;
	float: right;
	transition: 300ms ease-in-out;
	width: 124px;
	margin-right: 10px;
}

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
	font-weight: 600;
}

.minusbtn {
	float: right;
	background-color: transparent;
	border: none;
	margin-right: 15px;
}

table>tbody>tr>th {
	text-align: center;
}

#coupontable>tbody>tr>td {
	text-align: center;
}

#infotable>tbody>tr {
	border-bottom: 0.5px solid rgb(222, 226, 230);
}

#infotable>tbody>tr>th, #coupontable>tbody>tr>th, #counseltable>tbody>tr>th
	{
	width: 15%;
	background-color: rgb(245, 245, 245);
}

#infotable>tbody>tr>td {
	width: 35%;
}

#infosubmitbtn {
	float: right;
	width: 80px;
	height: 30px;
	font-size: 14px;
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
}

#siteback {
	float: right;
	width: 80px;
	height: 30px;
	font-size: 14px;
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
}

.infotext {
	width: 200px;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}
.text-area{
	height: 214px;
    width: 600px;
    border: none;
    resize: none;
}
.text-area:focus{
	outline:0;
}
.table td, .table th{
	vertical-align:inherit;
}
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>???????????? ????????????</h3>
			<br>

			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">
							???????????? ??????
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
						<form method="post" id="form">
							<div class="card-body table-responsive p-00">
								<table class="table text-nowrap" id="infotable">
									<tr>
										<th>?????????</th>
										<td>${counselDetail.m_nickname }</td>

										<th>??????</th>
										<c:if test="${counselDetail.pr_status eq 0}">
											<td>????????????</td>
										</c:if>
										<c:if test="${counselDetail.pr_status eq 1}">
											<td>????????????</td>
										</c:if>
										<c:if test="${counselDetail.pr_status eq 2}">
											<td>????????????</td>
										</c:if>
									</tr>
									<tr>

										<th>?????????</th>
										<td>${counselDetail.m_email }</td>

										<th>????????????</th>
										<td>${counselDetail.pr_type }</td>
									</tr>
									<tr>

										<th>?????????</th>
										<td>????????? ???????????? ????????????</td>

										<th>?????? ??????</th>
										<td>${counselDetail.ccg_subname }</td>
									</tr>
									<tr>

										<th>?????????</th>
										<td>${counselDetail.pr_date}${counselDetail.pr_time}</td>
									</tr>
								</table>
								<input type="hidden" id="m_email" name="m_email"
									value="${counselDetail.m_email }"> <input type="hidden"
									id="c_email" name="c_email" value="${counselDetail.c_email }">
								<br>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="content">
		<div class="container-fluid">

			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">
							?????? ??????
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
						<form method="post" id="form">
							<div class="card-body table-responsive p-00">
								<table class="table text-nowrap" id="infotable">
									<tr>
										<th>????????????</th>
										<td style="width:80%;"><textarea readonly class="text-area">${counselDetail.pc_report}</textarea></td>

										
									</tr>
									<tr>

										<th>????????????</th>
										<td style="width:80%;"><textarea readonly class="text-area">${counselDetail.pc_result }</textarea></td>

										
									</tr>
								
								</table>
								
								<br>
							<div class="btndiv">
								<button type="button"
									onclick="deleteFnc('${counselDetail.pr_no}')" id="deletebtn">??????</button>
								<span type="button" class="btn btn-default"
									id="updatesubmit-btn" data-toggle="modal"
									onclick="updateFnc(${counselDetail.pr_no})">??????????????????</span>
								<button type="button" id="backbtn"
									onclick="location.href='counselorPersonalList.do'">????????????</button>
							</div>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%-- <section>
		<div>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">????????????</p>
					</div>
				</div>
			</div>
			<div class="row" id="maindiv1">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<table class="table text-nowrap" id="boardtable">

								<tr>
									<th style="height: 250px;">????????????</th>
									<td colspan="5"><textarea readonly class="text-area">${counselDetail.pc_report}</textarea></td>
								</tr>
								<tr>
									<th style="height: 250px;">????????????</th>
									<td colspan="5"><textarea readonly class="text-area">${counselDetail.pc_result }</textarea></td>
								</tr>
							</table>
							<br>
							<div class="btndiv">
								<button type="button"
									onclick="deleteFnc('${counselDetail.pr_no}')" id="deletebtn">??????</button>
								<span type="button" class="btn btn-default"
									id="updatesubmit-btn" data-toggle="modal"
									onclick="updateFnc(${counselDetail.pr_no})">??????????????????</span>
								<button type="button" id="backbtn"
									onclick="location.href='counselorPersonalList.do'">????????????</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

 --%>
	<!-- ?????? ?????? ?????? -->
	<div class="modal fade" id="updatemodal-lg" style="display: none">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">????????????</h4>
					<button type="button" class="close" data-dismiss="modal"
						id="area-hidden" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">?????????????????? ??????</h3>
						</div>
						<form id="updateFrm" method="post">
							<div class="card-body">
								<div class="form-group">
									<label for="exampleInputEmail1">????????????</label>
									<textarea type="text" style="height: 100px"
										class="form-control" id="pc_report" name="pc_report"> ${counselDetail.pc_report }
														</textarea>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">????????????</label>
									<textarea type="text" style="height: 100px"
										class="form-control" id="pc_result" name="pc_result">${counselDetail.pc_result }
									</textarea>

									<input type="hidden" style="height: 100px" class="form-control"
										id="pr_no" name="pr_no">
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" id="close-btn"
						data-dismiss="modal">??????</button>
					<button type="button" class="btn btn-primary" id="updateSubmit"
						name="updateSubmit">??????</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ?????? ?????? ??? -->


	<script>
	
	function deleteFnc(pr_no) {
		if (confirm("?????? ?????????????????????????") == true) {
			$.ajax({
				url : 'personalCounselDelete.do',
				data : {pr_no : pr_no},
				dataType : "text",
				success : function(responseText) {
					console.log(responseText);
					alert("????????? ?????????????????????.");
					location.href = "counselorPersonalList.do";
				},
				error : function() {
					alert("error! ??????????????? ???????????????");
				}
			});
		} else {
			return;
		}
	}
	
	
	 //?????? 
	$(function(){
		$("#updateSubmit").click(function(){
			
			updateFrm.action="PersonalCounselUpdate.do";
			updateFrm.submit();
			alert("????????? ?????????????????????.");
		});
	}); 
	

	//???????????????
	function updateFnc(pr_no) {	

		$.ajax({
			url : 'personalCounselUpdateForm.do',

			data : {pr_no : pr_no},
			dataType : "text",
			success : function(responseText) {
				//alert(responseText);
				$("#pr_no").val(responseText);
			/* 	$('#updatemodal-lg').attr('data-target','#updatemodal-lg'); */
				 $("#updatemodal-lg").attr("class", "modal fade show");
				$("#updatemodal-lg").attr("style", "display:block");					
			},
			error : function() {
				alert("error! ??????????????? ???????????????");
				location.href = "counselorPersonalList.do";
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
</html>
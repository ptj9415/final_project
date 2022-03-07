<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
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

#addtr {
	float: right;
	background-color: #1E90FF;
	color: white;
	border: none;
	border-radius: 4px;
	width: 85px;
	height: 30px;
}

#careertable {
	text-align: center;
	border-bottom: 0.5px solid rgb(222, 226, 230);
}

#careertable>tbody>tr>th {
	background-color: rgb(245, 245, 245);
}

#saveformbtn {
	float: right;
	width: 80px;
	height: 35px;
	border: none;
	border-radius: 5px;
	background-color: #1E90FF;
	color: white;
}

#backbtn {
	float: right;
	width: 80px;
	height: 35px;
	margin-right: 10px;
	border: 1px solid red;
	border-radius: 5px;
	background-color: white;
	color: red;
}

#deletetr{
	border: 1px solid #EB4646;
	border-radius: 5px;
	background-color: #EB4646;
	color: white;
	width: 60px;
	height: 30px;
}

#cc_status {
	width: 100px;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#subject {
	width: 500px;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
	
}
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>상담 경력 수정</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">상담 경력</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<button type="button" id="addtr" onclick="addtr();">경력 추가</button>
							<form id="saveform" name="saveform">
							<br><br>
								<table class="table text-nowrap" id="careertable">
									<tr>
										<th>구분</th>
										<th>경력사항</th>
										<th>삭제</th>
									</tr>
									<c:forEach items="${career }" var="career">
										<tr>
											<td><select id="cc_status" name="cc_status"
												class="cc_status">
													<option value="선택">선택</option>
													<option value="현재"
														<c:if test="${career.cc_status eq '현재' }">selected</c:if>>현재</option>
													<option value="과거"
														<c:if test="${career.cc_status eq '과거' }">selected</c:if>>과거</option>
											</select></td>
											<td><input type="text" id="subject" name="cc_subject"
												class="cc_subject" value="${career.cc_subject }"></td>
											<td>
												<button type="button" class="deletetr" id="deletetr"
													name="deletetr">삭제</button>
											</td>
										</tr>
									</c:forEach>
								</table>
								<input type="hidden" id="c_email" name="c_email"
									value="${counselor.c_email }">
							</form>
							<div class="btndiv">
								<button type="button" id="saveformbtn">수정</button>
								<button type="button" id="backbtn"
									onclick="location.href='counselorMyPageMain.do'">돌아가기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<script>
		function addtr() {
			var table = $('#careertable tr').length;
			var innerHtml = "";
			innerHtml += '<tr>';
			innerHtml += '<td><select id="cc_status" name="cc_status" class="cc_status"><option value="선택">선택</option><option value="현재">현재</option><option value="과거">과거</option></select></td>';
			innerHtml += '<td><input type="text" id="subject" name="cc_subject" class="cc_subject"></td>'
			innerHtml += '<td><button type="button" class="deletetr" id="deletetr" name="deletetr">삭제</button></td>';
			innerHtml += '</tr>';

			$('#careertable > tbody:last').append(innerHtml);
		}

		$(document).on('click', '.deletetr', deletetr);

		function deletetr(e) {
			var tr = $(e.target).parent().parent().remove();
		}

		$("#saveformbtn").click(function() {

			var cc_status = [];
			var cc_subject = [];
			$('.cc_status').each(function() {
				var status = $(this).val();
				cc_status.push(status);
			});

			$('.cc_subject').each(function() {
				var subject = $(this).val();
				cc_subject.push(subject);
			});

			console.log(cc_subject);
			console.log(cc_status);
			var list = new Array();

			for (var i = 0; i < cc_subject.length; i++) {
				var obj = new Object();
				obj.cc_subject = cc_subject[i];
				obj.cc_status = cc_status[i];
				list.push(obj);
			}

			var datalist = JSON.stringify(list);
			console.log(list);
			console.log(datalist);

			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url : "careerupdate.do",
				type : 'post',
				contentType : 'application/json; charset=UTF-8',
				dataType : "json",
				data : datalist,
				success : function() {
					alert("수정이 완료되었습니다.");
					location.reload();
				},
				error : function() {
					alert("수정이 완료되었습니다.");
					location.reload();
				}
			});

		});
	</script>
</body>
</html>
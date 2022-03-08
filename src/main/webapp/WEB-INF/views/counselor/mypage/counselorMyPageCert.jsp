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
	width: 120px;
	height: 30px;
}

#certtable {
	text-align: center;
	border-bottom: 0.5px solid rgb(222, 226, 230);
}

#certtable>tbody>tr>th {
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

#ccf_issueby, #ccf_name, #ccf_date {
	width: 200px;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>자격사항 수정</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">자격사항</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<button type="button" id="addtr" onclick="addtr();">자격사항
								추가</button>
							<form id="saveform" name="saveform">
								<br>
								<br>
								<table class="table text-nowrap" id="certtable">
									<tr>
										<th>자격사항</th>
										<th>발급기관</th>
										<th>발급일자</th>
										<th>삭제</th>
									</tr>
									<c:forEach items="${certification }" var="certification">
										<tr>
											<td><input type="text" id="ccf_name" name="ccf_name"
												class="ccf_name" value="${certification.ccf_name }"></td>
											<td><input type="text" id="ccf_issueby"
												name="ccf_issueby" class="ccf_issueby"
												value="${certification.ccf_issueby }"></td>
											<td><input type="date" id="ccf_date" name="ccf_date"
												class="ccf_date" value="${certification.ccf_date }"></td>
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
	<script>
		function addtr() {
			var table = $('#certtable tr').length;
			var innerHtml = "";
			innerHtml += '<tr>';
			innerHtml += '<td><input type="text" id="ccf_name" name="ccf_name" class="ccf_name"></td>';
			innerHtml += '<td><input type="text" id="ccf_issueby" name="ccf_issueby" class="ccf_issueby"></td>';
			innerHtml += '<td><input type="date" id="ccf_date" name="ccf_date" class="ccf_date"></td>';
			innerHtml += '<td><button type="button" class="deletetr" id="deletetr" name="deletetr">삭제</button></td>';
			innerHtml += '</tr>';

			$('#certtable > tbody:last').append(innerHtml);
		}

		$(document).on('click', '.deletetr', deletetr);

		function deletetr(e) {
			var tr = $(e.target).parent().parent().remove();
		}

		$("#saveformbtn").click(function() {

			var ccf_name = [];
			var ccf_issueby = [];
			var ccf_date = [];
			$('.ccf_name').each(function() {
				var name = $(this).val();
				ccf_name.push(name);
			});

			$('.ccf_issueby').each(function() {
				var issueby = $(this).val();
				ccf_issueby.push(issueby);
			});

			$('.ccf_date').each(function() {
				var date = $(this).val();
				ccf_date.push(date);
			});

			console.log(ccf_name);
			console.log(ccf_issueby);
			console.log(ccf_date);
			var list = new Array();

			for (var i = 0; i < ccf_name.length; i++) {
				var obj = new Object();
				obj.ccf_name = ccf_name[i];
				obj.ccf_issueby = ccf_issueby[i];
				obj.ccf_date = ccf_date[i];

				list.push(obj);
			}

			var datalist = JSON.stringify(list);
			console.log(list);
			console.log(datalist);

			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url : "certificationupdate.do",
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
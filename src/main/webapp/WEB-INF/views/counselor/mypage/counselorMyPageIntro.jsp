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

#introtable {
	text-align: center;
	border-bottom: 0.5px solid rgb(222, 226, 230);
}

#introtable>tbody>tr>th {
	background-color: rgb(245, 245, 245);
}

#introtable>tbody>tr>td {

	vertical-align: middle;
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

#ci_title {
	width: 200px;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

textarea {
	width: 500px;
	height: 160px;
	border: 0.5px solid rgb(210, 210, 210);
	resize: none;
}
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>소개글 수정</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">소개글</p>
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
								<br> <br>
								<table class="table text-nowrap" id="introtable">
									<tr>
										<th>제목</th>
										<th>내용</th>
										<th>삭제</th>
									</tr>
									<c:forEach items="${info }" var="info">
										<tr>
											<td><input type="text" id="ci_title" name="ci_title"
												class="ci_title" value="${info.ci_title }"></td>
											<td><textarea id="ci_subject" name="ci_subject"
													class="ci_subject">${info.ci_subject}</textarea></td>
											<td>
												<button type="button" class="deletetr" id="deletetr"
													name="deletetr">삭제</button>
											</td>
										</tr>
									</c:forEach>
								</table>
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
			var table = $('#introtable tr').length;

			if (table <= 3) {
				var innerHtml = "";
				innerHtml += '<tr>';
				innerHtml += '<td><input type="text" id="ci_title" name="ci_title" class="ci_title"></td>';
				innerHtml += '<td><textarea id="ci_subject" name="ci_subject" class="ci_subject"></textarea></td>';
				innerHtml += '<td><button type="button" class="deletetr" id="deletetr" name="deletetr">삭제</button></td>';
				innerHtml += '</tr>';

				$('#introtable > tbody:last').append(innerHtml);
			} else {
				alert('상담사 소개글은 최대 세 개 까지 작성할 수 있습니다.');
				return;
			}
		}

		$(document).on('click', '.deletetr', deletetr);

		function deletetr(e) {
			var tr = $(e.target).parent().parent().remove();
		}

		$("#saveformbtn").click(function() {

			var ci_title = [];
			var ci_subject = [];
			$('.ci_title').each(function() {
				var title = $(this).val();
				ci_title.push(title);
			});

			$('.ci_subject').each(function() {
				var subject = $(this).val();
				ci_subject.push(subject);
			});

			var list = new Array();

			for (var i = 0; i < ci_title.length; i++) {
				var obj = new Object();
				obj.ci_title = ci_title[i];
				obj.ci_subject = ci_subject[i];

				list.push(obj);
			}

			var datalist = JSON.stringify(list);
			console.log(list);
			console.log(datalist);

			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url : "infoupdate.do",
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
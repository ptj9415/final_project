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
.pagetitle {
	margin-left: 40px;
}

.titlebar, .maindiv {
	border: 0.5px solid black;
	border-radius: 3px;
	background-color: white;
	width: 1050px;
	margin-left: 40px;
}

.titlebar {
	margin-top: 10px;
	height: 35px;
}

.maindiv {
	margin-top: 2px;
}

table, tr, th, td {
	border: 0.5px solid black;
}

th {
	text-align: center;
}

.careertable {
	width: 1007px;
	margin-left: 10px;
	margin-top: 15px;
}

.careertable>tbody>tr>th, .certificatetable>tbody>tr>th, .introtable>tbody>tr>th
	{
	height: 40px;
}

.careertable>tbody>tr>td, .certificatetable>tbody>tr>td {
	height: 35px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="pagetitlediv">
		<br>
		<h3 class="pagetitle">상담사 마이페이지 - 상담 경력 수정</h3>
	</div>

	<div class="titlebar">
		<span class="titlespan">상담 경력 수정
			<button type="button" class="minusbtn" id="minusbtn1">
				<i class="fa fa-minus" id="minusicon"></i>
			</button>
		</span>
	</div>

	<div class="maindiv" id="maindiv3">
		<div class="careertablediv">
			<button type="button" id="addtr" onclick="addtr();">추가</button>
			<form id="saveform" name="saveform">
				<table class="careertable" id="careertable">
					<tr>
						<th>구분</th>
						<th>경력사항</th>
						<th>삭제</th>
					</tr>
					<c:forEach items="${career }" var="career">
						<tr>
							<td><select id="cc_status" name="cc_status" class="cc_status">
									<option value="선택">선택</option>
									<option value="현재"
										<c:if test="${career.cc_status eq '현재' }">selected</c:if>>현재</option>
									<option value="과거"
										<c:if test="${career.cc_status eq '과거' }">selected</c:if>>과거</option>
							</select></td>
							<td><input type="text" id="subject" name="cc_subject" class="cc_subject"
								value="${career.cc_subject }"></td>
							<td>
								<button type="button" class="deletetr" id="deletetr"
									name="deletetr">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</form>
			<input type="hidden" id="c_email" name="c_email"
				value="${counselor.c_email }"> <br>
				<button type="button" id="pageback" name="pageback" onclick="location.href='counselorMyPageMain.do'">돌아가기</button>
			<button type="button" id="saveformbtn">수정</button>
			<br> <br>
		</div>
	</div>
	<br>
	<br>
	<br>
	<script>
		function addtr() {
			var table = $('#careertable tr').length;
			var innerHtml = "";
			innerHtml += '<tr>';
			innerHtml += '<td><select id="cc_status" name="cc_status" class="cc_status"><option value="선택">선택</option><option value="현재">현재</option><option value="과거">과거</option></select></td>';
			innerHtml += '<td><input type="text" id="cc_subject" name="cc_subject" class="cc_subject"></td>'
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
			
			for(var i = 0; i < cc_subject.length; i++) {
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
				url: "careerupdate.do",
				type : 'post',
				contentType : 'application/json; charset=UTF-8',
				dataType: "json",
				data: datalist, 
				success: function() {
					alert("수정이 완료되었습니다.");
					location.reload();
				},
				error: function() {
					alert("수정이 완료되었습니다.");
					location.reload();
				}
			});		
			
		});
	</script>
</body>
</html>
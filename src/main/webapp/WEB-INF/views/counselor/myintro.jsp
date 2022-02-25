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
			<%-- <input type="hidden" id="c_email" name="c_email"
				value="${info.c_email }"> --%> <br>
			<button type="button" id="pageback" name="pageback"
				onclick="location.href='counselormypage.do'">돌아가기</button>
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
			
			if(table <= 3) {
			var innerHtml = "";
			innerHtml += '<tr>';
			innerHtml += '<td><input type="text" id="ci_title" name="ci_title" class="ci_title"></td>';
			innerHtml += '<td><textarea id="ci_subject" name="ci_subject" class="ci_subject"></textarea></td>';
			innerHtml += '<td><button type="button" class="deletetr" id="deletetr" name="deletetr">삭제</button></td>';
			innerHtml += '</tr>';

			$('#careertable > tbody:last').append(innerHtml);
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

			console.log(ci_title);
			console.log(ci_subject);
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
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

table>tbody>tr>th {
	text-align: center;
}

#coupontable>tbody>tr>td {
	text-align: center;
}

#infotable>tbody>tr {
	border-bottom: 0.5px solid rgb(222, 226, 230);
}

#infotable>tbody>tr>th {
	width: 15%;
	background-color: rgb(245, 245, 245);
}

#infotable>tbody>tr>td {
	width: 35%;
}

#infosubmitbtn {
	float: right;
}
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>상담사 정보 상세보기</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">
							상담사 정보
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
								<br>
								<table class="table text-nowrap" id="infotable">
									<tr>
										<th>이름</th>
										<td>${counselor.c_name }</td>
										<th>성별</th>
										<td>${counselor.c_gender }</td>
									</tr>
									<tr>
										<th>상담사 등급</th>
										<td>${counselor.c_grade }</td>
										<th>생년월일</th>
										<td>${counselor.c_birthdate }</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>${counselor.c_email }</td>
										<th>연락처</th>
										<td>${counselor.c_phone }</td>
									</tr>
									<tr>
										<th>상담사 주소</th>
										<td colspan="3">${counselor.c_address }</td>
									</tr>
								</table>
								<input type="hidden" id="c_email" name="c_email" value="${counselor.c_email }">
								<br>
							</div>
						</form>
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
					<div class="card">
						<p id="headerp">
							상담 내역
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
							<br>
							<table class="table text-nowrap" id="counseltable">
								<tr>
									<th>상담 유형</th>
									<th>상담사</th>
									<th>신청일</th>
									<th>상담일</th>
									<th>상담 상태</th>
									<th>관리</th>
								</tr>
								<%-- 								<c:choose> --%>
								<%-- 									<c:when test="${not empty coupon}"> --%>
								<%-- 										<c:forEach items="${coupon }" var="coupon"> --%>
								<!-- 											<tr> -->
								<%-- 												<td>${coupon.c_name }</td> --%>
								<%-- 												<td>${coupon.c_price }</td> --%>
								<%-- 												<td>${coupon.c_startdate }</td> --%>
								<%-- 												<td>${coupon.c_finaldate }</td> --%>
								<!-- 											</tr> -->
								<%-- 										</c:forEach> --%>
								<%-- 									</c:when> --%>
								<%-- 									<c:when test="${empty coupon }"> --%>
								<!-- 										<tr> -->
								<!-- 											<td colspan="4">보유한 쿠폰이 없습니다.</td> -->
								<!-- 										</tr> -->
								<%-- 									</c:when> --%>
								<%-- 								</c:choose> --%>
							</table>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

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

	$('#minusbtn2').click(function() {
		if ($('#maindiv2').css('display') == 'none') {
			$('#maindiv2').show();
			$('#minusicon2').attr('class', 'fa fa-minus');
		} else if ($('#maindiv2').css('display') != 'none') {
			$('#maindiv2').hide();
			$('#minusicon2').attr('class', 'fa fa-plus');
		}
	});
	
	function infosubmit() {
		var url = "adminCounselorInfoUpdate.do";
		var formData = new FormData($("#form")[0]);
		$.ajax({
			url : url,
			type : "post",
			data : formData,
			cache : false,
			contentType : false,
			processData : false,
			success : function() {
				alert("회원정보 수정이 완료되었습니다.");
				location.reload();
			},
			error : function() {
				console.log("실패");
			}
		});
	}
</script>
</html>
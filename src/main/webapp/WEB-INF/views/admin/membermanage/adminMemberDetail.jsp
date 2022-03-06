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

#infotable>tbody>tr>th, #coupontable>tbody>tr>th, #counseltable>tbody>tr>th {
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
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>회원정보 상세보기</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">
							회원 정보
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
										<th>닉네임</th>
										<td><input type="text" class="infotext" id="m_nickname"
											name="m_nickname" value="${member.m_nickname }"></td>
										<th>상태</th>
										<td>${member.m_type }</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>${member.m_email }</td>
										<th>연락처</th>
										<td><input type="text" class="infotext" id="m_phone"
											name="m_phone" value="${member.m_phone }"></td>
									</tr>
								</table>
								<input type="hidden" id="m_email" name="m_email"
									value="${member.m_email }"> <br>
								<button type="button" onclick="infosubmit()" id="infosubmitbtn">정보
									수정</button>
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
							보유 쿠폰
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
							<table class="table text-nowrap" id="coupontable">
								<tr>
									<th>쿠폰 이름</th>
									<th>쿠폰 금액</th>
									<th>발급일</th>
									<th>만료일</th>
								</tr>
								<c:choose>
									<c:when test="${not empty coupon}">
										<c:forEach items="${coupon }" var="coupon">
											<tr>
												<td>${coupon.c_name }</td>
												<td>${coupon.c_price }</td>
												<td>${coupon.c_startdate }</td>
												<td>${coupon.c_finaldate }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:when test="${empty coupon }">
										<tr>
											<td colspan="4">보유한 쿠폰이 없습니다.</td>
										</tr>
									</c:when>
								</c:choose>
							</table>
							<br>
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
					<div class="card">
						<p id="headerp">
							상담 내역
							<button type="button" class="minusbtn" id="minusbtn3">
								<i id="minusicon3" class="fa fa-minus"></i>
							</button>
						</p>
					</div>
				</div>
			</div>
			<div class="row" id="maindiv3">
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
								<tr>
								<td colspan="6" style="text-align: center">상담 내역이 없습니다.</td>
								</tr>
								<tr>
								<td colspan="6" style="text-align: center">상담 내역이 없습니다.</td>
								</tr>
								<tr>
								<td colspan="6" style="text-align: center">상담 내역이 없습니다.</td>
								</tr>
								<tr>
								<td colspan="6" style="text-align: center">상담 내역이 없습니다.</td>
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
			<br>
		<button type="button" onclick="location.href='adminMemberList.do'" id="siteback">목록으로</button>
		</div>
		<br>
		<br>
		<br>
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

	$('#minusbtn3').click(function() {
		if ($('#maindiv3').css('display') == 'none') {
			$('#maindiv3').show();
			$('#minusicon3').attr('class', 'fa fa-minus');
		} else if ($('#maindiv3').css('display') != 'none') {
			$('#maindiv3').hide();
			$('#minusicon3').attr('class', 'fa fa-plus');
		}
	});

	function infosubmit() {
		var url = "adminUserInfoUpdate.do";
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
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
	font-size: 16px;
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

#counseltable>tbody>tr>td {
	text-align: center;
	border-bottom: 0.5px solid rgb(222, 226, 230);
}

#counseltable>tbody>tr>th {
	background-color: rgb(245, 245, 245);
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

#certfiledown {
	border: none;
	border-radius: 5px;
	background-color: #1E90FF;
	color: white;
}

#rejectbtn {
	border: 1px solid #EB4646;
	border-radius: 5px;
	background-color: #EB4646;
	color: white;
}

#reasonbtn {
	border: 1px solid #EB4646;
	border-radius: 5px;
	background-color: #EB4646;
	color: white;
}

#confirmbtn {
	border: 1px solid #1E90FF;
	border-radius: 5px;
	background-color: #1E90FF;
	color: white;
}

.headshotdiv {
	float: left;
	margin-right: 35px;
}

#infotable {
	width: 86.3%;
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
								<div class="headshotdiv">
									<img
										src="../fileupload/counselorpicture/${counselor.c_picturepath }"
										class="preImage" id="preImage" name="preImage"
										style="height: 197px; width: 148px;"
										onerror="this.src='img/counselorpicture/errorprofile.jpg';">
									<br>
									<!-- 파일 업로드 부분 추가됐습니다. 사이드바 컨텐츠 밑에 <div class="card-body box-profile">  -->
								</div>
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
								<input type="hidden" id="c_email" name="c_email"
									value="${counselor.c_email }"> <br>
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
							<table class="table text-nowrap" id="counseltable" style="text-align: center;">
								<tr>
									<th>상담 유형</th>
									<th>내담자(닉네임)</th>
									<th>신청일</th>
									<th>상담일</th>
									<th>상담 상태</th>
								</tr>
								<tr>
									<td>카카오톡</td>
									<td>리오</td>
									<td>2022-03-12</td>
									<td>-</td>
									<td>상담 대기</td>
								</tr>
								<tr>
									<td>화상(Zoom)</td>
									<td>리오</td>
									<td>2022-03-12</td>
									<td>-</td>
									<td>상담 취소</td>
								</tr>
								<tr>
									<td>전화</td>
									<td>도라에몽</td>
									<td>2022-02-15</td>
									<td>2022-02-17</td>
									<td>상담 완료</td>
								</tr>
								<tr>
									<td>카카오톡</td>
									<td>도넛</td>
									<td>2022-02-09</td>
									<td>2022-02-10</td>
									<td>상담 완료</td>
								</tr>
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
							등급 변경 신청 내역
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
									<th>신청일</th>
									<th>기존 등급</th>
									<th>신청 등급</th>
									<th>증빙서류</th>
									<th>상태</th>
									<th>관리</th>
								</tr>
								<c:choose>
									<c:when test="${empty apply }">
										<tr>
											<td colspan="5">등급 변경 신청 내역이 없습니다.</td>
										</tr>
									</c:when>
									<c:when test="${not empty apply }">
										<c:forEach items="${apply }" var="apply">
											<tr>
												<td>${apply.cu_applydate }</td>
												<td>${apply.cu_currentgrade }</td>
												<td>${apply.cu_applygrade }<input type="hidden"
													id="c_grade" name="c_grade" value="${apply.cu_applygrade }">
													<input type="hidden" id="cu_no" name="cu_no"
													value="${apply.cu_no }"></td>
												<c:choose>
													<c:when test="${empty apply.cu_filename }">
														<td>-</td>
													</c:when>
													<c:otherwise>
														<td>
															<button type="button" id="certfiledown"
																onclick="location.href='fileDownload2.do?fileName=${apply.cu_pfilename }&downName=${apply.cu_filename}'">다운로드</button>
														</td>
													</c:otherwise>
												</c:choose>
												<td>${apply.cu_status }</td>
												<c:choose>
													<c:when test="${apply.cu_status eq '신청완료'}">
														<td><button type="button" id="confirmbtn"
																onclick="gradeconfirm('${apply.cu_applygrade}', '${apply.cu_no }', '${counselor.c_email }');">승인</button>
															<button type="button" id="rejectbtn" data-toggle="modal"
																data-target="#modal-lg" data-no="${apply.cu_no }">반려</button></td>
													</c:when>
													<c:otherwise>
														<td>-</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<!-- 모달시작 -->
	<div class="modal fade" id="modal-lg">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">반려 사유</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">반려 사유 작성</h3>
						</div>
						<form id="frm" method="post">
							<div class="card-body">
								<div class="form-group">
									<input type="text" style="height: 100px" class="form-control"
										id="cu_rejection" name="cu_rejection"
										placeholder="반려사유를 입력하세요.">
								</div>
							</div>
							<input type="hidden" id="cu_status" name="cu_status" value="반려">
							<input type="hidden" class="modalcuno" id="cu_no" name="cu_no"
								value=""> <input type="hidden" id="c_email"
								name="c_email" value="${counselor.c_email }">
						</form>
					</div>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="submit"
						name="submit">등록</button>
				</div>
			</div>
		</div>
	</div>
	<br>
</body>

<script>
	$(document).on('click', '#rejectbtn', function() {
		var cu_no = $(this).data('no');
		$('.modalcuno').val(cu_no);
	})

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

	function gradeconfirm(cu_applygrade, cu_no, c_email) {
		var url = "adminCounselorGradeComfirm.do";
		var cu_status = "승인";
		var c_grade = cu_applygrade;
		var cu_no = cu_no;
		var c_email = c_email;
		if (confirm('정말 승인하시겠습니까?') == true) {
			$.ajax({
				url : url,
				type : "post",
				data : {
					cu_status : cu_status,
					c_grade : c_grade,
					cu_no : cu_no,
					c_email : c_email
				},
				success : function() {
					alert("등급 변경 승인이 완료되었습니다.");
					location.reload();
				},
				error : function() {
					console.log("실패");
				}
			});
		} else {
			return;
		}
	}

	$(function() {
		$("#submit").click(function() {
			alert('등급 변경 반려가 완료되었습니다.');
			frm.action = "adminCounselorGradeReject.do";
			frm.submit();
		});

	});
</script>
</html>
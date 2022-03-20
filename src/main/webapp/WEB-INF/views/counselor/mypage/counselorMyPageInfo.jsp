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

.filebox .uploadname, .filebox .uploadname1 {
	display: inline-block;
	height: 40px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	width: 31%;
	color: #999999;
}

.filebox label {
	display: inline-block;
	padding: 7px 20px;
	color: #fff;
	vertical-align: middle;
	background-color: #999999;
	cursor: pointer;
	height: 40px;
	margin-left: 10px;
	margin-top: 8px;
}

.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

#infotable {
	width: 86.3%;
}

#infotable>tbody>tr, #gradetable>tbody>tr, #gradeapplytable>tbody>tr {
	border-bottom: 0.5px solid rgb(222, 226, 230);
}

#infotable>tbody>tr>th, #gradetable>tbody>tr>th, #gradeapplytable>tbody>tr>th
	{
	width: 13%;
	background-color: rgb(245, 245, 245);
	text-align: center;
	vertical-align: middle;
}

#gradetable>tbody>tr>td {
	text-align: center;
	vertical-align: middle;
}

.headshotdiv {
	float: left;
	margin-right: 35px;
}

#submitbtn {
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

#method {
	float: left;
	margin-right: 25px;
}

#category {
	float: left;
	width: 80px;
	margin-right: 25px;
	border: 1px solid rgb(222, 226, 230);
	border-radius: 5px;
	color: rgb(222, 226, 230);
	cursor: pointer;
}

#categoryselected {
	float: left;
	width: 80px;
	margin-right: 25px;
	border: 1px solid #1E90FF;
	border-radius: 5px;
	color: white;
	background-color: #1E90FF;
	cursor: pointer;
}

#kakao, #zoom, #phone, #won1, #won2, #won3 {
	color: rgb(222, 226, 230);
}

#kakaoprice, #zoomprice, #phoneprice {
	border: 1px solid rgb(222, 226, 230);
	width: 90px;
	text-align: right;
}
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>내 정보 수정</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">내 정보</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<form method="post" enctype="multipart/form-data" id="form">
								<div class="headshotdiv">
									<img src="../fileupload/counselorpicture/${counselor.c_picturepath }"
										class="preImage" id="preImage" name="preImage"
										style="height: 228px; width: 171px;"
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
										<th>연락처</th>
										<td>${counselor.c_phone }</td>
										<th>이메일</th>
										<td>${counselor.c_email }</td>
									</tr>
									<tr>
										<th>등급</th>
										<td>${counselor.c_grade }</td>
										<th>주소</th>
										<td>${counselor.c_address }</td>
									</tr>
									<tr>
										<th>사진 변경</th>
										<td colspan="3"><div class="filebox">
												<input class="uploadname"> <label for="filename">파일
													찾기</label> <input type="file" id="filename" name="filename"
													onchange="setThumbnail(event);">
											</div></td>
									</tr>
								</table>
								<div class="btndiv">
									<button type="button" onclick="picture()" id="submitbtn">등록</button>
									<button type="button" id="backbtn"
										onclick="location.href='counselorMyPageMain.do'">돌아가기</button>
								</div>
							</form>
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
						<p id="headerp">상담 방식</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<table class="table text-nowrap" id="gradetable">
								<tr>
									<th>상담 방법</th>
									<td><div id="method"><input type="checkbox" id="kakaochk" onclick="checkMethod();"<c:if test="${price.p_kakao eq '1'}"> checked</c:if>>&nbsp;&nbsp;<span id="kakao">카카오톡(텍스트)</span>&nbsp;&nbsp;<input type="text" id="kakaoprice" <c:if test="${price.p_kakaoprice ne '0'}"> value="${price.p_kakaoprice }"</c:if> disabled><span id="won1">원</span></div>
										<div id="method"><input type="checkbox" id="zoomchk"" onclick="checkMethod();"<c:if test="${price.p_zoom eq '1'}"> checked</c:if>>&nbsp;&nbsp;<span id="zoom">Zoom(화상)</span>&nbsp;&nbsp;<input type="text" id="zoomprice" <c:if test="${price.p_zoomprice ne '0'}"> value="${price.p_zoomprice }"</c:if> disabled><span id="won2">원</span></div>
										<div id="method"><input type="checkbox" id="phonechk" onclick="checkMethod();"<c:if test="${price.p_phone eq '1'}"> checked</c:if>>&nbsp;&nbsp;<span id="phone">전화</span>&nbsp;&nbsp;<input type="text" id="phoneprice" <c:if test="${price.p_phoneprice ne '0'}"> value="${price.p_phoneprice }"</c:if> disabled><span id="won3">원</span></div></td>
								</tr>
								<tr>
									<th>상담 카테고리</th>
									<td><div class="category" id="category" name="type1">분노/우울</div>
										<div class="category" id="category" name="type2">연애/우정</div>
										<div class="category" id="category" name="type3">진로/취업</div>
										<div class="category" id="category" name="type4">결혼/육아</div>
										<div class="category" id="category" name="type5">청소년</div>
										<div class="category" id="category" name="type6">가정</div></td>
								</tr>
							</table>
							<form id="cateform" method="post" action="catesubmit.do">
								<input type="hidden" name="c_email" id="c_email" value="${counselor.c_email }">
								<input type="hidden" name="p_kakao" id="p_kakao" value="${price.p_kakao }">
								<input type="hidden" name="p_kakaoprice" id="p_kakaoprice" value="${price.p_kakaoprice }">
								<input type="hidden" name="p_zoom" id="p_zoom" value="${price.p_zoom }">
								<input type="hidden" name="p_zoomprice" id="p_zoomprice" value="${price.p_zoomprice }">
								<input type="hidden" name="p_phone" id="p_phone" value="${price.p_phone }">
								<input type="hidden" name="p_phoneprice" id="p_phoneprice" value="${price.p_phoneprice }">
								<input type="hidden" name="c_type1" id="c_type1" value="${counselor.c_type1 }">
								<input type="hidden" name="c_type2" id="c_type2" value="${counselor.c_type2 }">
								<input type="hidden" name="c_type3" id="c_type3" value="${counselor.c_type3 }">
								<input type="hidden" name="c_type4" id="c_type4" value="${counselor.c_type4 }">
								<input type="hidden" name="c_type5" id="c_type5" value="${counselor.c_type5 }">
								<input type="hidden" name="c_type6" id="c_type6" value="${counselor.c_type6 }">
								<div class="btndiv">
									<button type="button" onclick="catesubmit()" id="submitbtn">등록</button>
								</div>							
							</form>
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
						<p id="headerp">등급 변경 신청내역</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<table class="table text-nowrap" id="gradetable">
								<tr>
									<th>신청일</th>
									<th>기존 등급</th>
									<th>신청 등급</th>
									<th>증빙서류</th>
									<th>신청 결과</th>
									<th>비고</th>
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
												<td>${apply.cu_applygrade }</td>
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
												<c:if
													test="${apply.cu_status eq '신청완료'|| apply.cu_status eq '승인' }">
													<td>-</td>
												</c:if>
												<c:if test="${apply.cu_status eq '반려' }">
													<td><button type="button" id="rejectbtn"
															data-toggle="modal" data-target="#modal-lg"
															data-reason="${apply.cu_rejection }">반려사유</button></td>
												</c:if>
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
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">등급 변경 신청</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<form method="post" enctype="multipart/form-data" id="form1">
								<table class="table text-nowrap" id="gradeapplytable">
									<tr>
										<th>현재 등급</th>
										<td><input type="hidden" id="cu_currentgrade"
											name="cu_currentgrade" value="${counselor.c_grade }">
											${counselor.c_grade }</td>
										<th>변경할 등급</th>
										<td><select id="cu_applygrade" name="cu_applygrade"
											class="cc_status">
												<option value="선택">선택</option>
												<option value="심리상담사"
													<c:if test="${counselor.c_grade eq '심리상담사' }">selected</c:if>>심리상담사</option>
												<option value="전문상담사"
													<c:if test="${counselor.c_grade eq '전문상담사' }">selected</c:if>>전문상담사</option>
												<option value="정신과의사"
													<c:if test="${counselor.c_grade eq '정신과의사' }">selected</c:if>>정신과의사</option>
										</select></td>
									</tr>
									<tr>
										<th>증빙서류 제출</th>
										<td colspan="3">
											<div class="filebox">
												<input class="uploadname1" value="${banner.bn_filename }">
												<label for="filename1">파일 찾기</label> <input type="file"
													id="filename1" name="filename1">
											</div>
										</td>
									</tr>
								</table>
								<input type="hidden" id="c_email" name="c_email"
									value="${counselor.c_email }"> <input type="hidden"
									id="cu_status" name="cu_status" value="신청완료">
								<div class="btndiv">
									<button type="button" onclick="certsubmit()" id="submitbtn">등록</button>
									<button type="button" id="backbtn"
										onclick="location.href='counselorMyPageMain.do'">돌아가기</button>
								</div>
							</form>
							<br>
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
							<h3 class="card-title">반려 사유 확인</h3>
						</div>
						<div class="card-body">
							<div class="form-group">
								<input type="text" style="height: 100px" class="form-control"
									id="cu_rejections" name="cu_rejection" value="">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(document).ready(function() {
		if($('#p_kakao').val() == '1' ) {
			$('#kakao').css('color','black');
			$('#won1').css('color','black');
			$('#kakaoprice').removeAttr('disabled');
		}
		
		if($('#p_zoom').val() == '1' ) {
			$('#zoom').css('color','black');
			$('#won2').css('color','black');
			$('#zoomprice').removeAttr('disabled');
		}
		
		if($('#p_phone').val() == '1' ) {
			$('#phone').css('color','black');
			$('#won3').css('color','black');
			$('#phoneprice').removeAttr('disabled');
		}
		
		if($('#c_type1').val() == '1') {
			$('div[name=type1]').attr('id', 'categoryselected');
		}
		
		if($('#c_type2').val() == '1') {
			$('div[name=type2]').attr('id', 'categoryselected');
		}
		
		if($('#c_type3').val() == '1') {
			$('div[name=type3]').attr('id', 'categoryselected');
		}
		
		if($('#c_type4').val() == '1') {
			$('div[name=type4]').attr('id', 'categoryselected');
		}
		
		if($('#c_type5').val() == '1') {
			$('div[name=type5]').attr('id', 'categoryselected');
		}
		
		if($('#c_type6').val() == '1') {
			$('div[name=type6]').attr('id', 'categoryselected');
		}
		
		
	});
	
		function catesubmit() {
			var p_kakaoprice = $('#kakaoprice').val();
			var p_zoomprice = $('#zoomprice').val();
			var p_phoneprice = $('#phoneprice').val();
			
			if (p_kakaoprice != '') {
				$('#p_kakaoprice').val(p_kakaoprice);
				$('#p_kakao').val('1');
			} else {
				$('#p_kakao').val('0');
			}
			if(p_zoomprice != '') {
				$('#p_zoomprice').val(p_zoomprice);
				$('#p_zoom').val('1');
			} else {
				$('#p_zoom').val('0');
			}
			if(p_phoneprice != '') {
				$('#p_phoneprice').val(p_phoneprice);
				$('#p_phone').val('1');
			} else {
				$('#p_phone').val('0');
			}
			
			$('#cateform').submit();
			
		}
	
		function checkMethod() {			
			if($('#kakaochk').is(':checked') == true) {
				$('#kakao').css('color', 'black');
				$('#won1').css('color','black');
				$('#kakaoprice').removeAttr('disabled');
			} else {
				$('#kakao').css('color', 'rgb(222, 226, 230)');
				$('#won1').css('color','rgb(222, 226, 230)');
				$('#kakaoprice').attr('disabled', true);
				$('#kakaoprice').val('');
				$('#p_kakaoprice').val('0');
				$('#p_kakao').val('0');
			}
			
			if($('#zoomchk').is(':checked') == true) {
				$('#zoom').css('color', 'black');
				$('#won2').css('color','black');
				$('#zoomprice').removeAttr('disabled');	
			} else {
				$('#zoom').css('color', 'rgb(222, 226, 230)');
				$('#won2').css('color','rgb(222, 226, 230)');
				$('#zoomprice').attr('disabled', true);
				$('#zoomprice').val('');
				$('#p_zoomprice').val('0');
				$('#p_zoom').val('0');
			}
			
			if($('#phonechk').is(':checked') == true) {
				$('#phone').css('color', 'black');
				
				$('#won3').css('color','black');
				$('#phoneprice').removeAttr('disabled');	
			} else {
				$('#phone').css('color', 'rgb(222, 226, 230)');
				$('#won3').css('color','rgb(222, 226, 230)');
				$('#phoneprice').attr('disabled', true);
				$('#phoneprice').val('');
				$('#p_phoneprice').val('0');
				$('#p_phone').val('0');
			}
		}
		
	
		$('div[name=type1]').on('click', function() {
			if ($(this).attr('id') == 'category') {
				$(this).attr('id', 'categoryselected');
				$('#c_type1').val('1');
			} else {
				$(this).attr('id', 'category');
				$('#c_type1').val('0');
			}
		});
		
		$('div[name=type2]').on('click', function() {
			if ($(this).attr('id') == 'category') {
				$(this).attr('id', 'categoryselected');
				$('#c_type2').val('1');
			} else {
				$(this).attr('id', 'category');
				$('#c_type2').val('0');
			}
		});
		
		$('div[name=type3]').on('click', function() {
			if ($(this).attr('id') == 'category') {
				$(this).attr('id', 'categoryselected');
				$('#c_type3').val('1');
			} else {
				$(this).attr('id', 'category');
				$('#c_type3').val('0');
			}
		});
		
		$('div[name=type4]').on('click', function() {
			if ($(this).attr('id') == 'category') {
				$(this).attr('id', 'categoryselected');
				$('#c_type4').val('1');
			} else {
				$(this).attr('id', 'category');
				$('#c_type4').val('0');
			}
		});
		
		$('div[name=type5]').on('click', function() {
			if ($(this).attr('id') == 'category') {
				$(this).attr('id', 'categoryselected');
				$('#c_type5').val('1');
			} else {
				$(this).attr('id', 'category');
				$('#c_type5').val('0');
			}
		});
		
		$('div[name=type6]').on('click', function() {
			if ($(this).attr('id') == 'category') {
				$(this).attr('id', 'categoryselected');
				$('#c_type6').val('1');
			} else {
				$(this).attr('id', 'category');
				$('#c_type6').val('0');
			}
		});
		
		$(document).on('click', '#rejectbtn', function() {
			var cu_rejection = $(this).data('reason');
			$('#cu_rejections').val(cu_rejection);
		});

		$('#minusbtn1').click(function() {
			if ($('#maindiv1').css('display') == 'none') {
				$('#maindiv1').show();
				$('#minusicon').attr('class', 'fa fa-minus');
			} else if ($('#maindiv1').css('display') != 'none') {
				$('#maindiv1').hide();
				$('#minusicon').attr('class', 'fa fa-plus');
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

		function setThumbnail(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var preimg = $('#preImage');
				preimg.attr('src', event.target.result);
			};
			reader.readAsDataURL(event.target.files[0]);
		}

		function picture() {
			var url = "counselorPicture.do";
			var formData = new FormData($("#form")[0]);
			$.ajax({
				url : url,
				type : "post",
				enctype : 'multipart/form-data',
				data : formData,
				cache : false,
				contentType : false,
				processData : false,
				success : function(data) {
					alert("수정이 완료되었습니다.");
					location.reload();
				},
				error : function() {
					console.log("실패");
				}
			});
		}

		function certsubmit() {
			var url = "counselorUpgradeApply.do";
			var formData = new FormData($("#form1")[0]);
			$.ajax({
				url : url,
				type : "post",
				enctype : 'multipart/form-data',
				data : formData,
				cache : false,
				contentType : false,
				processData : false,
				success : function(data) {
					alert("신청이 완료되었습니다.");
					location.reload();
				},
				error : function() {
					console.log("실패");
				}
			});
		}

		$("#filename").on('change', function() {
			var fileName = $("#filename").val();
			$(".uploadname").val(fileName);
		});

		$("#filename1").on('change', function() {
			var fileName = $("#filename1").val();
			$(".uploadname1").val(fileName);
		});
	</script>
</body>
</html>
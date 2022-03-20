<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<style>
h3 {
	font-size: 24px;
	font-weight: 600;
}

.minusbtn {
	border: none;
	background-color: transparent;
	float: right;
	margin-right: 10px;
}

#modify1 {
	float: right;
	margin-right: 15px;
	background-color: rgb(0, 123, 255);
	height: 35px;
	width: 60px;
	color: white;
	border: none;
	border-radius: 6px;
}

.modify {
	float: right;
	background-color: rgb(0, 123, 255);
	height: 35px;
	width: 60px;
	color: white;
	border: none;
	border-radius: 6px;
}

#thtable>tbody>tr {
	border-bottom: 0.5px solid rgb(222, 226, 230);
}

#thtable>tbody>tr>th {
	width: 13%;
	background-color: rgb(245, 245, 245);
	text-align: center;
	vertical-align: middle;
}

#headerp {
	position: relative;
	top: 7px;
	margin-left: 15px;
	font-weight: 600;
}

.row {
	margin-bottom: -10px;
}

.headshotdiv {
	float: left;
	margin-right: 30px;
}

#nothtable {
	text-align: center;
}

#nothtable {
	border-top: 0.5px solid rgb(222, 226, 230);
	border-bottom: 0.5px solid rgb(222, 226, 230);
}

#nothtable>tbody>tr>th {
	background-color: rgb(245, 245, 245);
}

#introtable {
	text-align: center;
	border-top: 0.5px solid rgb(222, 226, 230);
	border-bottom: 0.5px solid rgb(222, 226, 230);
	width: 100%;
	word-wrap: break-word;
	word-break: keep-all;
	vertical-align: middle;
}

#introtable>tbody>tr>th {
	background-color: rgb(245, 245, 245);
}

#introtable>tbody>tr>td {
	vertical-align: middle;
	word-wrap: break-word;
	word-break: keep-all;
	
}
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>마이페이지</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">
							내 정보
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
						<div class="card-body table-responsive p-00">
							<div class="headshotdiv">
								<img
									src="../fileupload/counselorpicture/${counselor.c_picturepath }"
									class="preImage" id="preImage" name="preImage"
									style="height: 150px; width: 112.5px;"
									onerror="this.src='img/counselorpicture/errorprofile.jpg';">
								<br>
							</div>
							<table class="table text-nowrap" id="thtable" style="width: 90%;">
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
							</table>
							<br>
							<button type="button" id="modify1"
								onclick="location.href='counselorMyPageInfo.do'">수정</button>
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
							내 상담시간
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
							<table class="table text-nowrap" id="thtable"
								style="text-align: center;">
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">상담시간</th>
									<th class="dayth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">월</th>
									<th class="dayth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">화</th>
									<th class="dayth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">수</th>
									<th class="dayth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">목</th>
									<th class="dayth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">금</th>
									<th class="dayth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">토</th>
									<th class="dayth">일</th>
								</tr>
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">09:00
										~ 10:00</th>
									<td id="mon0910" class="timetd"></td>
									<td id="tue0910" class="timetd"></td>
									<td id="wed0910" class="timetd"></td>
									<td id="thu0910" class="timetd"></td>
									<td id="fri0910" class="timetd"></td>
									<td id="sat0910" class="timetd"></td>
									<td id="sun0910" class="timetd"></td>
								</tr>
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">10:00
										~ 11:00</th>
									<td id="mon1011" class="timetd"></td>
									<td id="tue1011" class="timetd"></td>
									<td id="wed1011" class="timetd"></td>
									<td id="thu1011" class="timetd"></td>
									<td id="fri1011" class="timetd"></td>
									<td id="sat1011" class="timetd"></td>
									<td id="sun1011" class="timetd"></td>
								</tr>
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">11:00
										~ 12:00</th>
									<td id="mon1112" class="timetd"></td>
									<td id="tue1112" class="timetd"></td>
									<td id="wed1112" class="timetd"></td>
									<td id="thu1112" class="timetd"></td>
									<td id="fri1112" class="timetd"></td>
									<td id="sat1112" class="timetd"></td>
									<td id="sun1112" class="timetd"></td>
								</tr>
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">12:00
										~ 13:00</th>
									<td id="mon1213" class="timetd"></td>
									<td id="tue1213" class="timetd"></td>
									<td id="wed1213" class="timetd"></td>
									<td id="thu1213" class="timetd"></td>
									<td id="fri1213" class="timetd"></td>
									<td id="sat1213" class="timetd"></td>
									<td id="sun1213" class="timetd"></td>
								</tr>
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">13:00
										~ 14:00</th>
									<td id="mon1314" class="timetd"></td>
									<td id="tue1314" class="timetd"></td>
									<td id="wed1314" class="timetd"></td>
									<td id="thu1314" class="timetd"></td>
									<td id="fri1314" class="timetd"></td>
									<td id="sat1314" class="timetd"></td>
									<td id="sun1314" class="timetd"></td>
								</tr>
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">14:00
										~ 15:00</th>
									<td id="mon1415" class="timetd"></td>
									<td id="tue1415" class="timetd"></td>
									<td id="wed1415" class="timetd"></td>
									<td id="thu1415" class="timetd"></td>
									<td id="fri1415" class="timetd"></td>
									<td id="sat1415" class="timetd"></td>
									<td id="sun1415" class="timetd"></td>
								</tr>
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">15:00
										~ 16:00</th>
									<td id="mon1516" class="timetd"></td>
									<td id="tue1516" class="timetd"></td>
									<td id="wed1516" class="timetd"></td>
									<td id="thu1516" class="timetd"></td>
									<td id="fri1516" class="timetd"></td>
									<td id="sat1516" class="timetd"></td>
									<td id="sun1516" class="timetd"></td>
								</tr>
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">16:00
										~ 17:00</th>
									<td id="mon1617" class="timetd"></td>
									<td id="tue1617" class="timetd"></td>
									<td id="wed1617" class="timetd"></td>
									<td id="thu1617" class="timetd"></td>
									<td id="fri1617" class="timetd"></td>
									<td id="sat1617" class="timetd"></td>
									<td id="sun1617" class="timetd"></td>
								</tr>
							</table>
							<br>
							<button type="button" class="modify" id="modify2"
								onclick="location.href='counselorMyPageTime.do'">수정</button>
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
							경력사항
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
							<table class="table text-nowrap" id="nothtable">
								<tr>
									<th>구분</th>
									<th>경력사항</th>
								</tr>
								<c:forEach items="${career }" var="career">
									<tr>
										<td>${career.cc_status }</td>
										<td>${career.cc_subject }</td>
									</tr>
								</c:forEach>
							</table>
							<br>
							<button type="button" class="modify" id="modify3"
								onclick="location.href='counselorMyPageCareer.do'">수정</button>
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
							자격사항
							<button type="button" class="minusbtn" id="minusbtn4">
								<i id="minusicon4" class="fa fa-minus"></i>
							</button>
						</p>
					</div>
				</div>
			</div>
			<div class="row" id="maindiv4">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<table class="table text-nowrap" id="nothtable">
								<tr>
									<th>자격사항</th>
									<th>발급기관</th>
									<th>발급일자</th>
								</tr>
								<c:forEach items="${certification }" var="certification">
									<tr>
										<td>${certification.ccf_name }</td>
										<td>${certification.ccf_issueby }</td>
										<td>${certification.ccf_date }</td>
									</tr>
								</c:forEach>
							</table>
							<br>
							<button type="button" class="modify" id="modify4"
								onclick="location.href='counselorMyPageCert.do'">수정</button>
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
							상담사 소개
							<button type="button" class="minusbtn" id="minusbtn5">
								<i id="minusicon5" class="fa fa-minus"></i>
							</button>
						</p>
					</div>
				</div>
			</div>
			<div class="row" id="maindiv5">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<table class="table text-nowrap" id="introtable">
								<tr>
									<th>제목</th>
									<th>내용</th>
								</tr>
								<c:forEach items="${info }" var="info">
									<tr>
										<td>${info.ci_title }</td>
										<td style="text-align: left;">${info.ci_subject }</td>
									</tr>
								</c:forEach>
							</table>
							<br>
							<button type="button" class="modify" id="modify5"
								onclick="location.href='counselorMyPageIntro.do'">수정</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>

	<script>
	$('#minusbtn1').click(function() {
		if ($('#maindiv1').css('display') == 'none') {
		$('#maindiv1').show();
		$('#minusicon').attr('class', 'fa fa-minus');
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
	
	$('#minusbtn4').click(function() {
		if ($('#maindiv4').css('display') == 'none') {
			$('#maindiv4').show();
			$('#minusicon4').attr('class', 'fa fa-minus');
		} else if ($('#maindiv4').css('display') != 'none') {
			$('#maindiv4').hide();
			$('#minusicon4').attr('class', 'fa fa-plus');
		}
	});
		
	$('#minusbtn5').click(function() {
		if ($('#maindiv5').css('display') == 'none') {
			$('#maindiv5').show();
			$('#minusicon5').attr('class', 'fa fa-minus');
		} else if ($('#maindiv5').css('display') != 'none') {
			$('#maindiv5').hide();
			$('#minusicon5').attr('class', 'fa fa-plus');
		}
	});
	
	<!-- 미리보기 이미지 화면 -->
	function setThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function (event) {
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
			enctype: 'multipart/form-data',
			data : formData,
			cache : false,
			contentType : false,
			processData : false,
			success : function(data){
				alert("사진등록되었습니다.");
			},
			error: function(){
				console.log("실패");
			}
		});
		   
	}
	
	$(document).ready(function() {
		
		<c:forEach items="${time}" var="time">
			var param = '${time.cd_day}' + '${time.cd_time}';
			$('.timetd').each(function() {
				var id = $(this).attr('id');
				if(id == param) {
					$(this).text('★');
				}
			});
		</c:forEach>
		
	});
	
	</script>
</body>
</html>
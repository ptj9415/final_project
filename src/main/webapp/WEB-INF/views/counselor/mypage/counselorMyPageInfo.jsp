<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
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

.titlespan {
	margin-left: 15px;
	line-height: 35px;
}

.maindiv {
	margin-top: 2px;
}

.headshotdiv {
	margin-top: 15px;
	margin-left: 15px;
	float: left;
	width: 120px;
}

.myinfotablediv, .gradeupdatediv, .fileuploaddiv {
	margin-left: 10px;
	margin-top: 15px;
}

table, tr, th, td {
	border: 0.5px solid black;
}

th {
	text-align: center;
}

.myinfotable {
	height: 150px;
}

.myinfotable>tbody>tr>th {
	width: 100px;
}

.myinfotable>tbody>tr>td {
	width: 300px;
}

.gradetable {
	height: 50px;
}

.gradetable>tbody>tr>th {
	width: 100px;
}

.gradetable>tbody>tr>td {
	width: 300px;
}

.fileuploadtable {
	height: 200px;
}

.fileuploadtable>tbody>tr>td {
	width: 800px;
}
</style>
</head>
<body>
	<div class="pagetitlediv">
		<br>
		<h3 class="pagetitle">마이페이지 - 내 정보 수정</h3>
	</div>

	<div class="titlebar">
		<span class="titlespan">내 정보
			<button type="button" class="minusbtn" id="minusbtn1">
				<i class="fa fa-minus" id="minusicon"></i>
			</button>
		</span>
	</div>

	<div class="maindiv" id="maindiv1">
		<div class="headshotdiv">
			<img src="img/counselorpicture/${counselor.c_picturepath }"
				class="preImage" id="preImage" name="preImage"
				style="height: 150px; width: 112.5px;"
				onerror="this.src='https://media.istockphoto.com/vectors/isometric-building-concept-single-on-round-base-vector-id1090958052';">
			<br>
			<!-- 파일 업로드 부분 추가됐습니다. 사이드바 컨텐츠 밑에 <div class="card-body box-profile">  -->
		</div>

		<div class="myinfotablediv">
			<table class="myinfotable">
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
		</div>
		<div class="imageuploaddiv">
			<form method="post" enctype="multipart/form-data" id="form">
				<input multiple="multiple" type="file" id="filename" name="filename"
					accept="image/*" onchange="setThumbnail(event);" /> <br>
				<div class="row form-group">
					<div class="col-md-12">
						<input type="hidden" value="${counselor.c_email}" name="id">
						<button type="button" onclick="picture()"
							class="btn btn-primary  py-2 px-5">사진등록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<button type="button" class="modify" id="modify1"
		onclick="location.href='counselorinfo.do'">수정</button>
	<br>
	<br>

	<div class="titlebar">
		<span class="titlespan">등급 변경 신청
			<button type="button" class="minusbtn" id="minusbtn2">
				<i class="fa fa-minus" id="minusicon"></i>
			</button>
		</span>
	</div>
	<div class="maindiv" id="maindiv2">
		<div class="gradeupdatediv">
			<table class="gradetable">
				<tr>
					<th>현재 등급</th>
					<td>${counselor.c_grade }</td>
					<th>변경할 등급</th>
					<td><select id="cc_status" name="cc_status" class="cc_status">
							<option value="선택">선택</option>
							<option value="심리상담사"
								<c:if test="${counselor.c_grade eq '심리상담사' }">selected</c:if>>심리상담사</option>
							<option value="전문상담사"
								<c:if test="${counselor.c_grade eq '전문상담사' }">selected</c:if>>전문상담사</option>
							<option value="정신과의사"
								<c:if test="${counselor.c_grade eq '정신과의사' }">selected</c:if>>정신과의사</option>
					</select></td>
				</tr>
			</table>
		</div>
		<div class="fileuploaddiv">
			<table class="fileuploadtable">
				<tr>
					<th>증빙서류 제출</th>
					<td><form name="dataForm" id="dataForm"
							onsubmit="return registerAction()">
							<button id="btn-upload" type="button"
								style="border: 1px solid #ddd; outline: none;">파일 추가</button>
							<input id="input_file" multiple="multiple" type="file"
								style="display: none;"> <span
								style="font-size: 10px; color: gray;">※첨부파일은 최대 10개까지 등록이
								가능합니다.</span>
							<div class="data_file_txt" id="data_file_txt"
								style="margin: 40px;">
								<span>첨부 파일</span> <br />
								<div id="articlefileChange"></div>
							</div>
							<button type="submit"
								style="border: 1px solid #ddd; outline: none;">전송</button>
						</form></td>
				</tr>
			</table>
		</div>
	</div>

	<script>
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
					alert("사진등록되었습니다.");
				},
				error : function() {
					console.log("실패");
				}
			});

		}
		
		<!--다중파일 업로드-->
		// input file 파일 첨부시 fileCheck 함수 실행
		$(document).ready(function() {
			$("#input_file").on("change", fileCheck);
		});

		/**
		 * 첨부파일로직
		 */
		$(function() {
			$('#btn-upload').click(function(e) {
				e.preventDefault();
				$('#input_file').click();
			});
		});

		// 파일 현재 필드 숫자 totalCount랑 비교값
		var fileCount = 0;
		// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
		var totalCount = 10;
		// 파일 고유넘버
		var fileNum = 0;
		// 첨부파일 배열
		var content_files = new Array();

		function fileCheck(e) {
			var files = e.target.files;

			// 파일 배열 담기
			var filesArr = Array.prototype.slice.call(files);

			// 파일 개수 확인 및 제한
			if (fileCount + filesArr.length > totalCount) {
				$.alert('파일은 최대 ' + totalCount + '개까지 업로드 할 수 있습니다.');
				return;
			} else {
				fileCount = fileCount + filesArr.length;
			}

			// 각각의 파일 배열담기 및 기타
			filesArr.forEach(function(f) {
				var reader = new FileReader();
				reader.onload = function(e) {
					content_files.push(f);
					$('#articlefileChange').append(
							'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">' 
							+ '<font style="font-size:12px">' + f.name + '</font>' 
							+ '<img src="resources/img/headshot.jpg" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>'
							+ '<div/>');
					fileNum++;
				};
				reader.readAsDataURL(f);
			});
			console.log(content_files);
			
			//초기화 한다.
			$("#input_file").val("");
		}

		// 파일 부분 삭제 함수
		function fileDelete(fileNum) {
			var no = fileNum.replace(/[^0-9]/g, "");
			content_files[no].is_delete = true;
			$('#' + fileNum).remove();
			fileCount--;
			console.log(content_files);
		}

		/*
		 * 폼 submit 로직
		 */
		function registerAction() {

			var form = $("form")[0];
			var formData = new FormData(form);
			for (var x = 0; x < content_files.length; x++) {
				// 삭제 안한것만 담아 준다. 
				if (!content_files[x].is_delete) {
					formData.append("article_file", content_files[x]);
				}
			}
			/*
			 * 파일업로드 multiple ajax처리
			 */
			$.ajax({
				type : "POST",
				enctype : "multipart/form-data",
				url : "fileupload.do",
				data : formData,
				processData : false,
				contentType : false,
				success : function(data) {
					if (JSON.parse(data)['result'] == "OK") {
						alert("파일업로드 성공");
					} else
						alert("서버내 오류로 처리가 지연되고있습니다. 잠시 후 다시 시도해주세요");
				},
				error : function(xhr, status, error) {
					alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
					return false;
				}
			});
			return false;
		}
	</script>

</body>
</html>
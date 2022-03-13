<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>SummerNoteExample</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/e20d670992.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 서머노트를 위해 추가해야할 부분 -->
<script
	src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
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

tr, th, td {
	border: 1px solid #dee2e6;
}

th {
	background-color: rgb(245, 245, 245);
}

#infotable {
	width: 100%;
	height: 150px;
}

#infotable>tbody>tr>th {
	width: 10%;
	text-align: center;;
}

#infotable>tbody>tr>td {
	width: 40%;
}

#gc_title {
	width: 57%;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#gc_startdate, #gc_finaldate {
	widgh: 100%;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#gc_date, #gc_time {
	widgh: 50%;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#gc_min_person, #gc_max_person {
	width: 17%;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#gc_type {
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
	width: 40%;
}

#gc_price {
	width: 45%;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#counseltable>tbody>tr>th {
	text-align: center;
	vertical-align: middle;
}

#gc_kakao {
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
	width: 40%;
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

#modify2 {
	float: right;
	height: 35px;
	border: none;
	border-radius: 5px;
	background-color: #1E90FF;
	color: white;
}
</style>
</head>

<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>그룹상담 개설</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">기본 정보</p>
					</div>
				</div>
			</div>
			<!-- 그룹 상담 개설 페이지 -->
			<form action="summernote.do" method="post"
				enctype="multipart/form-data">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body table-responsive p-00">
								<br>
								<table class="table text-nowrap" id="infotable">
									<tr>
										<th>상담명</th>
										<td><input class="inputname" type="text" id="gc_title"
											name="gc_title"></td>
										<th>상담방식</th>
										<td><select id="gc_type" name="gc_type">
												<option value="카톡">카톡</option>
												<option value="줌">줌</option>
										</select></td>
									</tr>
									<tr>
										<th>모집일</th>
										<td><input type="date" id="gc_startdate"
											name="gc_startdate">&nbsp;~&nbsp;<input type="date"
											id="gc_finaldate" name="gc_finaldate"></td>
										<th>상담일</th>
										<td><input type="date" id="gc_date" name="gc_date">&nbsp;-&nbsp;<input
											type="time" id="gc_time" name="gc_time" value="14:00"></td>
									</tr>
									<tr>
										<th>모집 인원</th>
										<td>최소&nbsp;&nbsp;<input class="pcount"
											id="gc_min_person" name="gc_min_person" type="text">&nbsp;명
											~ 최대&nbsp;&nbsp;<input class="pcount" type="text"
											id="gc_max_person" name="gc_max_person">&nbsp;명
										</td>
										<th>상담 비용</th>
										<td><input class="pcount" id="gc_price" name="gc_price"
											type="text">&nbsp;원</td>
									</tr>
								</table>
								<br>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-12 offset-md-0">
						<div class="card">
							<p id="headerp">상담개요</p>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body table-responsive p-00">
								<br>
								<table class="table text-nowrap" id="counseltable">
									<tr>
										<th>상담 소개</th>
										<td><textarea class="summernote" name="summernote"></textarea>

										</td>
									</tr>
									<tr>
										<th>썸네일 이미지</th>
										<td><div class="filebox">
												<input class="uploadname"> <label for="filename">파일
													찾기</label> <input type="file" id="filename" name="filename">
											</div></td>
									</tr>
									<tr>
										<th>카카오톡 오픈주소</th>
										<td><input type="text" class="inputcacao" id="gc_kakao"
											name="gc_kakao"></td>
									</tr>
								</table>
								<br>
								<div class="btndiv">
									<button type="submit" class="modify2" id="modify2"
										name="modify2">그룹 상담 개설</button>
								</div>
								<br> <br>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
	<script>
		$('#minusbtn').click(function() {
			if ($('.maincontainer').css('display') == 'none') {
				$('.maincontainer').show();
				$('#minusicon').attr('class', 'fa fa-minus');
			} else if ($('.maincontainer').css('display') != 'none') {
				$('.maincontainer').hide();
				$('#minusicon').attr('class', 'fa fa-plus');
			}
		});

		$('#minusbtn2').click(function() {
			if ($('.maincontainer2').css('display') == 'none') {
				$('.maincontainer2').show();
				$('#minusicon2').attr('class', 'fa fa-minus');
			} else if ($('.maincontainer2').css('display') != 'none') {
				$('.maincontainer2').hide();
				$('#minusicon2').attr('class', 'fa fa-plus');
			}
		}); //열고 닫기 끝.

		// 에디터 설정 시작.
		$('.summernote').summernote(
				{
					// 에디터 높이
					height : 400,
					weight : 500,
					// 에디터 한글 설정
					lang : "ko-KR",
					// 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
					focus : true,
					//콜백 함수
					callbacks : {
						onImageUpload : function(files, editor, welEditable) {
							// 파일 업로드(다중업로드를 위해 반복문 사용)
							for (var i = files.length - 1; i >= 0; i--) {
								uploadSummernoteImageFile(files[i], this);
							}
						}
					},
					toolbar : [
							// 글꼴 설정
							[ 'fontname', [ 'fontname' ] ],
							// 글자 크기 설정
							[ 'fontsize', [ 'fontsize' ] ],
							// 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
							[
									'style',
									[ 'bold', 'italic', 'underline',
											'strikethrough', 'clear' ] ],
							// 글자색
							[ 'color', [ 'forecolor', 'color' ] ],
							// 표만들기
							[ 'table', [ 'table' ] ],
							// 글머리 기호, 번호매기기, 문단정렬
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							// 줄간격
							[ 'height', [ 'height' ] ],
							// 그림첨부, 링크만들기, 동영상첨부
							[ 'insert', [ 'picture', 'link', 'video' ] ],
							// 코드보기, 확대해서보기, 도움말
							[ 'view', [ 'codeview', 'fullscreen', 'help' ] ] ],
					// 추가한 글꼴
					fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
							'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋음체',
							'바탕체' ],
					// 추가한 폰트사이즈
					fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
							'20', '22', '24', '28', '30', '36', '50', '72' ]
				});

		// 이미지 파일 DB에 넣을 수 있게 경로로 변환.
		function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile.do",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}
		
		$("#filename").on('change', function() {
			var fileName = $("#filename").val();
			$(".uploadname").val(fileName);
		});
	</script>
</body>
</html>
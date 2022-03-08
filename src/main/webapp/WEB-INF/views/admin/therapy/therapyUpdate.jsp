<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
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

#therapytable>tbody>tr {
	border-bottom: 0.5px solid rgb(222, 226, 230);
}

#therapytable>tbody>tr>th {
	width: 13%;
	background-color: rgb(245, 245, 245);
	text-align: center;
	vertical-align: middle;
}

.filebox .uploadname {
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
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>심리테라피 수정</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">심리테라피 수정</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<form action="therapyInsert.do" enctype="multipart/form-data"
								method="post">
								<table class="table text-nowrap" id="therapytable">
									<tr>
										<th>제목</th>
										<td><input type="text" id="t_title" name="t_title"
											value="${therapy.t_title}"></td>
									</tr>
									<tr>
										<th>게시글 내용</th>
										<td><textarea class="summernote" name="summernote">${therapy.t_subject}</textarea>
										</td>
									</tr>
									<tr>
										<th>썸네일</th>
										<td><div class="filebox">
												<input class="uploadname"
													placeholder="첨부파일"> <label for="filename">파일찾기</label> 
													<input type="file" id="filename" name="filename" value="${therapy.t_picture}">
													<div>${therapy.t_picture}</div>
											</div></td>
									</tr>
								</table>
								<div class="btndiv">
									<button type="submit" id="submitbtn">수정하기</button>
									<button type="button" id="backbtn"
										onclick="location.href='admintherapy.do'">돌아가기</button>
								</div>
							</form>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- jQuery -->
	<script>
		$(function() {
			$('.select2').select2()
		});

		// 에디터 설정 시작.
		$('.summernote').summernote(
				{
					// 에디터 높이
					height : 200,
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
				url : "uploadSummernoteImageFileList.do",
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
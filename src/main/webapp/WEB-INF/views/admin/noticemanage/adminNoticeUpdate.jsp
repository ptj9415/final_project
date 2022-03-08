<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

#noticetable>tbody>tr {
	border-bottom: 0.5px solid rgb(222, 226, 230);
}

#noticetable>tbody>tr>th {
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

#category, #title {
	width: 200px;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#title {
	width: 400px;
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
	background-color: white;
	color: #EB4646;
	border: 1px solid #EB4646;
	border-radius: 4px;
	height: 35px;
	float: right;
	margin-right: 10px;
}

#n_category {
	width: 530px;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#n_title {
	width: 530px;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>공지사항 수정 - ${notices.n_title }</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">공지사항 수정</p>
					</div>
				</div>
			</div>
			<div class="row" id="maindiv1">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<form action="noticeUpdateEnd.do" method="post" id="frm"
								enctype="multipart/form-data">
								<table class="table table-hover text-nowrap" id="noticetable">
									<tr>
										<th>말머리</th>
										<td><select name="n_category" id="n_category">
												<option value="전체"
													<c:if test="${notices.n_category eq '전체' }">selected</c:if>>전체</option>
												<option value="긴급"
													<c:if test="${notices.n_category eq '긴급' }">selected</c:if>>긴급</option>
												<option value="이벤트"
													<c:if test="${notices.n_category eq '이벤트' }">selected</c:if>>이벤트</option>
												<option value="기타"
													<c:if test="${notices.n_category eq '기타' }">selected</c:if>>기타</option>
										</select></td>
										<th>제목</th>
										<td><input type="text" name="n_title" id="n_title"
											value="${notices.n_title }"></td>
									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3"><textarea class="summernote"
												name="summernote">${notices.n_content }</textarea></td>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td colspan="3"><div class="filebox">
												<input class="uploadname" value="첨부파일" placeholder="첨부파일">
												<label for="fileName">파일 찾기</label> <input type="file"
													id="fileName" name="fileName"
													value="${notices.n_filename }">
											</div></td>
									</tr>
								</table>
								<input type="hidden" name="n_no" id="n_no"
									value="${notices.n_no }">
								<div class="btndiv">
									<button type="submit" id="submitbtn">등록</button>
									<button type="button" id="backbtn"
										onclick="location.href='adminNoticeList.do'">돌아가기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script>
	// Summernote 에디터 설정 시작.
	$('.summernote')
			.summernote(
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
								'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림',
								'돋음체', '바탕체' ],
						// 추가한 폰트사이즈
						fontSizes : [ '8', '9', '10', '11', '12', '14', '16',
								'18', '20', '22', '24', '28', '30', '36', '50',
								'72' ]
					});

	// 이미지 파일 DB에 넣을 수 있게 경로로 변환.
	function uploadSummernoteImageFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "summernoteImageFile.do",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}
</script>
</html>
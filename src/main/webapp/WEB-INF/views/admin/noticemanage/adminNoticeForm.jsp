<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script src="https://kit.fontawesome.com/e20d670992.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
<style>
.noticeForm {
	width: 100%;
	border: 1px solid gray;
}
select {
	width: 100%;
	height: 28px;
}
th {
	text-align: center;
}
.belowBtn{
	margin-right: 10px;
	
	
}
#title {
	width: 100%;
}
span {
	margin-left: 100px;
	font-size: 20px;
	font-size: x-large;
}
#contentTh {
	height: 400px;
}

</style>
<script>
	
</script>
</head>
<body>
<br><br><br>
<div class="noticeFormMain">
	
	<div class="noticeForm">
		<span>공지사항 등록</span>
		<hr>
		<form action="noticeRegister.do" method="post" id="frm" enctype="multipart/form-data">	
		<div align="center">
			<table border="1">
				<tr>
					<th width="250px" height="50px">말머리</th>
					<td width="350px">
						<select name="category" id="category">
							<option value="전체" selected="selected">전체</option>
							<option value="urgency">긴급</option>
							<option value="event">이벤트</option>
							<option value="etc">뻘글</option>
						</select>
					</td>
					<th width="250px">제목</th>
					<td width="600px;"><input type="text" id="title" name="title"></td>
				</tr>
				<tr>
					<th id="contentTh">내용</th>
						<td colspan="3">
							<div class="container">
								<textarea class="summernote" name="content"></textarea>   
							</div>
							<input type="hidden" name="writer" id="writer" value="관리자">
							<input type="hidden" name="wdate" id="wdate" value="오늘">
							<input type="hidden" name="pfileName" id="pfileName">
						</td>
				</tr>
				<tr>
					<th height="50px">첨부파일</th>
					<td colspan="3"><input type="file" id="fileName" name="fileName"></td>
				</tr>
			</table>
			<br>
		</div>
			<div style="display: flex; justify-content: flex-end; margin-right: 100px; margin-bottom: 30px;">
				<input type="reset" value="초기화" class="belowBtn" id="reset">
				<input type="button" value="돌아가기" id="beforeBtn"  class="belowBtn">
				<input type="submit" value="등록하기" class="belowBtn">
			</div>
		</form>
	</div>
</div>
		
</body>
<script>

// 이전으로 돌아가는 식
$("#beforeBtn").on("click", function() {
	history.back();
});


//날짜에 sysdate값 할당해주기. 해당 selelctKey  => map.xml 상에서 sysdate로 해도 됨.
document.getElementById("wdate").value = new Date().toISOString().substring(0,10);



// Summernote 에디터 설정 시작.
    $('.summernote').summernote({
  // 에디터 높이
  height: 300,
  weight: 350,
  // 에디터 한글 설정
  lang: "ko-KR",
  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
  focus : true,
  //콜백 함수
  callbacks : { 
  	onImageUpload : function(files, editor, welEditable) {
            // 파일 업로드(다중업로드를 위해 반복문 사용)e
            for (var i = files.length - 1; i >= 0; i--) {
            	uploadSummernoteImageFile(files[i], this);
            }
  	}
  },
  toolbar: [
	    // 글꼴 설정
	    ['fontname', ['fontname']],
	    // 글자 크기 설정
	    ['fontsize', ['fontsize']],
	    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
	    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	    // 글자색
	    ['color', ['forecolor','color']],
	    // 표만들기
	    ['table', ['table']],
	    // 글머리 기호, 번호매기기, 문단정렬
	    ['para', ['ul', 'ol', 'paragraph']],
	    // 줄간격
	    ['height', ['height']],
	    // 그림첨부, 링크만들기, 동영상첨부
	    ['insert',['picture','link','video']],
	    // 코드보기, 확대해서보기, 도움말
	    ['view', ['codeview','fullscreen', 'help']]
	  ],
	  // 추가한 글꼴
	fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
	 // 추가한 폰트사이즈
	fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
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
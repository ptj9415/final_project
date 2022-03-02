<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
    th{
     height: 80px; width: 300px; 
     text-align: center;
     font-size: 20px;
    }
    td{
        text-align: center;
        font-size: 20px;
    }
</style>
</head>
<body>
	 <!-- Main content -->
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                     <br>
                        <h1>심리테라피 등록</h1>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
    
    <section class="content">
        <div class="container-fluid">
         <br>
            <form action="therapyInsert.do" enctype="multipart/form-data" method="post">
                <div class="row">
                    <div class="col-md-12">
                      <div class="card"> <!-- 하얀색 바 표시 시작-->
                          <div class="row">
                             <div class="col-12">
                             <br>
                             <div class="card-header">  
	                             <h2 class="text-left display-5">칼럼 등록</h2>
                        	</div>
                        	
                        	 <div class="card-body">       
                                <div class="form-group">
                                    <label>제목 : </label>
                                    <input type="text" name="t_title" class="form-control" placeholder="Type your keywords here">
                                </div>
                            </div>
                        	
                             <div class="card-body">
                                <div class="form-group">
                                    <label>칼럼내용 : </label>
	                      				<textarea class="summernote" name="summernote"></textarea>    
                                </div>
                             </div>                             
                             <div class="card-body">
                                <div class="form-group">
                                    <label>썸네일 등록하기 : </label>
	                      				<input type="file" name="filename" class="form-control">  
                                </div>
                             </div>
                            	<button type="button" class="btn btn-default" onclick="location.href='admintherapy.do'">돌아가기</i></button>
                                <button type="submit" class="btn btn-default">등록하기</button>
                            </div>
                          </div>
                        </div>
                    </div> 
                </div>
            </form>
        </div>
    </section>
    <!-- jQuery -->
<script>
    $(function () {
      $('.select2').select2()
    });

    // 에디터 설정 시작.
    $('.summernote').summernote({
  // 에디터 높이
  height: 200,
  weight: 500,
  // 에디터 한글 설정
  lang: "ko-KR",
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
			url : "uploadSummernoteImageFileList.do",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}
</script>
</body>
</html>
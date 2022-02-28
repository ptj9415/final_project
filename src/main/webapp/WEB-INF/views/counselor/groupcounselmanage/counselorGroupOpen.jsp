<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>SummerNoteExample</title>
  <meta charset="utf-8">
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
        .titlebar {
            border: 0.5px solid black;
            height: 30px;
            width: 1300px;
            background-color: white;
            margin-top: 10px;
        }

        .maincontainer,
        .maincontainer2,
        .maincontainer3,
        .maincontainer4,
        .maincontainer5 {
            margin-top: 1px;
            border: 0.5px solid black;
            width: 1300px;
            background-color: white;
            border: 0.5px solid black;
        }

        .infotable {
            border: 0.5px solid black;
            border-collapse: collapse;
            height: 150px;
        }
        .infotable2{
        	  border: 0.5px solid black;
           	  border-collapse: collapse;
           	  height: 150px;
        }

        .infotable>tbody>tr {
            border: 0.5px solid black;
        }
        .infotable2>tbody>tr {
            border: 0.5px solid black;
        }

        .infotable>tbody>tr>td {
            border: 0.5px solid black;
            width: 400px;
            text-indent: 10px;
        }
         .infotable2>tbody>tr>td {
            border: 0.5px solid black;
            width: 1100px;
            text-indent: 10px;
        }
		
        .infotable>tbody>tr>th {
            border: 0.5px solid black;
            background-color: aqua;
            width: 150px;
        }
         .infotable2>tbody>tr>th {
            border: 0.5px solid black;
            background-color: aqua;
            width: 150px;
        }

        .timetable {
            border: 0.5px solid black;
            border-collapse: collapse;
            height: 300px;
        }

        .timetable>tbody>tr {
            border: 0.5px solid black;
        }

        .timetable>tbody>tr>th {
            border: 0.5px solid black;
        }

        .timetable>tbody>tr>td {
            border: 0.5px solid black;
            width: 100px;
        }

        .timeth {
            background-color: aqua;
            width: 180px;
        }

        .dayth {
            width: 154px;
            background-color: aqua;
        }

        .headshotdiv {
            float: left;
            margin-top: 30px;
            margin-left: 25px;
        }

        .infotablediv {
            margin-top: 30px;
            margin-left: 15px;
        }

        .mdbtndiv {
            height: 50px;
            background-color: red;
            float: left;
            margin-right: 20px;
            margin-bottom: 5px;
            float: left;
            float: left;
        }

        .modify1,
        .modify2,
        .modify3,
        .modify4,
        .modify5 {
            width: 130px;
            height: 30px;
            float: right;
            margin-right: 20px;
        }

        .minusbtn,
        .minusbtn2,
        .minusbtn3,
        .minusbtn4,
        .minusbtn5 {
            float: right;
            margin-right: 10px;
            margin-top: 7px;
            background-color: transparent;
            border: none;
        }

        .careertable {
            border: 0.5px solid black;
            border-collapse: collapse;
            width: 1265px;
        }

        .careertable>tbody>tr {
            border: 0.5px solid black;
        }

        .careertable>tbody>tr>th {
            border: 0.5px solid black;
        }

        .careertable>tbody>tr>td {
            border: 0.5px solid black;
        }

        .carrertablediv {
            margin-top: 30px;
            margin-left: 15px;
        }

        .ftable {
            border: 0.5px solid black;
            border-collapse: collapse;
            width: 1265px;
        }

        .ftable>tbody>tr {
            border: 0.5px solid black;
        }

        .ftable>tbody>tr>th {
            border: 0.5px solid black;
            background-color: aqua;
        }

        .ftable>tbody>tr>td {
            border: 0.5px solid black;
        }

        .ftablediv {
            margin-top: 30px;
            margin-left: 15px;
        }

        .introtable {
            border: 0.5px solid black;
            border-collapse: collapse;
            width: 1265px;
        }

        .introtable>tbody>tr {
            border: 0.5px solid black;
        }

        .introtable>tbody>tr>th {
            border: 0.5px solid black;
            background-color: aqua;
        }

        .introtable>tbody>tr>td {
            border: 0.5px solid black;
        }

        .introtablediv {
            margin-top: 30px;
            margin-left: 15px;
        }

        .careerth {
            background-color: aqua;
        }
        .input { padding: 15px 100px; margin: 5px 0; box-sizing: border-box; }
        .inputname{height:40px; weight:700px; }
        .inputcacao{ width:1070px; height:60px; }
        .pcount{ height:30px; width:100px;}
    </style>
</head>

<body>
	<!-- 그룹 상담 개설 페이지 -->
	<form action="summernote.do" method="post" enctype="multipart/form-data">
	    <div class="container">
	        <div class="titlebar">
	            <span>상담 소개
	                <button type="button" id="minusbtn" name="minusbtn" class="minusbtn">
	                    <i class="fa fa-minus" id="minusicon"></i>
	                </button>
	            </span>
	        </div>
	        <div class="maincontainer">
	            <div class="infotablediv">
	                <table class="infotable">
	                    <tr>
	                        <th>상담명</th><td><input class="inputname" type="text" id="gc_title" name="gc_title"></td>
	                        <th>상담방식</th>
	                        <td>
	                        	<select id="gc_type" name="gc_type">
									<option value="연애">연애</option>
									<option value="우울증">우울증</option>
								</select>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>모집일</th><td><input type="date" id="gc_startdate" name="gc_startdate">~<input type="date" id="gc_finaldate" name="gc_finaldate"></td>
	                        <th>상담일</th><td><input type="date" id="gc_date" name="gc_date">&nbsp;-&nbsp;<input type="time" id="gc_time" name="gc_time" value="14:00"></td>
	                    </tr>
	                    <tr>
	                        <th>모집 인원</th><td>최소인원<input class="pcount" id="gc_min_person" name="gc_min_person" type="text">~ 최대인원<input class="pcount" type="text" id="gc_max_person" name="gc_max_person"></td>
	                        <th>상담 비용</th><td><input class="pcount" id="gc_price" name="gc_price" type="text" value="50000">원</td>
	                    </tr>
	                </table>
	                <br>
	                <br>
	                <br>
	            </div>
	        </div>
	    </div>
	    <div class="container">
	        <div class="titlebar">
	            <span>상담 개요
	                <button type="button" id="minusbtn2" name="minusbtn2" class="minusbtn2">
	                    <i class="fa fa-minus" id="minusicon2"></i>
	                </button>
	            </span>
	        </div>
	        <div class="maincontainer2">
	            <div class="infotablediv">
	                <table class="infotable2">
	                     <tr>
	                        <th>*주의사항*</th><td>*홈페이지 양식에 맞게 에디터에서 사진을 먼저 올려주세요*</td>
	                    </tr>
	                    <tr>
	                        <th>상담 소개</th>
	                        <td>
	                             <div class="container">
	                      			<textarea class="summernote" name="summernote"></textarea>    
	                   		     </div>
	                   		</td>
	                    </tr>
	                    <tr>
	                        <th>썸네일 이미지</th>
	                        <td><input multiple="multiple" type="file" id="filename" name="filename" style="margin-bottom: 20px;" required></td>
	                    </tr>
	                    <tr>
	                        <th>카카오톡 오픈주소</th>
	                        <td><input type="text" class="inputcacao" id="gc_kakao" name="gc_kakao" ></td>
	                    </tr>
	                </table>
	                <br>
	                <button type="submit" class="modify2" id="modify2" name="modify2">그룹 상담 개설</button>
	                <br>
	                <br>
	            </div>
	        </div>
	    </div>
	</form>
    <script>
        $('#minusbtn').click(function () {
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
				url : "uploadSummernoteImageFile.do",
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
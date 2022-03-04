<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/ckeditor/ckeditor.js"></script>
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



</style>
<script>
	
</script>
</head>
<body>
<br><br><br>
<div class="noticeFormMain">
	
	<div class="noticeForm">
		<span>공지사항 수정</span>
		<hr>
		<form action="noticeUpdateEnd.do" method="post" id="frm" enctype="multipart/form-data">	
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
					<td width="600px;"><input type="text" id="title" name="title" value="${notices.n_title }"></td>
				</tr>
				<tr>
					<th id="contentTh">내용</th>
						<td colspan="3">
							<textarea id="content" name="content" rows="40" cols="80">${notices.n_content }</textarea>
							<script> 
								// ckeditor적용을 위한 스크립트문. 
								var ckeditor_config = {
										//resize_enabled: false,
										enterMode: CKEDITOR.ENTER_BR,
										shiftEnterMode : CKEDITOR.ENTER_P,
										filebrowserUploadUrl : "imageUpload.do"
											// 이미지업로드를 위해서 추가해야 하는 부분. 컨트롤러에서 정의. 
								};
								
								CKEDITOR.replace("content", ckeditor_config);
							</script>
							
					<input type="hidden" name="writer" id="writer" value="관리자">
					<input type="hidden" name="wdate" id="wdate" readonly="readonly">
					<input type="hidden" name="pfilename" id="pfilename">
					<input type="hidden" name="no" name="no" value="${notices.n_no }">
						</td>
				</tr>
				<tr>
					<th height="50px">첨부파일</th>
					<td colspan="3"><input type="file" id="filename" name="filename"></td>
				</tr>
			</table>
			<br>
		</div>
			<div style="display: flex; justify-content: flex-end; margin-right: 100px; margin-bottom: 30px;">
				<input type="reset" value="초기화" class="belowBtn" id="reset">
				<input type="button" value="돌아가기" id="beforeBtn"  class="belowBtn">
				<input type="submit" value="수정하기" class="belowBtn">
			</div>
		</form>
	</div>
</div>
		
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$("#beforeBtn").on("click", function() {
		history.back();
	});


//날짜에 sysdate값 할당해주기. 해당 selelctKey 
document.getElementById("wdate").value = new Date().toISOString().substring(0,10);

// 초기화 눌렀을 때 ckeditor도 같이 초기화되도록. 
$("#reset").on("click", function() {
	CKEDITOR.instances.content.setData("");  // 'content'는 id값이다.
})



</script>
</html>
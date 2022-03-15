<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 조회하기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.noticeForm {
	width: 70%;
	margin-left: 300px;
}
select {
	width: 100%;
	height: 28px;
}
th {
	text-align: center;
}
.belowBtn{
	width: 10%;
	margin: auto;
	display: block;
}
#title {
	width: 100%;
}
#content {
	width: 100%;
	height: 100%;
}
#contentTh {
	height: 350px;
}
.sameRow {
	margin-left: 30px;
}
.noticeTitle {
	font-size: 20px;
}
</style>
</head>
<body>
<!-- 공지사항 등록하는 폼에서 형식을 가져오자.ㅏ 그리고 ck에디터만 제외  넘오오는 변수이름은 notices임.  -->
<br><br><br>
	<div class="noticeForm">
		<h3>공지사항 상세보기</h3><hr>
		<span class="noticeTitle">${notices.n_title}</span><br>
		<span>작성일:&nbsp;${notices.n_writedate }</span>
		<span class="sameRow">조회수&nbsp; | ${notices.n_hit }</span>
		<span class="sameRow">작성자:&nbsp;${notices.n_writer } </span>
		<hr>
		<form action="noticeUpdate.do" method="post" id="frm" enctype="multipart/form-data">	
		<div align="center">
			<table border="1">
				<tr>
					<th width="250px" height="50px">말머리</th>
					<td width="1200px"><c:out value="${notices.n_category }" /></td>
				</tr>
				<tr>
					<th id="contentTh">내용</th>
						<td colspan="3">
							<div class="contentBox"><c:out value="${notices.n_content}" escapeXml="false" /></div>
						</td>
						
				</tr>
				<tr>
					<th height="50px">첨부파일</th>
					<td colspan="3"><a href="fileDownload.do?fileName=${notices.n_pfilename }&downName=${notices.n_filename }">${notices.n_filename }</a></td>
				</tr>
			</table>
								<input type="hidden" name="fileName" value="${notices.n_filename }">
								<input type="hidden" name="writer" id="writer" value="${notices.n_writer }">
								<input type="hidden" name="wdate" id="wdate" value="${notices.n_writedate }">
								<input type="hidden" name="pfileName" id="pfileName" value="${notices.n_pfilename }">
								<input type="hidden" name="updateNo" id="updateNo" value="${notices.n_no }">	
			<br>
		</div>
			<div>
				<input type="button" value="돌아가기" id="beforeBtn"  class="belowBtn">
			</div>
		</form>
		<br><br><br><br>
	</div>
</body>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$("#beforeBtn").on("click", function() {
		location.href='userNoticeList.do';
	});

</script>
</html>
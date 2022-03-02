<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style type="text/css">
.wrap2 {
	border: 1px solid black;
	padding-top: 20px;
	padding-bottom: 30px;
	width: 1400px;
	height: 900px;
}

th, td {
	border: 1px solid #3C3C8C;
	height: 30px;
}

#button {
	margin-left: 20px;
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	border: 1px solid skyblue;
	margin-top: 30px;
}

#button:hover {
	background-color: skyblue;
	color: white;
}
</style>
</head>
<body>
	<div class="wrap2" align="center">
		<div class="titleDiv" style="border-bottom: 1px solid black">
			<h3 style="text-align: left; margin-left: 20px;">${boardRead.b_title}</h3>
			<a style="float: right; margin-right: 20px;">${boardRead.b_wdate}
				| ${boardRead.c_name} | ${boardRead.b_hit}</a> <br>
		</div>
		<div>
			<pre
				style="border: 1px solid black; height: 400px; width: 820px; margin-top: 20px;"
				id="b_content" name="b_content">${boardRead.b_content}</pre>
			<div>
				<input type="hidden" name="b_no" id="b_no" value="${boardRead.b_no}">
			</div>
			<c:if test="${boardRead.b_email ne email}">
				<br>
				<br>
				<br>
			</c:if>
			<c:if test="${boardRead.b_email eq email}">
				<div class="button_div">
					<button id="button" type="button"
						onclick="location.href='userBoardUpdateForm.do?b_no=${boardRead.b_no}';">수정</button>
					<button id="button" name="button" type="button"
						onclick="deleteFnc('${boardRead.b_no}');">삭제</button>
				</div>
			</c:if>
		</div>


		<!--  댓글  -->
		<div id="reply">
			<ol class="replyList">

				<c:if test="${not empty reply.content}">
					<hr align="left" style="border: solid 1px #C29F6D; width: 105%;">
					<br>
					<p style="color: #AE8B59; font-weight: bold; font-size: 20px">댓글</p>
					<br>
						${reply.content }
			</c:if>

			</ol>
		</div>


	</div>
	<button type="button" id="button"
		style="float: right; margin-right: 500px; margin-top: 20px"
		onclick="location.href='userBoardForm.do'">글쓰기</button>
	<button type="button" id="button"
		style="float: right; margin-right: 10px; margin-top: 20px"
		onclick="location.href='userBoardList.do'">돌아가기</button>
	<br>
	<br>
	<br>
	<br>
	<br>

	<script type="text/javascript">
	
	// 삭제 (디자인적용)
	function deleteFnc(b_no){
		Swal.fire({
		  title: '정말 삭제하시겠습니까?',
		  text: '삭제 후에는 복구가 불가능합니다.',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#1E90FF',
		  cancelButtonColor: '#EB4646',
		  confirmButtonText: '삭제',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
              //"삭제" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
			$.ajax({
				url : "userBoardDelete.do",
				type : "post",
				data : {
					b_no : b_no
				},
				dataType : "text",
				success : function() {
					location.href = "userBoardList.do";
				},
				error : function() {
					alert("삭제 실패")
				}
			})
		  }
		})
	}
	
</script>
</body>
</html>
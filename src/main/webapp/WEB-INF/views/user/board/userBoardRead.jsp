<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<style type="text/css">
.wrap2 {
	border: 1px solid black;
	padding-top: 20px;
	padding-bottom: 30px;
	width: 1400px;
}

th, td {
	border: 1px solid #3C3C8C;
	height: 30px;
}

#button, #replySubmit {
	margin-left: 20px;
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	border: 1px solid skyblue;
}

#button:hover, replySubmit:hover {
	background-color: skyblue;
	color: white;
}

#br_content {
	height: 70px;
	width: 1280px;
	margin-bottom: 30px;
}
</style>
</head>
<body>
	<div class="wrap2" align="center">
		<div class="titleDiv" style="border-bottom: 1px solid black">
			<h3 style="text-align: left; margin-left: 20px;">${boardRead.b_title}</h3>
			<c:choose>
				<c:when test="${board.b_anony eq 'F' }">
					<a class="card-text" style="float: right; margin-right: 20px;">
						🕒 ${boardRead.b_wdate} &nbsp; | &nbsp; 👱‍♀️ ${board.m_nickname}
						&nbsp; | &nbsp; 💕 ${boardRead.b_hit}</a>
					<br>
				</c:when>
				<c:otherwise>
					<a class="card-text" style="float: right; margin-right: 20px;">
						🕒 ${boardRead.b_wdate} &nbsp; | &nbsp; 👱‍♀️ 익명 &nbsp; | &nbsp;
						💕 ${boardRead.b_hit}</a>
					<br>
				</c:otherwise>
			</c:choose>
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
				<br>
				<br>
			</c:if>
		</div>
		<c:if test="${not empty email }">
			<button type="button" id="button"
				style="float: right; margin-right: 200px; margin-top: 20px"
				onclick="location.href='userBoardForm.do'">글쓰기</button>

			<!-- 좋아요 -->
			<div id="heartArea">
				<c:if test="${not empty boardLike }">
					<span id="Heart">💗</span>
				</c:if>
				<c:if test="${empty boardLike}">
					<span id="Heart">💔</span>
				</c:if>
			</div>
			<input type="hidden" id="m_email" name="m_email" value="${email }">
		</c:if>
		<button type="button" id="button"
			style="float: right; margin-right: 10px; margin-top: 20px"
			onclick="location.href='userBoardList.do'">돌아가기</button>

		<br> <br> <br>
		<!-- 댓글 목록 -->
		<div div align="left">
			<ol class="replyList">
				<c:set var="replyContent" value="${boardReplyList }" />
				<p style="text-align: left; margin-left: 40px;">
					💌 댓글 <small><b>&nbsp;💕 ${br_count}&nbsp;</b></small>
				</p>

				<hr align="left"width: 90%>
				<c:choose>
					<c:when test="${not empty replyContent}">
						<c:forEach var="boardReply" items="${boardReplyList}">
							<div style="text-align: left; margin-left: 40px;">
								<p>
									👱‍♀️ ${boardReply.br_name} &emsp; <a>🕒 <fmt:parseDate
											value="${boardReply.br_wdate}" var="replyDate"
											pattern="yyyy-MM-dd" /> <fmt:formatDate value="${replyDate}"
											pattern="yyyy-MM-dd" /></a> &emsp; &emsp; &emsp; &emsp;
									<c:if test="${boardReply.br_email eq email}">
										<button id="button" name="button" type="button"
											onclick="delReply('${boardReply.br_no}');">삭제</button>
									</c:if>
								<p>${boardReply.br_content}
								<hr align="left"width: 90%>
								</p>
								<br>

							</div>
						</c:forEach>
					</c:when>

					<c:otherwise>
						<br>
						<p align="center">아직 댓글이 없어요 😥 댓글을 작성해 보세요 🥰</p>
						<br>
						<hr align="left"width: 90%>
					</c:otherwise>
				</c:choose>
			</ol>
		</div>
		<!-- 댓글 작성 -->
		<c:if test="${not empty email}">
			<div>
				<p style="text-align: left; margin-left: 60px;">👱‍♀️ 작성자 :
					${nickname}</p>
				<input type="text" id="br_content" name="br_content"
					placeholder="댓글 내용을 작성하세요." /> <span><br>
					<button type="button" id="replySubmit" name="replySubmit">등록</button>
			</div>
			<br>
		</c:if>

		<c:if test="${empty email}">
			<br>
			<br>
			<br>
			<p align="center">사용자만 댓글 등록이 가능합니다 😥</p>
			<br>
			<br>
		</c:if>
	</div>

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
	
	
	
	// 댓글 등록
	$('#replySubmit').on('click', function() {
		var b_no = $('#b_no').val();
		var br_no = $('#br_no').val();
		var br_content = $('#br_content').val();
		$.ajax({
			url : 'boardReplyResister.do',
			data : {
				b_no : b_no,
				br_no : br_no,
				br_content : br_content
			},
			dataType : 'text',
			success : function(responseText) {
				console.log(responseText);
				location.reload();
			},
			error : function() {
				alert("댓글 등록 실패");
			}
		});
	});

	
	
	// 댓글 삭제
	function delReply(br_no) {
		console.log("댓글 번호" + br_no)
		$.ajax ({
			url : "boardReplyDelete.do",
			type : "post",
			data : {
				br_no : br_no				
			},
			dataType :  "text",
			success : function() {
				location.reload();
			},
			error : function() {
				alret("댓글 삭제 실패")
			}
})
	}
	
	
	// 좋아요
	$("#heartArea").on("click", function() {
		var b_no = $("#b_no").val();
		var m_email = $("#m_email").val();
		console.log(b_no + " + " + m_email);
		if($("#heartArea span").html() == "💔") {			
			$.ajax({
				url: "boardLikeInsert.do",
				data: {b_no:b_no, m_email:m_email},
				dataType: "text",
				type : "post",
				success: function (data) {
					alert("좋아요가 추가되었습니다.");
					$("#heartArea span").html("💗");
				},
				error: function() {
					alert("에러");
				}
			}); 
		} else if ($("#heartArea span").html() == "💗") {
			$.ajax({
				url: "boardLikeDelete.do",
				data: {b_no:b_no, m_email:m_email},
				dataType: "text",
				type : "post",
				success: function (data) {
					alert("좋아요가 취소되었습니다.");											
					$("#heartArea span").html("💔");
				},				
				error: function() {				
					alert("에러");
				}
			});			
		}
	});
		
// 		var m_email = $("#m_email").val();
// 		var b_no = $("#b_no").val();
// 		if($("#heartBoard").attr("class") == "icon_heart_alt"){	
// 			$.ajax({
// 				url: "boardLikeInsert.do",
// 				data: {id:id, isbn: isbn},
// 				dataType: "text",
// 				type : "post",
// 				success: function (data) {
// 					if(data == 'T'){
// 						$("#hearticon").attr("class","fa fa-heart");
// 						alert('좋아요');															
// 					}
// 				}
// 			}); 
// 		}else{
// 			$.ajax({
// 				url: "boardLikeDelete.do",
// 				data: {id:id, isbn: isbn},
// 				dataType: "text",
// 				type : "post",
// 				success: function (data) {
// 					if(data == 'T'){
// 						$("#hearticon").attr("class","icon_heart_alt");
// 						alert('좋아요 삭제');															
// 					}
// 				}
// 			}); 
// 		}
		
// 	});
	
	
	
</script>
</body>
</html>
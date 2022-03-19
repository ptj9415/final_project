<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style type="text/css">
.wrap2 {
	border-style: none;
	width: 80%;
	margin-right: auto;
	margin-left: auto;
	margin-top: 80px;
	margin-bottom: 350px;
}

.br_content {
	font-size: 13px;
}

.br_contentBox {
	height: 65px;
	width: 1420px;
	font-size: 13px;
	overflow:hidden;
}

.br_contentBoxDiv {
	margin-top: 70px;
	float: left;
}

textarea {
    width: 100%;
    height: 6.25em;
    resize: none;
    border: 1px solid #E5E5E5;
}
  
textarea:focus {
    outline: none;
}

textarea::placeholder {
 	font-size: 13px;
 	color: #dededf;
}

.subject {
	text-align: left;
	font-weight: bold;
	color: #0975ad;
}

.topDiv {
	text-align: right;
}

.title {
	text-align : left;
	margin-top: 40px;
	margin-bottom: 0px;
	height: 50px;
}

#b_content {
	overflow:hidden;
	height:auto;
	text-align: left;
}

.user_btn {
	margin-top: 13px;
	float: right;
	font-size: 13px;
	font-weight: bold;
}


button {
	height: 35px;
	width: 80px;
	padding: 5px;
	margin-left: 20px;
	border: 1px solid black;
	background-color: white;
	color: black;
	border: 1px solid black;
	margin-top: 80px;
	font-size: 13px;
	margin-bottom: 70px;
}

button:hover {
	background-color: black;
	color: white;
}

/* 삭제 Swal 디자인  */
#swal2-title {
	font-size: 25px;
}

#swal2-content {
	font-size: 15px;
}

.swal2-header {
	height: 200px;
}

.swal2-actions {
	font-size: 12px;
	height: 80px;
	width: 300px;
	height: 80px;
}

.swal2-actions button {
	height: 30px;
	width: 80px;
	padding: 5px;
}

</style>
</head>
<body>
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('img/bannerimg/faqBanner2.png'); height: 350px;"
		data-stellar-background-ratio="0.5"></section>
		
	<div class="wrap2" align="center">
		<p class="subject">${boardRead.b_subject }</p>
			<hr align="left"width: 90%>
			<h4 class="title">${boardRead.b_title}</h4>
			<div class="topDiv">
				<c:choose>
					<c:when test="${boardRead.b_anony eq 'F' }">
						<small><a class="card-text">
								<img style="height: 10px; width: 10px; margin-bottom: 2px" src="img/board/wall-clock.png" alt=""> 
									${boardRead.b_wdate} &nbsp; <b>${boardRead.m_nickname}</b> &nbsp;
								<img style="height: 15px; width: 15px; margin-bottom: 3px" src="img/board/visibility.png" alt="">  
								 	${boardRead.b_hit}</a></small>
							<br>
					</c:when>
					<c:otherwise>
						<small><a class="card-text">
								<img style="height: 10px; width: 10px; margin-bottom: 2px" src="img/board/wall-clock.png" alt=""> 
									${boardRead.b_wdate} &nbsp; <b>익명</b> &nbsp;
								<img style="height: 15px; width: 15px; margin-bottom: 3px" src="img/board/visibility.png" alt="">  
								 	${boardRead.b_hit}</a></small>
							<br>	
					</c:otherwise>
				</c:choose>
			</div>	
			<hr align="left"width: 90%>
			<c:if test="${boardRead.b_email eq email}">
				<div class="user_btn">
					<a	style="margin-right: 8px;"
						onclick="location.href='userBoardUpdateForm.do?b_no=${boardRead.b_no}';">수정</a>
					<a
						onclick="deleteFnc('${boardRead.b_no}');">삭제</a>
				</div>
				<br>
				<br>
			</c:if>
		<div>
			<pre id="b_content" name="b_content">${boardRead.b_content}</pre>
			<div>
				<input type="hidden" name="b_no" id="b_no" value="${boardRead.b_no}">
			</div>
			<c:if test="${boardRead.b_email ne email}">
				<br>
				<br>
				<br>
			</c:if>
		</div>
		<span style="display: inline-block;">
			<c:if test="${not empty email }">
				<button style="margin-right: 5px;"
						onclick="location.href='userBoardForm.do'">글쓰기</button>
				<input type="hidden" id="m_email" name="m_email" value="${email }">
			</c:if>
		</span>
		<span style="display: inline-block;">
				<button
					onclick="location.href='userBoardList.do'">돌아가기</button>
		</span>	
		
		<!-- 댓글 목록 -->
		<div div align="left">
			<ol class="replyList">
				<c:set var="replyContent" value="${boardReplyList }" />
				<p>
					 <small><b>댓글&nbsp;${br_count}개&nbsp;&nbsp;</small></b>
			
			
			<!-- 좋아요 -->
			<c:if test="${not empty email}">
			<small><b id="heartArea">
				<c:if test="${not empty boardLike }">
					<span id="Heart">💗</span>
					<c:choose>
						<c:when test="${like_count eq '0' }">
							<span id="count"></span>
						</c:when>
						<c:otherwise>
							<span id="count"> ${like_count }명이 공감</span>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${empty boardLike }">
					<span id="Heart">🤍</span>
					<c:choose>
						<c:when test="${like_count eq '0' }">
							<span id="count"></span>
						</c:when>
						<c:otherwise>
							<span id="count"> ${like_count }명이 공감</span>
						</c:otherwise>
					</c:choose>
				</c:if>
			</b></small>
			</c:if>
			
			<c:if test="${empty email}">
				<small><span id="count" onclick="javascript:btn()">🤍 ${like_count }명이 공감</span></small>
			</c:if>
			
				</p>
				<hr align="left"width: 90%>
				<c:choose>
					<c:when test="${not empty replyContent}">
						<c:forEach var="boardReply" items="${boardReplyList}">
							<div>
								<small><p>
									<a><b>${boardReply.br_name}&nbsp; </b></a> <a>
									<img style="height: 10px; width: 10px; margin-bottom: 2px" src="img/board/wall-clock.png" alt="">  
									<fmt:parseDate
											value="${boardReply.br_wdate}" var="replyDate"
											pattern="yyyy-MM-dd" /><fmt:formatDate value="${replyDate}"
											pattern="yyyy-MM-dd" /></a> &emsp;&emsp;
									<c:if test="${boardReply.br_email eq email}">
									<img style="height: 13px; width: 13px; margin-bottom: 4px" 
									src="img/board/bin.png" alt=""
									onclick="delReply('${boardReply.br_no}');">  
									</c:if>
								</small></p>	
								<pre class="br_content">${boardReply.br_content}</pre>
								<hr align="left"width: 90%>
								<br>

							</div>
						</c:forEach>
					</c:when>

					<c:otherwise>
						<br>
						<p align="center" style="font-size: 14px;">아직 댓글이 없어요. &nbsp; 댓글을 작성해 보세요 ! </p>
						<br>
						<hr align="left"width: 90%>
					</c:otherwise>
				</c:choose>
			</ol>
		</div>
		<!-- 댓글 작성 -->
		<c:if test="${not empty email}">
			<div class="br_contentBoxDiv">
				<small><p style="text-align:left; font-weight: bold;">${nickname}</p></small>
				<textarea type="text" id="br_content" name="br_content" class="br_contentBox"
					placeholder="따뜻한 관심을 보여주세요."></textarea>
				<span><img style="height: 65px; width: 65px; margin-bottom: 60px"
				id="replySubmit" name="replySubmit"  
				src="img/board/checkbox.png">
				</span>
			</div>
			<br>
		</c:if>

		<c:if test="${empty email}">
			<br>
			<br>
			<br>
			<p align="center" style="font-size: 14px;">사용자만 댓글 등록이 가능합니다.</p>
			<br>
			<br>
		</c:if>
	</div>
<script>
	
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
			});
		  }
		});
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
		});
	}
	
	
	// 좋아요
	$("#heartArea").on("click", function() {
		var b_no = $("#b_no").val();
		var m_email = $("#m_email").val();
		console.log(b_no + " + " + m_email);
		if($("#heartArea span").html() == "🤍") {	// 좋아요 x		
			$.ajax({
				url: "boardLikeInsert.do",
				data: {b_no:b_no, m_email:m_email},
				dataType: "text",
				type : "post",
				success: function (data) {
					alert("좋아요가 추가되었습니다.");
					$("#Heart").html("💗");
					if(data == "0") {
						$("#count").html("");						
					} else {
						$("#count").html(data + "명이 공감");
					}
					
				},
				error: function() {
					alert("에러");
				}
			}); 
		} else if ($("#heartArea span").html() == "💗") { // 좋아요 o
			$.ajax({
				url: "boardLikeDelete.do",
				data: {b_no:b_no, m_email:m_email},
				dataType: "text",
				type : "post",
				success: function (data) {
					alert("좋아요가 취소되었습니다.");											
					$("#Heart").html("🤍");
					if(data == "0") {
						$("#count").html("");						
					} else {
						$("#count").html(data + "명이 공감");
					}
				},				
				error: function() {				
					alert("에러");
				}
			});			
		}
	});
	
	
	// 로그인 x 좋아요 눌렀을 때
	function btn(){ alert('로그인 후 이용 가능합니다.'); }

	
</script>
</body>
</html>
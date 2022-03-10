<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 한마디</title>
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=Source+Serif+Pro:400,600&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="fonts/icomoon/style.css">
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<style>
table {
	border: solid 1px;
}

.form-check-input{
	margin-left:580px;
}

.register-btn{
	border:1px solid white;
	width:100px;
	height:40px;
	color:white;
	text-align: center;
    border-radius: 30px;
}
.register-btn:hover{
	cursor:pointer;
}
.btn-delete{
	float:right;
}
.btn-delete:hover{
	cursor:pointer;
}
.card-text{
	float:left;
}
/*modal*/
/*modal end*/
</style>
</head>
<body>
	<!-- 오늘의 한마디 주제 -->
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('resources/user/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-2 bread">오늘의 한마디</h1>
					<p class="breadcrumbs">

						<span class="mr-2">오늘의 주제 : ${todaySelect.sc_title} <i
							class="ion-ios-arrow-forward"></i>
						</span> <br> <br> <span>${todaySelect.sc_subject}</span> <br>
						<br>

					</p>

			
					
					<!-- modal btn -->
	
		<span type="button" class="register-btn" id="submit-btn"
			data-toggle="modal" data-target="#modal-lg">글쓰기
		</span>
	
				</div>
			</div>
		</div>

	</section>
	<!-- modal contents start -->

<div class="modal fade" id="modal-lg">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Today Story</h4>
					<button type="button" class="close" data-dismiss="modal" style="width:300px"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- general form elements -->
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">주제를 보고 어떤생각이 드는지 적어보세요</h3>
						</div>
						<!-- /.card-header -->
						<!-- form start -->
						<form id="frm" action="todayReplyInsert.do" method="post">
							<div class="card-body">
								
									<span> 작성자 : ${nickname }</span>
									<br>
								  <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="anony" name="anony" style="float:right">
                    <input type="hidden" id="sr_anony" name="sr_anony" value="F">
                    
    					   
							
                    <label class="form-check-label" for="exampleCheck1"  style="float:right">닉네임 비공개</label>
                  </div> 
								<div class="form-group">
									<label for="exampleInputPassword1"></label>
									 <input type="text" style="height:300px" class="form-control"  id="sr_subject" name="sr_subject"
										placeholder="오늘의 한마디를 입력하세요..">
								</div>
							</div>
							<!-- /.card-body -->

				<input type="hidden" id="sc_no" name="sc_no" value="${todaySelect.sc_no}">
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary" id="submit" name="submit">등록</button>
				</div>
						</form>
					</div>
					<!-- /.card -->
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!-- modal contents end -->

	<!-- 댓글 start -->

	<section class="ftco-services">
		<div class="container">
			<div class="row justify-content-start mt-5 py-5">

				<div class="col-md-8 ftco-animate">
					<div class="row d-flex">
						<c:forEach items="${todayReplyList}" var="todayReplyList">
							<div class="col-md-6 d-flex align-items-stretch">
								<div
									class="media block-6 services services-2 d-block bg-light p-4 mb-4">
									
									<c:if test="${nickname eq todayReplyList.sr_writer}">
									
									<div class="btn-delete" id="btn-delete">
										<span id="delete"
											onclick="replyDelete('${todayReplyList.sr_no}')">❌</span>
									</div>
									</c:if>
									<div class="media-body p-2 mt-3">
							<c:choose>
								<c:when test="${todayReplyList.sr_anony eq 'F' }">
									<p class="card-text" id="sr_anony" style="text-align: right;">${todayReplyList.sr_writer}
								</p>
								</c:when>
								<c:otherwise>
									<p class="card-text"  id="sr_anony" style="text-align: right;">익명</p>
								</c:otherwise>
							</c:choose>
										
										
										<br>
										<br>
										<p>${todayReplyList.sr_subject}</p>

									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<input type="hidden" id="sc_no" name="sc_no"
		value="${todaySelect.sc_no}" />


	<!-- 댓글 end -->

<script>
/* 	function anonyFnc(){
		$('#anonymous').click( function() {
			var str = ${nickname};
			str.replace(${nickname},'익명');
			alert(str.replace(${nickname},'익명'));
		}
			});
	 */

	function replyDelete(sr_no) {
		console.log(sr_no);
		$.ajax({
			url : 'todayReplyDelete.do',
			data : {
				sr_no : sr_no
			},
			dataType : 'text',
			success : function(responseText) {
				console.log(responseText);
			
				location.reload();
				alert("삭제 완료");
			},
			error : function() {
				alert('error! 관리자에게 문의하세요');
			}
		})
	}
	

	
	// 글쓴이 익명 체크 여부
	$('#anony').change( function() {
		if($('#anony').is(':checked')) {
			$('#sr_anony').val('T');
		} else {
			$('#sr_anony').val('F');
		}
	});

	
	//글 등록 제출
	/* $(function() {
		$("#submit").click(function(e) {
			
				e.preventDefault();
				if(!confirm('정말로 등록하시겠습니까?')) 
					return;
				$('#submit').submit();
				frm.action = "todayReplyInsert.do";
			});
			
			/* frm.action = "todayReplyInsert.do"; 

		});
 */
	
	/* modal start */
	/* modal end */
	
</script>
<script src="resources/user/js/jquery.min.js"></script>
	<script src="resources/user/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="resources/user/js/popper.min.js"></script>
	<script src="resources/user/js/bootstrap.min.js"></script>
	<script src="resources/user/js/jquery.easing.1.3.js"></script>
	<script src="resources/user/js/jquery.waypoints.min.js"></script>
	<script src="resources/user/js/jquery.stellar.min.js"></script>
	<script src="resources/user/js/owl.carousel.min.js"></script>
	<script src="resources/user/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/user/js/aos.js"></script>
	<script src="resources/user/js/jquery.animateNumber.min.js"></script>
	<script src="resources/user/js/bootstrap-datepicker.js"></script>
	<script src="resources/user/js/jquery.timepicker.min.js"></script>
	<script src="resources/user/js/scrollax.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&amp;sensor=false"></script>
	<script src="resources/user/js/google-map.js"></script>
	<script src="resources/user/js/main.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 한마디</title>
<style>
table {
	border: solid 1px;
}

/* 버튼 스타일*/
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
 
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.6); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 15% auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  width: 600px; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.closing {
  color: #aaa;
  float: right;
  padding-left: 500px;
  font-size: 28px;
  font-weight: bold;
}

.closing:hover,
.closing:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
#btn-write {
	border: none;
	border-radius: 30px;
	background-color: white;
	width: 120px;
	height: 50px;
	font-size: 15px;
	font-weight: bold;
}

#btn-write:hover {
	background-color: lightgray;
	transition: all ease 3s 0s;
	opacity: 0.7;
}

.btn-delete {
	float: right;
}
</style>
</head>
<body>
	<!-- 오늘의 한마디 주제 -->
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/bg_1.jpg');"
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
						<!-- Trigger/Open The Modal -->
						<button id="myBtn">Open Modal</button>

					<button class="btn-write" id="btn-write">글 등록 →</button>


					</p>

				</div>
			</div>
		</div>
	</section>

						<!-- The Modal -->
					<div id="myModal" class="modal">

						<!-- Modal content -->
						<div class="modal-content">
							<span class="closing">&times;</span>
							<p>Some text in the Modal..</p>
						</div>

					</div>
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
									<div class="btn-delete" id="btn-delete">
										<span id="delete"
											onclick="replyDelete('${todayReplyList.sr_no}')">❌</span>
									</div>
									<div class="media-body p-2 mt-3">
										<h3 class="heading">${todayReplyList.sr_writer}</h3>
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
</body>

<script>
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

				alert("댓글이 삭제되었습니다.");
				location.reload();

			},
			error : function() {
				alert('댓글 삭제 실패.');
			}
		})
	}
	
	// Get the modal
	var modal = document.getElementById("myModal");

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("closing")[0];

	// When the user clicks on the button, open the modal
	btn.onclick = function() {
	  modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
</script>
</html>
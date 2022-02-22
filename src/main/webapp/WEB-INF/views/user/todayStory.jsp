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
#btn-write{
	border: none;
	border-radius: 30px;
	background-color : white;
	width: 120px;
	height: 50px;
	font-size: 15px;
	font-weight:bold;
}
#btn-write:hover{
	background-color : lightgray;
	transition: all ease 2s 0s;
	  opacity: 0.7;
}

.btn-delete{
 float:right;
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
					
						<span class="mr-2">오늘의 주제 : ${todaySelect.sc_title}
						<i class="ion-ios-arrow-forward"></i>
						</span> 
						<br>
						<br>
						<span>${todaySelect.sc_subject}</span>
						<br>
						<br>
						
				<button class="btn-write" id="btn-write"> 글 등록  →</button>		
				
							
					</p>
				</div>
			</div>
		</div>
	</section>
	
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
									<span>❌</span>
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
		<input type="hidden" id="sc_no" name="sc_no" value="${todaySelect.sc_no}" />


	<!-- 댓글 end -->
</body>
</html>
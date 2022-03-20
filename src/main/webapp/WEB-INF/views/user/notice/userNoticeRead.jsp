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
<style type="text/css">
.wrap2 {
	border-style: none;
	width: 80%;
	margin-right: auto;
	margin-left: auto;
	margin-top: 80px;
	margin-bottom: 250px;
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
	text-align: left;
	margin-top: 40px;
	margin-bottom: 0px;
	height: 33px;
}

#b_content {
	overflow: hidden;
	height: auto;
	text-align: left;
}

.user_btn {
	margin-top: 13px;
	float: right;
	font-size: 13px;
	font-weight: bold;
}

button {
	height: 30px;
	width: 80px;
	margin-left: 20px;
	border: 1px solid black;
	background-color: white;
	color: black;
	border: 1px solid black;
	margin-top: 220px;
	font-size: 13px;
}

button:hover {
	background-color: black;
	color: white;
}
</style>
</head>
<body>
					<section class="hero-wrap hero-wrap-2">
	<img src="img/bannerimg/notice.png" id="bannerimg">
	</section>

	<div class="wrap2" align="center">
		<p class="subject">${notices.n_category }</p>
		<hr align="left"width: 90%>
		<h4 class="title">${notices.n_title}</h4>
		<div class="topDiv">
			<small><a> <img
					style="height: 10px; width: 10px; margin-bottom: 2.5px"
					src="img/board/wall-clock.png" alt=""> 
					<fmt:parseDate value="${notices.n_writedate}" var="noticeDate" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${noticeDate}" pattern="yyyy-MM-dd" /></a> &emsp; 
					
			<b>${notices.n_writer}</b> &emsp; 
			<img style="height: 15px; width: 15px; margin-bottom: 3px" src="img/board/visibility.png" alt=""> ${notices.n_hit} &emsp;
			<c:if test="${not empty notices.n_filename}">
				<img style="height: 15px; width: 15px; margin-bottom: 3px" src="img/board/download.png" alt="">
				<a href="fileDownload.do?fileName=${notices.n_pfilename }&downName=${notices.n_filename }">${notices.n_filename }</a>
			</c:if> </small> <br>
		</div>

		<hr align="left"width: 90%>

		<pre id="b_content" name="b_content">${notices.n_content}</pre>
		<div>
			<input type="hidden" name="fileName" value="${notices.n_filename }">
			<input type="hidden" name="writer" id="writer" value="${notices.n_writer }"> 
			<input type="hidden" name="wdate" id="wdate" value="${notices.n_writedate }"> 
			<input type="hidden" name="pfileName" id="pfileName" value="${notices.n_pfilename }"> 
			<input type="hidden" name="updateNo" id="updateNo" value="${notices.n_no }">
		</div>

		<button onclick="location.href='userNoticeList.do'">돌아가기</button>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script
	src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
<style>
#previous-btn {
	width: 100px;
	height: 40px;
	border-radius: 50px;
	background-color: #468FB6;
	color: white;
	border: solid 1px #468FB6;
	font-size: 14px;
	cursor: pointer;
	position: relative;
}

#previous-btn:hover {
	background: #fff;
	color: #468FB6;
	border: solid 1px #468FB6;
	transition: 0.3s ease-in-out;
	cursor: pointer;
}
</style>
</head>
<body>
<section class="hero-wrap hero-wrap-2"
		style="background-image: url('resources/user/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 style="color: white">상담사 상세보기</h1>
				</div>
			</div>
		</div>

	</section>
<h1>상담사 상세보기 페이지</h1>
<div>
		<p>${counselorSelect.c_name } ${counselorSelect.c_grade }</p>
</div>


	<input type="button" data-page="2" name="previous" onclick="prevfunc('${email}','${type}')"
		class="previous action-button" value="Previous" id="previous-btn" />
	<input type="hidden" id="c_email" name="c_email" value="${email}" >
	<input type="hidden" id="onecheck" name="onecheck" value="${type}"> 

<script>
/* $('#previous-btn').click(function() {
	location.href = 'personalCounselStep2.do'
}); */

function prevfunc(c_email,type){
	var url = "personalCounselStep2.do";
	url = url + "?c_email="+c_email;
	url = url + "&onecheck=" + type;
	location.href = url;

}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet'
	href='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
<link rel="stylesheet" href="style.css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Hind:300,400');

*, *:before, *:after {
	-webkit-box-sizing: inherit;
	box-sizing: inherit;
}

html {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

body {
	margin: 0;
	padding: 0;
	font-family: 'Hind', sans-serif;
	background: #fff;
	color: #4d5974;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	min-height: 100vh;
}

h2 {
	text-align: center;
	margin-top: 100px;
	color: #C1AEEE;
}

.all {
	margin-bottom: 300px;
}

accordion {
	
}
.accordion a {
	position: relative;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-webkit-flex-direction: column;
	-ms-flex-direction: column;
	flex-direction: column;
	width: 100%;
	padding: 1rem 3rem 1rem 1rem;
	color: #7288a2;
	font-size: 1.15rem;
	font-weight: 400;
	border-bottom: 1px solid #e5e5e5;
	padding-left: 200px;
}

.accordion a:hover, .accordion a:hover::after {
	cursor: pointer;
	color: #ff5353;
}

.accordion a:hover::after {
	border: 1px solid #ff5353;
}

.accordion a.active {
	color: #ff5353;
	border-bottom: 1px solid #ff5353;
	padding-left: 200px;
	
}

.accordion a::after {
	font-family: 'Ionicons';
	content: '❤';
	position: absolute;
	float: right;
	right: 1rem;
	font-size: 1rem;
	color: #7288a2;
	padding: 5px;
	width: 30px;
	height: 30px;
	-webkit-border-radius: 30%;
	-moz-border-radius: 30%;
	border-radius: 30%;
	border: 1px solid #7288a2;
	text-align: center;
}

.accordion a.active::after {
	font-family: 'Ionicons';
	content: '❤';
	color: #ff5353;
	border: 1px solid #ff5353;
}

.accordion .content {
	opacity: 0;
	padding: 0 1rem;
	max-height: 0;
	border-bottom: 1px solid #e5e5e5;
	overflow: hidden;
	clear: both;
	-webkit-transition: all 0.2s ease 0.15s;
	-o-transition: all 0.2s ease 0.15s;
	transition: all 0.2s ease 0.15s;
}

.accordion .content p {
	font-size: 1rem;
	font-weight: 300;
}

.accordion .content.active {
	opacity: 1;
	padding: 1rem;
	max-height: 100%;
	-webkit-transition: all 0.35s ease 0.15s;
	-o-transition: all 0.35s ease 0.15s;
	transition: all 0.35s ease 0.15s;
	padding-left: 200px;
}
</style>
</head>
<body>
<div class="all">
	<h2>Frequently Asked Questions</h2>
	<br><br><br>
	<div class="accordion">
		<div class="accordion-item">
			<c:forEach items="${faqs}" var="faq">
				<a>${faq.f_title}</a>
				<div class="content">
					<p>${faq.f_subject}</p>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<script type="text/javascript">
//Code By Webdevtrick ( https://webdevtrick.com )
const items = document.querySelectorAll(".accordion a");

function toggleAccordion(){
  this.classList.toggle('active');
  this.nextElementSibling.classList.toggle('active');
}

items.forEach(item => item.addEventListener('click', toggleAccordion));
</script>
</body>
</html>
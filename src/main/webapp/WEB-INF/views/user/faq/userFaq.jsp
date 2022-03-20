<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap Expand and Collapse FAQ Accordion</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<style>
/*faq*/

body {
	width: 80%;
	margin-right: auto;
	margin-left: auto;
}
.accordion {
	color: #153E54;
	background-color: white;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
}

.active2, .accordion:hover {
	background-color: #153E54;
	color: white;
}

.accordion:after {
	content: '\002B';
	color: black;
	font-weight: bold;
	float: right;
	margin-left: 5px;
}

.active2:hover {
	color: white;
}

.active2:after {
	content: "\2212";
}

.panel {
	padding: 0 18px;
	color: #153E54;
	background-color: white;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
}

.faq-container {
	width: 80%;
	margin-right: auto;
	margin-left: auto;
	margin-top: 80px;
	margin-bottom: 200px;
}

p {
	color: #323C73;
	font-weight: bold;
}

.page-title {
	font-weight: bold;
	margin-bottom: 35px;
}
/*faq end*/
</style>

</head>
<body>
					<section class="hero-wrap hero-wrap-2">
	<img src="img/bannerimg/faq.png" id="bannerimg">
	</section>
		
	<div class="faq-container">
		<h1 class="page-title">FAQ</h1>

		<c:forEach items="${faqs}" var="faq">
			<button class="accordion">${faq.f_title}</button>
			<div class="panel">
				<pre>${faq.f_subject}</pre>
			</div>
		</c:forEach>
	</div>

	<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active2");
				var panel = this.nextElementSibling;
				if (panel.style.maxHeight) {
					panel.style.maxHeight = null;
				} else {
					panel.style.maxHeight = panel.scrollHeight + "px";
				}
			});
		}

		$(document).ready(
				function() {
					// Add minus icon for collapse element which is open by default
					$(".collapse.show").each(function() {
						$(this).prev(".card-header").addClass("highlight");
					});

					// Highlight open collapsed element 
					$(".card-header .btn").click(
							function() {
								$(".card-header").not($(this).parents())
										.removeClass("highlight");
								$(this).parents(".card-header").toggleClass(
										"highlight");
							});
				});
	</script>
</body>
</html>
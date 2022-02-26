<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 공통변수 처리 -->
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"
	scope="application" />
<c:set var="RESOURCES_PATH" value="${CONTEXT_PATH}/resources"
	scope="application" />
<!DOCTYPE html>
<html>
<style style="text/css">

html,

body {

    margin:0;

    padding:0;

    height:100%;

}

#wrapper {

   position:relative;

    min-height:100%;

}

#header {

   height:70px;

    background:#ccc;

}

#container {

    padding:20px;

}

#footer {

    position:absolute;

    bottom:0;
	left:0;
	right:0;
	padding-top:500px;
    width:100%;

    height:70px;   

    background:#ccc;

}
.div.wrap{
	position:relative;
	
}
* {
box-sizing: border-box;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
}
#body{
	height:100%;
}
	
</style>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="text/javascript">
	var CONTEXT_PATH = "${CONTEXT_PATH}";
	var RESOURCES_PATH = "${RESOURCES_PATH}";
</script>



<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="resources/user/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/user/css/animate.css">

<link rel="stylesheet" href="resources/user/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/user/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/user/css/magnific-popup.css">

<link rel="stylesheet" href="resources/user/css/aos.css">

<link rel="stylesheet" href="resources/user/css/ionicons.min.css">

<link rel="stylesheet" href="resources/user/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/user/css/jquery.timepicker.css">


<link rel="stylesheet" href="resources/user/css/flaticon.css">
<link rel="stylesheet" href="resources/user/css/icomoon.css">
<link rel="stylesheet" href="resources/user/css/style.css">
<style type="text/css">

.scrollax-performance, .scrollax-performance *, .scrollax-performance *:before,
	.scrollax-performance *:after {
	pointer-events: none !important;
	-webkit-animation-play-state: paused !important;
	animation-play-state: paused !important;
}; 
</style>


<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/48/1a/intl/ko_ALL/common.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/48/1a/intl/ko_ALL/util.js"></script>
</head>


<body>


<%-- 	<div class='wrap'>
		<tiles:insertAttribute name="header" />
		<div class='content'>
			<div class="page_content">
				<tiles:insertAttribute name="body" />
				<tiles:insertAttribute name="footer" />
			</div>

		</div>

	</div>
	 --%>
	<div class='wrap'>
		<tiles:insertAttribute name="header" />
	</div>
		
		<main>
				<tiles:insertAttribute name="body" />
		</main>
				
				<tiles:insertAttribute name="footer" />
			
		

	





<!-- 	<script src="resources/user/js/jquery.min.js"></script>
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
	<script src="resources/user/js/main.js"></script> -->

</body>

</html>
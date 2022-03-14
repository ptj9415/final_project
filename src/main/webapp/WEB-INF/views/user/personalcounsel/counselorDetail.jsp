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
/*상담사 상세페이지*/

.card {
    border: none;
    position: relative;
    overflow: hidden;
    border-radius: 8px;
    cursor: pointer
}



/* .card:after {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    width: 4px;
    height: 100%;
    background-color: #468FB6;
 /*    transform: scaleY(0); */
    transition: all 0.5s;
    transform-origin: bottom
} */

.card:hover::after {
  /*   transform: scaleY(1) */
}

.fonts {
    font-size: 11px
}

.social-list {
    display: flex;
    list-style: none;
    justify-content: center;
    padding: 0
}

.social-list li {
    padding: 10px;
    color: #468FB6;
    font-size: 19px
}

/* .buttons button:nth-child(1) {
    border: 1px solid #468FB6!important;
    color: #468FB6;
    height: 40px;
    width:80px;
}

.buttons button:nth-child(1):hover {
    border: 1px solid #468FB6!important;
    color: #fff;
    height: 40px;
    width:80px;
    background-color: #468FB6;
}

.buttons button:nth-child(2) {
    border: 1px solid #468FB6!important;
    background-color: #468FB6;
    color: #fff;
    height: 40px
} */
.profile-body{
	margin-top:100px;
}
/*상담사 상세페이지 end*/
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
.hashtag-btn{
  	border: 1px solid #468FB6!important;
    color: #468FB6;
    height: 40px;
    width:110px;
    background-color: white;
    border-radius: 20px;
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
<div class="profile-body">
	<div class="container mt-5">
    <div class="row d-flex justify-content-center">
        <div class="col-md-7">
            <div class="card p-3 py-4">
                <div class="text-center"> 
                	<img src="img/counselorpicture/${counselorSelect.c_picturepath}" onerror="this.src='resources/user/images/errorprofile.jpg';" width="100" class="rounded-circle"> 
                </div>
                <div class="text-center mt-3"> 
                	<!-- <span class="bg-secondary p-1 px-4 rounded text-white">Pro</span> -->
                    <h5 class="mt-2 mb-0" style="font-weight:bold">${counselorSelect.c_name } </h5> <span>${counselorSelect.c_grade }</span>
                                            <p class="fonts">${counselorSelect.c_phone }</p>
                    
                    <br>
                      <p class="fonts" style="font-weight:bold">' ${counselorSelect.c_name } ${counselorSelect.c_grade } ' 님의 전문 상담 카테고리 </p>
                    <div class="buttons"> 
                    	<c:forEach items="${subNameList }" var="subnames">
		                    <button class="hashtag-btn">#${subnames.ccg_subname }</button> 
                    	</c:forEach>
		                    
	                    </div>
                    <div class="px-4 mt-1">
                        <p class="fonts">Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
                    </div>
                    <ul class="social-list">
                        <li><i class="fa fa-facebook"></i></li>
                        <li><i class="fa fa-dribbble"></i></li>
                        <li><i class="fa fa-instagram"></i></li>
                        <li><i class="fa fa-linkedin"></i></li>
                        <li><i class="fa fa-google"></i></li>
                    </ul>
	                    
                </div>
            </div>
        </div>
    </div>
</div>
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
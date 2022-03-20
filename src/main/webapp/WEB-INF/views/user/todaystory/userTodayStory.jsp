<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 한마디</title>

<link rel="stylesheet" href="resources/user/css/todayStory.css">
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
	margin-left: 25px;
}

.register-btn{
	background-color:#153e54;
	width:100px;
	height:40px;
	color:white;
	font-size:14px;
	text-align: center;
    border-radius: 30px;
}
.register-btn:hover{
	cursor:pointer;
	color:#153e54;
	border:1px solid #153e54;
	background-color:white;
	text-align: center;
	transition: 300ms ease-in-out;
}
.btn-delete{
	float:right;
}
.btn-delete:hover{
	cursor:pointer;
	 transform:scale(1.4);
}
.card-text{
	float:left;
	margin-top: -40px;
}
.today-container{
	margin-top:100px;
}
/*댓글*/
@charset "utf-8";

@import url("https://fonts.googleapis.com/css?family=Handlee");

/* Box sizing */
html {

}
/* *,
*:before,
*:after {
  box-sizing: inherit;
} */

/* My style */
.sticky-notes{
  /* background: rgba(102, 102, 102, 0.068); */
  color: #fff;
}



h1#title {
  font-size: 2em;
  text-align: center;
  margin: 1em;
}

h3 {
  margin-bottom: 22px;
}

p#description {
  font-size: 16px;
  text-align: center;
}

#survey-form {
  display: flex;
  flex-flow: row wrap;
  margin-bottom: 100px;
  margin-right: auto;
  margin-left: 50px;
 /*  justify-content: space-around; */
  
}

/* legend.tape {
  background-color: rgba(255, 255, 255, 0.7);
  padding: 12px;
  border-radius: 5px;
} */

fieldset.sticky-note {
  border-radius: 3px;
  height: 13em;
  width: 13em;
  padding-right:20px;
  padding-top:10px;
  padding-left:40px;
  padding-bottom:20px;
  margin: 2em;
  color: #000;
  background: rgb(255 253 199 / 56%);
  box-shadow: 8px 5px 5px rgba(33, 33, 33, 0.5);
}

fieldset.sticky-note:nth-child(1) {
  transform: rotate(6deg);
  background-color: rgb(187 187 208 / 22%);
}

fieldset.sticky-note:nth-child(even) {
  transform: rotate(-6deg);
  background-color: rgb(189 209 176 / 31%);
}

fieldset.sticky-note:nth-child(3n) {
  transform: rotate(4deg);
  background-color: rgb(207 157 165 / 32%);
}

fieldset.sticky-note:nth-child(5n) {
  transform: rotate(-6deg);
}

fieldset.sticky-note:nth-child(7n) {
  transform: rotate(-4deg);
}


fieldset.sticky-note:hover,
fieldset.sticky-note:focus {
  box-shadow: 12px 12px 8px rgba(0, 0, 0, 0.442);
  transform: scale(1.1);
  transition: transform 0.25s linear;
}

input[type="text"],
input[type="number"],
input[type="email"],
select,
textarea {
  margin-bottom: 10px;
  background: transparent;
  width: 100%;
  border: none;
  border-bottom: 1px solid rgba(0, 0, 0, 0.6);
  font-size: 16px;
  height: 30px;
}

input[type="checkbox"] {
  position: relative;
  width: 40px;
  height: 20px;
  -webkit-appearance: none;
  background: #c6c6c6;
  outline: none;
  border-radius: 20px;
  box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
  /* transition: .5%; */
}

input:checked[type="checkbox"] {
  background: #153e54;
}

input[type="checkbox"]:before {
  content: "";
  position: absolute;
  width: 20px;
  height: 20px;
  border-radius: 50%;
  top: 0;
  left: 0;
  background: #fff;
  transform: scale(1.1);
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
  transition: 0.5s;
}

input:checked[type="checkbox"]:before {
  left: 20px;
}

@media (max-width: 768px) {
  fieldset.sticky-note {
    margin: 40px 0 0 0;
  }
}

@media (max-width: 426px) {
  fieldset.sticky-note:nth-child(-n + 7) {
    transform: none;
  }

}
.none-text{
  border-radius: 3px;
  height: 100px;
  width: 300px;
  font-size:14px;
  text-align:center;
  padding-right:20px;
  padding-top:20px;
  padding-left:20px;
  padding-bottom:20px;
  margin-top:100px;
  margin-bottom:100px;
  margin-right:auto;
  margin-left:auto;
  color: black;
  background: rgb(255 253 199 / 56%);
  box-shadow: 8px 5px 5px rgba(33, 33, 33, 0.5);
}
/*댓글 end*/
/*modal*/
/*modal end*/
</style>
</head>
<body>
	<!-- 오늘의 한마디 주제 -->
			<section class="hero-wrap hero-wrap-2">
	<img src="img/bannerimg/todaystory.png" id="bannerimg">
	</section>
		<div class="today-container">
			<div class="container">
				<div class="row justify-content-start mb-5 pb-2">
					<div
						class="col-md-4 heading-section ftco-animate fadeInUp ftco-animated">
						<span class="subheading subheading-with-line"><small
							class="pr-2 bg-white">MAEUMI</small></span>
						<h2 class="mb-4">오늘의 한마디</h2>
					</div>
					<div
						class="col-md-8 pl-md-5 heading-section ftco-animate fadeInUp ftco-animated">
						<div class="pl-md-4 border-line">
							<span class="mr-2">오늘의 주제는 '</span> <span style="font-weight:bold; color:black;">${todaySelect.sc_title} </span><span class="mr-2">' 입니다</span>
							<p>${todaySelect.sc_subject}</p>
							<input type="button" class="register-btn" id="submit-btn" data-toggle="modal" data-target="#modal-lg" value="글쓰기">
	
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- modal contents start -->

<div class="modal fade" id="modal-lg">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title"></h4>
					<button type="button" class="close" data-dismiss="modal" style="width:100px"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- general form elements -->
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">오늘의 한마디</h3>
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
	  
        <div class="sticky-notes">
            <form action="get" id="survey-form">

<c:set var="todayReplyContent" value="${todayReplyList }" />
	<c:choose>
			<c:when test="${not empty todayReplyContent}">
	     	 <c:forEach items="${todayReplyList}" var="todayReplyList">
	                <fieldset class="sticky-note">
	                    
	                    <c:if test="${nickname eq todayReplyList.sr_writer}">
										
							<div class="btn-delete" id="btn-delete">
								<span id="delete" onclick="replyDelete('${todayReplyList.sr_no}')" style="font-size:24px; font-weight:bold; color:rgb(132, 40, 40);">×</span>
							</div>
						</c:if>
						<br>
						<br>
						<c:choose>
							<c:when test="${todayReplyList.sr_anony eq 'F' }">
								<p class="card-text" id="sr_anony" style="text-align: right; font-weight:bold;">${todayReplyList.sr_writer}</p>
							</c:when>
							<c:otherwise>
								<p class="card-text"  id="sr_anony" style="text-align: right; font-weight:bold;">익명</p>
							</c:otherwise>
						</c:choose>
<<<<<<< HEAD
								<br><br><p style="padding-bottom:20px; margin-top: -50px;">${todayReplyList.sr_subject}</p>
=======
								<br><br><p style="padding-bottom:20px; font-size: 13px;">${todayReplyList.sr_subject}</p>
>>>>>>> branch 'master' of https://github.com/ptj9415/final_project.git
	                   
            <input type="hidden" id="sc_no" name="sc_no" value="${todaySelect.sc_no}" />
	                </fieldset>          
	       </c:forEach>	
	       </c:when>
		       	<c:otherwise>
								<div class="none-text">
									<p>아직 댓글이 하나도 없어요.</p>
									<p>오늘의 한마디를 작성해 보세요!</p>
								</div>
				</c:otherwise>
		</c:choose>
            </form>
        </div>
        <!-- End of .sticky-notes-->

    
    <!-- End of .container-->

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
	<script src="https://gitcdn.link/repo/freeCodeCamp/testable-projects-fcc/master/build/bundle.js"></script>
	
</body>
</html>
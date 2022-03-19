<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>마이 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>

.md-stepper-horizontal {
	display: table;
	width: 100%;
	margin: 0 auto;
	background-color: #FFFFFF;
	box-shadow: 0 3px 8px -6px rgba(0, 0, 0, .50);
}

.md-stepper-horizontal .md-step {
	display: table-cell;
	position: relative;
	padding: 24px;
}

.md-stepper-horizontal .md-step:hover, .md-stepper-horizontal .md-step:active
	{
	/* background-color: rgba(0, 0, 0, 0.04); */
	
}

.md-stepper-horizontal .md-step:active {
	border-radius: 15%/75%;
}

.md-stepper-horizontal .md-step:first-child:active {
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
}

.md-stepper-horizontal .md-step:last-child:active {
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

.md-stepper-horizontal .md-step:hover .md-step-circle {
	background-color: #757575;
}

.md-stepper-horizontal .md-step:first-child .md-step-bar-left,
	.md-stepper-horizontal .md-step:last-child .md-step-bar-right {
	display: none;
}

.md-stepper-horizontal .md-step .md-step-circle {
	width: 30px;
	height: 30px;
	margin: 0 auto;
	background-color: #999999;
	border-radius: 50%;
	text-align: center;
	line-height: 30px;
	font-size: 16px;
	font-weight: 600;
	color: #FFFFFF;
}

.md-stepper-horizontal.green .md-step.active .md-step-circle {
	background-color: #00AE4D;
}

/*step1*/
.md-stepper-horizontal.orange .md-step.active .md-step-circle {
	background-color: #999999;
}
/*step2*/
.md-stepper-horizontal.orange .md-step.active .md-step-circle {
	background-color: #468FB6;
}
/*step3*/
.md-stepper-horizontal.orange .md-step.active .md-step-circle {
	background-color: #999999;
}
/*step4*/
.md-stepper-horizontal.orange .md-step.active .md-step-circle {
	background-color: #468FB6;
}

.md-stepper-horizontal .md-step.active .md-step-circle {
	background-color: rgb(33, 150, 243);
}

.md-stepper-horizontal .md-step.done .md-step-circle:before {
	font-family: 'FontAwesome';
	font-weight: 100;
	content: "\f00c";
}

.md-stepper-horizontal .md-step.done .md-step-circle *,
	.md-stepper-horizontal .md-step.editable .md-step-circle * {
	display: none;
}

.md-stepper-horizontal .md-step.editable .md-step-circle {
	-moz-transform: scaleX(-1);
	-o-transform: scaleX(-1);
	-webkit-transform: scaleX(-1);
	transform: scaleX(-1);
}

.md-stepper-horizontal .md-step.editable .md-step-circle:before {
	font-family: 'FontAwesome';
	font-weight: 100;
	content: "\f040";
}

.md-stepper-horizontal .md-step .md-step-title {
	margin-top: 16px;
	font-size: 16px;
	font-weight: 600;
}

.md-stepper-horizontal .md-step .md-step-title, .md-stepper-horizontal .md-step .md-step-optional
	{
	text-align: center;
	color: rgba(0, 0, 0, .26);
}

.md-stepper-horizontal .md-step.active .md-step-title {
	font-weight: 600;
	color: rgba(0, 0, 0, .87);
}

.md-stepper-horizontal .md-step.active.done .md-step-title,
	.md-stepper-horizontal .md-step.active.editable .md-step-title {
	font-weight: 600;
}

.md-stepper-horizontal .md-step .md-step-optional {
	font-size: 12px;
}

.md-stepper-horizontal .md-step.active .md-step-optional {
	color: rgba(0, 0, 0, .54);
}

.md-stepper-horizontal .md-step .md-step-bar-left,
	.md-stepper-horizontal .md-step .md-step-bar-right {
	position: absolute;
	top: 36px;
	height: 1px;
	border-top: 1px solid #DDDDDD;
}

.md-stepper-horizontal .md-step .md-step-bar-right {
	right: 0;
	left: 50%;
	margin-left: 20px;
}

.md-stepper-horizontal .md-step .md-step-bar-left {
	left: 0;
	right: 50%;
	margin-right: 20px;
}

*, *::before, *::after {
	box-sizing: border-box;
}

.pb-2, .py-2 {
	margin-top: 100px;
}

body {
	font-weight: 400;
	letter-spacing: 0;
	text-rendering: optimizeLegibility;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	-moz-font-feature-settings: "liga" on;
	width: 100%;
	margin-right: auto;
	margin-left: auto;
}

p {
	display: block;
	float: right;
	margin-right: 20px;
	margin-block-start: 0.5em;
	margin-block-end: 0.6em;
	margin-inline-start: 0px;
	/* margin-inline-end: 0px; */
}

img {
	height: auto;
	max-width: 100%;
	vertical-align: middle;
}

.btn {
	background-color: white;
	border: 1px solid #468FB6;
	color: #468FB6;
	padding: 0.5rem;
	text-transform: lowercase;
	border-radius: 30px;
	margin-right: auto;
	margin-left: auto;
	margin-right: 20px;
}

.btn:hover {
	transition: 0.3s ease-in-out;
	background-color: #468FB6;
	color: white;
	cursor: pointer;
}

.card__doctor {
	/* background-color: white;
    /* border: 1px solid #468FB6; */
	/* color: #468FB6; */
	/* padding: 0.5rem;  */
	text-transform: lowercase;
	border-radius: 30px;
	font-size: 0.8em;
	width: 100%;
}

.btn--block {
	display: block;
	width: 30%;
}

/*detail start*/
.row{
	margin-bottom:100px;
}
.container mt-5 {
   
    width: 80%;
    margin-right:auto;
    margin-left:auto;
    border-radius:40px;
    margin-bottom:100px;
  }
  
  .date__box {
    position: absolute;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    color: #ccc;
    border: 4px solid;
    font-weight: bold;
    padding: 5px 10px;
  }
  .date__box .date__day {
    font-size: 22px;
  }
  
  .blog-card {
    padding: 30px;
    position: relative;
  }
  .blog-card .date__box {
    opacity: 0;
    transform: scale(0.5);
    transition: 500ms ease-in-out;
  }
  .blog-card .blog-card__background,
  .blog-card .card__background--layer {
    z-index: -1;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
  }
  .blog-card .blog-card__background {
    padding: 15px;
    background: white;
  }
  .blog-card .card__background--wrapper {
    height: 80%;
    clip-path: polygon(0 0, 100% 0, 100% 80%, 0 80%);
    position: relative;
    overflow: hidden;
  }
  .blog-card .card__background--main {
    height: 100%;
    position: relative;
    transition: 300ms ease-in-out;
    background-repeat: no-repeat;
    background-size: cover;
  }
  .blog-card .card__background--layer {
    z-index: 0;
    opacity: 0;
    background: rgba(51, 51, 51, 0.9);
    transition: 300ms ease-in-out;
  }
  .blog-card .blog-card__head {
    height: 300px;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .blog-card .blog-card__info {
    z-index: 10;
    background: white;
    padding: 20px 15px;
    border-radius:40px;
  }
  .blog-card .blog-card__info h5 {
    transition: 300ms ease-in-out;
  }
  
  a.icon-link {
    color: #363738;
    transition: 200ms ease-in-out;
  }
  a.icon-link i {
    color: #468FB6;
  }
  a.icon-link:hover {
    color: #468FB6;
    text-decoration: none;
  }
  
  .btn {
    background: white;
    color: #363738;
    font-weight: bold;
    outline: none;
    box-shadow: 1px 1px 3px 0 rgba(0, 0, 0, 0.2);
    overflow: hidden;
    border-radius: 0;
    height: 50px;
    line-height: 50px;
    display: inline-block;
    padding: 0;
    border: none;
  }
  .btn:focus {
    box-shadow: none;
  }
  .btn:hover {
    background: #468FB6;
    color: #fff;
  }
  .btn.btn--with-icon {
    padding-right: 20px;
  }
  .btn.btn--with-icon i {
    padding: 0px 30px 0px 15px;
    margin-right: 10px;
    height: 50px;
    line-height: 50px;
    vertical-align: bottom;
    color: white;
    background: #468FB6;
    clip-path: polygon(0 0, 70% 0, 100% 100%, 0% 100%);
  }
  .btn.btn--only-icon {
    width: 50px;
  }
  

/*detail end*/

/*button start*/
.btn--block {
    display: block;
    width: 30%;
}
.apply-btn {
   background-color: #468FB6;
    border: 0px solid white;
    color: white;
    text-transform: lowercase;
    border-radius: 30px;
    /* margin-right: auto; */
    margin-left: auto;
    margin-right: 80px;
    padding: 0.5rem;
    width: 100px;
}
.apply-btn:hover {
   background-color: white;
    border: 1px solid #468FB6;
    color: #468FB6;
    text-transform: lowercase;
    border-radius: 30px;
    /* margin-right: auto; */
    margin-left: auto;
    margin-right: 80px;
    padding: 0.5rem;
    width: 100px;
    transition: 300ms ease-in-out;
   
}

.apply-btn:after{
	border: 0px;
}

h3 {
	font-size: 24px;
	font-weight: 600;
}

.row {
	margin-bottom: -10px;
}

#headerp {
	position: relative;
	top: 7px;
	margin-left: 15px;
	font-weight: 600;
}

#infotable {
	width: 100%;
	height: 150px;
}

#infotable>tbody>tr>th {
	width: 10%;
	text-align: center;;
}

#infotable>tbody>tr>td {
	width: 40%;
}

#gc_title {
	width: 57%;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#gc_startdate, #gc_finaldate {
	widgh: 100%;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#gc_date, #gc_time {
	widgh: 50%;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#gc_min_person, #gc_max_person {
	width: 17%;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#gc_type {
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
	width: 40%;
}

#gc_price {
	width: 45%;
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
}

#counseltable>tbody>tr>th {
	text-align: center;
	vertical-align: middle;
}

#gc_kakao {
	height: 30px;
	border: 0.5px solid rgb(210, 210, 210);
	width: 40%;
}

.filebox .uploadname, .filebox .uploadname1 {
	display: inline-block;
	height: 40px;
	padding: 0 10px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	width: 31%;
	color: #999999;
}

.filebox label {
	display: inline-block;
	padding: 7px 20px;
	color: #fff;
	vertical-align: middle;
	background-color: #999999;
	cursor: pointer;
	height: 40px;
	margin-left: 10px;
	margin-top: 8px;
}

.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

#modify2 {
	float: right;
	height: 35px;
	border: none;
	border-radius: 5px;
	background-color: #1E90FF;
	color: white;
}

#backbtn {
	float: right;
	width: 80px;
	height: 35px;
	margin-right: 10px;
	border: 1px solid red;
	border-radius: 5px;
	background-color: white;
	color: red;
}

#closebtn {
	float: right;
	height: 35px;
	margin-right: 10px;
	border: none;
	border-radius: 5px;
	background-color: red;
	color: white;
}

textarea {
	width: 40%;
	height: 6.25em;
	resize: none;
}

.mainForm{
	margin-left: 50px;
}
.myInfoForm {
	padding: 20px;
	border: 1px solid gray;
	width: 40%;
}
.myInfo {
	margin-top: 15px;
}
.changeBtn {
	width:110px;
	height:45px;
	float: right;
	border-radius: 30px;
    border: 1px solid #8dacbd42;
    background-color: #8dacbd42;
}
.changeBtn:hover{
	color:white;
	border:1px solid #153e54;
	background-color:#153e54;
	transition:200ms ease-in-out;
}
.changeBtn:focus{
	outline:0;
}



.myInfoInput {
	border: 0px solid gray;
	width: 250px;
}
#changeCheck {
	display: none;
}
.manage-btn{
	width:50%; 
	margin-left:auto; 
	margin-right:auto;
}
</style>
</head>
<body>
	
<section class="hero-wrap hero-wrap-2" style="background-image: url('resources/user/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
				</div>
			</div>
		</div>
</section>

<div class="container">
		<div class="row justify-content-start mb-5 pb-2">
			<div
				class="col-md-4 heading-section ftco-animate fadeInUp ftco-animated">
				<span class="subheading subheading-with-line"><small
					class="pr-2 bg-white">MAEUMI</small></span>
				<h2 class="mb-4">마이페이지</h2>
			</div>
			<div class="col-md-8 pl-md-5 heading-section ftco-animate fadeInUp ftco-animated">
				<div class="pl-md-4 border-line">
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia, there live the blind texts.
						Separated they live in. A small river named Duden flows by their
						place and supplies it with the necessary regelialia. It is a
						paradisematic country, in which roasted parts of sentences fly
						into your mouth.</p>
				</div>
			</div>
		</div>
	</div>

<section class="content">
	<div class="container-fluid">
		<br>
			<div class="row">
				<div class="col-md-1 offset-md-0"></div>
				<div class="col-md-10 offset-md-0">
					<div class="card">
						<p id="headerp">개인 정보</p>
					</div>
				</div>
			</div>
			<div class="row">
			<div class="col-1"></div>
				<div class="col-10">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<br>
							<table class="table text-nowrap" id="infotable">
								<tr>
									<th>이메일</th>
									<td>${member.m_email } (${member.m_type })</td>
									<th>닉네임</th>
									<td>
										<input type="text" class="myInfoInput" id="nickname" name="nickname" value="${member.m_nickname }" readonly="readonly"> 
										<input type="button" class="changeBtn" id="changeBtn" onclick="nicknameChanged()" value="닉네임 변경">
										<input type="button" class="changeBtn" id="changeCheck" value="적용">
									</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>
										 <input type="text" class="myInfoInput" value="${member.m_phone }">
										 <input type="button" class="changeBtn" id="phoneChkBtn" value="연락처 수정">
									</td>
									<th>MBTI</th>
									<td>${member.m_mbti}</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td>******
										<input type="button" id="changePwdBtn" value="비밀번호 변경하기" >
										<input type="button" id="memberLeave" value="회원탈퇴">
									</td>
									<th>가입 유형</th>
									<td>${member.m_type}</td>
								</tr>
							</table>
							<br>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" id="pwdvalue" value="${member.m_type }">
	</div>
</section>
<br><br><br>
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-1 offset-md-0"></div>
				<div class="col-md-10 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">
							내 결제 내역
							<!-- <button type="button" class="minusbtn" id="minusbtn2">
								<i id="minusicon2" class="fa fa-minus"></i>
							</button> -->
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10">
					<div class="card" id="maindiv2">
						<div class="card-body table-responsive p-00">
							<table class="table text-nowrap" id="membertable">
								<thead>
									<tr>
										<th>결제 번호</th>
										<th>상담사 이름</th>
										<th>상담 구분</th>
										<th>결제일</th>
										<th>결제 금액</th>
										<th>현황</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach  items="${list}" var="list">
										<tr>
											<td>${list.or_uid}</td>
											<td>${list.c_name}</td>
											<c:if test="${list.or_status eq 0 }">
												<td>결제 완료</td>
											</c:if>
											<c:if test="${list.or_status eq 1 }">
												<td>환불</td>
											</c:if>
											<td>${list.or_date}</td>
											<td>${list.or_price}</td>
											<c:if test="${list.or_status eq 0 }">
												<td> <button type="button" onclick="refundFunc('${list.or_no}')">환불</button></td>
											</c:if>
											<c:if test="${list.or_status eq 1 }">
												<td>-</td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
	</section>
	<br><br><br>
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-1 offset-md-0"></div>
				<div class="col-md-10 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">
							자유게시판
<!-- 							<button type="button" class="minusbtn" id="minusbtn2">
								<i id="minusicon2" class="fa fa-minus"></i>
							</button> -->
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10">
					<div class="card" id="maindiv2">
						<div class="card-body table-responsive p-00">
							<table class="table text-nowrap" id="membertable">
								<thead>
									<tr>
										<th colspan="2">작 성 일</th>
										<th colspan="2">구분</th>
										<th colspan="5">제목</th>
										<th style="text-align:center">게시글가기</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach  items="${blist}" var="blist">
									<tr>
										<td colspan="2">${blist.b_wdate}</td>
										<td colspan="2">${blist.b_subject}</td>
										<td colspan="5">${blist.b_title}</td>
										<td><button class="manage-btn" onclick="boardDetail('${blist.b_no}')">게시글가기</button> </td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
	</section>
<br><br><br>
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-1 offset-md-0"></div>
				<div class="col-md-10 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">
							내 상담 내역
							<!-- <button type="button" class="minusbtn" id="minusbtn2">
								<i id="minusicon2" class="fa fa-minus"></i>
							</button> -->
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10">
					<div class="card" id="maindiv2">
						<div class="card-body table-responsive p-00">
							<table class="table text-nowrap" id="membertable">
								<thead>
									<tr>
										<th>상담일</th>
										<th>상담사 이름</th>
										<th>구분</th>
										<th>상담주제</th>
										<th>상담타입</th>
										<th>상담상태</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach  items="${plist}" var="plist">
										<tr>
											<td>${plist.pr_date}</td>
											<td>${plist.c_name}</td>
											<c:if test="${plist.pr_no ne 0 }">
												<td>개인상담</td>
											</c:if>
											<td>${plist.c_name} 상담사 ${plist.pr_type} 개인상담</td>
											<td>${plist.pr_type}</td>
											<c:if test="${plist.pr_status eq 0 }">
												<td>상담 중</td>
											</c:if>
											<c:if test="${plist.pr_status eq 1 }">
												<td>상담 완료</td>
											</c:if>
											<c:if test="${plist.pr_status eq 2 }">
												<td>환불</td>
											</c:if>
											<td> <button type="button" onclick="personalsangDam('${plist.pr_no}')">조회</button> </td> 
										</tr>
									</c:forEach>
									<c:forEach  items="${glist}" var="glist">
										<tr>
											<td>${glist.gr_reservedate}</td>
											<td>${glist.gc_name}</td>
											<c:if test="${glist.gr_no ne 0 }">
												<td>그룹상담</td>
											</c:if>
											<td>${glist.gc_title}</td>
											<td>${glist.gc_type }</td>
											<c:if test="${glist.gr_status eq 0 }">
												<td>상담 중</td>
											</c:if>
											<c:if test="${glist.gr_status eq 1 }">
												<td>상담 완료</td>
											</c:if>
											<td> <button type="button" onclick="GroupsangDam('${glist.gc_no}','${glist.gr_no}')">조회</button> </td> 
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
	</section>
<!-- 결국 이메일이랑, 가입유형으로 구분해야 한다.  
	카카오로 로그인을 하든, 네이버로 로그인을 하든, 일반회원으로 로그인을 하든 
	기본적으로 세션값을 부여해서 이메일일과 가입유형에 대한 세션값을 준다.
	그리고 컨트롤러를 통해서 그 세션값을 가져와서 쿼리를 날려 해당 유저의 모든 정보를 추출해서
	그 정보를 mypage로 전달한다. 
	-->
<br><br><br>
</body>
<script>
	 /* 가입유형이 '마으미'인 회원들만 비밀번호 변경 버튼 출력하기 */
	 $(document).ready(function(){
		 if ( $("#pwdvalue").val() != '마으미' ) {
			 $("#changePwdBtn").hide();
			 $("#memberLeave").hide();
		 }
	 });

	 
	/* =========닉네임 변경============ */
	
	// 메소드chain 숙지하기. 동일한 것들 연달아서 적용가능.
	var myNickname = $("#nickname").val();
	function nicknameChanged() {
			$("#nickname").attr("readonly", false)
						  .attr("placeholder", "변경할 닉네임을 입력하세요.")
						  .val('')
						  .focus();
			$("#changeBtn").hide();
			$("#changeCheck").css("display", "block");
	}
	
	// 닉네임 변경 시키기
	$("#changeCheck").on("click",function(){
		var sendNickname = $("#nickname").val();
		
		if( $("#nickname").val() == '' ){
			alert("변경할 닉네임을 입력하세요");
			$("#nickname").focus();
		} else {
			$.ajax({  // 닉네임 변경 호출
				url: "ajaxUpdateNickname.do",
				type: "POST",
				data: {
					sendNickname : sendNickname
				},
				dataType : "text",
				success: function(responseText) {
						if(responseText == 'YES') {
							alert("닉네임이 변경되었습니다.");
							$("#changeBtn").show();
							$("#changeCheck").css("display", "none");
						}
				}
			});		
		}
	});
	
	
	/* =======휴대폰번호 등록하기========== */
	
	/* 연락처 인증 팝업창  호출 */
	$("#phoneChkBtn").on("click", function() {
		 phonePopupOpen();
	});
	
	function  phonePopupOpen() {
		var url= "phoneChkPopup.do";    //팝업창 페이지 URL
		var winWidth = 500;    
	    var winHeight = 400;
	    var popupX = (window.screen.width / 2) - (800 / 2);
	    var popupY= (window.screen.height /2) - (600 / 2);
	    var popupOption= "width="+winWidth+", height="+winHeight+", left="+ popupX + ", top=" + popupY;    //팝업창 옵션(optoin)
		window.open(url,"",popupOption);
	};
	
	
	/* =======비밀번호 변경 팝업창 호출========= */
	$("#changePwdBtn").on("click", function() {
		 popupOpen();
	})
	
	function  popupOpen() {
		var url= "passwordPopup.do";    //팝업창 페이지 URL
		var winWidth = 500;    
	    var winHeight = 400;
	    var popupX = (window.screen.width / 2) - (800 / 2);
	    var popupY= (window.screen.height /2) - (600 / 2);
	    var popupOption= "width="+winWidth+", height="+winHeight+", left="+ popupX + ", top=" + popupY;    //팝업창 옵션(optoin)
		window.open(url,"",popupOption);
	}
	

	// 회원탈퇴 처리 => 상태값 F로 변경, session만료시키고, home.do로 이동시키기
	$("#memberLeave").on("click", function() {
		var memberLeaveCheck = confirm("정말 Maeumi.를 떠나시겠습니까..? \n탈퇴하면 1달 동안은 재가입이 어렵습니다.");
		if(memberLeaveCheck) {
			var sendEmail = $("#email").val(); 
			$.ajax({
				type: "POST",
				url: "ajaxMemberLeave.do",
				data: {
					sendEmail : sendEmail
				},
				success: function(responseText){
					if(responseText == "YES") {
						alert("탈퇴처리 되었습니다.");
						location.href='home.do';
					}
				}
			})
		}
		
	});
	
	function refundFunc(or_no){
		if(confirm('정말 환불하시겠습니까?')) {
			url = "mypageRefund.do";
			url = url + "?or_no="+or_no;
			location.href = url;
		}
	}
	
	function boardDetail(b_no){
		url = "userBoardRead.do";
		url = url +"?b_no="+b_no;
		location.href = url;
	}
	
	function GroupsangDam(gc_no, gr_no){
		alert(gc_no);
		url = "userGroupsangDam.do";
		url = url + "?gc_no="+gc_no;
		url = url + "&gr_no="+gr_no;
		location.href = url;
			
	}
	
	function personalsangDam(pr_no){
		url = "userPersonalsangDam.do";
		url = url + "?pr_no="+pr_no;
		location.href = url;
			
	}

</script>
<!-- Bootstrap 4 -->
<script src="subHomeFile/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Select2 -->
<script src="subHomeFile/plugins/select2/js/select2.full.min.js"></script>
<!-- AdminLTE App -->
<script src="subHomeFile/dist/js/adminlte.min.js"></script>
</html>
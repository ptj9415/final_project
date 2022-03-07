<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<style>
h3 {
	font-size: 28px;
	font-weight: bold;
}

#yellowdiv {
	color: white;
}

.small-box-footer {
	font-size: 14px;
}

.small-box h4 {
	font-size: 26px;
	margin: 10px;
}

.small-box h4:hover, .inner:hover {
	color: white;
}

#headerdiv {
	margin-bottom: 4px;
}

#headerp {
	position: relative;
	top: 7px;
	margin-left: 15px;
	font-size: 16px;
	font-weight: 600;
}

.small-box .icon {
	position: absolute;
	top: 10px;
	right: 10px;
	z-index: 0;
	font-size: 70px;
	color: rgba(0, 0, 0, 0.15);
}

.small-box .icon:hover {
color: rgba(0, 0, 0, 0.15);
}
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>
				<i class="fa fa-home"></i>HOME
			</h3>
			<div class="row">
				<div class="col-lg-3 col-xs-6">
					<div class="small-box bg-blue">
						<div class="inner">
							<h4>회원 관리</h4>
							<div class="icon">
								<ion-icon name="cellular" ></ion-icon>
							</div>
						</div>
						<a href="adminMemberList.do" class="small-box-footer">바로가기&nbsp;<i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-xs-6">
					<div class="small-box bg-green">
						<div class="inner">
							<h4>오늘의 한마디 관리</h4>
							<div class="icon">
								<ion-icon name="chatbubbles"></ion-icon>
							</div>
						</div>
						<a href="adminTodayStoryList.do" class="small-box-footer">바로가기&nbsp;<i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-xs-6">
					<div class="small-box bg-purple">
						<div class="inner">
							<h4>공지사항 관리</h4>
							<div class="icon">
								<ion-icon name="library"></ion-icon>
							</div>
						</div>
						<a href="adminNoticeList.do" class="small-box-footer">바로가기&nbsp;<i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<div class="col-lg-3 col-xs-6">
					<div class="small-box bg-red">
						<div class="inner">
							<h4>배너 관리</h4>
							<div class="icon">
								<ion-icon name="desktop"></ion-icon>
							</div>
						</div>
						<a href="adminBannerList.do" class="small-box-footer">바로가기&nbsp;<i
							class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-6">
					<div class="card" id="headerdiv">
						<p id="headerp">상담 통계</p>
					</div>
					<div class="card" id="maindiv">
						<div class="article" style="height: 350px;"></div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card" id="headerdiv">
						<p id="headerp">상담사 통계</p>
					</div>
					<div class="card" id="maindiv">
						<div class="article" style="height: 350px;"></div>
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-6">
					<div class="card" id="headerdiv">
						<p id="headerp">사이트 이용 통계</p>
					</div>
					<div class="card" id="maindiv">
						<div class="article" style="height: 350px;"></div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card" id="headerdiv">
						<p id="headerp">심리검사 통계</p>
					</div>
					<div class="card" id="maindiv">
						<div class="article" style="height: 350px;"></div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>
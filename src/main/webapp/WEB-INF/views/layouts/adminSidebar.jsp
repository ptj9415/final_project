<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
*:hover {
	color: #333;
}

#sidebar {
	background-color: white;
	box-shadow: 0 0px 0px rgb(0, 0, 0), 0px 0px rgb(0, 0, 0) !important;
	width: 250px;
}

.nav-pills .nav-link {
	color: #333;
}

.nav-sidebar .nav-item>.nav-link {
	margin-bottom: 0.7rem;
}

.nav-link {
	font-size: 14px;
}

[class*=sidebar-dark-] .nav-treeview>.nav-item>.nav-link {
	color: #333;
}

[class*=sidebar-dark-] .nav-sidebar>.nav-item.menu-open>.nav-link, [class*=sidebar-dark-] .nav-sidebar>.nav-item:hover>.nav-link,
	[class*=sidebar-dark-] .nav-sidebar>.nav-item>.nav-link:focus {
	color: #333;
}

#nav-link:hover {
	color: #333;
}

#treeview {
	background-color: #F2CBBD;
}

[class*=sidebar-dark] .brand-link {
	border-bottom: 1px solid rgb(222, 226, 230);
}

[class*=sidebar-dark] .brand-link, [class*=sidebar-dark] .brand-link .pushmenu
	{
	color: #333;
}
</style>
<body>
	<!-- Main Sidebar Container -->
	<aside class="main-sidebar sidebar-dark-primary elevation-4"
		id="sidebar">
		<!-- Brand Logo -->
		<c:if test = "${c_admin eq 'A' }">
		<a href="adminhome.do" class="brand-link" style="text-align: center;"> <span
			class="brand-text font-weight-light" ><img src="resources/user/images/logo.png" style="width: 80px;"></span>
		</a>
		</c:if>
		<c:if test = "${c_admin eq 'C' }">
		<a href="counselorMyPageMain.do" class="brand-link" style="text-align: center;"> <span
			class="brand-text font-weight-light" ><img src="resources/user/images/logo.png" style="width: 80px;"></span>
		</a>
		</c:if>
		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<c:if test="${c_admin eq 'A'}">
					<li class="nav-item"><a href="adminHome.do" class="nav-link"
						id="nav-link"> <i class="nav-icon fas fa-tachometer-alt"></i>
							<p>????????????</p>
					</a></li>
				</c:if>
				<c:if test="${c_admin eq 'C' }">
					<li class="nav-item"><a href="#" class="nav-link"
						id="nav-link"> <i class="nav-icon fas fa-chart-pie"></i>
							<p>
								?????? ?????? <i class="right fas fa-angle-left"></i>
							</p>
					</a>
						<ul class="nav nav-treeview" id="treeview">
							<li class="nav-item"><a href="counselorPersonalList.do"
								class="nav-link" id="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>???????????? ??????</p>
							</a></li>
							<li class="nav-item"><a href="counselorGroupOpen.do"
								class="nav-link" id="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>???????????? ??????</p>
							</a></li>
							<li class="nav-item"><a href="counselorGroupList.do"
								class="nav-link" id="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>???????????? ??????</p>
							</a></li>
						</ul></li>

					<li class="nav-item"><a href="counselorMyPageMain.do"
						class="nav-link" id="nav-link"> <i
							class="nav-icon fas fa-tree"></i>
							<p>???????????????</p>
					</a></li>
				</c:if>
				<c:if test="${c_admin eq 'A' }">
					<li class="nav-item"><a href="#" class="nav-link"
						id="nav-link"> <i class="nav-icon fas fa-edit"></i>
							<p>
								?????? ?????? <i class="fas fa-angle-left right"></i>
							</p>
					</a>
						<ul class="nav nav-treeview" id="treeview">
							<li class="nav-item"><a href="adminMemberList.do"
								class="nav-link" id="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>???????????? ??????</p>
							</a></li>
							<li class="nav-item"><a href="adminCounselorList.do"
								class="nav-link" id="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>????????? ??????</p>
							</a></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link"
						id="nav-link"> <i class="nav-icon fas fa-table"></i>
							<p>
								???????????? ?????? <i class="fas fa-angle-left right"></i>
							</p>
					</a>
						<ul class="nav nav-treeview" id="treeview">
							<li class="nav-item"><a href="adminTodayStoryList.do"
								class="nav-link" id="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>????????? ????????? ??????</p>
							</a></li>
							<li class="nav-item"><a href="adminBoardList.do"
								class="nav-link" id="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>??????????????? ??????</p>
							</a></li>
							<li class="nav-item"><a href="admintherapy.do"
								class="nav-link" id="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>??????????????? ??????</p>
							</a></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link"
						id="nav-link"> <i class="nav-icon far fa-envelope"></i>
							<p>
								???????????? ?????? <i class="fas fa-angle-left right"></i>
							</p>
					</a>
						<ul class="nav nav-treeview" id="treeview">
							<li class="nav-item"><a href="adminNoticeList.do"
								class="nav-link" id="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>???????????? ??????</p>
							</a></li>
							<li class="nav-item"><a href="adminFaqList.do"
								class="nav-link" id="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>FAQ ??????</p>
							</a></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link"
						id="nav-link"> <i class="nav-icon fas fa-book"></i>
							<p>
								????????? ?????? <i class="fas fa-angle-left right"></i>
							</p>
					</a>
						<ul class="nav nav-treeview" id="treeview">
							<li class="nav-item"><a href="adminBannerList.do"
								class="nav-link" id="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>?????? ??????</p>
							</a></li>
						</ul></li>
				</c:if>
				<li class="nav-item"><a href="#" class="nav-link" id="nav-link">
						<i class="nav-icon far fa-plus-square"></i>
						<p>
							?????? ?????? <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview" id="treeview">
						<li class="nav-item"><a href="counselorStatistics.do"
							class="nav-link" id="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>????????? ?????? ??????</p>
						</a></li>
						<li class="nav-item"><a href="adminSalesChart.do"
							class="nav-link" id="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>?????? ??????</p>
						</a></li>
					</ul></li>
			</ul>

		</nav>
		<!-- /.sidebar-menu -->
		</div>
		<!-- /.sidebar -->
	</aside>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Main Sidebar Container -->
	<aside class="main-sidebar sidebar-dark-primary elevation-4">
		<!-- Brand Logo -->
		<a href="home.do" class="brand-link"> <span
			class="brand-text font-weight-light">Maeumi</span>
		</a>
		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<li class="nav-item"><a href="adminHome.do" class="nav-link"> <i
						class="nav-icon fas fa-tachometer-alt"></i>
						<p>메인화면</p>
				</a></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-chart-pie"></i>
						<p>
							상담 관리 <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="counselorPersonalApplyList.do"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>개인상담 신청내역</p>
						</a></li>
						<li class="nav-item"><a href="counselorPersonalList.do"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>개인상담 관리</p>
						</a></li>
						<li class="nav-item"><a href="counselorGroupOpen.do"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>그룹상담 개설</p>
						</a></li>
						<li class="nav-item"><a href="counselorGroupList.do"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>그룹상담 관리</p>
						</a></li>
						<li class="nav-item"><a href="counselorGroupApply.do"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>그룹상담 관리-신청자목록(임시)</p>
						</a></li>
						<li class="nav-item"><a href="counselorGroupDetail.do"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>그룹상담 관리-그룹상담 상세 조회(임시)</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="counselorMyPageMain.do"
					class="nav-link"> <i class="nav-icon fas fa-tree"></i>
						<p>마이페이지</p>
				</a></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-edit"></i>
						<p>
							회원 관리 <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="adminMemberList.do"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>일반회원 관리</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>상담사 관리</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-table"></i>
						<p>
							커뮤니티 관리 <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="adminTodayStoryList.do"
							class="nav-link active"> <i class="far fa-circle nav-icon"></i>
								<p>오늘의 한마디 관리</p>
						</a></li>
						<li class="nav-item"><a href="adminBoardList.do"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>자유게시판 관리</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>심리테라피 관리</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon far fa-envelope"></i>
						<p>
							고객센터 관리 <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="adminNoticeList.do"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>공지사항 관리</p>
						</a></li>
						<li class="nav-item"><a href="adminFaqList.do"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>FAQ 관리</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>챗봇 관리</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-book"></i>
						<p>
							사이트 관리 <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>배너 관리</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon far fa-plus-square"></i>
						<p>
							통계 관리 <i class="fas fa-angle-left right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									통계 관리<i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="a">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>상담 통계</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>상담사 통계</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>사이트 이용 통계</p>
								</a></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>심리검사 통계</p>
								</a></li>
							</ul></li>
					</ul></li>
			</ul>

		</nav>
		<!-- /.sidebar-menu -->
		</div>
		<!-- /.sidebar -->
	</aside>
</body>
</html>
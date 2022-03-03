<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>회원정보 상세보기</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">기본 정보</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<br>
							<table class="table text-nowrap" id="infotable">
								<tr>
									<th>닉네임</th>
									<td>${member.m_nickname }</td>
									<th>상태</th>
									<td>${member.m_type }</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>${member.m_email }</td>
									<th>연락처</th>
									<td>${member.m_phone }</td>
								</tr>
							</table>
							<br>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">보유 쿠폰</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<br>
							<table class="table text-nowrap" id="infotable">
								<tr>
									<th>쿠폰 이름</th>
									<th>쿠폰 금액</th>
									<th>발급일</th>
									<th>만료일</th>
								</tr>
								<c:choose>
									<c:when test="${not empty coupon}">
										<c:forEach items="${coupon }" var="coupon">
											<tr>
												<td>${coupon.c_name }</td>
												<td>${coupon.c_price }</td>
												<td>${coupon.c_startdate }</td>
												<td>${coupon.c_finaldate }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:when test="${empty coupon }">
										<tr>
											<td colspan="4">보유한 쿠폰이 없습니다.</td>
										</tr>
									</c:when>
								</c:choose>
							</table>
							<br>
						</div>
					</div>
				</div>
			</div>
			
						<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">상담 내역</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<br>
							<table class="table text-nowrap" id="infotable">
								<tr>
									<th>상담 유형</th>
									<th>상담사</th>
									<th>신청일</th>
									<th>상담일</th>
									<th>상담 상태</th>
									<th>관리</th>
								</tr>
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${not empty coupon}"> --%>
<%-- 										<c:forEach items="${coupon }" var="coupon"> --%>
<!-- 											<tr> -->
<%-- 												<td>${coupon.c_name }</td> --%>
<%-- 												<td>${coupon.c_price }</td> --%>
<%-- 												<td>${coupon.c_startdate }</td> --%>
<%-- 												<td>${coupon.c_finaldate }</td> --%>
<!-- 											</tr> -->
<%-- 										</c:forEach> --%>
<%-- 									</c:when> --%>
<%-- 									<c:when test="${empty coupon }"> --%>
<!-- 										<tr> -->
<!-- 											<td colspan="4">보유한 쿠폰이 없습니다.</td> -->
<!-- 										</tr> -->
<%-- 									</c:when> --%>
<%-- 								</c:choose> --%>
							</table>
							<br>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</section>
</body>
</html>
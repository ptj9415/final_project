<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>매출 통계</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">
							검색
							<button type="button" class="minusbtn" id="minusbtn1">
								<i id="minusicon1" class="fa fa-minus"></i>
							</button>
						</p>
					</div>
				</div>
			</div>

			<div class="row" id="maindiv1">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<div class="card-header">
							<div class="row">
								<div class="col-6">
									<div class="form-group">
										<label>이름</label> <br> <input type="text"
											class="form-control" id="c_name" placeholder="이름을 입력해주세요.">
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>성별</label> <select class="	status" id="c_gender">
											<option value="all">전체</option>
											<option value="남성">남성</option>
											<option value="여성">여성</option>
										</select>
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>상담사 등급</label> <select class="	status" id="c_grade">
											<option value="all">전체</option>
											<option value="심리상담사">심리상담사</option>
											<option value="전문상담사">전문상담사</option>
											<option value="정신과의사">정신과의사</option>
										</select>
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>생년월일</label> <br> <input type="date"
											class="form-control" id="c_birthdate">
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>이메일</label> <br> <input type="text"
											class="form-control" id="c_email" placeholder="이메일을 입력해주세요.">
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>연락처</label> <br> <input type="text"
											class="form-control" id="c_phone" placeholder="연락처를 입력해주세요.">
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>주소</label> <br> <input type="text"
											class="form-control" id="c_address" placeholder="주소를 입력해주세요.">
									</div>
								</div>

								<div class="col-6">
									<div class="form-group">
										<label>상태</label> <select class="	status" id="c_status">
											<option value="all">전체</option>
											<option value="가입">가입</option>
											<option value="탈퇴">탈퇴</option>
										</select>
									</div>
								</div>
							</div>
							<div class="btndiv">
								<button type="reset" id="clearbtn">초기화</button>
								<button type="button" id="btnSearch">
									검색&nbsp;<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>

	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">
							상담사 목록
							<button type="button" class="minusbtn" id="minusbtn2">
								<i id="minusicon2" class="fa fa-minus"></i>
							</button>
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card" id="maindiv2">
						<div class="card-body table-responsive p-00">
							<c:choose>
								<c:when test="${pagination.listCnt lt pagination.end }">
									<span>(총 ${pagination.listCnt }건 중 ${pagination.start }
										~ ${pagination.listCnt }건)</span>
								</c:when>
								<c:otherwise>
									<span>(총 ${pagination.listCnt }건 중 ${pagination.start }
										~ ${pagination.end }건)</span>
								</c:otherwise>
							</c:choose>
							&nbsp;&nbsp;&nbsp;<select class="paging" name="searchType"
								id="listSize" onchange="page(1)">
								<option value="10"
									<c:if test="${pagination.getListSize() == 10 }">selected="selected"</c:if>>10건
									보기</option>
								<option value="15"
									<c:if test="${pagination.getListSize() == 15 }">selected="selected"</c:if>>15건
									보기</option>
								<option value="20"
									<c:if test="${pagination.getListSize() == 20 }">selected="selected"</c:if>>20건
									보기</option>
							</select> <br> <br>
							<table class="table text-nowrap" id="membertable">
								<thead>
									<tr>
										<th>이름</th>
										<th>성별</th>
										<th>상담사 등급</th>
										<th>생년월일</th>
										<th>이메일</th>
										<th>연락처</th>
										<th>주소</th>
										<th>상태</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${counselor }" var="counselor">
										<tr>
											<td>${counselor.c_name }</td>
											<td>${counselor.c_gender }</td>
											<td>${counselor.c_grade }</td>
											<td>${counselor.c_birthdate }</td>
											<td>${counselor.c_email }</td>
											<td>${counselor.c_phone }</td>
											<td>${counselor.c_address }</td>
											<td>${counselor.c_status }</td>
											<td><button type="button" class="managebtn"
													id="managebtn" name="${counselor.c_email }"
													onclick="location.href='adminCounselorDetail.do?c_email=${counselor.c_email}'">관리</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<br>
							<div id="paginationBox" class="pagination1" style="float: right;">
								<ul class="pagination">
									<c:if test="${pagination.prev}">
										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					,'${search.c_name}', '${search.c_gender}', '${search.c_grade}', '${search.c_birthdate}', '${search.c_email}', '${search.c_phone}', '${search.c_address}', '${search.c_status}')">이전</a></li>
									</c:if>
									<c:forEach begin="${pagination.startPage}"
										end="${pagination.endPage}" var="CounselorNo">

										<li
											class="page-item <c:out value="${pagination.page == CounselorNo ? 'active' : ''}"/> ">
											<a class="page-link" href="#"
											onClick="fn_pagination('${CounselorNo}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}','${search.c_name}', '${search.c_gender}', '${search.c_grade}', '${search.c_birthdate}', '${search.c_email}', '${search.c_phone}', '${search.c_address}', '${search.c_status}')">
												${CounselorNo} </a>
										</li>
									</c:forEach>
									<c:if test="${pagination.next}">

										<li class="page-item"><a class="page-link" href="#"
											onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
					,'${search.c_name}', '${search.c_gender}', '${search.c_grade}', '${search.c_birthdate}', '${search.c_email}', '${search.c_phone}', '${search.c_address}', '${search.c_status}')">다음</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
	</section>
</body>
<script>
	
</script>
</html>
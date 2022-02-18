<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>주소</th>
									<th>전화번호</th>
									<th>등급</th>
									<th>MBTI</th>
								</tr>
							</thead>

				<tbody>
								<c:forEach items="${member}" var="members">
									<tr>
										<td>${members.m_email }</td>
										<td>${members.m_password }</td>
										<td>${members.m_phone }</td>
										<td>${members.m_type }</td>
										<td>${members.m_nickname}</td>
										<td>${members.m_mbti}</td>
									</tr>
								</c:forEach>
				</tbody>
	</table>
</body>
</html>
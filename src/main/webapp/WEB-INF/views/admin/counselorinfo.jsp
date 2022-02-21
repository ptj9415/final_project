<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.titlebar {
	border: 0.5px solid black;
	height: 30px;
	width: 1300px;
	background-color: white;
	margin-top: 10px;
}

.maincontainer {
	margin-top: 1px;
	border: 0.5px solid black;
	width: 1300px;
	background-color: white;
	border: 0.5px solid black;
}

.infotable {
	border: 0.5px solid black;
	border-collapse: collapse;
	height: 150px;
}

.infotable>tbody>tr {
	border: 0.5px solid black;
}

.infotable>tbody>tr>td {
	border: 0.5px solid black;
	width: 400px;
	text-indent: 10px;
}

.infotable>tbody>tr>th {
	border: 0.5px solid black;
	background-color: aqua;
	width: 150px;
}

.headshotdiv {
	float: left;
	margin-top: 30px;
	margin-left: 25px;
}

.infotablediv {
	margin-top: 30px;
	margin-left: 15px;
}
</style>
</head>
<body>
	<h3>내 정보 수정</h3>
	<div class="container">
		<div class="titlebar">
			<span>내 정보
				<button type="button" id="minusbtn" name="minusbtn" class="minusbtn">
					<i class="fa fa-minus" id="minusicon"></i>
				</button>
			</span>
		</div>
		<div class="maincontainer">
			<div class="headshotdiv">
				<img alt="headshot" src="resources/img/headshot.jpg"
					style="height: 150px">
			</div>
			<div class="infotablediv">
				<table class="infotable">
					<tr>
						<th>이름</th>
						<td>모코코</td>
						<th>성별</th>
						<td>남성</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>010-0594-7795</td>
						<th>이메일</th>
						<td>yedam23fp@gmail.com</td>
					</tr>
					<tr>
						<th>등급</th>
						<td>심리상담사</td>
						<th>주소</th>
						<td>서울특별시 강서구 화곡1동</td>
					</tr>
				</table>
				<br>
				<button type="button" class="modify1" id="modify1" name="modify1">사진 첨부</button>
				<span>※ 프로필사진의 크기는 640 x 480을 권장드립니다. 사이즈 크기가 다를 경우 사진이 올바르게 나오지 않을 수 있습니다.</span>
				<br> <br>
			</div>
		</div>
	</div>

</body>
</html>
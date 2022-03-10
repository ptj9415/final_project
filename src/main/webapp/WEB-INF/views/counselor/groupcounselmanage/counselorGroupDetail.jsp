<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
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

tr, th, td {
	border: 1px solid #dee2e6;
}

th {
	background-color: rgb(245, 245, 245);
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

#infotable>tbody>tr>th {
	width: 15%;
}

#counseltable>tbody>tr>th {
	width: 15%;
	vertical-align: middle;
}
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>상담일지 작성</h3>
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
									<th>상담명</th>
									<td>${detail.gc_title }</td>
									<th>상담방식</th>
									<td>${detail.gc_type}</td>
								</tr>
								<tr>
									<th>모집일</th>
									<td>${detail.gc_startdate }~${detail.gc_finaldate }</td>
									<th>상담일</th>
									<td>${detail.gc_date }</td>
								</tr>
								<tr>
									<th>신청인원</th>
									<td>${detail.gc_person }명</td>
									<th>상담 비용</th>
									<td>${detail.gc_price }원
									<input type="hidden" id="gc_no" value="${detail.gc_no }"></td>
								</tr>
							</table>
							<br>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">상담일지 작성</p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<br>
							<table class="table text-nowrap" id="counseltable">
								<tr>
									<th>상담내용</th>
									<td><span>※상담 내용은 내담자가 확인할 수 있습니다.</span><br>
									<textarea id="gc_report">${detail.gc_report }</textarea></td>
								</tr>
								<tr>
									<th>상담결과</th>
									<td><textarea id="gc_result">${detail.gc_result }</textarea></td>
								</tr>
							</table>
							<br>
							<div class="btndiv">
								<button type="button" class="modify2" id="modify2"
									name="modify2">상담일지 작성</button>
								<button type="button" id="backbtn"
									onclick="location.href='counselorGroupList.do'">돌아가기</button>
							</div>
							<br> <br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		$('#modify2').on('click', function() {
			var gc_report = $('#gc_report').val();
			var gc_result = $('#gc_result').val();
			var gc_no = $('#gc_no').val();
			var gc_no = 
			$.ajax({
				url: 'groupCounselDetailInsert.do',
				data: {gc_report:gc_report, gc_result:gc_result, gc_no:gc_no},
				type:'post',
				success: function(data) {
					if(data == '1') {
						alert('등록이 완료되었습니다.');
					} else {
						alert('등록에 실패하였습니다. 관리자에게 문의해주세요.');
					}
				},
				error: function() {
					alert('등록에 실패하였습니다. 관리자에게 문의해주세요.');
				}
			});
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

#bannertable>tbody>tr {
	border-bottom: 0.5px solid rgb(222, 226, 230);
}

#bannertable>tbody>tr>th {
	width: 13%;
	background-color: rgb(245, 245, 245);
	text-align: center;
	vertical-align: middle;
}

#headerp {
	position: relative;
	top: 7px;
	margin-left: 15px;
	font-weight: 600;
}

#bn_name {
	width: 40%;
}

textarea {
	width: 40%;
	height: 6.25em;
	resize: none;
}

#bannerimg {
	height: 3%;
	width: 40%;
}

.filebox .uploadname {
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

#submitbtn {
	float: right;
	width: 80px;
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
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>배너 수정</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">배너 수정</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<form method="post" enctype="multipart/form-data" id="form">
								<table class="table text-nowrap" id="bannertable">
									<tr>
										<th>이름</th>
										<td><input type="text" id="bn_name" name="bn_name"
											value="${banner.bn_name }"></td>
									</tr>
									<tr>
										<th>파일첨부</th>
										<td><div class="filebox">
												<img src="../fileupload/bannerimg/${banner.bn_pfilename }" id="bannerimg">
												<p>※배너 크기는 1200p x 216p 로 조절하시기 바랍니다.
												</p>
													<input class="uploadname" value="${banner.bn_filename }">
													<label for="filename">파일 찾기</label> <input type="file"
														id="filename" name="filename"
														onchange="setThumbnail(event);" >		
											</div>
									</tr>
									
									<tr>
										<th>주제</th>
										<td><textarea id="bn_title" name="bn_title">${banner.bn_title }</textarea></td>
									</tr>
									<tr>
										<th>내용</th>
										<td><textarea id="bn_subject" name="bn_subject">${banner.bn_subject }</textarea></td>
									</tr>
								</table>
								<div class="btndiv">
									<button type="button" onclick="picture()" id="submitbtn">등록</button>
									<button type="button" id="backbtn"
										onclick="location.href='adminBannerList.do'">돌아가기</button>
								</div>
							</form>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		function setThumbnail(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var preimg = $('#preImage');
				preimg.attr('src', event.target.result);
			};
			reader.readAsDataURL(event.target.files[0]);
		}

		function picture() {
			var url = "adminBannerInsert.do";
			var formData = new FormData($("#form")[0]);
			$.ajax({
				url : url,
				type : "post",
				enctype : 'multipart/form-data',
				data : formData,
				cache : false,
				contentType : false,
				processData : false,
				success : function() {
					alert("배너 등록이 완료되었습니다.");
					location.href = "adminBannerList.do"
				},
				error : function() {
					console.log("실패");
				}
			});
		}
		
		$("#filename").on('change', function() {
			var fileName = $("#filename").val();
			$(".uploadname").val(fileName);
		});
	</script>
</body>
</html>
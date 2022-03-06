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
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>배너 등록</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">배너 등록</p>
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
										<td><input type="text" id="bn_name" name="bn_name"></td>
									</tr>
									<tr>
										<th>파일첨부</th>
										<td><img
											src="https://media.istockphoto.com/vectors/isometric-building-concept-single-on-round-base-vector-id1090958052"
											class="preImage" id="preImage" name="preImage"
											style= "height:3%; width: 40%;"> <br> <br>
											<input multiple="multiple" type="file" id="filename"
											name="filename" accept="image/*"
											onchange="setThumbnail(event);">
									</tr>
									<tr>
										<th>주제</th>
										<td><textarea id="bn_title" name="bn_title"></textarea></td>
									</tr>
									<tr>
										<th>내용</th>
										<td><textarea id="bn_subject" name="bn_subject"></textarea></td>
									</tr>
								</table>
								<button type="button" onclick="picture()"
									class="btn btn-primary  py-2 px-5">등록</button>
								<button type="button" id="back" name="back"
									onclick="location.href='adminBannerList.do'">돌아가기</button>
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
	</script>
</body>
</html>
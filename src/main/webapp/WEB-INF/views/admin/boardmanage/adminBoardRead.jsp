<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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

#boardtable>tbody>tr {
	border-bottom: 0.5px solid rgb(222, 226, 230);
}

#boardtable>tbody>tr>th {
	width: 13%;
	background-color: rgb(245, 245, 245);
	text-align: center;
	vertical-align: middle;
}

#deletebtn {
	background-color: #EB4646;
	color: white;
	border: none;
	border-radius: 4px;
	height: 35px;
	float: right;
}

#backbtn {
	background-color: white;
	color: #EB4646;
	border: 1px solid #EB4646;
	border-radius: 4px;
	height: 35px;
	float: right;
	margin-right: 10px;
}

/* 삭제 Swal 디자인  */
#swal2-title {
	font-size: 25px;
}

#swal2-content {
	font-size: 15px;
}

.swal2-header {
	height: 200px;
}

.swal2-actions {
	font-size: 12px;
	height: 80px;
	width: 300px;
	height: 80px;
}

.swal2-actions button {
	height: 30px;
	width: 80px;
}
</style>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<br>
			<h3>게시글 상세보기 - ${boardRead.b_title }</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card" id="headerdiv">
						<p id="headerp">게시글</p>
					</div>
				</div>
			</div>
			<div class="row" id="maindiv1">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<table class="table text-nowrap" id="boardtable">
								<tr>
									<th>작성자</th>
									<td>${boardRead.m_nickname }</td>
									<th>주제</th>
									<td>${boardRead.b_subject }</td>
									<th>작성일</th>
									<td>${boardRead.b_wdate }</td>
								</tr>
								<tr>
									<th style="height: 400px;">내용</th>
									<td colspan="5">${boardRead.b_content }</td>
								</tr>
							</table>
							<br>
							<div class="btndiv">
								<button type="button" onclick="deleteFnc('${boardRead.b_no}')" id="deletebtn">게시글 삭제</button>
								<button type="button" id="backbtn"
									onclick="location.href='adminBoardList.do'">돌아가기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script>
	
	function deleteFnc(b_no){
		Swal.fire({
		  title: '정말 삭제하시겠습니까?',
		  text: '삭제 후에는 복구가 불가능합니다.',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#1E90FF',
		  cancelButtonColor: '#EB4646',
		  confirmButtonText: '삭제',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
              //"삭제" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
			$.ajax({
				url : "boardDelete.do",
				type : "post",
				data : {
					b_no : b_no
				},
				dataType : "text",
				success : function(responseText) {
					location.href="adminBoardList.do";
				},
				error : function() {
					alert("삭제 실패")
				}
			})
		  }
		})
	}
	</script>
</body>
</html>
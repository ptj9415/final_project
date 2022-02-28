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
.wrap {
	border: 1px solid #9282CD;
	padding-top: 20px;
	padding-bottom: 30px;
	width: 1400px;
}

.filterinput {
	border: 1px solid #CED4DA;
	padding: 0;
}

th, td {
	border: 1px solid #3C3C8C;
	height: 30px;
}

button {
	width: 70px;
	height: 26px;
}

.color:hover {
	background: linear-gradient(to left, #BEAEE2, #F7DBF0);
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
	font-size: 12px; height : 80px;
	width: 300px;
	height: 80px;
}

.swal2-actions button {
	height: 30px;
	width: 80px;
}
}
</style>
</head>
<body>
	<h2>FAQ 관리</h2>
	<div
		style="border: 1px solid; width: 1400px; padding-bottom: 10px; padding-top: 10px; margin-bottom: 10px">검색</div>
	<div class="wrap" align="center">
		<form name="search">
			<table>
				<tbody>
					<tr>
						<th width="200px">작성자</th>
						<td><input type="text" class="filterinput" name="c_name"
							id="c_name" style="width: 550px" placeholder="입력하세요."></td>

						<th width="200px">제목</th>
						<td><input type="text" class="filterinput" name="f_title"
							id="f_title" style="width: 550px" placeholder="입력하세요."></td>
					</tr>
				</tbody>
			</table>
			<br>
			<button type="button" name="submit" id="submit" onclick="clickFnc()"
				style="float: right">검색</button>
			<button type="reset" name="replace" id="replace" style="float: right">초기화</button>
		</form>
	</div>
	<br>
	<div
		style="border: 1px solid; width: 1400px; padding-bottom: 10px; padding-top: 10px; margin-bottom: 10px">FAQ
		목록</div>
	<div class="wrap" align="center">
		<button type="button" class="button" id="insertbtn" name="insertbtn"
			style="float: right" onclick="location.href='faqForm.do'">등록하기</button>
		<br> <br>

		<table id="datatable">
			<thead>
				<tr>
					<th style="width: 150px">작성자</th>
					<th style="width: 500px">제목</th>
					<th style="width: 300px">작성일</th>
					<th style="width: 250px">관리</th>
				</tr>
			</thead>
			<tbody id="dbtbody">
				<c:forEach items="${faqs}" var="faq">
					<tr class="color"
						onclick="location.href='faqRead.do?f_no=${faq.f_no}';">
						<td>${faq.c_name}</td>
						<td>${faq.f_title}</td>
						<td>${faq.f_wdate}</td>
						<!-- 수정 / 삭제 부분은 클릭 안되게  -->
						<td onclick="event.cancelBubble=true;"><button type="button"
								name="update" id="update"
								onclick="location.href='faqUpdateForm.do?f_no=${faq.f_no }';">수정</button>
							<button type="button" name="delete" id="delete"
								onclick="deleteFnc('${faq.f_no}')">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script type="text/javascript">
	
	// 삭제 (디자인적용)
	function deleteFnc(f_no){
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
				url : "faqDelete.do",
				type : "post",
				data : {
					f_no : f_no
				},
				dataType : "text",
				success : function() {
					location.href = "faqList.do";
				},
				error : function() {
					alert("삭제 실패")
				}
			})
		  }
		})
	}
	
	
	// 삭제 
/* 	function deleteFnc(f_no) {
		if(confirm("삭제하시겠습니까?") == true) {
			
			$.ajax({
				url : "faqDelete.do",
				type : "post",
				data : {
					f_no : f_no
				},
				dataType : "text",
				success : function() {
					swal("삭제 완료")
					location.href = "faqList.do";
				},
				error : function() {
					alert("삭제 실패")
				}
			})
		}
	}
*/

	// 검색
	function clickFnc() {
		var c_name = $('#c_name').val();
		var f_title = $('#f_title').val();
		
		$.ajax({
			url : "faqSearch.do",
			type : "get",
			data : {c_name : c_name , f_title : f_title},
			dataType : "json",
			success : function(data) {
				
				var tbody = $("#dbtbody");
				tbody.remove();
				var title = ["c_name", "f_title", "f_wdate"]
				var table = $("#datatable");
				var body = document.createElement("tbody");
				$(body).attr("id", "dbtbody");
				for(datas of data) {
					var tr = document.createElement("tr");
					$(tr).addClass("color");
					// tr 클릭 시 페이지 이동
					$(tr).attr("onclick", "location.href='faqRead.do?f_no=" + datas.f_no + "\'");
					for(var i = 0; i <  title.length; i++) {
						var td = document.createElement("td");
						td.innerHTML = datas[title[i]];
						tr.append(td);
					}
					var btntd = document.createElement("td");
					btntd.innerHTML = '<button type="button" name="update" id="update" onclick="location.href=\'faqUpdateForm.do?f_no=' + datas.f_no + '\';">수정</button>&nbsp;<button type="button" name="delete" id="delete" onclick="deleteFnc(\'' + datas.f_no + '\')">삭제</button>';
					tr.append(btntd);
 					body.append(tr);
				}
 				
				table.append(body);	
			},
			error : function(data) {
				alert("데이터가 없습니다.")
			}
		})
	}


</script>
</body>
</html>
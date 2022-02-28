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

<!-- select 2 -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet"/> 
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>


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
select option[value=""][disabled] {
	display: none;
}
}
</style>
</head>
<body>
	<h2>자유게시판 관리</h2>
	<div
		style="border: 1px solid; width: 1400px; padding-bottom: 10px; padding-top: 10px; margin-bottom: 10px">검색</div>
	<div class="wrap" align="center">
		<form name="search">
			<table>
				<tbody>
					<tr>
						<th width="200px">작성자</th>
						<td><input type="text" class="filterinput" name="b_email"
							id="b_email" style="width: 550px" placeholder="입력하세요."></td>

						<th width="200px">주제</th>
						<td><select id="select2" style="width: 550px" class="subject">
						<option value="" disabled selected>선택</option>
						<option>연애</option>
						<option>취업/진로</option>
						<option>직장</option>
						<option>성추행</option>
						<option>육아 </option>
						<option>대인관계</option>
						<option>외모</option>
						<option>가족</option>
						<option>학업/고시</option>
						<option>금전/사업</option>
						<option>성생활</option>
						<option>이별/이혼</option>
						<option>중독</option>
						<option>성소수자</option>
						<option>자아/성격</option>
						<option>해외생활</option>
						<option>우울/불안</option>
						</select></td>
					</tr>
					<tr>
						<th width="200px">제목</th>
						<td><input type="text" class="filterinput" name="b_title"
							id="b_title" style="width: 550px" placeholder="입력하세요."></td>
						<th width="200px">작성일</th>
						<td><input type="date" class="filterinput" name="b_wdate"
							id="b_wdate" style="width: 550px"></td>
							
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
	<div style="border: 1px solid; width: 1400px; padding-bottom: 10px; padding-top: 10px; margin-bottom: 10px">게시글 목록</div>
	<div class="wrap" align="center">
		<table id="datatable">
			<thead>
				<tr>
					<th style="width: 150px">작성자</th>
					<th style="width: 150px">주제</th>
					<th style="width: 500px">제목</th>
					<th style="width: 300px">작성일</th>
					<th style="width: 250px">관리</th>
				</tr>
			</thead>
			<tbody id="dbtbody">
				<c:forEach items="${board}" var="board">
					<tr class="color"
						onclick="location.href='adminBoardRead.do?b_no=${board.b_no}';">
						<td>${board.c_name}</td>
						<td>${board.b_subject}</td>
						<td>${board.b_title}</td>
						<td>${board.b_wdate}</td>
						<!-- 삭제 부분은 클릭 안되게  -->
						<td onclick="event.cancelBubble=true;">
							<button type="button" name="delete" id="delete"
								onclick="deleteFnc('${board.b_no}')">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script type="text/javascript">
	
	// 삭제 (디자인적용)
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
				success : function() {
					location.href = "adminBoardList.do";
				},
				error : function() {
					alert("삭제 실패")
				}
			})
		  }
		})
	}
	

	// 검색
	function clickFnc() {
		var b_email = $('#b_email').val();
		var wdate = $('#b_wdate').val();
		var b_title = $('#b_title').val();
		var b_subject = $('.subject').val();
		
		console.log(b_email);
		console.log(b_title);
		console.log(b_subject);
		console.log(wdate);
		if(wdate != "") {
		var a = wdate.substr(2,2);
		var b = wdate.substr(5,2);
		var c = wdate.substr(8,2);
		var b_wdate = a + "-" + b + "-" + c;
		} else {
			var b_wdate = "null";
		}
		
		if(b_subject == null) {
			console.log('null');
		}
		console.log(b_wdate);
		$.ajax({
			url : "boardSearch.do",
			type : "get",
			data : {b_email : b_email , b_subject : b_subject, b_title : b_title, b_wdate : b_wdate},
			dataType : "json",
			success : function(data) {
				for(datas of data) {
					console.log(datas.b_email);
					console.log(datas.b_wdate);
					console.log(datas.b_title);
					console.log(datas.b_subject);
				}
			},
			error : function() {
				alert('오류입니다');
			}
		});
	}
// 				var tbody = $("#dbtbody");
// 				tbody.remove();
// 				var title = ["b_email", "b_subject", "b_title", "b_wdate"]
// 				var table = $("#datatable");
// 				var body = document.createElement("tbody");
// 				$(body).attr("id", "dbtbody");
// 				for(datas of data) {
// 					var tr = document.createElement("tr");
// 					$(tr).addClass("color");
// 					// tr 클릭 시 페이지 이동
// 					$(tr).attr("onclick", "location.href='boardRead.do?b_no=" + datas.b_no + "\'");
// 					for(var i = 0; i <  title.length; i++) {
// 						var td = document.createElement("td");
// 						td.innerHTML = datas[title[i]];
// 						tr.append(td);
// 					}
// 					var btntd = document.createElement("td");
// 					btntd.innerHTML = '<button type="button" name="delete" id="delete" onclick="deleteFnc(\'' + datas.f_no + '\')">삭제</button>';
// 					tr.append(btntd);
//  					body.append(tr);
// 				}
 				
// 				table.append(body);	
// 			},
// 			error : function(data) {
// 				alert("데이터가 없습니다.")
// 			}
// 		})
// 	}
	
	
	// 페이지

	// select 2
	$(document).ready(function() { 
		$("#select2").select2(); 
	});
	
	$('#replace').on('click', function() {
		$('.subject').select2('val', '선택');
	});

</script>
</body>
</html>
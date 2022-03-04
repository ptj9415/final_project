<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script src="https://kit.fontawesome.com/f124f87943.js" crossorigin="anonymous"></script>
 <style>
 .mainForm {
	padding: 50px
 }
 .searchFormTitle {
 	border: 1px solid gray;
 }
 .searchContent {
 	border: 1px solid gray;
 }
 .searchForm {
 	border: 1px solid gray;
 	width: 100%;
 }
 .searchTable {
 	margin-top: 30px;
 	margin-left: 40px;
 	margin-right: 40px;
 	margin-top: 30px;
 }
 #searchCategory{
 	width: 100%;
 	
 }
 input {
	width: 100%;
	text-align: center;
}
.outBtn {
	margin-top: 15px;
	display: flex;
	justify-content: flex-end;
	margin-bottom: 30px;
	margin-right: 240px;
}

#resetBtn, #allDelete {
	margin-right: 10px;
}
.searchListForm {
	border: 1px solid gray;
}
.searchListTitle {
	border: 1px solid gray;
}
.searchListOut {
	margin-top: 20px;
	margin-left: 40px;
}
.noticeList {
	margin: 10px;
}

#categorySelect {
	width: 90%
}
th, td{
	text-align: center;
}
th {
	background-color: #FFD9E4;
}
button {
	background-color: #FFF0F5;
}
input[type='checkbox']{
	width:20px;
	height: 20px;
	margin-top: 5px;
}
table > input {
	width: 100%;
}
	

 </style>
 <script>
 
 // 검색창 항목들 초기화시킴
$(document).ready(function(){
	 $("#resetBtn").on("click", function() {
		 $("#searchWriter").val("");
		 $("#searchCategory").val("");
	 	 $("#searchTitle").val("");
	 	 $("#searchDate").val("");
	 });
 
}); 
 </script>
</head>
<body>
    <div class="mainForm">
        <div class="title">
            <h3>공지사항 관리<i class="fa-solid fa-chevron-down"></i></h3>
        </div>
        <div class="searchForm">
            <div class="searchFormTitle">
                <h4>검색</h4>
            </div>
            <div class="searchContent" align="center">
                <table border="1" class="searchTable">
                    <tr>
                        <th width="150px">작성자</th>
                        <td width="450px"><input type="text" name="searchWriter" id="searchWriter"></td>
                        <th width="150px">말머리</th>
                        <td width="450px">
                        	<select name="searchCategory" id="searchCategory">
                        		<option value="전체" selected="selected">전체</option>
                        		<option value="urgency">긴급</option>
                        		<option value="event">이벤트</option>
                        		<option value="etc">뻘글</option>
                        	</select>
                        </td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" id="searchTitle" name="searchTitle"></td>
                        <th>작성일</th>
                        <td><input type="date" name="searchDate" id="searchDate"></td>
                    </tr>
                </table>
                <div class="outBtn">
	                <button id="resetBtn">초기화</button>
	                <button >검색</button>
        		</div>
        	</div>
        </div>
        <br>
        <hr>
        
        <!-- 페이지 하단 공지사항 목록치 출력되는 곳  -->
        <div class="searchListForm">
            <div class="searchListTitle">
                공지사항 목록
            </div>
            <div class="searchListContent">
            	<div class="searchListOut">
	                <span>(총 4건 중 4건)</span>
                </div>
                <div class="outBtn">
	                <button id="allDelete" >일괄 삭제</button>
	                <button onclick="location.href='adminNoticeForm.do'">공지사항 작성</button>
	            </div>
                <div class="noticeListForm" align="center">
	                <table class="noticeList" border="1">
	                    <tr>
		                    <th width="50px"><input type="checkbox" id="allCheck"></th>
		                    <th width="100px">작성자</th>
		                    <th width="100px">말머리</th>
		                    <th width="400px">제목</th>
		                    <th width="120px">작성일</th>
		                    <th width="100px">고정/유동</th>
		                    <th width="200px">관리</th>
		                    <th width="150px">고정 게시물 설정</th>
	                    </tr>
	                    <c:forEach items="${notices }" var="notice" varStatus="status">
	                    	<tr class="noticeTr"  id="line${status.count }"
	                    		onmouseover="this.style.background='#ebf7fd'"
	                    		onmouseleave="this.style.background='white'"
	                    		>
	                    		<td><input type="checkbox" name="check" data-partNum="${notice.n_no }"></td>
	                    		<td align="center">${notice.n_writer }</td>
	                    		<td align="center">${notice.n_category }</td>
	                    		<td align="center" id="readTd" onclick="noticeRead(${notice.n_no})">${notice.n_title }</td>
	                    		<td align="center">${notice.n_writedate }</td>
	                    		<td align="center">${notice.n_status }</td>
	                    		<td>
	                    			<button type="button" onclick="noticeUpdate('${notice.n_no}')">수정</button>
	                    			<button type="button" onclick="noticeDelete('${notice.n_no}')">삭제</button>
	                    		</td>
	                    		<td>
	                    			<button type="button" id="status" onclick="noticeStatus('${notice.n_no}')">고정 게시물 등록</button>
	                    		</td>
	                    	</tr>
	                    </c:forEach>
	                </table>
	             </div>
            </div>
            <form action="noticeRead.do" id="frm" method="post"> <!-- 공지사항 조회할 때 넘어갈 폼값. -->
            	<input type="hidden" name="no" id="no">
            </form>
            <form action="noticeUpdate.do" id="frm2" method="post"> <!-- 공지사항 수정할 때 넘어갈 폼값 -->
            	<input type="hidden" name="updateNo" id="updateNo">
            </form>
            <div class="outBtn">
            	<!--  이 부분에 페이지 버튼들이 들어가야 함. -->
	            <button>처음</button>
	            <button>이전</button>
	            <button>다음</button>
	            <button>끝</button>
        	</div>
        </div>
    </div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
	// 고정 게시물 설정 
	function noticeStatus(str){
		var statusNum = str;
		$.ajax({
			url: "statusUpdate.do",
			data: {
				statusNum : statusNum
			},
			dataType: "text",
			success: function(responseText){
								
			}
		})
	};
	
	
	//선택삭제 구현
	$("#checkDeleteBtn").on("click", function() {
		var confirmCheck = confirm("선택하신 것을 삭제하시겠습니까?");
		
		if(confirmCheck){
			var checkAry = new Array();   // 체크한 것을 담을 리스트변수 선언.
			
			$("input[name='check']:checked").each(function(){
				checkAry.push($(this).attr("data-partNum"));    // 체크했던 것들을 리스변수 checkAry에 모두 담는다.
			});
			
			//이제 ajax처리를 통해 삭제시킨다. 
			$.ajax({
				url: "ajaxCheckDelete.do",
				type: "post",
				data: {  sendCheck : checkAry},
				success: function(responseText){
					
					if(responseText == 1) {
						alert("삭제되었습니다.");
						location.href = 'adminNoticeList.do';
					} else {
						alert("삭제실패");
					}
				}
			});  //ajax끝
		}
	});
	
	
	//행 조회하기 (noticeRead)
	function noticeRead(str) {
		frm.no.value = str;
		alert(frm.no.value);     // 값이 제대로 담겼는지 체크
		frm.submit();
	};
	
	
	// 행 삭제하기. ajax로 처리해서 해당 화면으로 돌아오는 방식으로. 
	function noticeDelete(str) {
		var deleteNum = str;
		$.ajax({
			url: "noticeDelete.do",
			data: {
				deleteNum : deleteNum
			},
			type: "POST",
			dataType: "text",
			success: function(responseText){
				if(responseText == "YES"){
					alert("정상적으로 삭제되었습니다.");
					location.reload();
				} 
			}
		});  //ajax끝
	};

	// 공지 수정하기
	function noticeUpdate(str) {
		frm2.updateNo.value = str;
		alert(frm2.updateNo.value);  // 대상이 맞는지 체크.
		frm2.submit();
	}
	
	// 전체 선택, 전체 해제 시키기
	$("#allCheck").on("click", function() {
		if($("#allCheck").prop("checked")) {
			$("input[name='check']").prop("checked", true);
		} else {
			$("input[name='check']").prop("checked", false);
		}
	});	
	
	
	//전체 중에서 하나라도 체크를 해제하면, allCheck도 체크가 해제되도록 하기. 
	$("input[name='check']").on("click", function() {
		$("#allCheck").prop("checked", false);
	});
	
	
</script>

</html>
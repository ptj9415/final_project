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
	                <button onclick="location.href='noticeForm.do'">공지사항 작성</button>
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
	                    		onclick="noticeRead(line${status.count})">
	                    		<td><input type="checkbox" name="check"></td>
	                    		<td align="center">${notice.n_writer }</td>
	                    		<td align="center">${notice.n_category }</td>
	                    		<td align="center">${notice.n_title }</td>
	                    		<td align="center">${notice.n_writedate }</td>
	                    		<td align="center">${notice.n_status }</td>
	                    		<td>
	                    			<button>수정</button>
	                    			<button type="button" onclick="noticeDelete()">삭제</button>
	                    		</td>
	                    		<td>
	                    			<button>고정 게시물 등록</button>
	                    		</td>
	                    	</tr>
	                    </c:forEach>
	                </table>
	             </div>
            </div>
            <div class="outBtn">
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
$(document).ready(function(){
	
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
	
	// noticeRead() 부분해야 함.
	function noticeRead(${status.count}){
		alert("line");
		
	}
	
	
	// 행 삭제시키기
	function noticeDelete(${notice.n_no}){
		$.ajax({
			url: "noticeDelete.do",
			type: "POST",
			data: {
				deleteNum : num
			},
			success: function(responseText){
				if(responseText == 'YES'){
					alert("삭제성공");
					location.reload();
				} else {
					alert("삭제실패");
					return false;
				}
			}
			
		});
	}
	
	
});
</script>

</html>
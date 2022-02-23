<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<style>
.pagetitle {
	margin-left: 40px;
}

.titlebar, .maindiv {
	border: 0.5px solid black;
	border-radius: 3px;
	background-color: white;
	width: 1050px;
	margin-left: 40px;
}

.titlebar {
	margin-top: 10px;
	height: 35px;
}

.titlespan {
	margin-left: 15px;
	line-height: 35px;
}

.maindiv {
	margin-top: 2px;
}

.headshotdiv {
	margin-top: 15px;
	margin-left: 15px;
	float: left;
	width: 200px;
}

.myinfotablediv, .timetablediv, .careertablediv, .certificatetablediv,
	.introtablediv {
	margin-left: 10px;
	margin-top: 15px;
}

table, tr, th, td {
	border: 0.5px solid black;
}

th {
	text-align: center;
}

.myinfotable {
	height: 150px;
}

.myinfotable>tbody>tr>th {
	width: 100px;
}

.myinfotable>tbody>tr>td {
	width: 300px;
}

.timeth {
	width: 150px;
}

.timetable, .careertable, .certificatetable, .introtable {
	width: 1007px;
}

.timetable {
	height: 350px;
}

.careertable>tbody>tr>th, .certificatetable>tbody>tr>th, .introtable>tbody>tr>th
	{
	height: 40px;
}

.careertable>tbody>tr>td, .certificatetable>tbody>tr>td {
	height: 35px;
	text-align: center;
}

.introtable>tbody>tr>th:nth-child(1) {
	width: 200px;
}

.introtable>tbody>tr>td:nth-child(1) {
	text-align: center;
}

.minusbtn {
	border: none;
	background-color: transparent;
	float: right;
	margin-right: 10px;
}

.modify {
	float: right;
	margin-right: 30px;
	background-color: rgb(0, 123, 255);
	height: 35px;
	width: 60px;
	color: white;
	border: none;
	border-radius: 6px;
}
</style>
</head>
<body>
	<div class="pagetitlediv">
		<br>
		<h3 class="pagetitle">마이페이지</h3>
	</div>

	<div class="titlebar">
		<span class="titlespan">내 정보
			<button type="button" class="minusbtn" id="minusbtn1">
				<i class="fa fa-minus" id="minusicon"></i>
			</button>
		</span>
	</div>

	<div class="maindiv" id="maindiv1">
		<div class="headshotdiv">
			<img src="img/counselorpicture/${counselor.c_picturepath }"
				class="preImage" id="preImage" name="preImage" style="height: 120px"> <br>
			<!-- onerror="this.src='https://media.istockphoto.com/vectors/isometric-building-concept-single-on-round-base-vector-id1090958052';" -->

			<!-- 파일 업로드 부분 추가됐습니다. 사이드바 컨텐츠 밑에 <div class="card-body box-profile">  -->
			<form method="post" enctype="multipart/form-data" id="form">
				<input multiple="multiple" type="file" id="filename" name="filename"
					accept="image/*" onchange="setThumbnail(event);" /> <br>
				<div class="row form-group">
					<div class="col-md-12">
						<input type="hidden" value="${counselor.c_email}" name="id">
						<button type="button" onclick="picture()"
							class="btn btn-primary  py-2 px-5">사진등록</button>
					</div>
				</div>
			</form>
		</div>

		<div class="myinfotablediv">
			<table class="myinfotable">
				<tr>
					<th>이름</th>
					<td>${counselor.c_name }</td>
					<th>성별</th>
					<td>${counselor.c_gender }</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${counselor.c_phone }</td>
					<th>이메일</th>
					<td>${counselor.c_email }</td>
				</tr>
				<tr>
					<th>등급</th>
					<td>${counselor.c_grade }</td>
					<th>주소</th>
					<td>${counselor.c_address }</td>
				</tr>
			</table>
			<br>
			<button type="button" class="modify" id="modify1"
				onclick="location.href='counselorinfo.do'">수정</button>
			<br> <br>
		</div>
	</div>

	<div class="titlebar">
		<span class="titlespan">내 상담시간
			<button type="button" class="minusbtn" id="minusbtn2">
				<i class="fa fa-minus" id="minusicon2"></i>
			</button>
		</span>
	</div>

	<div class="maindiv" id="maindiv2">
		<div class="timetablediv">
			<table class="timetable">
				<tr>
					<th class="timeth">상담시간</th>
					<th class="dayth">월</th>
					<th class="dayth">화</th>
					<th class="dayth">수</th>
					<th class="dayth">목</th>
					<th class="dayth">금</th>
					<th class="dayth">토</th>
					<th class="dayth">일</th>
				</tr>
				<tr>
					<th class="timeth">09:00 ~ 10:00</th>
					<td id=""></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th class="timeth">10:00 ~ 11:00</th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th class="timeth">11:00 ~ 12:00</th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th class="timeth">12:00 ~ 13:00</th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th class="timeth">13:00 ~ 14:00</th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th class="timeth">14:00 ~ 15:00</th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th class="timeth">15:00 ~ 16:00</th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th class="timeth">16:00 ~ 17:00</th>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<br>
			<button type="button" class="modify" id="modify2"
				onclick="location.href='mycounseltime.do'">수정</button>
			<br> <br>
		</div>
	</div>

	<div class="titlebar">
		<span class="titlespan">상담 경력
			<button type="button" class="minusbtn" id="minusbtn3">
				<i class="fa fa-minus" id="minusicon3"></i>
			</button>
		</span>
	</div>

	<div class="maindiv" id="maindiv3">
		<div class="careertablediv">
			<table class="careertable">
				<tr>
					<th>구분</th>
					<th>경력사항</th>
				</tr>
				<tr>
					<td>현재</td>
					<td>위너스아이엠 EAP 상담사</td>
				</tr>
				<tr>
					<td>이전</td>
					<td>대구광역시 청소년 상담복지센터 상담사</td>
				</tr>
				<tr>
					<td>이전</td>
					<td>헬로스마일 상담복지센터 상담사</td>
				</tr>
			</table>
			<br>
			<button type="button" class="modify" id="modify3"
				onclick="location.href='mycareer.do'">수정</button>
			<br> <br>
		</div>
	</div>

	<div class="titlebar">
		<span class="titlespan">자격사항
			<button type="button" class="minusbtn" id="minusbtn4">
				<i class="fa fa-minus" id="minusicon4"></i>
			</button>
		</span>
	</div>

	<div class="maindiv" id="maindiv4">
		<div class="certificatetablediv">
			<table class="certificatetable">
				<tr>
					<th>자격사항</th>
					<th>발급기관</th>
					<th>발급일자</th>
				</tr>
				<tr>
					<td>전문 상담사 2급</td>
					<td>한국상담학회</td>
					<td>1997. 06. 05</td>
				</tr>
				<tr>
					<td>가족상담전문가 2급</td>
					<td>한국가족문화상담협회</td>
					<td>1997. 08. 21</td>
				</tr>
			</table>
			<br>
			<button type="button" class="modify" id="modify4"
				onclick="location.href='mycounseltime.do'">수정</button>
			<br> <br>
		</div>
	</div>

	<div class="titlebar">
		<span class="titlespan">상담사 소개
			<button type="button" class="minusbtn" id="minusbtn5">
				<i class="fa fa-minus" id="minusicon5"></i>
			</button>
		</span>
	</div>

	<div class="maindiv" id="maindiv5">
		<div class="introtablediv">
			<table class="introtable">
				<tr>
					<th>제목</th>
					<th>내용</th>
				</tr>
				<tr>
					<td>심리상담을 망설이는 분께</td>
					<td>불안과 스트레스가 만연한 세상입니다. 아마도 당신은, 전쟁 같은 삶 속에서 혼자 힘으로 살아내기 위해
						몸부림치다가 외롭고 지친 상태로 이곳을 찾았을 것 같습니다. 내 마음 다 털어놓고 위로받을 수 있는 단 한사람만
						있어도, 세상은 조금 더 살만해지지 않을까요?</td>
				</tr>
				<tr>
					<td>심리상담 효과</td>
					<td>첫째. 경청과 깊은 공감으로, 아무에게도 말하지 못하고 쌓아두었던 이야기들을 풀어낼 수 있도록
						도와드립니다. 둘째. 이해받고 존중받는 경험을 통해, 자기 자신을 이해하고 내 안에 있는 숨겨져 있던 힘과 해결책을
						발견하게 될 것입니다. 셋째. 자기 수용과 더불어, 낮은 자존감에서 회복되는 과정에 함께하겠습니다. "상담을 받기로
						선택한 것이, 태어나서 내가 나를 위해 한 일 중 가장 잘 한 일인 것 같아요. 나는 내가 생각했던 것보다 훨씬 괜찮은
						사람이었네요." 타인의 시선을 의식하여 가혹하게 높은 기준으로 살다가, 지치고 힘들어 삶을 포기하려했던 세 아이의
						엄마가 남겨주신 말입니다.</td>
				</tr>
			</table>
			<br>
			<button type="button" class="modify" id="modify5"
				onclick="location.href='mycounseltime.do'">수정</button>
			<br> <br>
		</div>
	</div>
	<br>
	<br>
	<br>

	<script>
	$('#minusbtn1').click(function() {
		if ($('#maindiv1').css('display') == 'none') {
		$('#maindiv1').show();
		$('#minusicon').attr('class', 'fa fa-minus');
		} else if ($('#maindiv1').css('display') != 'none') {
			$('#maindiv1').hide();
			$('#minusicon').attr('class', 'fa fa-plus');
		}
	});
	
	$('#minusbtn2').click(function() {
		if ($('#maindiv2').css('display') == 'none') {
			$('#maindiv2').show();
			$('#minusicon2').attr('class', 'fa fa-minus');
		} else if ($('#maindiv2').css('display') != 'none') {
			$('#maindiv2').hide();
			$('#minusicon2').attr('class', 'fa fa-plus');
		}
	});
	
	$('#minusbtn3').click(function() {
		if ($('#maindiv3').css('display') == 'none') {
			$('#maindiv3').show();
			$('#minusicon3').attr('class', 'fa fa-minus');
		} else if ($('#maindiv3').css('display') != 'none') {
			$('#maindiv3').hide();
			$('#minusicon3').attr('class', 'fa fa-plus');
		}
	});
	
	$('#minusbtn4').click(function() {
		if ($('#maindiv4').css('display') == 'none') {
			$('#maindiv4').show();
			$('#minusicon4').attr('class', 'fa fa-minus');
		} else if ($('#maindiv4').css('display') != 'none') {
			$('#maindiv4').hide();
			$('#minusicon4').attr('class', 'fa fa-plus');
		}
	});
		
	$('#minusbtn5').click(function() {
		if ($('#maindiv5').css('display') == 'none') {
			$('#maindiv5').show();
			$('#minusicon5').attr('class', 'fa fa-minus');
		} else if ($('#maindiv5').css('display') != 'none') {
			$('#maindiv5').hide();
			$('#minusicon5').attr('class', 'fa fa-plus');
		}
	});
	
	<!-- 미리보기 이미지 화면 -->
	function setThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function (event) {
			var preimg = $('#preImage');
			preimg.attr('src', event.target.result);
		};
		reader.readAsDataURL(event.target.files[0]);
	} 
	
	function picture() {
		var url = "counselorPicture.do";
		var formData = new FormData($("#form")[0]);
		$.ajax({
			url : url,
			type : "post",
			enctype: 'multipart/form-data',
			data : formData,
			cache : false,
			contentType : false,
			processData : false,
			success : function(data){
				alert("사진등록되었습니다.");
			},
			error: function(){
				console.log("실패");
			}
		});
		   
	}
	
	$(document).ready(function() {
		
	});
	}
	</script>
</body>
</html>
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
.titlebar {
	border: 0.5px solid black;
	height: 30px;
	width: 1300px;
	background-color: white;
	margin-top: 10px;
}

.maincontainer, .maincontainer2, .maincontainer3, .maincontainer4,
	.maincontainer5 {
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

.timetable {
	border: 0.5px solid black;
	border-collapse: collapse;
	height: 300px;
}

.timetable>tbody>tr {
	border: 0.5px solid black;
}

.timetable>tbody>tr>th {
	border: 0.5px solid black;
}

.timetable>tbody>tr>td {
	border: 0.5px solid black;
	width: 100px;
}

.timeth {
	background-color: aqua;
	width: 180px;
}

.dayth {
	width: 154px;
	background-color: aqua;
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

.mdbtndiv {
	height: 50px;
	background-color: red;
	float: left;
	margin-right: 20px;
	margin-bottom: 5px;
	float: left;
	float: left;
}

.modify1, .modify2, .modify3, .modify4, .modify5 {
	width: 70px;
	height: 30px;
	float: right;
	margin-right: 20px;
}

.minusbtn, .minusbtn2, .minusbtn3, .minusbtn4, .minusbtn5 {
	float: right;
	margin-right: 10px;
	margin-top: 7px;
	background-color: transparent;
	border: none;
}

.careertable {
	border: 0.5px solid black;
	border-collapse: collapse;
	width: 1265px;
}

.careertable>tbody>tr {
	border: 0.5px solid black;
}

.careertable>tbody>tr>th {
	border: 0.5px solid black;
	background-color:;
}

.careertable>tbody>tr>td {
	border: 0.5px solid black;
}

.carrertablediv {
	margin-top: 30px;
	margin-left: 15px;
}

.ftable {
	border: 0.5px solid black;
	border-collapse: collapse;
	width: 1265px;
}

.ftable>tbody>tr {
	border: 0.5px solid black;
}

.ftable>tbody>tr>th {
	border: 0.5px solid black;
	background-color: aqua;
}

.ftable>tbody>tr>td {
	border: 0.5px solid black;
}

.ftablediv {
	margin-top: 30px;
	margin-left: 15px;
}

.introtable {
	border: 0.5px solid black;
	border-collapse: collapse;
	width: 1265px;
}

.introtable>tbody>tr {
	border: 0.5px solid black;
}

.introtable>tbody>tr>th {
	border: 0.5px solid black;
	background-color: aqua;
}

.introtable>tbody>tr>td {
	border: 0.5px solid black;
}

.introtablediv {
	margin-top: 30px;
	margin-left: 15px;
}

.careerth {
	background-color: aqua;
}
</style>
</head>
<body>
	<h3>마이페이지</h3>
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
				<img alt="headshot" src="${counselor.c_picturepath }"
					onerror="this.src='https://media.istockphoto.com/vectors/isometric-building-concept-single-on-round-base-vector-id1090958052';"
					style="height: 150px"> <br>
				<!-- 파일 업로드 부분 추가됐습니다. 사이드바 컨텐츠 밑에 <div class="card-body box-profile">  -->
				<form method="post" enctype="multipart/form-data" id="form">
					<input multiple="multiple" type='file' id="filename" name="filename" style="margin-bottom: 20px;" required="required">
					<br>
					<div class="row form-group">
						<div class="col-md-12">
							<input type="hidden" value="${counselor.c_email}" name="id">
							<button type="button" onclick="picture()"
								class="btn btn-primary  py-2 px-5">사진등록</button>
						</div>
					</div>
				</form>
			</div>

		</div>
		<div class="infotablediv">
			<table class="infotable">
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
			<button type="button" class="modify1" id="modify1" name="modify1">수정</button>
			<br> <br>
		</div>
	</div>
	</div>
	<div class="container">
		<div class="titlebar">
			<span>내 상담시간
				<button type="button" id="minusbtn2" name="minusbtn2"
					class="minusbtn2">
					<i class="fa fa-camera" id="minusicon2"></i>
				</button>
			</span>
		</div>

		<div class="maincontainer2">
			<div class="infotablediv">
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
						<td></td>
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
			</div>
			<br>
			<button type="button" class="modify2" id="modify2" name="modify2"
				onclick="infomodify()">수정</button>
			<br> <br>
		</div>
	</div>

	<div class="container">
		<div class="titlebar">
			<span>자격사항
				<button type="button" id="minusbtn3" name="minusbtn3"
					class="minusbtn3">
					<i class="fa fa-minus" id="minusicon3"></i>
				</button>
			</span>
		</div>

		<div class="maincontainer3">
			<div class="carrertablediv">
				<table class="careertable">
					<tr>
						<th class="careerth">자격사항</th>
						<th class="careerth">발급기관</th>
						<th class="careerth">발급일자</th>
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
			</div>
			<br>
			<button type="button" class="modify3" id="modify3" name="modify3"
				onclick="infomodify()">수정</button>
			<br> <br>
		</div>
	</div>

	<div class="container">
		<div class="titlebar">
			<span>상담 경력
				<button type="button" id="minusbtn4" name="minusbtn4"
					class="minusbtn4">
					<i class="fa fa-minus" id="minusicon4"></i>
				</button>
			</span>
		</div>

		<div class="maincontainer4">
			<div class="ftablediv">
				<table class="ftable">
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
			</div>
			<br>
			<button type="button" class="modify4" id="modify4" name="modify4"
				onclick="infomodify()">수정</button>
			<br> <br>
		</div>
	</div>

	<div class="container">
		<div class="titlebar">
			<span>상담사 소개
				<button type="button" id="minusbtn5" name="minusbtn5"
					class="minusbtn5">
					<i class="fa fa-minus" id="minusicon5"></i>
				</button>
			</span>
		</div>

		<div class="maincontainer5">
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
							선택한 것이, 태어나서 내가 나를 위해 한 일 중 가장 잘 한 일인 것 같아요. 나는 내가 생각했던 것보다 훨씬
							괜찮은 사람이었네요." 타인의 시선을 의식하여 가혹하게 높은 기준으로 살다가, 지치고 힘들어 삶을 포기하려했던 세
							아이의 엄마가 남겨주신 말입니다.</td>
					</tr>

				</table>
			</div>
			<br>
			<button type="button" class="modify5" id="modify5" name="modify5"
				onclick="infomodify()">수정</button>
			<br> <br>
		</div>
	</div>
	<br>
	<br>
	<br>
	<script>
		$('#modify1').click(function() {
			location.href = "counselorinfo.do";
		})

		$('#modify2').click(function() {
			location.href = "mycareer.do";
		})

		$('#modify3').click(function() {
			location.href = "mycertification.do";
		})

		$('#modify4').click(function() {
			location.href = "mycounseltime.do";
		})
		$('#modify5').click(function() {
			location.href = "myintro.do";
		})

		$('#minusbtn').click(function() {
			if ($('.maincontainer').css('display') == 'none') {
				$('.maincontainer').show();
				$('#minusicon').attr('class', 'fa fa-minus');
			} else if ($('.maincontainer').css('display') != 'none') {
				$('.maincontainer').hide();
				$('#minusicon').attr('class', 'fa fa-plus');
			}
		});

		$('#minusbtn2').click(function() {
			if ($('.maincontainer2').css('display') == 'none') {
				$('.maincontainer2').show();
				$('#minusicon2').attr('class', 'fa fa-minus');
			} else if ($('.maincontainer2').css('display') != 'none') {
				$('.maincontainer2').hide();
				$('#minusicon2').attr('class', 'fa fa-plus');
			}
		});

		$('#minusbtn3').click(function() {
			if ($('.maincontainer3').css('display') == 'none') {
				$('.maincontainer3').show();
				$('#minusicon3').attr('class', 'fa fa-minus');
			} else if ($('.maincontainer3').css('display') != 'none') {
				$('.maincontainer3').hide();
				$('#minusicon3').attr('class', 'fa fa-plus');
			}
		});

		$('#minusbtn4').click(function() {
			if ($('.maincontainer4').css('display') == 'none') {
				$('.maincontainer4').show();
				$('#minusicon4').attr('class', 'fa fa-minus');
			} else if ($('.maincontainer4').css('display') != 'none') {
				$('.maincontainer4').hide();
				$('#minusicon4').attr('class', 'fa fa-plus');
			}
		});

		$('#minusbtn5').click(function() {
			if ($('.maincontainer5').css('display') == 'none') {
				$('.maincontainer5').show();
				$('#minusicon5').attr('class', 'fa fa-minus');
			} else if ($('.maincontainer5').css('display') != 'none') {
				$('.maincontainer5').hide();
				$('#minusicon5').attr('class', 'fa fa-plus');
			}
		});
		<!-- 미리보기 이미지 화면 -->
		<script type="text/javascript">
		        $(function() {
		            $("#filename").on('change', function(){
		                readURL(this);
		            });
		        });
		        function readURL(input) {
		            if (input.files && input.files[0]) {
		               var reader = new FileReader();
		               reader.onload = function (e) {
		                  $('#preImage').attr('src', e.target.result);
		               }
		               reader.readAsDataURL(input.files[0]);
		            }
		        }
		    

		<!-- 파일 업로드 아작스. -->
		function picture(){
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
		      },error: function(){
		         console.log("실패");
		      }
		   });
		   
		}
	</script>
</body>
</html>
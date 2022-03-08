<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nsert title here</title>
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

#timetable>tbody>tr {
	border-bottom: 0.5px solid rgb(222, 226, 230);
}

#timetable>tbody>tr>th {
	width: 10%;
	background-color: rgb(245, 245, 245);
	text-align: center;
	vertical-align: middle;
}

#timetable>tbody>tr>td {
	text-align: center;
}

#saveformbtn {
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
			<h3>상담시간 수정</h3>
			<br>
			<div class="row">
				<div class="col-md-12 offset-md-0">
					<div class="card">
						<p id="headerp">상담시간</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body table-responsive p-00">
							<table class="table text-nowrap" id="timetable">
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">상담시간</th>
									<th class="dayth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">월&nbsp;&nbsp;<input
										type="checkbox" name="checkallmon" id="checkallmon"></th>
									<th class="dayth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">화&nbsp;&nbsp;<input
										type="checkbox" name="checkalltue" id="checkalltue"></th>
									<th class="dayth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">수&nbsp;&nbsp;<input
										type="checkbox" name="checkallwed" id="checkallwed"></th>
									<th class="dayth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">목&nbsp;&nbsp;<input
										type="checkbox" name="checkallthu" id="checkallthu"></th>
									<th class="dayth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">금&nbsp;&nbsp;<input
										type="checkbox" name="checkallfri" id="checkallfri"></th>
									<th class="dayth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">토&nbsp;&nbsp;<input
										type="checkbox" name="checkallsat" id="checkallsat"></th>
									<th class="dayth">일&nbsp;&nbsp;<input type="checkbox"
										name="checkallsun" id="checkallsun"></th>
								</tr>
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">09:00
										~ 10:00</th>
									<td><input type="checkbox" name="checkmon" class="check"
										value="mon0910"></td>
									<td><input type="checkbox" name="checktue" class="check"
										value="tue0910"></td>
									<td><input type="checkbox" name="checkwed" class="check"
										value="wed0910"></td>
									<td><input type="checkbox" name="checkthu" class="check"
										value="thu0910"></td>
									<td><input type="checkbox" name="checkfri" class="check"
										value="fri0910"></td>
									<td><input type="checkbox" name="checksat" class="check"
										value="sat0910"></td>
									<td><input type="checkbox" name="checksun" class="check"
										value="sun0910"></td>
								</tr>
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">10:00
										~ 11:00</th>
									<td><input type="checkbox" name="checkmon" class="check"
										value="mon1011"></td>
									<td><input type="checkbox" name="checktue" class="check"
										value="tue1011"></td>
									<td><input type="checkbox" name="checkwed" class="check"
										value="wed1011"></td>
									<td><input type="checkbox" name="checkthu" class="check"
										value="thu1011"></td>
									<td><input type="checkbox" name="checkfri" class="check"
										value="fri1011"></td>
									<td><input type="checkbox" name="checksat" class="check"
										value="sat1011"></td>
									<td><input type="checkbox" name="checksun" class="check"
										value="sun1011"></td>
								</tr>
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">11:00
										~ 12:00</th>
									<td><input type="checkbox" name="checkmon" class="check"
										value="mon1112"></td>
									<td><input type="checkbox" name="checktue" class="check"
										value="tue1112"></td>
									<td><input type="checkbox" name="checkwed" class="check"
										value="wed1112"></td>
									<td><input type="checkbox" name="checkthu" class="check"
										value="thu1112"></td>
									<td><input type="checkbox" name="checkfri" class="check"
										value="fri1112"></td>
									<td><input type="checkbox" name="checksat" class="check"
										value="sat1112"></td>
									<td><input type="checkbox" name="checksun" class="check"
										value="sun1112"></td>
								</tr>
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">12:00
										~ 13:00</th>
									<td><input type="checkbox" name="checkmon" class="check"
										value="mon1213"></td>
									<td><input type="checkbox" name="checktue" class="check"
										value="tue1213"></td>
									<td><input type="checkbox" name="checkwed" class="check"
										value="wed1213"></td>
									<td><input type="checkbox" name="checkthu" class="check"
										value="thu1213"></td>
									<td><input type="checkbox" name="checkfri" class="check"
										value="fri1213"></td>
									<td><input type="checkbox" name="checksat" class="check"
										value="sat1213"></td>
									<td><input type="checkbox" name="checksun" class="check"
										value="sun1213"></td>
								</tr>
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">13:00
										~ 14:00</th>
									<td><input type="checkbox" name="checkmon" class="check"
										value="mon1314"></td>
									<td><input type="checkbox" name="checktue" class="check"
										value="tue1314"></td>
									<td><input type="checkbox" name="checkwed" class="check"
										value="wed1314"></td>
									<td><input type="checkbox" name="checkthu" class="check"
										value="thu1314"></td>
									<td><input type="checkbox" name="checkfri" class="check"
										value="fri1314"></td>
									<td><input type="checkbox" name="checksat" class="check"
										value="sat1314"></td>
									<td><input type="checkbox" name="checksun" class="check"
										value="sun1314"></td>
								</tr>
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">14:00
										~ 15:00</th>
									<td><input type="checkbox" name="checkmon" class="check"
										value="mon1415"></td>
									<td><input type="checkbox" name="checktue" class="check"
										value="tue1415"></td>
									<td><input type="checkbox" name="checkwed" class="check"
										value="wed1415"></td>
									<td><input type="checkbox" name="checkthu" class="check"
										value="thu1415"></td>
									<td><input type="checkbox" name="checkfri" class="check"
										value="fri1415"></td>
									<td><input type="checkbox" name="checksat" class="check"
										value="sat1415"></td>
									<td><input type="checkbox" name="checksun" class="check"
										value="sun1415"></td>
								</tr>
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">15:00
										~ 16:00</th>
									<td><input type="checkbox" name="checkmon" class="check"
										value="mon1516"></td>
									<td><input type="checkbox" name="checktue" class="check"
										value="tue1516"></td>
									<td><input type="checkbox" name="checkwed" class="check"
										value="wed1516"></td>
									<td><input type="checkbox" name="checkthu" class="check"
										value="thu1516"></td>
									<td><input type="checkbox" name="checkfri" class="check"
										value="fri1516"></td>
									<td><input type="checkbox" name="checksat" class="check"
										value="sat1516"></td>
									<td><input type="checkbox" name="checksun" class="check"
										value="sun1516"></td>
								</tr>
								<tr>
									<th class="timeth"
										style="border-right: 0.5px solid rgb(222, 226, 230);">16:00
										~ 17:00</th>
									<td><input type="checkbox" name="checkmon" class="check"
										value="mon1617"></td>
									<td><input type="checkbox" name="checktue" class="check"
										value="tue1617"></td>
									<td><input type="checkbox" name="checkwed" class="check"
										value="wed1617"></td>
									<td><input type="checkbox" name="checkthu" class="check"
										value="thu1617"></td>
									<td><input type="checkbox" name="checkfri" class="check"
										value="fri1617"></td>
									<td><input type="checkbox" name="checksat" class="check"
										value="sat1617"></td>
									<td><input type="checkbox" name="checksun" class="check"
										value="sun1617"></td>
								</tr>
							</table>
							<input type="hidden" name="hiddenValue" id="hiddenValue" value="" />
							<br>
							<div class="btndiv">
								<button type="button" id="saveformbtn">수정</button>
								<button type="button" id="backbtn"
									onclick="location.href='counselorMyPageMain.do'">돌아가기</button>
							</div>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
		//월요일 체크박스 전체선택
		$(document).ready(function() {
			$("#checkallmon").click(function() {
				if ($("#checkallmon").is(":checked"))
					$("input[name=checkmon]").prop("checked", true);
				else
					$("input[name=checkmon]").prop("checked", false);
			});

			$("input[name=checkmon]").click(function() {
				var total = $("input[name=checkmon]").length;
				var checked = $("input[name=checkmon]:checked").length;

				if (total != checked)
					$("#checkallmon").prop("checked", false);
				else
					$("#checkallmon").prop("checked", true);
			});
		});

		//화요일 체크박스 전체선택
		$(document).ready(function() {
			$("#checkalltue").click(function() {
				if ($("#checkalltue").is(":checked"))
					$("input[name=checktue]").prop("checked", true);
				else
					$("input[name=checktue]").prop("checked", false);
			});

			$("input[name=checktue]").click(function() {
				var total = $("input[name=checktue]").length;
				var checked = $("input[name=checktue]:checked").length;

				if (total != checked)
					$("#checkalltue").prop("checked", false);
				else
					$("#checkalltue").prop("checked", true);
			});
		});

		//수요일 체크박스 전체선택
		$(document).ready(function() {
			$("#checkallwed").click(function() {
				if ($("#checkallwed").is(":checked"))
					$("input[name=checkwed]").prop("checked", true);
				else
					$("input[name=checkwed]").prop("checked", false);
			});

			$("input[name=checkwed]").click(function() {
				var total = $("input[name=checkwed]").length;
				var checked = $("input[name=checkwed]:checked").length;

				if (total != checked)
					$("#checkallwed").prop("checked", false);
				else
					$("#checkallwed").prop("checked", true);
			});
		});

		//목요일 체크박스 전체선택
		$(document).ready(function() {
			$("#checkallthu").click(function() {
				if ($("#checkallthu").is(":checked"))
					$("input[name=checkthu]").prop("checked", true);
				else
					$("input[name=checkthu]").prop("checked", false);
			});

			$("input[name=checkthu]").click(function() {
				var total = $("input[name=checkthu]").length;
				var checked = $("input[name=checkthu]:checked").length;

				if (total != checked)
					$("#checkallthu").prop("checked", false);
				else
					$("#checkallthu").prop("checked", true);
			});
		});

		//금요일 체크박스 전체선택
		$(document).ready(function() {
			$("#checkallfri").click(function() {
				if ($("#checkallfri").is(":checked"))
					$("input[name=checkfri]").prop("checked", true);
				else
					$("input[name=checkfri]").prop("checked", false);
			});

			$("input[name=checkfri]").click(function() {
				var total = $("input[name=checkfri]").length;
				var checked = $("input[name=checkfri]:checked").length;

				if (total != checked)
					$("#checkallfri").prop("checked", false);
				else
					$("#checkallfri").prop("checked", true);
			});
		});

		//토요일 체크박스 전체선택
		$(document).ready(function() {
			$("#checkallsat").click(function() {
				if ($("#checkallsat").is(":checked"))
					$("input[name=checksat]").prop("checked", true);
				else
					$("input[name=checksat]").prop("checked", false);
			});

			$("input[name=checksat]").click(function() {
				var total = $("input[name=checksat]").length;
				var checked = $("input[name=checksat]:checked").length;

				if (total != checked)
					$("#checkallsat").prop("checked", false);
				else
					$("#checkallsat").prop("checked", true);
			});
		});

		//일요일 체크박스 전체선택
		$(document).ready(function() {
			$("#checkallsun").click(function() {
				if ($("#checkallsun").is(":checked"))
					$("input[name=checksun]").prop("checked", true);
				else
					$("input[name=checksun]").prop("checked", false);
			});

			$("input[name=checksun]").click(function() {
				var total = $("input[name=checksun]").length;
				var checked = $("input[name=checksun]:checked").length;

				if (total != checked)
					$("#checkallsun").prop("checked", false);
				else
					$("#checkallsun").prop("checked", true);
			});
		});

		$("#saveformbtn").click(function() {

			var cd_day = [];
			var cd_time = [];

			$('input:checkbox[class=check]:checked').each(function() {
				var day = $(this).val().substring(0, 3);
				var time = $(this).val().substring(3, 8);
				cd_day.push(day);
				cd_time.push(time);
			});

			var list = new Array();

			for (var i = 0; i < cd_day.length; i++) {
				var obj = new Object();
				obj.cd_day = cd_day[i];
				obj.cd_time = cd_time[i];

				list.push(obj);
			}

			var datalist = JSON.stringify(list);

			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url : "counseltimeupdate.do",
				type : 'post',
				contentType : 'application/json; charset=UTF-8',
				dataType : "json",
				data : datalist,
				success : function() {
					alert("수정이 완료되었습니다.");
					location.reload();
				},
				error : function() {
					alert("수정이 완료되었습니다.");
					location.reload();
				}
			});
		});

		<c:forEach items="${time}" var="time">
		var param = '${time.cd_day}' + '${time.cd_time}';

		$('.check').each(function() {
			var val = $(this).val();
			if (param == val) {
				$(this).prop('checked', true);
			}
		});
		</c:forEach>

		var total = $("input[name=checkmon]").length;
		var checked = $("input[name=checkmon]:checked").length;

		if (total != checked) {
			$("#checkallmon").prop("checked", false);
		} else {
			$("#checkallmon").prop("checked", true);
		}

		var total = $("input[name=checktue]").length;
		var checked = $("input[name=checktue]:checked").length;

		if (total != checked) {
			$("#checkalltue").prop("checked", false);
		} else {
			$("#checkalltue").prop("checked", true);
		}

		var total = $("input[name=checkwed]").length;
		var checked = $("input[name=checkwed]:checked").length;

		if (total != checked) {
			$("#checkallwed").prop("checked", false);
		} else {
			$("#checkallwed").prop("checked", true);
		}

		var total = $("input[name=checkthu]").length;
		var checked = $("input[name=checkthu]:checked").length;

		if (total != checked) {
			$("#checkallthu").prop("checked", false);
		} else {
			$("#checkallthu").prop("checked", true);
		}

		var total = $("input[name=checkfri]").length;
		var checked = $("input[name=checkfri]:checked").length;

		if (total != checked) {
			$("#checkallfri").prop("checked", false);
		} else {
			$("#checkallfri").prop("checked", true);
		}

		var total = $("input[name=checksat]").length;
		var checked = $("input[name=checksat]:checked").length;

		if (total != checked) {
			$("#checkallsat").prop("checked", false);
		} else {
			$("#checkallsat").prop("checked", true);
		}

		var total = $("input[name=checksun]").length;
		var checked = $("input[name=checksun]:checked").length;

		if (total != checked) {
			$("#checkallsun").prop("checked", false);
		} else {
			$("#checkallsun").prop("checked", true);
		}
	</script>
</body>
</html>
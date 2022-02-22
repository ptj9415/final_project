<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<style>

body {
	font-family: 'NanumBarunGothic ';
}

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
	<h3>상담사 마이페이지</h3>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
  
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title><tiles:insertAttribute name="atitle"/></title>
		 <!-- Google Font: Source Sans Pro -->
		  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
		  <!-- Font Awesome -->
		  <link rel="stylesheet" href="subHomeFile/plugins/fontawesome-free/css/all.min.css">
		  <!-- fullCalendar -->
		  <link rel="stylesheet" href="subHomeFile/plugins/fullcalendar/main.css">
		  <!-- Theme style -->
		  <link rel="stylesheet" href="subHomeFile/dist/css/adminlte.min.css">
		</head>
	<body class="hold-transition sidebar-mini">
<div class="wrapper">
		<tiles:insertAttribute name="aheader"/>
		<tiles:insertAttribute name="asidebar"/>
		 <div class="content-wrapper">
			<tiles:insertAttribute name="abody"/>
		</div>
		<tiles:insertAttribute name="afooter"/>
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<!-- jQuery -->
<!-- Bootstrap 4 -->
<script src="subHomeFile/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="subHomeFile/dist/js/adminlte.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
:root {
    /* CSS variables to change the configuration of tick and circle */
    --circle-width: 250px;
    --circle-height: 250px;
    --tick-width: calc(var(--circle-width)*0.56);
    --tick-height: calc(var(--circle-height)*0.24);
    --tick-thickness: calc(var(--tick-width)*0.1);
    --background-color: #4285F4;    /* Royal Blue */
    --circle-color: #fff;           /* White */
    --tick-first-color: #0F9D58;    /* Shamrock Green */
    --tick-second-color: #F4B400;   /* Selective Yellow */
    --tick-third-color: #DB4437;    /* Cinnabar */
    --tick-final-color: #4285F4;    /* Royal Blue */
}

body {
    /* background-color: var(--background-color); */
}
.circle-body{
	width:80%;
	height:400px;
}
.circle {
   margin-right: auto;
    margin-left: auto;
    margin-top: 250px;
    width: var(--circle-width);
    height: var(--circle-height);
    left: calc(50% - var(--circle-width) / 2);
    top: calc(50% - var(--circle-height) / 2);
    display: inline-block;
    position: absolute;
    border-radius: 30%;
    border: 10px solid #d6d6d621;
}

.tick {
    display: inline-block;
    width: 56%;
    height: 24%;
    border-left: var(--tick-thickness) solid var(--tick-final-color);
    border-bottom: var(--tick-thickness) solid var(--tick-final-color);
    position: absolute;
    margin: 0 auto;
    left: calc(var(--circle-width)*0.15);
    top: calc(var(--circle-height)/2 - var(--tick-height));
    transform: rotate(-40deg);
    transform-origin: calc(var(--tick-width)*0.57) calc(var(--tick-height)/2);
    animation: tick-animation 1s;
}

@keyframes tick-animation {
    0% {
        height: 0;
        width: 0;
        border-left-color: var(--tick-first-color);
    }
    50% {
        width: 0;
        height: var(--tick-height);
        border-left-color: var(--tick-second-color);
        border-bottom-color: var(--tick-first-color);
    }
    75% {
        border-left-color: var(--tick-third-color);
        border-bottom-color: var(--tick-second-color);
    }
    90% {
        border-bottom-color: var(--tick-third-color);
    }
    100% {
        width: var(--tick-width);
        border-color: var(--tick-final-color);
    }
}

a,img{
      border:none;
      }
.btn-primary,a{
	  text-decoration:none;
	  }
.btn,.btn-primary{
	letter-spacing:.85px;
	}
.btn-primary,.reply,.ta-c{
	text-align:center;
	}
*{
	margin:0;
	padding:0;
	font-family:"Helvetica Neue",Helvetica,Helvetica,Arial,sans-serif;
	font-size:100%;
	line-height:25px;
	}
.btn-primary,h1,h2,h3{
	font-family:MetroNova,"Helvetica Neue",Helvetica,Arial,"Lucida Grande",sans-serif;
	color:#212121;
	}
img{
	max-width:100%;
	display:block;
	margin-right:auto;
	margin-left:auto;
	}
body{
	-webkit-font-smoothing:antialiased;
	-webkit-text-size-adjust:none;
	width:100%!important;
	height:100%;
	color:#212121;
	}

.btn-primary{
	text-transform:uppercase;
	background-color:none;
	border:2px solid #cad568;
	padding:0 20px;
	line-height:42px;
	margin:auto;
	cursor:pointer;
	display:inline-block;
	border-radius:50px;
	white-space:nowrap;
	font-size:12px;
	font-weight:600;
	}
h1,h2,h3{
	margin:0;
	line-height:1.2;
	font-weight:200
	}
h2{
	font-size:42px;
	line-height:50px;
	margin-top:0;
	padding-bottom:25px;
  }
h3{
	font-size:25px;
	line-height:37px;
	}
h4,ol,p,ul{
	font-size:16px;
	}
h4{
	line-height:25px;
	font-weight:700;
  }
ol,p,ul{
	margin:0 auto 20px;
	font-weight:400;
	color:#777;
	-moz-font-feature-settings:'ss01';
	-webkit-font-feature-settings:'ss01';
	font-feature-settings:'ss01';
	}
.body h1,.btn{
	color:#212121;
	}
ol li,ul li{
	margin-left:5px;
	list-style-position:inside;
	}
.container{
	margin:0 auto;
	/* max-width:485px; */
	}
.body,.footer,.header{
	padding:50px;
	padding-top: 20px;
    padding-bottom: 20px;
	}
.header{
	padding-bottom:0;
	border-top:solid 1.7px #696969;
	}
.header h1{
	margin:0;
	}
.body h1,.body p{
	margin:0 0 20px;
	}
.footer{
	background:#f2f2f2;
	}
.body h1{
	font-size:42px;
	line-height:50px;
	}
.btn{
	border:2px solid #CFCF6D;
	display:inline-block;
	padding:3px;
	font-weight:600;
	font-size:12px;
	line-height:15px;
	text-transform:uppercase;
	}
.footer img{
	margin-bottom:15px;
	}
.board-activity,.board-header,hr{
	margin-bottom:30px;
	}
.footer p{
	font-size:14px;
	color:#bbb;
	
	}
hr{
	border:none;
	border-bottom:1px solid #F2F2F2;
	}
p.small{
	font-size:14px;
	line-height:20px;
	}
p.x-small{
	font-size:12px;
	opacity:.6;
	}
p.x-small a{
	color:#777;
	text-decoration:underline;
	}
.board-activity td,.board-header td{
	padding:10px;
	}
.board-activity .avatar,.board-activity .board,.board-activity .line,.board-header .avatar,.board-header .board,.board-header .line{
	width:50px;
	padding:0;
	}
.board-activity .avatar img,.board-activity .board img,.board-activity .line img,.board-header .avatar img,.board-header .board img,.board-header .line img{
	margin-right:0;
	margin-bottom:0;
	}

.board-activity img,.board-header img{
	margin-right:20px;
	display:inline-block;
	vertical-align:top;
	max-width:113px;
	margin-bottom:20px;
	}
.board-activity .avatar,.board-header .avatar{
	border-radius:100%;
	width:50px;
	height:50px;
	}
.board-activity .line,.board-header .line{
	background:url(https://niice.co/assets/emails/bg-line.jpg) center 0 repeat-y;
	}
.board-activity{
	margin-bottom:50px;
	}
.board-activity tr:last-child .line{
	background:0 0;
	}
.reply{
	font-size:14px;
	opacity:.6;
	}
.board-invite{
	margin-bottom:30px;
	}
.board-invite hr{
	margin-bottom:0;
	border-bottom:2px dashed #777;
	}
.board-invite table{
	width:100%;
	table-layout:fixed;
	}
.board-invite table .board-invite__board{
	width:150px;
	}

.board-invite td{
	vertical-align:middle;
	}
.board-invite p{
	font-weight:700;
	margin-bottom:0;
	color:#212121;
	}
.board-invite img{
	display:inline;
	}
.board-invite .avatar{
	text-align:center;
	width:74px;
	}
.board-invite .avatar img{
	margin-top:20px;
	}
.board-invite .avatar p{
	text-overflow:ellipsis;
	overflow:hidden;
	width:72px;
	white-space:nowrap;
	font-size:14px;
	line-height:20px;
	}
.complete-body{
	margin-right:auto;
	margin-left:auto;
	width:80%;
	margin-bottom:100px;sss
}

/*check-sign*/
/**
 * Extracted from: SweetAlert
 * Modified by: Istiak Tridip
 */
.success-checkmark {
  margin-top:100px;
  width: 80px;
  height: 115px;
  margin-right:auto;
  margin-left:auto;
}
.success-checkmark .check-icon {
  width: 80px;
  height: 80px;
  position: relative;
  border-radius: 50%;
  box-sizing: content-box;
  border: 4px solid #4CAF50;
}
.success-checkmark .check-icon::before {
  top: 3px;
  left: -2px;
  width: 30px;
  transform-origin: 100% 50%;
  border-radius: 100px 0 0 100px;
}
.success-checkmark .check-icon::after {
  top: 0;
  left: 30px;
  width: 60px;
  transform-origin: 0 50%;
  border-radius: 0 100px 100px 0;
  animation: rotate-circle 5s ease-in;
}
.success-checkmark .check-icon::before, .success-checkmark .check-icon::after {
  content: "";
  height: 100px;
  position: absolute;
  background: #FFFFFF;
  transform: rotate(-45deg);
}
.success-checkmark .check-icon .icon-line {
  height: 5px;
  background-color: #4CAF50;
  display: block;
  border-radius: 2px;
  position: absolute;
  z-index: 10;
}
.success-checkmark .check-icon .icon-line.line-tip {
  top: 46px;
  left: 14px;
  width: 25px;
  transform: rotate(45deg);
  animation: icon-line-tip 1s;
}
.success-checkmark .check-icon .icon-line.line-long {
  top: 38px;
  right: 8px;
  width: 47px;
  transform: rotate(-45deg);
  animation: icon-line-long 1s;
}
.success-checkmark .check-icon .icon-circle {
  top: -4px;
  left: -4px;
  z-index: 10;
  width: 80px;
  height: 80px;
  border-radius: 50%;
  position: absolute;
  box-sizing: content-box;
  border: 4px solid rgba(76, 175, 80, 0.5);
}
.success-checkmark .check-icon .icon-fix {
  top: 8px;
  width: 5px;
  left: 26px;
  z-index: 1;
  height: 85px;
  position: absolute;
  transform: rotate(-45deg);
  background-color: #FFFFFF;
}

@keyframes rotate-circle {
  0% {
    transform: rotate(-45deg);
  }
  5% {
    transform: rotate(-45deg);
  }
  12% {
    transform: rotate(-405deg);
  }
  100% {
    transform: rotate(-405deg);
  }
}
@keyframes icon-line-tip {
  0% {
    width: 0;
    left: 1px;
    top: 19px;
  }
  54% {
    width: 0;
    left: 1px;
    top: 19px;
  }
  70% {
    width: 50px;
    left: -8px;
    top: 37px;
  }
  84% {
    width: 17px;
    left: 21px;
    top: 48px;
  }
  100% {
    width: 25px;
    left: 14px;
    top: 45px;
  }
}
@keyframes icon-line-long {
  0% {
    width: 0;
    right: 46px;
    top: 54px;
  }
  65% {
    width: 0;
    right: 46px;
    top: 54px;
  }
  84% {
    width: 55px;
    right: 0px;
    top: 35px;
  }
  100% {
    width: 47px;
    right: 8px;
    top: 38px;
  }
}
/*check-sign end*/

/*본문*/
@import url("https://fonts.googleapis.com/css?family=Amarante");

.table-body {
  
  font-size: 62.5%;
  line-height: 1;
  color: #585858;
  padding: 22px 10px;
  padding-bottom: 55px;
}

::selection {
  background: #5f74a0;
  color: #fff;
}
::-moz-selection {
  background: #5f74a0;
  color: #fff;
}
::-webkit-selection {
  background: #5f74a0;
  color: #fff;
}

br {
  display: block;
  line-height: 1.6em;
}
ol,
ul {
  list-style: none;
}

input,
textarea {
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  outline: none;
}

blockquote,
q {
  quotes: none;
}
blockquote:before,
blockquote:after,
q:before,
q:after {
  content: "";
  content: none;
}
strong,
b {
  font-weight: bold;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
}
img {
  border: 0;
  max-width: 100%;
}

h1 {
 
 
  line-height: 1.7em;
  margin-bottom: 10px;
  text-align: center;
}

/** page structure **/
#wrapper {
  display: block;
  width: 850px;
  background: #fff;
  margin: 0 auto;
  padding: 10px 17px;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0, 0, 0, 0.35);
}

#keywords {
  margin: 0 auto;
  font-size: 1.2em;
  margin-bottom: 15px;
}

#keywords thead {
  cursor: pointer;
  background: #c9dff0;
}
#keywords thead tr th {
font-size: 20px;
  font-weight: bold;
  padding: 12px 30px;
  padding-left: 42px;
}
#keywords thead tr th span {
	font-size: 18px;
  padding-right: 20px;
  background-repeat: no-repeat;
  background-position: 100% 100%;
}

#keywords thead tr th.headerSortUp,
#keywords thead tr th.headerSortDown {
  background: #acc8dd;
}

#keywords thead tr th.headerSortUp span {
  background-image: url("https://i.imgur.com/SP99ZPJ.png");
}
#keywords thead tr th.headerSortDown span {
  background-image: url("https://i.imgur.com/RkA9MBo.png");
}

#keywords tbody tr {
  color: #555;
}
#keywords tbody tr td {
	font-size: 18px;
  text-align: center;
  padding: 15px 10px;
}
#keywords tbody tr td.lalign {
  text-align: left;
}

/*본문 end*/
</style>
</head>
<body>
<section class="hero-wrap hero-wrap-2"
		style="background-image: url('resources/user/images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-2 bread">개인상담</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html"><i
								class="ion-ios-arrow-forward"></i></a></span> <span><i
							class="ion-ios-arrow-forward"></i></span>
					</p>
				</div>
			</div>
		</div>


	</section>
<!-- 결제완료페이지 -->

	<div class="success-checkmark">
		  <div class="check-icon">
			    <span class="icon-line line-tip"></span>
			    <span class="icon-line line-long"></span>
			    <div class="icon-circle"></div>
			    <div class="icon-fix"></div>
		  </div>
</div>

	<div class="complete-body">
	  <div class="header">
      <div class="container">
        <h1>
            <img src="resources/user/images/MaeumiLogo.png"  style="width: 120px;"></h1>
      </div>
    </div>
  
    <div class="pay-body">
      <div class="container">
        <h1 style="text-align:center">상담신청이 성공적으로 완료되었습니다.</h1>
  
       
  	    <div class="table-body">
    <div id="wrapper">
        <h3>상담신청 내역</h3>
        
        <table id="keywords" cellspacing="0" cellpadding="0" style="font-size:'40px'">
          <thead>
            <tr>
              <th><span>test</span></th>
              <th><span>test</span></th>
              
            </tr>
          </thead>
          <tbody>
            <tr>
              
              <td>test</td>
              <td>test</td>
             
            </tr>
            <tr>
              <td>test</td>
              <td>test</td>
              
            </tr>
            <tr>
              <td>test</td>
              <td>test</td>
              
            </tr>
            <tr>
              <td>test</td>
              <td>test</td>
              
            </tr>
            
           
          </tbody>
        </table>
        
       </div> 
    </div> 
      </div>
        <button type="button" class="btn btn-primary" style="float:right; height:40px; width:100px;" value="마이페이지">마이페이지</button>
    </div>
  </div>
    <div class="footer">
      <div class="container">
        <a href="https://niice.co/" target="_blank">
            <img src="resources/user/images/MaeumiLogo.png"  style="width: 100px;"></a>
       
        <p>Copyright © 2022 2022 All rights reserved 마으미</p>
      </div>
    </div>
 <script>

 </script>
</body>
</html>
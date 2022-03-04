<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>invoice</title>
</head>
<style>
@import
	url(https://fonts.googleapis.com/css?family=Roboto:100,300,400,900,700,500,300,100)
	;

* {
	margin: 0;
	box-sizing: border-box;
}
/* body {
  background: #e0e0e0;
  font-family: "Roboto", sans-serif;
  background-image: url("");
  background-repeat: repeat-y;
  background-size: 100%;
} */
::selection {
	background: #f31544;
	color: #fff;
}

::moz-selection {
	background: #f31544;
	color: #fff;
}

h1 {
	font-size: 1.5em;
	color: #222;
}

h2 {
	font-size: 0.9em;
}

h3 {
	font-size: 1.2em;
	font-weight: 300;
	line-height: 2em;
}

p {
	font-size: 0.7em;
	color: #666;
	line-height: 1.2em;
}

#invoiceholder {
	width: 100%;
	height: 100%;
	/* padding-top: 50px; */
}

#headerimage {
	z-index: -1;
	position: relative;
	top: -50px;
	height: 350px;
	/* background-image: url("http://michaeltruong.ca/images/invoicebg.jpg"); */
	/* -webkit-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15),
    inset 0 -2px 4px rgba(0, 0, 0, 0.15); */
	-moz-box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15), inset 0 -2px 4px
		rgba(0, 0, 0, 0.15);
	/* box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15),
    inset 0 -2px 4px rgba(0, 0, 0, 0.15); */
	overflow: hidden;
	background-attachment: fixed;
	background-size: 1920px 80%;
	background-position: 50% -90%;
}

#invoice {
	position: relative;
	top: -290px;
	margin: 0 auto;
	width: 85%;
	background: #fff;
}

[id*="invoice-"] {
	/* Targets all id with 'col-' */
	border-bottom: 1px solid #eee;
	padding: 30px;
}

#invoice-top {
	min-height: 120px;
}

#invoice-mid {
	min-height: 120px;
}

#invoice-bot {
	min-height: 250px;
	height: 500px;
}

.logo {
	float: left;
	height: 60px;
	width: 60px;
	background: url(http://michaeltruong.ca/images/logo1.png) no-repeat;
	background-size: 60px 60px;
}

.clientlogo {
	float: left;
	height: 60px;
	width: 60px;
	background: url(http://michaeltruong.ca/images/client.jpg) no-repeat;
	background-size: 60px 60px;
	border-radius: 50px;
}

.info {
	display: block;
	float: left;
	margin-left: 20px;
}

.title {
	float: right;
}

.title p {
	text-align: right;
}

#project {
	margin-left: 52%;
}

table {
	width: 100%;
	border-collapse: collapse;
}

td {
	padding: 5px 0 5px 15px;
	border: 1px solid #eee;
}

.tabletitle {
	padding: 5px;
	background: #eee;
}

.service {
	border: 1px solid #eee;
}

.item {
	width: 35%;
}

.itemtext {
	font-size: 0.9em;
}

td.subtotal {
	width: 25%;
}

td.Rate {
	width: 15%;
}

td.Hours {
	width: 15%;
}

#legalcopy {
	margin-top: 30px;
}

form {
	float: right;
	margin-top: 30px;
	text-align: right;
}

.effect2 {
	position: relative;
}

.effect2:before, .effect2:after {
	z-index: -1;
	position: absolute;
	content: "";
	bottom: 15px;
	left: 10px;
	width: 50%;
	top: 80%;
	max-width: 300px;
	background: #777;
	-webkit-box-shadow: 0 15px 10px #777;
	-moz-box-shadow: 0 15px 10px #777;
	box-shadow: 0 15px 10px #777;
	-webkit-transform: rotate(-3deg);
	-moz-transform: rotate(-3deg);
	-o-transform: rotate(-3deg);
	-ms-transform: rotate(-3deg);
	transform: rotate(-3deg);
}

.effect2:after {
	-webkit-transform: rotate(3deg);
	-moz-transform: rotate(3deg);
	-o-transform: rotate(3deg);
	-ms-transform: rotate(3deg);
	transform: rotate(3deg);
	right: 10px;
	left: auto;
}

.legal {
	width: 70%;
}

.pb-3, .py-3 {
	padding-top: 60px;
}

.mb-5, .my-5 {
	margin-bottom: 0.3rem;
}

/*결제버튼*/
#pay-btn {
	width: 100px;
	height: 40px;
	border-radius: 50px;
	background-color: #468FB6;
	color: white;
	border: solid 1px #468FB6;
	font-size: 14px;
}

#pay-btn:hover {
	background: #fff;
	color: #468FB6;
	border: solid 1px #468FB6;
	transition: 0.3s ease-in-out;
}

#back-btn {
	width: 100px;
	height: 40px;
	border-radius: 50px;
	background-color: #468FB6;
	color: white;
	border: solid 1px #468FB6;
	font-size: 14px;
	float: left;
}

#back-btn:hover {
	background: #fff;
	color: #468FB6;
	border: solid 1px #468FB6;
	transition: 0.3s ease-in-out;
}

/*결제버튼 end*/
</style>
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
	<div id="invoiceholder">

		<div id="headerimage"></div>
		<div id="invoice" class="effect2">

			<div id="invoice-top">
				<div class="logo"></div>
				<div class="info">
					<h2>Michael Truong</h2>
					<p>
						hello@michaeltruong.ca </br> 289-335-6503
					</p>
				</div>
				<!--End Info-->
				<div class="title">
					<h1>Invoice #1069</h1>
					<p>
						Issued: May 27, 2015</br> Payment Due: June 27, 2015
					</p>
				</div>
				<!--End Title-->
			</div>
			<!--End InvoiceTop-->
			<div id="invoice-mid">

				<div class="clientlogo"></div>
				<div class="info">

					<h2>이소정 상담사</h2>

					<p>
						potato@gmail.com</br> 555-555-5555</br>
				</div>

				<div id="project">
					<h2>Project Description</h2>
					<p>Proin cursus, dui non tincidunt elementum, tortor ex feugiat
						enim, at elementum enim quam vel purus. Curabitur semper malesuada
						urna ut suscipit.</p>
				</div>

			</div>
			<!--End Invoice Mid-->

			<div id="invoice-bot">

				<div id="table">
					<table>
						<tr class="tabletitle">
							<td class="item"><h2>상담 신청 내역</h2></td>
							<td class="Hours"><h2></h2></td>
							<td class="Rate"><h2></h2></td>
							<td class="subtotal"><h2></h2></td>
						</tr>

						<tr class="service">
							<td class="tableitem"><p class="itemtext">상담방식</p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext">채팅</td>
						</tr>

						<tr class="service">
							<td class="tableitem"><p class="itemtext">상담날짜</p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext">2022-03-23 수</p></td>
						</tr>

						<tr class="service">
							<td class="tableitem"><p class="itemtext">할인쿠폰</p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem">
								<p class="itemtext"></p> <select name='coupon'>
									<option value='' selected>-- 선택 --</option>
									<option value='2000'>회원가입 축하쿠폰 (2000원)</option>
									<option value='500'>상담후기 작성 쿠폰(500원)</option>

							</select>
							</td>
						</tr>

						<tr class="service">
							<td class="tableitem"><p class="itemtext">Animation</p></td>
							<td class="tableitem"><p class="itemtext">20</p></td>
							<td class="tableitem"><p class="itemtext">$75</p></td>
							<td class="tableitem"><p class="itemtext">$1,500.00</p></td>
						</tr>

						<tr class="service">
							<td class="tableitem"><p class="itemtext">Animation
									Revisions</p></td>
							<td class="tableitem"><p class="itemtext">10</p></td>
							<td class="tableitem"><p class="itemtext">$75</p></td>
							<td class="tableitem"><p class="itemtext">$750.00</p></td>
						</tr>

						<tr class="service">
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
						</tr>


						<tr class="tabletitle">
							<td></td>
							<td></td>
							<td class="Rate"><h2>Total</h2></td>
							<td class="payment"><h2>$3,644.25</h2></td>
						</tr>

					</table>
				</div>
				<!--End Table-->

				<form action="https://www.paypal.com/cgi-bin/webscr" method="post"
					target="_top">
					<input type="hidden" name="cmd" value="_s-xclick"> <input
						type="hidden" name="hosted_button_id" value="QRZ7QTM9XRPJ6">
					<input type="button" id="pay-btn" name="submit" value="결제하기">
				</form>



				<div id="legalcopy">
					<a href="personalCounselStep4.do"><input type="button"
						id="back-btn" name="submit" value="뒤로가기"></a>
				</div>

			</div>
			<!--End InvoiceBot-->
		</div>
		<!--End Invoice-->
	</div>


</body>
</html>
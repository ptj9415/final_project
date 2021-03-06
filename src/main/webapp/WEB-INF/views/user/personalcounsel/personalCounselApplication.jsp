<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>invoice</title>
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
	width: 80%;
    height: 1300px;
    padding-top: 50px;
    margin-right: auto;
    margin-left: auto;
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
	/* background: url(http://michaeltruong.ca/images/logo1.png) no-repeat; */
	background-size: 60px 60px;
}

.clientlogo {
	float: left;
	height: 60px;
	width: 60px;
	/* background: url(http://michaeltruong.ca/images/client.jpg) no-repeat; */
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

/*????????????*/
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


#counselor-name{
 	font-weight:bold;
}

.control-btn{
	margin-top:50px;
}
/*???????????? end*/
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
					<h1 class="mb-2 bread">????????????</h1>
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

			
			<!--End InvoiceTop-->	
			<div id="invoice-mid">

				
				<img class="clientlogo" src="img/counselorpicture/${counselorSelect.c_picturepath}" onerror="this.src='resources/user/images/errorprofile.jpg';">
				<div class="info">
					
					<%-- <h2>${counselorSelect.c_name } ${counselorSelect.c_grade }</h2>
					<p>${c_email}</p>
					<p>${counselorSelect.c_phone }</p>
					 --%>
				</div>

				<div id="project">
					<h2 id="counselor-name">${counselorSelect.c_name } ${counselorSelect.c_grade }</h2>
					<p>${c_email}</p>
					<p>${counselorSelect.c_phone }</p>
				</div>

			</div>
			<!--End Invoice Mid-->
	
			<div id="invoice-bot">

				<div id="table">
					<table>
						<tr class="tabletitle">
							<td class="item"><h2>?????? ?????? ??????</h2></td>
							<td class="Hours"><h2></h2></td>
							<td class="Rate"><h2></h2></td>
							<td class="subtotal"><h2></h2></td>
						</tr>
						<tr class="service">
							<td class="tableitem"><p class="itemtext">?????? ?????????</p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext">${type2}</p></td>
						</tr>
						<tr class="service">
							<td class="tableitem"><p class="itemtext">????????????</p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext">??????</td>
						</tr>

						<tr class="service">
							<td class="tableitem"><p class="itemtext">????????????</p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext">2022-03-23 ??? ${time}</p></td>
						</tr>

						

						<tr class="service">
							<td class="tableitem"><p class="itemtext">????????????</p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext">${type3 }</p></td>
						</tr>
						
						<tr class="service">
							<td class="tableitem"><p class="itemtext">????????????</p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem">
								<p class="itemtext"></p> 
								<select name='checkbox' id="checkbox" onchange="change()">
											<option value='' selected>-- ?????? --</option>
										<c:forEach items="${coupon }" var="coupon">
											<option value='${coupon.c_price}/${coupon.c_no}'>${coupon.c_name} (${coupon.c_price}???)</option>									
										</c:forEach>
								</select>
							</td>
						</tr>
						
						<tr class="service">
							<td class="tableitem"><p class="itemtext">????????????</p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext" id="discount"></p></td>
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
							<td class="payment" id="totalPrice"></td>
						</tr>

					</table>
				</div>
			</div>
				<!--End Table ?????????,??????, ??????,??????(?????????????????????????????????...)--> 
<!-- 				<div class="control-btn">
					<a href="personalCounselStep4.do"><input type="button" id="back-btn" name="submit" value="????????????"></a>
					<input	type="hidden" name="hosted_button_id" value="QRZ7QTM9XRPJ6">
				</div> -->
				<input type="hidden" id="g_price" name="g_price" value="${type3}">
				<form action="paymentComplete.do" id="frm" name="frm">
					<input type="hidden" name="pr_time" value="${time}">
					<input type="hidden" id="c_email" name="c_email" value="${c_email}" >
					<input type="hidden" id="ccg_subname" name="ccg_subname" value="${type2}">
					<input type="hidden" id="pr_price" name="pr_price">
					<input type="hidden" id="or_uid" name="or_uid">
					<input type="hidden" id="c_no" name="c_no" value="">
					<input type="hidden" name="pr_type" value="${pr_type}">
					<input type="hidden" name="pr_date" value="${pr_date}">
				</form>
			<div id="legalcopy">
					<a href="personalCounselStep4.do">
					<input type="button" id="back-btn" name="submit" value="????????????"></a>
			</div>
				<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
						<input type="hidden" name="cmd" value="_s-xclick"> 
						<input type="hidden" name="hosted_button_id" value="QRZ7QTM9XRPJ6">
						<input type="hidden" id="c_email" name="c_email" value="${c_email}" >
						<input type="button" class="check_module" id="pay-btn" name="submit" value="?????? ?????? ??????">
				</form>
			</div>
			<!--End InvoiceBot-->
			<div id="invoice-top">
				<div class="logo"></div>
				<div class="info">
				</div>
				<!--End Info-->
				<div class="title">
				</div>
				<!--End Title-->
			</div>
		</div>
		<!--End Invoice-->
<script>
function change(){
	   var price = $("#g_price").val();
	   var priceSelect = $("#checkbox").val();
	   var num = priceSelect.indexOf('/');
	   var priceResult = priceSelect.substr(0,4);
	   var couponNo = priceSelect.substr(num+1);
	   
	   $("#discount").text(' '+'-'+priceResult);
	   var ddd = price-priceResult;
	   $("#totalPrice").text(ddd);
	   $("#pr_price").val(ddd);
	   $("#c_no").val(couponNo);
	   
}


$('#previous-btn').click(function() {
	location.href = 'personalCounselStep3.do'
});

</script>
<script>
		var pr_price = $("#pr_price").val();
        $(".check_module").click(function () {
        var IMP = window.IMP; // ????????????
        IMP.init('imp71871883');
        // 'iamport' ?????? ???????????? "????????? ????????????"??? ??????
        // i'mport ????????? ????????? -> ????????? -> ?????????????????????
        IMP.request_pay({
        pg: 'inicis', // version 1.1.0?????? ??????.
        /*
        'kakao':???????????????,
        html5_inicis':????????????(???????????????)
        'nice':???????????????
        'jtnet':????????????
        'uplus':LG????????????
        'danal':??????
        'payco':?????????
        'syrup':????????????
        'paypal':?????????
        */
        pay_method: 'card',
        /*
        'samsung':????????????,
        'card':????????????,
        'trans':?????????????????????,
        'vbank':????????????,
        'phone':?????????????????????
        */
        merchant_uid: 'merchant_' + new Date().getTime(),
        /*
        merchant_uid??? ??????
        https://docs.iamport.kr/implementation/payment
        ?????? url??? ??????????????? ?????? ??? ?????? ????????? ????????????.
        ???????????????.
        ????????? ????????? ????????????.
        */
        name: '?????????:???????????????',
        //??????????????? ????????? ??????
        amount: 100,
        //??????
        //bank_name : null,
        buyer_email: 'iamport@siot.do',
        buyer_name: '???????????????',
        buyer_tel: '010-1234-5678',
        buyer_addr: '??????????????? ????????? ?????????',
        buyer_postcode: '123-456',
        m_redirect_url: 'https://www.yourdomain.com/payments/complete',
        /*
        ????????? ?????????,
        ????????? ????????? ???????????? URL??? ??????
        (???????????????, ?????????, ????????? ????????? ????????????. PC??? ??????????????? callback????????? ????????? ?????????)
        */
        }, function (rsp) {
        console.log(rsp);
        if (rsp.success) {
        //$("#pr_price").val(rsp.paid_amount);
        $("#or_uid").val(rsp.imp_uid);
        $("#frm").submit();
         var msg = '????????? ?????????????????????.';
        msg += '??????ID : ' + rsp.imp_uid;
        /* msg += '?????? ??????ID : ' + rsp.merchant_uid;
        msg += '?????? ?????? : ' + rsp.paid_amount;
        msg += '?????? ???????????? : ' + rsp.apply_num; */
        } else {
        var msg = '????????? ?????????????????????.';
        /*msg += '???????????? : ' + rsp.error_msg;
        msg += '??????' + rsp.amount;
        msg += rsp.imp_uid; */
        }
        alert(msg);
	        });
        });
    </script>

</body>
</html>
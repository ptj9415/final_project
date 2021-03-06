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
  <script>

 google.load( "webfont", "1" );

 google.setOnLoadCallback(function() {

  WebFont.load({ custom: {

   families: [ "NanumGothic" ],

   urls: [ "http://fontface.kr/NanumGothic/css" ]

  }});

 });

</script>
</head>
<style>

body, header ul li a, header h1, header h2{

font-family: 'Nanum Gothic', Arial, Helvetica, sans-serif !important;
font-size: 20px;
}

@import
	url(https://fonts.googleapis.com/css?family=Roboto:100,300,400,900,700,500,300,100)
	;

* {
	margin: 0;
	box-sizing: border-box;
}

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
	border-radius: 30px;
	height: 750px;
}

[id*="invoice-"] {
	/* Targets all id with 'col-' */
	/* border-bottom: 1px solid #8dacbd42; */
	border-bottom: 1px solid #8dacbd42;
    padding: 40px;
    height: 150px;
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
	height: 120px;
	width: 120px;
	/* background: url(http://michaeltruong.ca/images/client.jpg) no-repeat; */
	background-size: 60px 60px;
	border-radius: 60px;
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
	float:right;
	text-align: end;
}

table {
	width: 100%;
	border-collapse: collapse;
}

td {
	padding: 5px 0 5px 15px;
	/* border: 1px solid #8dacbd42; */
}

.tabletitle {
	padding: 5px;
	background: #8dacbd42;
}

.service {
	/* border: 1px solid #8dacbd42; */
}

.item {
	width: 35%;
}

.itemtext {
	font-size: 0.9em;
}
.itemtext1 {
	font-size: 0.9em; 
	float:right;
	margin-right: 15px;
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
	background-color: #153e54;
	color: white;
	border: solid 1px #153e54;
	font-size: 14px;
	margin-right:450px;
}

#pay-btn:hover {
	background: #fff;
	color: #153e54;
	border: solid 1px #153e54;
	transition: 0.3s ease-in-out;
}

#back-btn {
	width: 100px;
	height: 40px;
	border-radius: 50px;
	background-color: #153e54;
	color: white;
	border: solid 1px #153e54;
	font-size: 14px;
	float: left;
}

#back-btn:hover {
	background: #fff;
	color: #153e54;
	border: solid 1px #153e54;
	transition: 0.3s ease-in-out;
}


#counselor-name{
 	font-weight:bold;
}

.control-btn{
	margin-top:50px;
}

#checkbox{
	float: right;
    margin-right: 10px;
    border: 1px solid #8dacbd42;
    border-radius: 10px;
    font-size: 12px;
    color: #153e54;
    padding: 5px
}
#checkbox:focus{
	 border: 1px solid #8dacbd42;
	 outline:0;
	 
}
p.itemtext1{
	margin-top:16px;
}
p.itemtext{
	margin-top:16px;
}	

/*???????????? end*/
</style>
<body>
	<section class="hero-wrap hero-wrap-2">
		<img src="img/bannerimg/personalcounsel.png" id="bannerimg">
	</section>
	<div id="invoiceholder">
		<div id="headerimage"></div>
		<div id="invoice" class="effect2" style="height:800px;">
			<!--End InvoiceTop-->	
			<div id="invoice-mid" style="height:180px;">
				<img class="clientlogo" src="img/counselorpicture/${counselorSelect.c_picture}" onerror="this.src='resources/user/images/errorprofile.jpg';" width="350px;">
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
			<div id="invoice-bot" style="height:560px;" >
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
							<td class="tableitem"><p class="itemtext1">${pr_type }</p></td>
						</tr>
						<tr class="service">
							<td class="tableitem"><p class="itemtext">????????????</p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext1">${c_value}</p></td>
						</tr>

						<tr class="service">
							<td class="tableitem"><p class="itemtext">????????????</p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext1">${pr_date} ${pr_time}???</p></td>
						</tr>

						<tr class="service">
							<td class="tableitem"><p class="itemtext">????????????</p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext1" id="total">${pr_price } ???</p></td>
						</tr>
						
						<tr class="service">
							<td class="tableitem"><p class="itemtext">????????????</p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext1"></p></td>
							<td class="tableitem">
								<p class="itemtext"></p> 
								<select name='checkbox' id="checkbox" onchange="change()">
											<option value='0' selected>-- ?????? --</option>
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
							<td class="tableitem"><p class="itemtext1" id="discount"></p></td>
						</tr>

						<tr class="tabletitle">
							<td class="tableitem"><p class="itemtext">??????</p></td>
							<td> </td>
							<td> </td>
							<%-- <td class="itemtext1" id="totalPrice" >${pr_price } ???</td> --%>
							<td class="tableitem"><p class="itemtext1" id="totalPrice">${pr_price } ???</p></td>
						</tr>
					</table>
				</div>
			</div>
				<!--End Table ?????????,??????, ??????,??????(?????????????????????????????????...)--> 
<!-- 				<div class="control-btn">
					<a href="personalCounselStep4.do"><input type="button" id="back-btn" name="submit" value="????????????"></a>
					<input	type="hidden" name="hosted_button_id" value="QRZ7QTM9XRPJ6">
				</div> -->
				<input type="hidden" id="g_price" name="g_price" value="${pr_price}">
				<form action="paymentComplete.do" id="frm" name="frm">
					<input type="hidden" name="pr_time" value="${pr_time}">
					<input type="hidden" id="c_email" name="c_email" value="${c_email}" >
					<input type="hidden" id="pr_price" name="pr_price" value="${pr_price}">
					<input type="hidden" id="pr_type" name="pr_type" value="${c_value}">
					<input type="hidden" id="or_uid" name="or_uid">
					<input type="hidden" id="c_no" name="c_no" value="0">
					<input type="hidden" name="ccg_subname" value="${pr_type}">
					<input type="hidden" name="pr_date" value="${pr_date}">
				</form>
			<!-- <div id="legalcopy">
					<a href="personalCounselStep4.do">
					<input type="button" id="back-btn" name="submit" value="????????????"></a>
			</div> -->
				
				<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
						<input type="hidden" name="cmd" value="_s-xclick"> 
						<input type="hidden" name="hosted_button_id" value="QRZ7QTM9XRPJ6">
						<input type="hidden" id="c_email" name="c_email" value="${c_email}" >
					<div style="width:150px; height:100px;">
						<input type="button" class="check_module" id="pay-btn" name="submit" value="????????????">
					</div>
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
$(document).ready(function(){
	var n1 = $("#total").html();
	const cn1 = n1.toString()
	  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	$("#total").html(cn1);
	$("#totalPrice").html(cn1);
	
	});

function change(){
	   var price = $("#g_price").val();
	   var priceSelect = $("#checkbox").val();
	   var num = priceSelect.indexOf('/');
	   var priceResult = priceSelect.substr(0,num);
	   const cn1 = priceResult.toString()
		  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	   
	   var couponNo = priceSelect.substr(num+1);
	   couponNo = Number(couponNo);
	   if (priceResult ==' '|| priceResult == null || priceResult =='') {
	   		$("#discount").text('');
	   }else{
		    $("#discount").text(' '+' '+'-'+cn1+'???');
	   }
	   
	   var ddd = price-priceResult;
	   const cn2 = ddd.toString()
		  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	   $("#totalPrice").text(cn2+"???");
	   $("#pr_price").val(ddd);
	   $("#c_no").val(couponNo);
	   
}


$('#previous-btn').click(function() {
	location.href = 'personalCounselStep3.do'
});

</script>
<script>
        $(".check_module").click(function () {
		var price = $("#pr_price").val();
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
        amount: price,
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
        $("#pr_price").val(rsp.paid_amount);
        $("#or_uid").val(rsp.imp_uid);
        $("#frm").submit();
         var msg = '????????? ?????????????????????.';
        //msg += '??????ID : ' + rsp.imp_uid;
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
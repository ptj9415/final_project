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
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<h1 class="mb-2 bread">그룹상담</h1>
					<p class="breadcrumbs">
						<span class="mr-2">
						<a href="index.html"><i class="ion-ios-arrow-forward"></i></a>
						</span> 
						<span><i class="ion-ios-arrow-forward"></i></span>
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
					<h2>${groupInvoice.c_name} 상담사</h2>
					<p>${groupInvoice.c_email }</br> ${groupInvoice.c_phone }</br></p>
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
							<td class="tableitem"><p class="itemtext">${groupInvoice.gc_type}</td>
						</tr>
						<tr class="service">
							<td class="tableitem"><p class="itemtext">상담날짜</p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext">${groupInvoice.gc_date}</p></td>
						</tr>
						<tr class="service">
							<td class="tableitem"><p class="itemtext">할인쿠폰</p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p> 
								<select name='checkbox' id="checkbox" onchange="change()">
											<option value='' selected>-- 선택 --</option>
										<c:forEach items="${coupon }" var="coupon">
											<option value='${coupon.c_price}/${coupon.c_no}'>${coupon.c_name} (${coupon.c_price}원)</option>									
										</c:forEach>
								</select>
							</td>
						</tr>
						<tr class="service">
							<td class="tableitem"><p class="itemtext">상담 금액</p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext">${groupInvoice.gc_price}원</p></td>
						</tr>
						<tr class="service">
							<td class="tableitem"><p class="itemtext">할인 금액</p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext"></p></td>
							<td class="tableitem"><p class="itemtext" id="discount" name="discount"></p></td>
						</tr>
						<tr class="tabletitle">
							<td class="Rate"><h2>총 결제 금액</h2></td>
							<td></td>
							<td></td>
							<td class="payment" id="totalPrice"></td>
						</tr>
					</table>
				</div>
				<input type="hidden" id="g_price" name="g_price" value="${groupInvoice.gc_price}">
				<form action="payment.do" id="frm" name="frm">
					<input type="hidden" id="gc_no" name="gc_no" value="${groupInvoice.gc_no}">
					<input type="hidden" id="gr_subject" name="gr_subject" value="${groupInvoice.gc_title}">
					<input type="hidden" id="pr_price" name="pr_price" value="">
					<input type="hidden" id="or_uid" name="or_uid">
					<input type="hidden" id="c_no" name="c_no" value="">
				</form>
				<!--End Table-->
			    <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
					<input type="hidden" name="cmd" value="_s-xclick"> <input
						type="hidden" name="hosted_button_id" value="QRZ7QTM9XRPJ6">
					<input type="button" class="check_module" id="pay-btn" name="submit" value="아임 포트 결제">
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
	<script>
	   function change(){
		   var price = $("#g_price").val();
		   var priceSelect = $("#checkbox").val();
		   var num = priceSelect.indexOf('/');
		   var priceResult = priceSelect.substr(0,4);
		   var couponNo = priceSelect.substr(num+1);
		   
		   $("#discount").text(' '+' '+'-'+priceSelect+'원');
		   var ddd = price-priceSelect;
		   $("#totalPrice").text(ddd+'원');
		   $("#gr_price").val(ddd);
		   $("#c_no").val(couponNo);
		   
	   }	
	</script>
	<script>
		var pr_price = $("#pr_price").val();
        $(".check_module").click(function () {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp71871883');
        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
        IMP.request_pay({
        pg: 'inicis', // version 1.1.0부터 지원.
        /*
        'kakao':카카오페이,
        html5_inicis':이니시스(웹표준결제)
        'nice':나이스페이
        'jtnet':제이티넷
        'uplus':LG유플러스
        'danal':다날
        'payco':페이코
        'syrup':시럽페이
        'paypal':페이팔
        */
        pay_method: 'card',
        /*
        'samsung':삼성페이,
        'card':신용카드,
        'trans':실시간계좌이체,
        'vbank':가상계좌,
        'phone':휴대폰소액결제
        */
        merchant_uid: 'merchant_' + new Date().getTime(),
        /*
        merchant_uid에 경우
        https://docs.iamport.kr/implementation/payment
        위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
        참고하세요.
        나중에 포스팅 해볼게요.
        */
        name: '주문명:결제테스트',
        //결제창에서 보여질 이름
        amount: 100,
        //가격
        //bank_name : null,
        buyer_email: 'iamport@siot.do',
        buyer_name: '구매자이름',
        buyer_tel: '010-1234-5678',
        buyer_addr: '서울특별시 강남구 삼성동',
        buyer_postcode: '123-456',
        m_redirect_url: 'https://www.yourdomain.com/payments/complete',
        /*
        모바일 결제시,
        결제가 끝나고 랜딩되는 URL을 지정
        (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
        */
        }, function (rsp) {
        console.log(rsp);
        if (rsp.success) {
        $("#or_uid").val(rsp.imp_uid);
        $("#frm").submit();
         var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        /* msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num; */
        } else {
        var msg = '결제에 실패하였습니다.';
        /*msg += '에러내용 : ' + rsp.error_msg;
        msg += 'ㅜㅜ' + rsp.amount;
        msg += rsp.imp_uid; */
        }
        alert(msg);
	        });
        });
    </script>
</body>
</html>
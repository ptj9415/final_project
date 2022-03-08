<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>invoice</title>
</head>
<style>
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
	margin-top:100px;
	margin-bottom:60px;
	margin-bottom: 0.3rem;
}

/*심리테라피 리스트*/

/* Lazy Load Styles */
.card-image {
	display: block;
	min-height: 20rem; /* layout hack */
	background: #fff center center no-repeat;
	background-size: cover;
	/* filter: blur(3px); */ /* blur the lowres image */
}

.card-image > img {
	display: block;
	width: 100%;
	opacity: 0; /* visually hide the img element */
}

.card-image.is-loaded {
	filter: none; /* remove the blur on fullres image */
	transition: filter 1s;
}

/* Layout Styles */


.card-list {
	display: block;
	margin: 1rem auto;
	padding: 0;
	font-size: 0;
	text-align: center;
	list-style: none;
	width:80%;
}

.card {
    border-radius: 30px;
	display: inline-block;
	width: 300px;
	max-width: 20rem;
	margin: 1rem;
	font-size: 1rem;
	text-decoration: none;
	overflow: hidden;
	box-shadow: 0 0 3rem -1rem rgba(0, 0, 0, 0.5);
	transition: transform 0.1s ease-in-out, box-shadow 0.1s;
	height: 480px;
}

.card:hover {
	transform: translateY(-0.5rem) scale(1.0125);
	box-shadow: 0 0.5em 3rem -1rem rgba(0, 0, 0, 0.5);
}

.card-description {
	display: block;
	padding: 2em 0.5em;
	color: #515151;
	text-decoration: none;
}

.card-description > h2 {
	margin: 0 0 0.5em;
}

/* .card-description > p {
	margin: 0;
} */
.therapy-title{
	font-weight:bold;
	font-size:20px;
}
.sub-title{
	width:80%;
	margin-right:auto;
	margin-left:auto;
}
/*심리테라피 리스트 end*/
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
					<h1 class="mb-2 bread">심리테라피</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html"><i
								class="ion-ios-arrow-forward"></i></a></span> <span><i
							class="ion-ios-arrow-forward"></i></span>
					</p>
				</div>
			</div>
		</div>
	</section>
	
	<div class="container">
		<div class="row justify-content-start mb-5 pb-2">
			<div
				class="col-md-4 heading-section ftco-animate fadeInUp ftco-animated">
				<span class="subheading subheading-with-line"><small
					class="pr-2 bg-white">MAEUMI</small></span>
				<h2 class="mb-4">심리 테라피</h2>
			</div>
			<div
				class="col-md-8 pl-md-5 heading-section ftco-animate fadeInUp ftco-animated">
				<div class="pl-md-4 border-line">
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia, there live the blind texts.
						Separated they live in. A small river named Duden flows by their
						place and supplies it with the necessary regelialia. It is a
						paradisematic country, in which roasted parts of sentences fly
						into your mouth.</p>
				</div>
			</div>
		</div>
	</div>
  <ul class="card-list">
        <li class="card">
            <a class="card-image" href="home.do" target="_blank" style="background-image: url(resources/user/images/testimg.jpg)" data-image-full="resources/user/images/testimg.jpg">
                <img src="resources/user/images/testimg.jpg" alt="Psychopomp" />
            </a>
            <a class="card-description" target="_blank">
                <p class="therapy-title">요동치는 마음을 어쩌면 좋지?</p>
                <p class="sub-title">당신이 지금 당장 명상을 시작해야 하는 이유</p>
               </a>
        </li>
        <li class="card">
            <a class="card-image" href="home.do" target="_blank" style="background-image: url(resources/user/images/testimg7.png)" data-image-full="resources/user/images/testimg7.png">
                <img src="resources/user/images/testimg7.png" alt="Psychopomp" />
            </a>
            <a class="card-description" target="_blank">
                <p class="therapy-title">요동치는 마음을 어쩌면 좋지?</p>
                <p class="sub-title">당신이 지금 당장 명상을 시작해야 하는 이유</p>
               </a>
        </li>
        
        <li class="card">
            <a class="card-image" href="home.do" target="_blank" style="background-image: url(resources/user/images/testimg3.jpg)" data-image-full="resources/user/images/testimg3.jpg">
                <img src="resources/user/images/testimg3.jpg" alt="Psychopomp" />
            </a>
            <a class="card-description" target="_blank">
          
                <p class="therapy-title">요동치는 마음을 어쩌면 좋지?</p>
                <p class="sub-title">당신이 지금 당장 명상을 시작해야 하는 이유</p>
               </a>
        </li>
        
        <li class="card">
            <a class="card-image" href="home.do" target="_blank" style="background-image: url(resources/user/images/testimg4.png)" data-image-full="resources/user/images/testimg4.png">
                <img src="resources/user/images/testimg4.png" alt="Psychopomp" />
            </a>
            <a class="card-description" target="_blank">
          
                <p class="therapy-title">요동치는 마음을 어쩌면 좋지?</p>
                <p class="sub-title">당신이 지금 당장 명상을 시작해야 하는 이유</p>
               </a>
        </li>
        
        <li class="card">
            <a class="card-image" href="home.do" target="_blank" style="background-image: url(resources/user/images/testimg5.jpg)" data-image-full="resources/user/images/testimg5.jpg">
                <img src="resources/user/images/testimg5.jpg" alt="Psychopomp" />
            </a>
            <a class="card-description" target="_blank">
          
                <p class="therapy-title">요동치는 마음을 어쩌면 좋지?</p>
                <p class="sub-title">당신이 지금 당장 명상을 시작해야 하는 이유</p>
               </a>
        </li>
        
        <li class="card">
            <a class="card-image" href="home.do" target="_blank" style="background-image: url(resources/user/images/testimg6.jpeg)" data-image-full="resources/user/images/testimg6.jpeg">
                <img src="resources/user/images/testimg6.jpeg" alt="Psychopomp" />
            </a>
            <a class="card-description" target="_blank">
          
                <p class="therapy-title">요동치는 마음을 어쩌면 좋지?</p>
                <p class="sub-title">당신이 지금 당장 명상을 시작해야 하는 이유</p>
               </a>
        </li>
    </ul>
   <script>
   window.addEventListener('load', function() {
		// setTimeout to simulate the delay from a real page load
		setTimeout(lazyLoad, 800);
	});
	function lazyLoad() {
		var card_images = document.querySelectorAll('.card-image');
		
		// loop over each card image
		card_images.forEach(function(card_image) {
			var image_url = card_image.getAttribute('data-image-full');
			var content_image = card_image.querySelector('img');
			// change the src of the content image to load the new high res photo
			content_image.src = image_url;
			// listen for load event when the new photo is finished loading
			content_image.addEventListener('load', function() {
				// swap out the visible background image with the new fully downloaded photo
				card_image.style.backgroundImage = 'url(' + image_url + ')';
				// add a class to remove the blur  to smoothly transition the image change
				card_image.className = card_image.className + ' is-loaded';
			});
		});
	}
   </script>
</body>
</html>
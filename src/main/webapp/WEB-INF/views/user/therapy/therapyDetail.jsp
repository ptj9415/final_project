<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	width:300px; 
	height:300px;
	opacity: 0; /* visually hide the img element */
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

    @import url('https://fonts.googleapis.com/css?family=Nunito');

article {
  max-width: 700px;
  margin: 0 auto;
  padding: 20px;
  box-sizing: border-box;
}

p {
  font-family: 'Nunito';
  font-size: 18px;
  color: rgba(0,0,0,.84);
  line-height: 1.60;
  margin: 30px auto;
}

article img {
  max-width: 100%;
  display: block;
  position: relative;
  cursor:  zoom-in;
}

#detail-modal {
  justify-content: center;
  align-items: center;
  display: none;
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
}

#detail-modal img {
  display: block;
  position: relative;
  z-index: 100;
  cursor: zoom-out;
}

.bg {
  position: fixed;
  left: 0;
  top: 0;
  right: 0;
  background-color: #ffffff;
  opacity: 0;
  display: block;
  transition: opacity .3s;
}

#next-btn {
	width: 100px;
	height: 40px;
	border-radius: 50px;
	background-color: #153e54;
	color: white;
	border: solid 1px #153e54;
	font-size: 14px;
	cursor: pointer;
	position: relative;
	margin-top:20px;
	margin-bottom:20px;
	margin-right:100px;
	float:right;
}

</style>
<body>
			<section class="hero-wrap hero-wrap-2">
	<img src="img/bannerimg/therapy.png" id="bannerimg">
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
					<p>삶과 미래를 긍정적으로 접근할 수 있다면 인생에 있어 더할 나위 없는 행복을 누릴 수 있고<br> 
					   행복해지기 위한 계획을 세울 수 있습니다. 심리테라피를 보면서 마음을 치유해보세요.</p>
				</div>
				</div>
			</div>
		</div>
	</div>
	<h1 style="text-align: center">${selectTherapy.t_title}</h1>
	  <br>
	     <div style="text-align: center">by 마으미 전문 칼럼</div>
	  <br>
	  <hr>
	<article>
       ${selectTherapy.t_subject}
    </article>
   	<div>
    	<button type="button" id="next-btn" name="btn" class="next action-button" onclick="func('${selectTherapy.t_no}')">돌아가기</button>        	
    	<br>
    	<br>
    	<br>
    	<br>
   	</div>
<script>
function func(t_no){
	var url = "userTerapy.do";
	url = url + "?t_no="+t_no;
	location.href = url;
	
}

const { fromEvent } = rxjs;
const images = document.querySelectorAll('article img');
const detailModal = document.querySelector('#detail-modal');
const detailBgModal = document.querySelector('.bg');

let canShowModal = true;

detailBgModal.addEventListener("transitionend", () => {
  if (detailBgModal.style.opacity === '0') {
    const showImage = document.querySelector('[fullscreen=true]')
    showImage.style.zIndex = 0;
    detailBgModal.style.bottom = 'auto';
    showImage.removeAttribute('fullscreen')
    canShowModal = true;
  }
});

const checkIsImagePortrait = (src) => {
  return new Promise((resolve) => {
    const img = new Image();
    img.src = src;
    img.onload = () => {
      let isImagePortrait;
      const ratio = img.naturalWidth / img.naturalHeight;
      const pratio = window.innerWidth / window.innerHeight;
      console.log('pratio', pratio)
      if (ratio < pratio) {
        isImagePortrait = true;
      } else {
        isImagePortrait = false
      }
      resolve(isImagePortrait);
    };
  });
};

const showModal = (imageElement) => {
  const src = imageElement.getAttribute('src');
  const modalImage = document.querySelector('#detail-modal img');
  return checkIsImagePortrait(src).then(isPortrait => {
    const src = imageElement.getAttribute('src');
    if (isPortrait) {
      modalImage.style.height = '100%';
      modalImage.style.width = 'auto';
    } else {
      modalImage.style.height = 'auto';
      modalImage.style.width = '100%';
    }
    
    detailModal.style.top = `${window.scrollY}px`;
    detailModal.style.height = `${window.innerHeight}px`;
    detailModal.style.display = 'flex';
    
    detailBgModal.style.bottom = '0';
    detailBgModal.style.opacity = 1;
    document.querySelector('#detail-modal img').setAttribute('src', src); 
  });
};

const hideModal = () => {
  detailBgModal.style.opacity = 0;
  detailModal.style.display = 'none';
  canShowModal = false;
};

let modalDetailPos;

const handleBodyScroll = () => {
  const { scrollY } = window;
  if (Math.abs(scrollY - modalDetailPos) > 50) {
    const event = new Event('click');
    detailModal.dispatchEvent(event);
    window.removeEventListener('scroll', handleBodyScroll);
  }
};

images.forEach((image) => {
  fromEvent(image, 'click').subscribe(() => {
  if (!canShowModal) {
    return
  }
    
  image.setAttribute('fullscreen', true)
    console.log('show image')
 
  showModal(image).then(() => {
    const modalImage = document.querySelector('#detail-modal img');
    
    const firstSnap = image.getBoundingClientRect();
    const lastSnap = modalImage.getBoundingClientRect();
 
    const {
      deltaX,
      deltaY,
      deltaWidth,
      deltaHeight
    } = getDelta(firstSnap, lastSnap);

    modalImage.animate([
      {
        transformOrigin: 'top left',
        transform: `
          translate(${deltaX}px, ${deltaY}px)
          scale(${deltaWidth}, ${deltaHeight})
        `
      },
      {
        transformOrigin: 'top left',
        transform: 'none'
      }
    ], {
      duration: 300,
      easing: 'ease-in-out',
      fill: 'both'
    }).onfinish = () => {
      modalDetailPos = window.scrollY;
      window.addEventListener('scroll', handleBodyScroll)
    };
  });
});
})

const moveElementToFullscreen = (element) => {
  element.style.position = 'fixed'; 
  element.style.left = 0;
  element.style.top = 0;
  element.style.right = 0;
  element.style.bottom = 0;
};

const moveElementToNormalState = (element) => {
  element.style.position = null; 
  element.style.left = null;
  element.style.top = null;
  element.style.right = null;
  element.style.bottom = null;
};

const getDelta = (firstSnap, lastSnap) => {
  const deltaX = firstSnap.left - lastSnap.left;
  const deltaY = firstSnap.top - lastSnap.top;
  const deltaWidth = firstSnap.width / lastSnap.width;
  const deltaHeight = firstSnap.height / lastSnap.height;
  return {
    deltaX: deltaX,
    deltaY: deltaY,
    deltaWidth: deltaWidth,
    deltaHeight: deltaHeight
  };
}

fromEvent(detailModal, 'click').subscribe(() => {

  const showImage = document.querySelector('[fullscreen=true]');
  if (!showImage ) {
    return;
  }
    const modalImage = document.querySelector('#detail-modal img');

    console.log('showImage', showImage)
  const firstSnap = modalImage.getBoundingClientRect();
  const lastSnap = showImage.getBoundingClientRect();
  
  hideModal();
  
  const { 
    deltaX,
    deltaY,
    deltaWidth,
    deltaHeight
  } = getDelta(firstSnap, lastSnap);
  
  showImage.style.zIndex = 100;
  
  showImage.animate([
    {
      transformOrigin: 'top left',
      transform: `
        translate(${deltaX}px, ${deltaY}px)
        scale(${deltaWidth}, ${deltaHeight})
      `
    },
    {
      transformOrigin: 'top left',
      transform: 'none'
    }
  ], {
    duration: 400,
    easing: 'ease',
    fill: 'both'
  });
});s
     </script>
</body>
</html>
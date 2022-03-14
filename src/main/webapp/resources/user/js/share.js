const url = 'https://twelvelevetype.netlify.app/';
const title = '지금 나의 자존감 상태는?';

var art = document.querySelector('.art')

function checkImage(){
	if(art.hasChildNodes){
		console.log("has");
		var artImage = art.firstChild.alt;
		return Number(artImage);
	} else {
		console.log("error");
		alert("구현중입니다.");
	}
	return error;
}

function sendKakaoLink(shareTitle, shareDescription, shareImageUrl) {
	Kakao.Link.sendDefault({
		objectType: 'feed',
		content: {
			title: shareTitle,
			description: shareDescription,
			imageUrl:
				shareImageUrl,
			link: {
				mobileWebUrl: 'https://twelvelevetype.netlify.app/',
				webUrl: 'https://twelvelevetype.netlify.app/',
			},
		},
		buttons: [
			{
				title: '나도 테스트 하러가기',
				link: {
					mobileWebUrl: 'https://twelvelevetype.netlify.app/',
					webUrl: 'https://twelvelevetype.netlify.app/',
				},
			},
		],
	});
}

function createDescription(){
	const imageNumber = checkImage();
	console.log(imageNumber);
	if(imageNumber === "error"){
		return 0;
	}
	switch (imageNumber) {
		case 0:
			var shareDescription = infoList[0].name;
			break;
		case 1:
			var shareDescription = infoList[1].name;
			break;
		case 2:
			var shareDescription = infoList[2].name;
			break;
		case 3:
			var shareDescription = infoList[3].name;
			break;
		case 4:
			var shareDescription = infoList[4].name;
			break;
		
	}
	var shareTitle = '나의 자존감 테스트 결과'
	const shareImageUrl = url + 'resources/user/img/image/' + imageNumber + '.png';
	sendKakaoLink(shareTitle, shareDescription, shareImageUrl);
}

const copy = () => {
  const tmp = document.createElement('textarea');
  document.body.appendChild(tmp);
  tmp.value = url;
  tmp.select();
  document.execCommand('copy');
  document.body.removeChild(tmp);
}
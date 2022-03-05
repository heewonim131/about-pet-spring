<%@ page contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
 	    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>aboutPet</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="format-detection" content="telephone=no">
<meta name="theme-color" content="#ffffff">
<link rel="canonical" href="">
<meta name="author" content="" />
<meta name="description" content="">
<meta name="keywords" content="">

<meta name="twitter:card" content="Summary">
<meta name="twitter:site" content="트위터 사이트">
<meta name="twitter:creator" content="트위터 계정">
<meta name="twitter:url" content="https://www.aboutpet.co.kr/">
<meta name="twitter:title" content="">
<meta name="twitter:description" content="">
<meta name="twitter:image" content="">

<meta property="og:type" content="website">
<meta property="og:site_name" content="">
<meta property="og:locale" content="ko">
<meta property="og:url" content="https://www.aboutpet.co.kr/">
<meta property="og:title" content="">
<meta property="og:description" content="">
<meta property="og:image" content="/_images/common/aboutpet_logo@2x.png" />
<meta property="og:image:url" content="/_images/common/aboutpet_logo@2x.png" />
<meta property="og:image:type" content="image/jpeg" />
<meta property="og:image:width" content="300" />
<meta property="og:image:height" content="300" />

<link href="/_images/common/favicon.ico" rel="shrtcut icon">
<link href="/_images/common/favicon.png" rel="apple-touch-icon-precomposed">

<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="https://vknfvtjnsgec6381690.cdn.ntruss.com/_css/jquery-ui.css">

<script async src="https://www.googletagmanager.com/gtag/js?id=G-NR86F31079"></script>
<script type="text/javascript" 	src="/_script/googleAnalytics.js"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', "G-NR86F31079");
</script>

<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery-3.3.1.min.js" ></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery-ui.min.js"></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.ui.datepicker-ko.js" ></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.blockUI.js" charset="utf-8"></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.inputmask.bundle.min.js" charset="utf-8"></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.number.min.js" charset="utf-8"></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.form.min.js" ></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.countdown.js" ></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/jquery/jquery.cookie.js" ></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/swiper.min.js"></script>
<script type="text/javascript"  src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/clipboard.min.js"></script>
<script type="text/javascript"  src="../js/common.js" ></script>
<script type="text/javascript"  src="../js/popup.js" ></script>
<script type="text/javascript" 	src="../js/ui.js"></script>
<script type="text/javascript" 	src="../js/deviceChk.js"></script>	<!-- // APP용 Device, Device OS, 위도, 경도 추가 -->
<!-- kakao map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c334796703760a76acd7724ca50251cd&libraries=services"></script>
<script type="text/javascript" 	src="https://vknfvtjnsgec6381690.cdn.ntruss.com/_script/kakao-map.js"></script>
<!-- app interface --> 
<script type="text/javascript" 	src="/_script/app-interface.js"></script>
<!-- adbrix -->
<script type="text/javascript" 	src="/_script/adbrix.js"></script>
<script type="text/javascript" 	src="/_script/ui.mo.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dbtckaqj51&submodules=geocoder"></script>
<script type="text/javascript">
//	const viewJsonData = JSON.parse(decodeURIComponent('%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D'));
</script>

<script type="text/javascript">
	$(document).ready(function(){
		/* 안드로이드 계열에서 저장되는 것 막음 / javascript Ready Function에 추가 */
		/*$(document).bind("contextmenu", function(e) {
		    return false;
		});*/
		
		document.addEventListener("contextmenu", e => { 
		    e.target.matches("img") && e.preventDefault()
		    e.target.matches("video") && e.preventDefault()
			e.target.className=="thumb-img" && e.preventDefault()
		})
	});
  

	
	// 설정 -> 앱 푸시 설정 토글시
	// 앱에서 호출하기 위해 공통으로 푸출
	function updateInfoRcyYn(checkYn) {
		if("" != null && "" != "") {
			var toastText = (checkYn == "Y") ? "설정" : "해제";
					
			var options = {
					url : "/updateInfoRcvYn"
					, data : { mbrNo : "0", infoRcvYn : checkYn }
					, done : function(result) {
						if(result == "S") {
							if(checkYn != "Y") {
								ui.toast("앱 푸시 알림이" +" "+toastText +"되었어요");	
							}	
						}
					}
			}
			ajax.call(options);
		}
	}

	// APP용 페이지 이동 Callback function
	function fnGoIndexOrderPayment(data){
		var obj = JSON.parse(data);
		createFormSubmit("indexOrderPaymentForm","/order/indexOrderPayment",obj);
	}
</script>
<style type="text/css">
	/* 아이폰 계열에서 저장되는 것 막음 / css 에 추가 */
	img, video {
		/* 화면을 길게 누르고 있을때 뜨는 팝업이나 액션시트를 제어 */
		-webkit-touch-callout:none;
		/* 텍스트나 이미지를 선택할 수 있게 하는 여부를 제어 */
		/*-webkit-user-select:none;*/
		/* 링크를 터치했을때 나오는 기본 영역의 색상을 제어 */
		/*-webkit-tap-highlight-color:transparent;*/
	}
	
	.loader{
    position: fixed;
    top:0;
    left:0;
    width: 100%;
    height:100%;
    background: rgba(255,255,255,0.9) url('../_images/common/icon_loading_76.gif') no-repeat 50% 50%;
    z-index: 1;
  }
</style>

<script>
// 히스토리 관련 함수( 모바일 < 버튼을 위함 )
var storageHist = {
	histCnstn : "StorageHistory",		// storage 저장 상수
	isApp : ("PC" == "APP")? true : false,
	cnvrtFullUrl : function(url) { 
		var fullUrl = url;
		if(url.indexOf('aboutpet.co.kr') < 0 && url.indexOf('localhost')  < 0 ){
			fullUrl = "https://aboutpet.co.kr"+((url.indexOf("/") != 0)?"/":"")+url;
		}			
		return fullUrl;
	},
	sendApp : function(func, url) {		// 앱 정보 전달
		try {
			// 데이터 세팅
			toNativeData.func = func;
			if(url != null && url != undefined && url != ""){
				toNativeData.url = storageHist.cnvrtFullUrl(url);
			}else{
				toNativeData.url = null;
			}
			// 호출
			toNative(toNativeData);
		} catch(e) {
			
		}
	},
	getHist : function() { 	// sessionStorage에 저장된 history 목록 확인
		var hist = sessionStorage.getItem(storageHist.StorageHistory);
		return (hist == null)?new Array():JSON.parse(hist);
	},
	setHist : function() {	//sessionStorage에 history 저장
		/* var sessionStorageCnt = 30; */
		var thisHistory = {
				url : window.location.href,
				histLength : window.history.length
			}
		var sessionHistory = storageHist.getHist();
		if(sessionHistory == null || sessionHistory.length == 0){				// 처음 셋팅
			var histArray = new Array();
			histArray.push(thisHistory);
			if(storageHist.isApp) storageHist.sendApp("onAddHistory", thisHistory.url);
			sessionStorage.setItem(storageHist.StorageHistory, JSON.stringify(histArray));
		}else{ 									// 추가
			if(sessionHistory[sessionHistory.length-1].histLength >= thisHistory.histLength){	// 브라우저 뒤로가기 고려하여 히스토리 조정(뒤로가기시 해당 페이지까지 히스토리 삭제)
				var theUrlIdx;
				sessionHistory.forEach(function(item, index, array) {
					if(item.url == thisHistory.url){
						theUrlIdx = index;
					}
				});
				if(theUrlIdx != null && theUrlIdx != undefined){
					var removeCnt = sessionHistory.length - theUrlIdx;
					sessionHistory.splice(theUrlIdx, removeCnt);
					sessionStorage.setItem(storageHist.StorageHistory, JSON.stringify(sessionHistory));
				}
			}
			
			if(sessionHistory[sessionHistory.length-1].url != thisHistory.url){
				sessionHistory.push(thisHistory);
				if(storageHist.isApp) storageHist.sendApp("onAddHistory", thisHistory.url);
				sessionStorage.setItem(storageHist.StorageHistory, JSON.stringify(sessionHistory));
			}
		}
	},
	replaceHist : function(url) {		// sessionStorage의 hisory 목록 replace또는 remove
		var sessionHistory = storageHist.getHist();
		sessionHistory.pop();	// remove
		if(url){				// url 추가
			var thisHistory = {
				url : storageHist.cnvrtFullUrl(url),
				histLength : window.history.length
			}
			sessionHistory.push(thisHistory);
		}
		if(storageHist.isApp) storageHist.sendApp("onReplaceHistory", url);
		sessionStorage.setItem(storageHist.StorageHistory, JSON.stringify(sessionHistory));
		return (sessionHistory.length == 0)?"/":sessionHistory[sessionHistory.length-1].url;
	},
	goBack : function(url){ 		// 이전페이지 / 페이지 이동
// 		if(storageHist.isApp){
// 			storageHist.sendApp("onHistoryBack", url);
// 		}else 
		if(url){	// url로 이동(해당 url 이후 삭제)
			var fullUrl = storageHist.cnvrtFullUrl(url);
			storageHist.clearUp(fullUrl);
			location.href = fullUrl;
		}else{		// 이전페이지
			var lastUrl = storageHist.replaceHist();
			location.href = lastUrl;
		}
	},
	getOut : function(url, firstUrl) {		// 진입페이지로 이동(url을 포함하지 않는 최근 목록으로 이동, firstUrl이 true경우 url을 벗어난 가장 상위 url로 이동)
		var lastUrl = storageHist.clearUp(url, true, firstUrl);
		location.href = lastUrl;
	},
	clearUp : function(url, part, firstUrl) {					// 해당 url까지 히스토리 목록 삭제하기 (part가 true이면 해당 url포함 목록 삭제)
		var sessionHistory = storageHist.getHist();
		var theUrlIdx;
		var isFinding = true;
		if(part){		// url을 포함하고 있으면 삭제
			sessionHistory.forEach(function(item, index, array) {
				if(firstUrl){
					if(isFinding){
						if(item.url.indexOf(url) != -1 ){
							theUrlIdx = index;
							isFinding = false;
						}
					}
				}else{
					if(item.url.indexOf(url) == -1 ){
						theUrlIdx = index+1;
					}
				}
			});
		}else{			// 해당 url까지 삭제
			sessionHistory.forEach(function(item, index, array) {
				if(item.url == url){
					theUrlIdx = index+1;
				}
			});
		}
		
		if(theUrlIdx != null && theUrlIdx != undefined){
			var removeCnt = sessionHistory.length - theUrlIdx;
			sessionHistory.splice(theUrlIdx, removeCnt);
			sessionStorage.setItem(storageHist.StorageHistory, JSON.stringify(sessionHistory));
		}
		return (sessionHistory.length == 0)?"/":sessionHistory[sessionHistory.length-1].url;
	},
	clearHist : function() {			// history 전체 삭제
		sessionStorage.removeItem(storageHist.StorageHistory);
		if(storageHist.isApp) storageHist.sendApp("onClearHistory");
	}
}

// sessionStorage 저장 호출 / 메인은 clear
var thisUrl = window.location.href;
if(thisUrl.indexOf('?returnUrl=') == -1 && thisUrl.indexOf('&returnUrl=') == -1 && (thisUrl.indexOf('/tv/home')>0 ||thisUrl.indexOf('/log/home')>0 || thisUrl.indexOf('/shop/home')>0 || thisUrl.indexOf('/mypage/indexMyPage')>0)){  // history clear
	storageHist.clearHist();
	storageHist.setHist();
}else{	// history 저장
	storageHist.setHist();
}
console.log("storageHist",storageHist.getHist());
</script><!-- Google Tag Manager -->
<!-- For Analysis Container -->
<script>
(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-NKC9BFM');
</script>

<!-- For Campaign Container -->
<script>
(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-M82SBBJ');
</script>
<!-- End Google Tag Manager -->
<!--라이브 앱과 연동을위한 JS -->
<script src="https://sgr.aboutpet.co.kr/web/runInit/v1.js"></script>
<script type="text/javascript">
	//검색API 클릭 이벤트(사용자 액션 로그 수집)
	function userActionLog(contId, action, url, targetUrl){	
		var mbrNo = "0";
		if (mbrNo != "0") {
			$.ajax({
				type: 'POST'
				, url : "/common/sendSearchEngineEvent"
				, async:false
				, dataType: 'json'
				, data : {
					"logGb" : "ACTION"
					, "mbr_no" : mbrNo
					, "section" : "shop" 
					, "content_id" : contId
					, "action" : action
					, "url" : (url != null && url) != '' ? url : document.location.href
					, "targetUrl" : (targetUrl != null && targetUrl != '') ? targetUrl : document.location.href
					, "litd" : ""
					, "lttd" : ""
					, "prclAddr" : ""
					, "roadAddr" : ""
					, "postNoNew" : ""
					, "timestamp" : ""
				}
			});
		}
	}
</script><script type="text/javascript">
			function loadCornerGoodsList(dispClsfNo, dispCornNo, dispClsfCornNo, dispType, timeDeal) {
				var form = document.createElement("form");
				document.body.appendChild(form);
				var url = "/shop/indexGoodsList";
				form.setAttribute("method", "GET");
				form.setAttribute("action", url);
		
				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "dispClsfNo");
				hiddenField.setAttribute("value", dispClsfNo);
				form.appendChild(hiddenField);
				document.body.appendChild(form);
				hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "dispCornNo");
				hiddenField.setAttribute("value", dispCornNo);
				form.appendChild(hiddenField);
				document.body.appendChild(form);
				hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "dispClsfCornNo");
				hiddenField.setAttribute("value", dispClsfCornNo);
				form.appendChild(hiddenField);
				document.body.appendChild(form);
				if(dispType != undefined) {
					hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					hiddenField.setAttribute("name", "dispType");
					hiddenField.setAttribute("value", dispType);
					form.appendChild(hiddenField);
					document.body.appendChild(form);
				}
				if(timeDeal != undefined) {
					hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					hiddenField.setAttribute("name", "timeDeal");
					hiddenField.setAttribute("value", timeDeal);
					form.appendChild(hiddenField);
					document.body.appendChild(form);
				}
				form.submit();
			}
			
			function goLink(url) {
				var viewDispClsfNo = '300000173';
				if(url.indexOf("?") > -1) {
					url += "&dispClsfNo="+viewDispClsfNo;
				}else {
					url += "?dispClsfNo="+viewDispClsfNo;
				}
				location.href = url;
			}

			/**
			 * 금액 콤마 처리
			 * @param x
			 * @returns {string}
			 */
			function numberWithCommas(x) {
				x = String(x);
				var pattern = /(-?\d+)(\d{3})/;
				while (pattern.test(x))
					x = x.replace(pattern, "$1,$2");
				return x;
			}
		</script></head>

<body class="body">
<!-- Google Tag Manager (noscript) -->
<!-- For Analysis Container -->
<noscript>
<iframe src="//www.googletagmanager.com/ns.html?id=GTM-NKC9BFM"
height="0" width="0" style="display:none;visibility:hidden"></iframe>
</noscript>

<!-- For Campaign Container -->
<noscript>
<iframe src="//www.googletagmanager.com/ns.html?id=GTM-M82SBBJ"
height="0" width="0" style="display:none;visibility:hidden"></iframe>
</noscript>
<!-- End Google Tag Manager (noscript) -->
<!-- 기본 컨텐츠 -->
	<div class="wrap" id="wrap">
		<input type="hidden" id="viewJsonData" value="%7B%22vod_group_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Flist%3Fchannel_id%3D%22%2C%22vod_group_move_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fmove_vod%5C%2F%22%2C%22vod_group_add_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fplaylist%5C%2Fadd_item%5C%2F%22%2C%22vod_upload_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fupload%5C%2F%22%2C%22vod_chnl_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fchannel%5C%2Flist%22%2C%22fo_mois_post_confmKey%22%3A%22U01TX0FVVEgyMDIxMDMzMDEwMzEzMDExMDk4MTk%3D%22%2C%22vod_api_chnl_id_log%22%3A%22aboutpet_log%22%2C%22vod_info_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2Finfo%5C%2F%22%2C%22vod_group_chnl_ord_api_url%22%3Anull%2C%22vod_list_api_url%22%3A%22https%3A%5C%2F%5C%2Fsgr.aboutpet.co.kr%5C%2Fv1%5C%2Fvod%5C%2Fvideo%5C%2F%22%2C%22vod_group_default%22%3A%22unclassified%22%2C%22vod_api_chnl_id_tv%22%3A%22aboutpet_tv%22%7D">
		
		<!-- s : header 영역 -->
					<script type="text/javascript">
	//개발자도구에서의 console.[log, debug] control	
	logger("prd");
	
	$(document).ready(function(){
		
		if("DEVICE_TYPE" != "DEVICE_TYPE"){
			if("PC" == "MO"){
				$("meta[name=viewport]").attr("content","width=device-width, initial-scale=1, maximum-scale=4, user-scalable=yes");
			}else if("PC" == "PC"){
 				$("meta[name=viewport]").attr("content","width=device-width, initial-scale=0, maximum-scale=6, user-scalable=yes");
 			}
		}

		//IE 진입 시 edge로 연결
		if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
			
			document.body.innerHTML = '';
		
			function edgeAlert(){
				alert("어바웃펫은 Internet Explorer를 지원하지 않습니다. \n크롬, 엣지 브라우저에 최적화 되어있습니다.")
				location.href = "microsoft-edge:" + location.href;
			}
			function closeIE(){
				open("","_self").close();
			}
			setTimeout(edgeAlert);
	        setTimeout(closeIE,200);
		}
		
		if(document.cookie.indexOf("DEVICE_GB") == -1){
			ipadCheck();
		}
		chcekLoginTagInfo(); 
		checkURL();
		
		
		
		// 검색창 문구
		/* getSearchInputAutoComplete(); */
		
		$("li[id^=liTag_]").one('click', function(){
			$("li[id^=liTag_]").removeClass("active");
			$(this).addClass("active");
	    });
		
		$(document).on("click" , "#alertBtn" , function(){
			getAlertList();
		});
	});
	
	function getAlertList(){
		var options = {
				url : "/alertList"
				, dataType : "html"
				, done : function(html){
					$("#alertBtn").removeClass("on");
					if("PC" == "PC"){
						$("#alertDiv").html(html);	
					}else{
						location.href="/alertList"	
					}
				}
		}
		ajax.call(options);
	}
	
	// ipad check logic
	function ipadCheck(){
		const iPad = (navigator.userAgent.match(/(iPad)/) /* iOS pre 13 */ ||  (navigator.platform === 'MacIntel' && navigator.maxTouchPoints > 1) /* iPad OS 13 */);
		if(iPad){
			setCookie("DEVICE_GB", "MO" , 24 );
			window.location.reload();
		}
	}
	
	//회원 관심태그 등록 여부 체크
	function chcekLoginTagInfo(){
		if("" != "Y" && "0" > 0 && "" == ""){
			location.href = "/join/indexTag?isPBHR=Y&returnUrl="+location.pathname+location.search;
		}
	}
	
	function setCookie( name, value, expirehours ) {
		var todayDate = new Date();
		todayDate.setHours( todayDate.getHours() + expirehours );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}
	
	
	$(function() {
		$('.category_wrap').on('show', function(e, param1) {
			if (param1 == "cate") {
				$('.right_btn_wrap').hide();
				
				var options = {
					url : "/brand/listStyleBrand",
					done : function(data) {
						var html = "";
						for (var i=0; i<data.brandStyleList.length; i++) {
							var brand = data.brandStyleList[i];
							html += '<li><a href="/brand/indexBrandDetail?bndNo=' + brand.bndNo + '">' + brand.bndNm + '</a></li>';
						}
						$('.dep_box.style ul').html(html);
					}
				};
				ajax.call(options);
			}
		});
		
		$('.category_wrap').on('hide', function(e, param1) {
			if (param1 == "cate")
				$('.right_btn_wrap').show();
		});
	});	
	
	// 검색
	function goSearch(dispClsfNo){
		
		var searchWord = $("#srchWord").val();
		var srchShopWord = $("#srchShopWord").val();
		if( srchShopWord != "" &&  srchShopWord != undefined){
			searchWord = srchShopWord;
		}
		var srchShopDispClsfNo = convertDispClsfNo((dispClsfNo == "" || dispClsfNo == undefined) ? "300000173" : dispClsfNo);
		// google Analytics 정보 전송
		// search_data.search_term = searchWord;
		// sendGtag('search');
		// 마지막 검색 페이지 진입 url 저장
		var lastUrl = window.location.href;
		if(lastUrl.indexOf("commonSearch") == -1){
			
			/* 
			$.cookie("searchLastUrl", lastUrl, {path:'/'});
			$.cookie("searchLastFocus", "10", {path:'/'});
			 */
			 
			location.href = "commonSearch.do";
			
		}else{
	          if ($.trim($("#srchWord").val())=="") {
                  location.href = "commonSearch.jsp";
         }else{
			  var searchWordData = { "searchWord": searchWord };
			  $.ajax({
			        url: "/AboutPet/Project/aboutPet/searchLog.do"
			        , dataType:"json"
			        , type:"get"
			        , data: searchWordData
			        , cache:false
			   
			      });     
			 location.href="commonSearch.do?srchWord="+searchWord;
			}
			
		}
	}
	
	// 메뉴 활성화	
	function checkURL() {
		var pathname = location.pathname;
		
		//펫로그회원(bizNo이 있는 회원)이 펫로그가 아닌 다른 페이지에 접속하면 alert
		if(pathname.indexOf("/log/") < 0 && "" != "" && "" > 0 && pathname.indexOf("/my/pet/") < 0 && pathname.indexOf("/commonSearch") < 0){
			if(confirm("로그아웃 됩니다. 로그아웃 하시겠습니까?")){
				location.href="/logout";
			}else{
				history.back(-1);
			}
		}
		
		var menu = $('.top_area .nav').children("li");
		
		for (var i=0; i<menu.length; i++) {
			var url = $(menu[i]).find("a").attr("href");
			if (url == location.pathname)
				$(menu[i]).addClass("active");
		}
	}
	
	// 위시리스트 추가 - 상품상세제외
	function insertWish(obj, goodsId){
		if( $(".popToast").is(":visible") ) return;

		var options = {
			url : "/goods/insertWish",
			data : {goodsId : goodsId},
			done : function(data){
				if(data.actGubun =='login'){
					//비로그인 시 처리 기획 없음.
					document.location.href = '/indexLogin?returnUrl='+encodeUriComponent(document.location.href);
				}else if(data.actGubun =='add'){
					$(obj).addClass("on");
					let msg = '<div class="link"><p class="tt">찜리스트에 추가되었어요</p><a href="/mypage/shop/myWishList" class="lk" data-content="" data-url="/mypage/shop/myWishList">바로가기</a></div>';
					ui.toast(msg,{
						bot:77
					});
					//if (confirm("위시리스트에 담겼습니다.\n확인하시겠습니까?")) location.href = "/mypage/interest/indexWishList";
				}else if(data.actGubun =='remove'){
					$(obj).removeClass("on");
					ui.toast("찜리스트에서 삭제되었어요", {
						bot:77
					})
					//alert("위시리스트에서 삭제되었습니다.");
				}else{
					let act = $(obj).hasClass("on") ? "취소" : "추가";
					ui.toast("찜 "+act+" 요청을 실패하였습니다", {
						bot:77
					});
					//alert('위시리스트 등록 또는 삭제에 실패하였습니다.');
				}
			}
		};
		ajax.call(options);
	}
	
	function insertWishS(obj, goodsId, query) {
		var options = {
			url : "/goods/insertWish",
			data : {goodsId : goodsId, search : "Y", returnUrl : document.URL+"?searchQuery="+query },
			done : function(data) {
				$(obj).addClass("click");
			}
		};
		ajax.call(options);
	}

	function goEvent(){
		var id = $(".tmenu .list .active").prop("id");
		var url = "";
		var eventGb2Cd = "10";
		//펫샵
		if(id =="liTag_10"){
			eventGb2Cd = "40";
		}
		//펫tv
		else if(id =="liTag_20"){
			eventGb2Cd = "20";
		}
		//펫로그
		else if(id =="liTag_30"){
			eventGb2Cd = "30";
		}

		window.location.href = "/event/main";
	}
	
	$(function () {
		// 검색 메뉴
		$(".searchMenuContent").hide();
		$(".searchMenuContent:first").show();

		$("ul.searchMenu li").click(function () {
			$("ul.searchMenu li").removeClass("active");
			$(this).addClass("active");
			$(".searchMenuContent").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});
		
		//검색 : 카테고리
		$(".categorySub").hide();
		$(".categorySub:first").show();

		$("ul.searchCate li").click(function () {
			$("ul.searchCate li").removeClass("active");
			$(this).addClass("active");
			$(".categorySub").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});

		//검색 : 브랜드
		$(".brandSub").hide();
		$(".brandSub:first").show();

		$("ul.searchBrand li").click(function () {
			$("ul.searchBrand li").removeClass("active");
			$(this).addClass("active");
			$(".brandSub").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});

		//검색어 : 최근/인기검색어
		$(".searchKindSub").hide();
		$(".searchKindSub:first").show();

		$("ul.searchKind li").click(function () {
			$("ul.searchKind li").removeClass("active");
			$(this).addClass("active");
			$(".searchKindSub").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});
		
		// 검색 아이콘 클릭 시
		$(".btnSch").on("click", function(){
			goSearch();
		});
		// 검색 이벤트
		var thisUrl = window.location.href;
		if(thisUrl.indexOf("commonSearch") == -1){
			$("#srchWord, #srchShopWord").on("click", function(){
				goSearch();
			});
		}else{
			$(document).on("keypress","#srchWord, #srchShopWord",function(e){
				if ( event.keyCode == 13 ) {
					goSearch();
				}
			});
		}
	
		// 스크롤시 검색 포커스 해제
		$(window).scroll(function(){
			if(document.activeElement.name == 'srchWord'){
				$("#srchWord").blur();
			}
		});
		
		// 네이버 AI 데이터 관리
		let mbrNo, section, contentId, baseUrl, targetUrl, litd, lttd, agent = "";
		$("a, button").on("click", function(){
			// 회원번호
			mbrNo = "4D6593ECEC3FA303D4A624DB978FF5B2";
			if("" != "0"){
				mbrNo = "0";
			}
			
			// 요청구분
			section = "10";
			if("10" == section){
				section = "shop";
			} else if("20" == section){
				section = "tv";
			} else if("30" == section){
				section = "log";
			} else {
				section = "member";
			}
			
			// 콘텐츠/상품 번호/회원번호/태그번호(data-content)
			contentId = $(this).data("content");
			
			// 현재 URL
			if("" != $(this)[0].baseURI){
				baseUrl = $(this)[0].baseURI;
			}
			
			// 타겟 URL
			if("" != $(this).data("url") && "undefined" != typeof  $(this).data("url")){
				targetUrl = $(this).data("url");
			} else if("" != $(this)[0].href && "#" != $(this)[0].href){
				targetUrl = $(this)[0].href;
			} else if("" != $(this)[0].onclick){
				targetUrl = $(this)[0].onclick;
			}
			
			// Device, Device OS, 위도, 경도 추가
			if("PC" == "APP"){
				agent = "APP_" + jscd.typeOs;
				
				// 위치정보 약관동의 여부
				var headerPstInfoAgrYn = "N";
				
				
				// APP ibricks Interface
				var data = {
					      "mbr_no" : mbrNo
						, "section" : section
						, "content_id" : contentId
						, "action" : "etc"
						, "url" : baseUrl
						, "target_url" : targetUrl
						, "agent" : agent
						, "prclAddr" : ""
						, "roadAddr" : ""
						, "postNoNew" : ""
						, "timestamp" : ""
						, "pstInfoAgrYn" : headerPstInfoAgrYn
				};
				toNativeData.func = "onIbrixClick";
				toNativeData.parameters = JSON.stringify(data);
				toNative(toNativeData);
			} else {
				agent = "WEB_" + jscd.typeOs; 
		
				$.ajax({
					url : "/common/sendSearchEngineEvent"
					, data : {
						  "mbr_no" : mbrNo
						, "section" : section
						, "content_id" : contentId
						, "action" : "etc"
						, "url" : baseUrl
						, "targetUrl" : targetUrl
						, "agent" : agent
						, "prclAddr" : ""
						, "roadAddr" : ""
						, "postNoNew" : ""
						, "timestamp" : ""
					}
				});
			}
			// Device, Device OS, 위도, 경도 추가
		});
	});
	
	// APP용 ibricks Callback function
	function interfaceIbricksCallback(responseData){
		var response = $.parseJSON(responseData);
		$.ajax({
			url : "/common/sendSearchEngineEvent"
			, data :{
			      "mbr_no" : response.mbrNo
					, "section" : response.section
					, "content_id" : response.contentId
					, "action" : response.action
					, "url" : response.baseUrl
					, "target_url" : response.targetUrl
					, "agent" : response.agent
					, "litd" : response.litd
					, "lttd" : response.lttd
					, "prclAddr" : response.prclAddr
					, "roadAddr" : response.roadAddr
					, "postNoNew" : response.postNoNew
					, "timestamp" : ""
			}
		});
	}
	
	// APP용 Device, Device OS, 위도, 경도 추가
	function onCurrentLocCallBackIbricks(resultJson){
		var result = $.parseJSON(resultJson);
		agent = "APP_" + jscd.typeOs;
		if( result.authYn !== undefined && result.authYn == 'Y'){
			appLocAuthYn = "Y";
			lttd = result.latitude;
			litd = result.longitude;
			
			$.ajax({
				url : "/common/sendSearchEngineEvent"
				, data : {
					  "mbr_no" : mbrNo
					, "section" : section
					, "content_id" : contentId
					, "action" : "etc"
					, "url" : baseUrl
					, "target_url" : targetUrl
					, "litd" : litd
					, "lttd" : lttd
					, "agent" : agent
					, "timestamp" : ""
				}
			});
		}
	}
	// APP용 Device, Device OS, 위도, 경도 추가
	
	// 메인으로 가기
	function goPetShopMain() {
		var form = document.createElement("form");
		document.body.appendChild(form);
		var url = "/shop/home/";
		form.setAttribute("method", "POST");
		form.setAttribute("action", url);

		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "lnbDispClsfNo");
		hiddenField.setAttribute("value", '300000173');
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		form.submit();
	}
	
	// 분류번호 보내기
	function sendDispClsfNo(dispClsfNo){
		var lnbDispClsfNo = dispClsfNo
		var cateCdL = dispClsfNo
		cateCdL = convertDispClsfNo(dispClsfNo);
		
		var form = document.createElement("form");
		document.body.appendChild(form);
		var url = "/shop/home/";
		if("/shop/home/" == "/event/indexSpecialExhibitionZone"){
			url = "/shop/home";
		}
		
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', 'lnbDispClsfNo');
		hiddenField.setAttribute('value', lnbDispClsfNo);
		form.appendChild(hiddenField);
		
		if("/shop/home/" == "/shop/indexCategory"||
			"/shop/home/" == "/event/indexExhibitionZone") {
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "cateCdL");
			hiddenField.setAttribute("value", cateCdL);	// 12564
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if("/shop/home/" == "/shop/indexNewCategory" ||
				 "/shop/home/" == "/shop/indexBestGoodsList") {
			var dispCornType = $("input[id^=dispCornType_]").val();
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "dispCornType");
			hiddenField.setAttribute("value", dispCornType);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if("/shop/home/" == "/pet/event/petshopEventList" ||
			"/shop/home/" == "/shop/indexLive" ){				
			form.setAttribute("method", "GET");
		}else if("/shop/home/" == "/event/shop/main"){
			form.setAttribute("method", "GET");
			form.removeChild(hiddenField);

			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "dispClsfNo");
			hiddenField.setAttribute("value", lnbDispClsfNo);
			form.appendChild(hiddenField);
		}
		else {
			form.setAttribute("method", "POST");
		}
		form.setAttribute("action", url);
		document.body.appendChild(form);
		form.submit();
	}
	
	function convertDispClsfNo(dispClsfNo) {
		var cateCdL = '12564';
		
		if('300000174' == dispClsfNo ) {	// 고양이
			cateCdL = '12565'
		} else if('300000175' == dispClsfNo ) {	// 관상어
			cateCdL = '14111'
		} else if('300000176' == dispClsfNo ) {	// 소동물
			cateCdL = '14196'
		}
		
		return cateCdL;	
	}
	
/* 	function getSearchInputAutoComplete() { 
		$.post( "/shop/getSearchInputAutoComplete",	function( data ) {
			var srchText = "검색어를 입력해주세요.";
			if(data.searchBox != null && data.searchBox.bnrText != null && data.searchBox.bnrText != ''){
				srchText = data.searchBox.bnrText;
			}
			// 모바일 검색창
			$("#srchWordMO").text(srchText);
			// pc 검색창
			$("#srchWord").attr("placeholder", srchText);
			$("#srchShopWord").attr("placeholder", srchText);
		});
	} */
	
	function clickLogin(){
		location.href = "/indexLogin?returnUrl="+location.pathname+location.search;
	}
	
	
	//장바구니 수 set, 캐시 이슈로 ajax 호출
	function loadCornerGoodsList(dispClsfNo, dispCornNo, dispClsfCornNo, dispType, timeDeal) {
		var petNo = $("#petNo_rec").val();
		var form = document.createElement("form");
		document.body.appendChild(form);
		var url = "/shop/indexGoodsList";
		form.setAttribute("method", "GET");
		form.setAttribute("action", url);

		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "dispClsfNo");
		hiddenField.setAttribute("value", dispClsfNo);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "dispCornNo");
		hiddenField.setAttribute("value", dispCornNo);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "dispClsfCornNo");
		hiddenField.setAttribute("value", dispClsfCornNo);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "dispType");
		hiddenField.setAttribute("value", dispType);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		if(timeDeal != undefined) {
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "timeDeal");
			hiddenField.setAttribute("value", timeDeal);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}
		if(dispType == 'RCOM') {
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "petNo");
			hiddenField.setAttribute("value", petNo);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}
		form.submit();
	}
    
  	//등급 레이어팝업 스크립트 추가 2021.05.13
	var rankBox = function(){
		ui.popLayer.open('popLank',{
			ocb:function(){
				// console.log("popLank 열림");
			},
			ccb:function(){
				// console.log("popLank 닫힘");
			}
		});

		if("PC" == "PC") {
			$(".rank_pc").addClass("on");
		}else {										
			$(".rank_mo").addClass("on");
		}
	}
  	
</script>

<script>
$(function(){      
   var thisUrl = window.location.href;
   if(thisUrl.indexOf("commonSearch") != -1){
      $(".form").addClass("open");
      $("#header_pc").attr('class','header pc cu mode14');
   }
   });
</script>
<!--로그인하면 mode 0  -->
<!-- header pc-->
<header class="header pc cu mode10" data-header="set0" id="header_pc">
	<input type="password" style="display:none;"><!-- 크롬 패스워드 자동완성 방지 -->
	<div class="hdr">
		<div class="inr">
			<div class="tdt">
			
		<%-- 	<div class="usr">
						<a class="rank_icon" href="javascript:rankBox();"><em class="lv <%=grade%>">웰컴</em></a>
							<a href="javascript:;" class="name"><b class="t"><%=memberDTO.getMem_id() %></b><i class="i">님</i></a>
						<div class="sbm">
							<ul class="sm">
							<li><a href="/mypage/info/indexPswdUpdate" data-content="950362" data-url="/mypage/info/indexPswdUpdate" class="bt">비밀번호 설정</a></li>
									<li><a href="/mypage/info/indexManageDetail" data-content="950362" data-url="/mypage/info/indexManageDetail" class="bt">회원정보 수정</a></li>
									<li><a href="logout.jsp" data-content="950362" data-url="/logout" class="bt">로그아웃</a></li>
								</ul>
						</div>
					</div> --%>
			
			<s:authorize ifNotGranted="ROLE_USER">
			<!--롤유저로 인가받지 않았다면=로그인 안했다면  -->
			<ul class="menu">					
					<li><a href="/Project/aboutPet/signUp.do" class="bt">회원가입</a></li>
		                <li><a href="login.jsp" class="bt">로그인</a></li>
		                <!-- <li><a href="javascript:;" class="bt">로그인/회원가입</a></li> -->
					<!-- <li><a href="javascript:goEvent();" class="bt">이벤트</a></li> -->
					<li><a href="logout.jsp" class="bt">이벤트</a></li> 
						<li class="custo">
							<a href="javascript:;" class="bt">고객센터</a>
							<div class="sbm">
								<ul class="sm">
									<li><a href="/customer/faq/faqList" class="bt">FAQ</a></li>
									<li><a href="/customer/inquiry/inquiryView" class="bt">1:1문의</a></li>
									<li><a href="/customer/notice/indexNoticeList" data-url="/customer/notice/indexNoticeList" data-content="" class="bt">공지사항</a></li>
								</ul>
							</div>
						</li>
					</ul>
			</s:authorize>
			<s:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
				<div class="usr">
						<a class="rank_icon" href="javascript:rankBox();"><em class="lv ">웰컴</em></a>
							<a href="javascript:;" class="name"><b class="t"></b><i class="i">${pageContext.request.userPrincipal.name}님</i></a>
						<div class="sbm">
							<ul class="sm">
							<li><a href="/mypage/info/indexPswdUpdate" data-content="950362" data-url="/mypage/info/indexPswdUpdate" class="bt">비밀번호 설정</a></li>
									<li><a href="/mypage/info/indexManageDetail" data-content="950362" data-url="/mypage/info/indexManageDetail" class="bt">회원정보 수정</a></li>
									<li><a href="logout.jsp" data-content="950362" data-url="/logout" class="bt">로그아웃</a></li>
								</ul>
						</div>
					</div>
				<ul class="menu">					
					<li><a href="javascript:goEvent();" class="bt">이벤트</a></li>
						<li class="custo">
							<a href="javascript:;" class="bt">고객센터</a>
							<div class="sbm">
								<ul class="sm">
									<li><a href="/customer/faq/faqList" class="bt">FAQ</a></li>
									<li><a href="/customer/inquiry/inquiryView" class="bt">1:1문의</a></li>
									<li><a href="/customer/notice/indexNoticeList" data-url="/customer/notice/indexNoticeList" data-content="" class="bt">공지사항</a></li>
								</ul>
							</div>
						</li>
					</ul>
				
			</s:authorize>
			
			
				<!-- <ul class="menu">					
					<li><a href="sign_up.jsp" class="bt">회원가입</a></li>
		                <li><a href="logon_input.jsp" class="bt">로그인</a></li>
		                <li><a href="javascript:;" class="bt">로그인/회원가입</a></li>
					<li><a href="javascript:goEvent();" class="bt">이벤트</a></li>
					<li><a href="logout.jsp" class="bt">이벤트</a></li> 
						<li class="custo">
							<a href="javascript:;" class="bt">고객센터</a>
							<div class="sbm">
								<ul class="sm">
									<li><a href="/customer/faq/faqList" class="bt">FAQ</a></li>
									<li><a href="/customer/inquiry/inquiryView" class="bt">1:1문의</a></li>
									<li><a href="/customer/notice/indexNoticeList" data-url="/customer/notice/indexNoticeList" data-content="" class="bt">공지사항</a></li>
								</ul>
							</div>
						</li>
					</ul> -->
			
			
			</div>
			<div class="hdt">
				<!-- mobile -->
				<button class="mo-header-btnType02">취소</button><!-- on 클래스 추가 시 활성화 -->
				<!-- // mobile -->
				<button class="btnGnb" type="button">메뉴</button>
<!-- -->
				<h1 class="logo shop">
					<a class="bt" href="shop_home.do">AboutPet</a>
				</h1>
				<nav class="menushop">
							<button type="button" class="bt st">강아지</button>
							<div class="list">
								<ul class="menu">
									<li class="active"><a class="bt" href="#" onclick="sendDispClsfNo(300000173)"><b class="t" id="b_tag_300000173">강아지</b></a></li>
									<li class=""><a class="bt" href="#" onclick="sendDispClsfNo(300000174)"><b class="t" id="b_tag_300000173">고양이</b></a></li>
									<li class=""><a class="bt" href="#" onclick="sendDispClsfNo(300000175)"><b class="t" id="b_tag_300000173">관상어</b></a></li>
									<li class=""><a class="bt" href="#" onclick="sendDispClsfNo(300000176)"><b class="t" id="b_tag_300000173">소동물</b></a></li>
								</ul>
							</div>
						</nav>
<!-- -->
				<!-- mobile -->
				<button class="mo-header-backNtn" onclick="storageHist.goBack();">뒤로</button>
					<div class="mo-heade-tit">
					<span class="tit"></span>
								</div>
				<div class="mo-header-rightBtn">
						<button class="mo-header-btnType01">
							<span class="mo-header-icon"></span>
							</button>
					</div>
				<button class="mo-header-close"></button>
				<!-- // mobile -->
				<nav class="tmenu">
					<ul class="list">
						<li id="liTag_20" class=""><a href="tv_main.do" class="bt">펫TV</a></li>
						<li id="liTag_30" class=""><a href="log.do" class="bt">펫로그</a></li>
						<li id="liTag_10" class="active"><a href="shop_home.do" class="bt">펫샵</a></li>
						<li id="liTag_00" class=""><a href="myPage.do" class="bt">MY</a></li>
					</ul>
				</nav>
			</div>
			<div class="cdt">
						<div class="schs">
						<div class="form">
									<div class="input kwd"><input id="srchWord" name="srchWord" type="search" value="" autocomplete="off" autoplaceholder="검색어를 입력해주세요." ></div>
									<button type="button" class="btnSch" data-content="" data-url="/commonSearch">검색</button>
									<!-- 자동완성 드롭박스 -->
									<div class="key-word-list" id="key-word-list" style="display:none;"><ul></ul></div>
									<!-- 자동완성 드롭박스 -->
								</div>
							</div>
						<div class="menu">
							<button id="alertBtn" class="bt alim  " type="button">알림</button>
							<button class="bt cart" type="button" onclick="location.href='/order/indexCartList/'">
									</button>
							<button id="srchClsBtn" class="bt close" type="button"  onclick="searchCommon.srchClsBtn();">닫기</button>
							<div class="alims" id="alertDiv">
							</div>
						</div>
						</div>
</div>
	</div>
	
<script type="text/javascript">   

var lastUrl = window.location.href;
if(lastUrl.indexOf("myPage.do") != -1){
   $("#liTag_00").addClass('active');
   $("#liTag_00").siblings().removeClass('active');
      
}else if(lastUrl.indexOf("shop_home.do") != -1){
   $("#liTag_10").addClass('active');
   $("#liTag_10").siblings().removeClass('active');
} else if(lastUrl.indexOf("log.do") != -1){
   $("#liTag_30").addClass('active');
   $("#liTag_30").siblings().removeClass('active');
} else if(lastUrl.indexOf("tv_main.do") || lastUrl.indexOf("edu_main.do") != -1){
   $("#liTag_20").addClass('active');
   $("#liTag_20").siblings().removeClass('active');
} 

</script>	
	
</header>


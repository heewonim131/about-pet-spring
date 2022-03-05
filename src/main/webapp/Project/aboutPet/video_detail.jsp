<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>aboutPet</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">

<!-- <link rel="stylesheet" type="text/css" href="/_css/style.pc.css"> -->
<link rel="stylesheet" type="text/css" href="https://vknfvtjnsgec6381690.cdn.ntruss.com/css/jquery-ui.css">

<link rel = "stylesheet" href = "../css/com.css">
<link rel = "stylesheet" href = "../css/common.css">
<link rel = "stylesheet" href = "../css/disp.css">
<link rel = "stylesheet" href = "../css/layout.css">
<link rel = "stylesheet" href = "../css/style.css">
<link rel = "stylesheet" href = "../css/swiper.css">
<link rel = "stylesheet" href = "../css/tv.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script async src="https://www.googletagmanager.com/gtag/js?id=G-NR86F31079"></script>
<script type="text/javascript" 	src="/_script/googleAnalytics.js"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', "G-NR86F31079");
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

	// mw/pc 자동 로그아웃 30분 
	var checkActionTimeOut;
	if('0' != '0' && 'PC' != 'APP'){
	    resetLoginTimeOut();
	    $(document).on('click keypress' , 'body' , function(){
	        resetLoginTimeOut();
	    });
	}
	function resetLoginTimeOut() {
		if('0' != '0' && 'PC' != 'APP'){
		    window.clearTimeout(checkActionTimeOut);
		    checkActionTimeOut = setTimeout(function() {
		        location.href="/logout/";
		    }, 30 * 60 * 1000);
		}		   
	}

	
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
<script src="https://sgr.aboutpet.co.kr/player/iframe_api/v1.js"></script>	
<script type="text/javascript">
//검색API 클릭 이벤트(사용자 액션 로그 수집)
function userActionLog(vdId, action){	
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
				, "section" : "tv" 
				, "content_id" : vdId
				, "action" : action
				, "url" : document.location.href
				, "targetUrl" : document.location.href
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
</script>
<script type="text/javascript">
			// 동영상 마우스 우클릭 방지
			$(".video-area").on("contextmenu", function(event) { event.preventDefault();});
			let nowVdId = "N2021071903372"; 	
			let sortCd = ""; 	
			let listGb = "VDO_N_N"; 	
			let player;						
			let tabGb = "S";				
			
			var seconds = 5;
			var myTimer;
			
			$(function(){
				//펫TV 상세는 pip모드로 인하여 viewport를 다시 셋팅함.(pip모드 해제시 화면이 확대되는 현상)
				$("meta[name=viewport]").attr("content", "width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no");
				
	            $(".btn-video-layer").click(function(){
	                $(this).toggleClass("on");
	                if($(this).hasClass("on")){
	                    $(this).parents(".videoAndListWrap").addClass("infoMode");
	                }else{
	                    $(this).parents(".videoAndListWrap").removeClass("infoMode");
	                };
	                $(this).css("top","");/* 04.12 */
	            });

	            /* tab width 설정 */
	            $(window).resize(reFn);
	            reFn();

	            function reFn(){
	                var $li = $(".tabWrap > .con > ul > li");
	                var check = window.matchMedia('(orientation:landscape)').matches;
	                $li.width($(document).width());
	                var w = window.innerWidth;
	                if(w >= 1024){
	                    $(".videoAndListWrap .tab-area").height($(".videoAndListWrap .video-area").height())
	                }else{
	                    $(".videoAndListWrap .tab-area").removeAttr("style");
	                };
	            };
	            
	            if("false" == "true"){
		            $(".off-ly").click(function() {
		            	//console.log(".off-ly");
		            	clearTimer();
					});
		            
		            $(".tvSlid").scroll(function() {
		            	//console.log(".tvSlid");
		            	clearTimer();
		            });
	            }
	            
	            /* 320대응 스크립트-04.12 */
	            $(".page.tv.detail .tab-area").scroll(function(){
	                var $bt = $(".div-right .btn-video-layer");
	                $bt.css("top","-" + $(this).scrollTop() + "px")
	                //console.log($(this).scrollTop())
	            })
	        });
			
			//가로모드 체크
			window.addEventListener('resize', function () {
				if (window.matchMedia('(orientation: portrait)').matches) {
					//mWeb, APP시 세로모드일때 타이머 리셋
                    if("false" == "true"){
                		//console.log("세로모드이다.");
                		clearTimer();
            		}
				} else {
					//mWeb, APP시 가로모드일때 타이머 리셋
                    if("false" == "true"){
	                    //console.log("가로모드이다");
	                    clearTimer();
                    }
				}
			});
			
			//뒤로가기 이벤트 처리에 사용-sgr에서 가이드
			window.addEventListener("message", function(event){
			    if(event.data.action == 'player_reload'){
			        document.getElementById(event.data.player_ifr_id).contentWindow.location.replace(event.data.player_url);
			    }
			});
			
			$(window).on('popstate', function(event) {
				var data = event.originalEvent.state;
				if(data !== null){
					nowVdId = data.vd_id;
					
					ui.tab2($("#tab_sris")); //시리즈 영상 탭으로 이동
					
					fncAutoFlag();
				}else{
					storageHist.goBack();
				}
			});
			
			let acTotTime = 0; 				
			let acPlayTime = 0; 			
			let outId = ""; 				
			let srisYn = "N"; 				
			let prevSrisVdId = ""; 			
			let nextSrisVdId = ""; 			
			let sesnYn = "N"; 				
			let prevSesnVdId = ""; 			
			let nextSesnVdId = ""; 			
			let prevAdviceVdId = ""; 		
			let nextAdviceVdId = ""; 		
			let srisAdYn = "N";				
			let sysRegr = "";				
			let autoPlayFlag = false;		
			let autoNextPlayFlag = false;	
			let firstVdoHits = true;		
			let boolPipNo = true;			
			
			$(document).ready(function(){
				fncAutoFlag();
				
				history.pushState({vd_id : nowVdId}, "", "/tv/series/indexTvDetail?vdId="+ nowVdId +"&sortCd="+ sortCd +"&listGb="+ listGb);

				$(document).click(function (e) {
					if(!$(e.target).closest(".prd-layer .cont").length ) {
						$('.prd-layer').slideUp('300');
						e.stopPropagation();
					}
				});

				$(".page.tv .prd-layer .top .inner").click(function(e){
					e.stopPropagation();
				});
			}); // End Ready
			
			//자동재생여부
			function fncAutoFlag(){
				//PC는 자동재생, MW는 자동재생안함
				//APP는 설정에 따라 자동재생시행
				if("true" == "true"){ //PC
					autoPlayFlag = true;
					autoNextPlayFlag = true;
					
					fncPrevNextVdoListInfo();
				}else if("false" == "true"){ //MW
					autoPlayFlag = false;
					autoNextPlayFlag = false;
					
					fncPrevNextVdoListInfo();
				}else if("false" == "true"){ //APP
					//자동재생여부 판단
					// 데이터 세팅
					toNativeData.func = "onIsAutoPlay";
					toNativeData.callback = "appIsAutoPlay";
					// APP 호출
					toNative(toNativeData);
					
					if("false" == "true"){
		            	//TWC 호출일때 상단 타이틀바 숨김
		            	// 데이터 세팅
						toNativeData.func = "onTitleBarHidden";
						toNativeData.hidden = "Y";
						// APP 호출
						toNative(toNativeData);
		            }
				}
			}
			
			//App 자동재생여부값
			function appIsAutoPlay(jsonString){
				var parseData = JSON.parse(jsonString);
				
				var autoPlay = parseData.isAutoPlay; //자동재생여부
				var pipYn = parseData.pipYn; //PIP지원가능여부
				
				if(autoPlay == "Y"){
					autoPlayFlag = true;
					autoNextPlayFlag = true;
				}else{
					autoPlayFlag = false;
					autoNextPlayFlag = false;
				}
				
				//OS버전에 따라 PIP기능이 안될때 & onNewPage 로 호출된게 아닐때 X버튼 보이도록 처리 & twc호출이 아닐때(twc호출일때는 jstl로 판단)
				if(pipYn == "N" && "false" == "false"){
					$("#btnClose").addClass("app");
					$("#btnClose").attr("onclick", "fncToMove('no_pip');");
				}
				
				fncPrevNextVdoListInfo();
			}
			
			//영상 상세정보, 태그목록, 연관상품목록, 이전/다음 시리즈(시즌) 목록 정보, 추천 영상 목록 조회
			function fncPrevNextVdoListInfo() {
				$.ajax({
					type: 'POST',
					url: "/tv/series/selectPrevNextVdoListInfo",
					async: false,
					dataType: 'json',
					data : {
						vdId : nowVdId
						, sortCd : sortCd
						, listGb : listGb
					},
					success: function(data) {
						acTotTime = 0; 				
						acPlayTime = 0; 			
						outId = ""; 				
						srisYn = "N"; 				
						prevSrisVdId = ""; 			
						nextSrisVdId = ""; 			
						sesnYn = "N"; 				
						prevSesnVdId = ""; 			
						nextSesnVdId = ""; 			
						prevAdviceVdId = ""; 		
						nextAdviceVdId = ""; 		
						srisAdYn = "N";				
						sysRegr = "";				
						firstVdoHits = true;		
						
						ui.tab2($("#tab_sris")); //시리즈 영상 탭으로 이동
						
						fncDetailInfo(data); 	//영상 상세정보, 태그목록, 연관상품목록
						fncDetailVdoList(data); //이전, 다음, 시리즈(시즌) 목록 정보 셋팅
						fncAdviceVdoList(data); //추천 영상 목록 정보 셋팅
						
						// PC의 경우에 영상 상세 진입할 경우 바로 댓글 조회 (MO WEB, APP의 경우 댓글 ui 버튼 클릭 시 댓글 목록 조회)
						if("true" == "true"){
							selectTvDetailReplyList('Y', nowVdId); // 댓글 정보
						} else {
							// 영상 자동 재생 페이지 이동 시 댓글 레이어 close
							$("#aplyContent").blur();
							if(boolPipNo){
								$("#moReplyLayerCloseBtn").trigger("click");
							}
						}
						
						//영상(인기, 맞춤, 신규)목록에서 댓글, 연관상품 클릭으로 상세페이지 진입시 댓글팝업, 연관상품 팝업이 떠야함.
						if("false" == "true"){
							if(listGb.indexOf("VDO") !== -1){
								var param = listGb.split("_");
								if(param[2] == "R"){
									//댓글팝업 실행
									//$("#video_reply").trigger("click");
									setTimeout(fncAplyLayerOpen, 500);
									listGb = param[0]+"_"+param[1]+"_N";
									
									var replaceUrl = "/tv/series/indexTvDetail?vdId="+ nowVdId +"&sortCd="+ sortCd +"&listGb="+ listGb;
									history.replaceState({vd_id : nowVdId}, "", replaceUrl);
									storageHist.replaceHist(replaceUrl);
								}else if(param[2] == "T"){
									//연관상품팝업 실행
									//$("#videoTing").trigger("click");
									getRelatedGoodsWithTv($("#videoTing"), nowVdId, "N");
									listGb = param[0]+"_"+param[1]+"_N";
									
									var replaceUrl = "/tv/series/indexTvDetail?vdId="+ nowVdId +"&sortCd="+ sortCd +"&listGb="+ listGb;
									history.replaceState({vd_id : nowVdId}, "", replaceUrl);
									storageHist.replaceHist(replaceUrl);
								}
							}else if(listGb.indexOf("TAG") !== -1){
								var param = listGb.split("_");
								if(param[1] == "R"){
									//댓글팝업 실행
									//$("#video_reply").trigger("click");
									setTimeout(fncAplyLayerOpen, 500);
									listGb = param[0]+"_N_"+param[2];
									
									var replaceUrl = "/tv/series/indexTvDetail?vdId="+ nowVdId +"&sortCd="+ sortCd +"&listGb="+ listGb;
									history.replaceState({vd_id : nowVdId}, "", replaceUrl);
									storageHist.replaceHist(replaceUrl);
								}else if(param[1] == "T"){
									//연관상품팝업 실행
									//$("#videoTing").trigger("click");
									getRelatedGoodsWithTv($("#videoTing"), nowVdId, "N");
									listGb = param[0]+"_N_"+param[2];
									
									var replaceUrl = "/tv/series/indexTvDetail?vdId="+ nowVdId +"&sortCd="+ sortCd +"&listGb="+ listGb;
									history.replaceState({vd_id : nowVdId}, "", replaceUrl);
									storageHist.replaceHist(replaceUrl);
								}
							}else if(listGb.indexOf("VT") !== -1){
								var param = listGb.split("_");
								if(param[2] == "R"){
									//댓글팝업 실행
									//$("#video_reply").trigger("click");
									setTimeout(fncAplyLayerOpen, 500);
									listGb = param[0]+"_"+param[1]+"_N";
									
									var replaceUrl = "/tv/series/indexTvDetail?vdId="+ nowVdId +"&sortCd="+ sortCd +"&listGb="+ listGb;
									history.replaceState({vd_id : nowVdId}, "", replaceUrl);
									storageHist.replaceHist(replaceUrl);
								}else if(param[2] == "T"){
									//연관상품팝업 실행
									//$("#videoTing").trigger("click");
									getRelatedGoodsWithTv($("#videoTing"), nowVdId, "N");
									listGb = param[0]+"_"+param[1]+"_N";
									
									var replaceUrl = "/tv/series/indexTvDetail?vdId="+ nowVdId +"&sortCd="+ sortCd +"&listGb="+ listGb;
									history.replaceState({vd_id : nowVdId}, "", replaceUrl);
									storageHist.replaceHist(replaceUrl);
								}
							}
							
							//연관상품 바텀시트 오픈 후 화면이동이면 연관상품 바텀시트 오픈시킴
							if(listGb.indexOf("goods") !== -1){
								var param = listGb.split("-");
								listGb = param[0];
								
								var replaceUrl = "/tv/series/indexTvDetail?vdId="+ nowVdId +"&sortCd="+ sortCd +"&listGb="+ listGb;
								history.replaceState({vd_id : nowVdId}, "", replaceUrl);
								storageHist.replaceHist(replaceUrl);
								
								getRelatedGoodsWithTv($("#videoTing"), nowVdId, "N");
							}else if(listGb.indexOf("cart") !== -1){
								var param = listGb.split("-");
								listGb = param[0];
								
								var replaceUrl = "/tv/series/indexTvDetail?vdId="+ nowVdId +"&sortCd="+ sortCd +"&listGb="+ listGb;
								history.replaceState({vd_id : nowVdId}, "", replaceUrl);
								storageHist.replaceHist(replaceUrl);
								
								getRelatedGoodsWithTv($("#videoTing"), nowVdId, "Y");
							}
						}
					},
					error: function(request, status, error) {
						ui.alert("오류가 발생되었습니다. 다시 시도하여 주십시오.");
					}
				});
			}
			
			//영상 상세정보, 태그목록, 연관상품목록 셋팅
			function fncDetailInfo(data){
				var tvDetailVO = data.tvDetailVO;
				var tagList = data.tagList;
				
				if(tvDetailVO !== null && tvDetailVO !== undefined) {
					userActionLog(tvDetailVO.vdId, "watch"); //클릭 이벤트-시청
					
					acTotTime = tvDetailVO.acTotTime;
					acPlayTime = tvDetailVO.acPlayTime;
					outId = tvDetailVO.acOutsideVdId;
					srisAdYn = tvDetailVO.srisAdYn;
					sysRegr = tvDetailVO.sysRegrNo;
					
					$("#video_title").html(tvDetailVO.ttl); //영상제목
					
					var srisThumBgUrl = "";
					if(tvDetailVO.srisPrflImgPath != null && tvDetailVO.srisPrflImgPath !== undefined){
						if(tvDetailVO.srisPrflImgPath.indexOf('cdn.ntruss.com') != -1){
							srisThumBgUrl = tvDetailVO.srisPrflImgPath;
						}else{
							srisThumBgUrl = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images"+ tvDetailVO.srisPrflImgPath +"?type=m&w=130&h=73&quality=95&bgcolor=FFFFFF&extopt=3";
						}
					}
					$("#sris_thum").css("background-image", "url("+ srisThumBgUrl +")"); //시리즈 썸네일
					$("#sris_thum").attr("onclick", "fncGoSrisList('"+ tvDetailVO.srisNo +"')"); //시리즈목록 이동
					
					$("#sris_name").html(tvDetailVO.srisNm); //시리즈명
					$("#sris_name").attr("onclick", "fncGoSrisList('"+ tvDetailVO.srisNo +"')"); //시리즈목록 이동
					
					
					//$("#player_count").html(fnComma(tvDetailVO.hits)); //재생수(조회수)
					$("#video_list_title").html("["+ tvDetailVO.srisNm +"] "+ (tvDetailVO.sesnNm == null ? "" : tvDetailVO.sesnNm)); //시리즈 영상 목록의 시리즈명, 시즌명
					
					/*영상 상세정보*/
					var dtlHtml = "";
					dtlHtml += '<div class="cont day">등록일 : '+ tvDetailVO.sysRegDt +'</div>';
				
                    
                    if(tvDetailVO.content != "" && tvDetailVO.content != undefined){
                    	dtlHtml += '<div class="cont">'+ tvDetailVO.content.replace(/(\n|\r\n)/g, '<br>') +'</div>';
                    }
                    
                    if(tagList != null && tagList.length > 0){
                    	dtlHtml += '<div class="cont tag">';
                    		for(var i=0; i<tagList.length; i++){
                    			dtlHtml += '<span style="cursor:pointer;" onclick="fncGoTagList(\''+ tagList[i].acTagNo +'\')">#'+ tagList[i].acTagNm +'</span>';
                    		}
	                  	dtlHtml += '</div>';
                    }
                    
                    if(tvDetailVO.crit != "" && tvDetailVO.crit != undefined){
                    	dtlHtml += '<div class="cont">';
                    	dtlHtml += '	<h3>음원저작권</h3>';
                    	dtlHtml += '	<p>'+ tvDetailVO.crit.replace(/(\n|\r\n)/g, '<br>') +'</p>';
                    	dtlHtml += '</div>';
                    }
					
					$("#video_detail").html(dtlHtml);
					/*//영상 상세정보*/
					
					/*연관상품*/
					$("#videoTing").attr("data-content", nowVdId);
					$("#videoTing").attr("data-url", "getRelatedGoodsWithTv(this, '"+ nowVdId +"', 'N')");
					
					//연관상품 갯수
					if(Number(tvDetailVO.goodsCount) > 0){
						$("#goodsNum").html(tvDetailVO.goodsCount);
						
						$(".tvConnectedTing").removeAttr("style");
						$(".btn-with-wrap").removeAttr("style");
						
						//연관상품 썸네일 이미지
						var goodsImgVO = tvDetailVO.goodsImgVO;
						var goodsThumBgUrl = "";
						if(goodsImgVO !== null && goodsImgVO !== undefined){
							if(goodsImgVO.imgPath !== null && goodsImgVO.imgPath !== undefined){
								if(goodsImgVO.imgPath.indexOf('cdn.ntruss.com') != -1){
									goodsThumBgUrl = goodsImgVO.imgPath;
								}else{
									goodsThumBgUrl = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images"+ goodsImgVO.imgPath +"?type=f&w=259&h=259&quality=90&align=4";
								}
							}else{
								goodsThumBgUrl = "../../_images/tv/@temp01.jpg"; 
							}
						}else{
							goodsThumBgUrl = "../../_images/tv/@temp01.jpg"; 
						}
						$("#goodsThums").css("background-image", "url("+ goodsThumBgUrl +")"); //시리즈 썸네일
					}else{
						$("#goodsNum").html("0");
						
						$(".tvConnectedTing").css("display", "none");
						$(".btn-with-wrap").css("display", "none");
					}
					/*//연관상품*/
					
					/*하단바(좋아요, 댓글, 공유, 찜)*/
					if(tvDetailVO.likeYn == "Y"){
						$("#video_like").addClass("on");
					}else{
						$("#video_like").removeClass("on");
					}
					$("#video_like").html(fnComma(tvDetailVO.likeCnt));
					$("#video_reply").html(fnComma(tvDetailVO.replyCnt));
					if(tvDetailVO.dibsYn == "Y"){
						$("#video_mark").addClass("on");
					}else{
						$("#video_mark").removeClass("on");
					}
					
					$("#video_like").attr("data-content", nowVdId);
					$("#video_reply").attr("data-content", nowVdId);
					$("#vdoClipboard").attr("data-content", nowVdId);
					$("#video_mark").attr("data-content", nowVdId);
					/*//하단바(좋아요, 댓글, 공유, 찜)*/
					

					$("#appSubject").val(tvDetailVO.ttl.replace(/amp;/gi, "")); //app 공유에서 사용-영상제목
					
					//공유 URL 셋팅
					$("#vdoClipboard").attr("data-clipboard-text", tvDetailVO.srtUrl); //PC,MO 공유에서 사용

					$("#appLink").val(tvDetailVO.srtUrl.replace(/amp;/gi, "")); //app 공유에서 사용-링크

				}else{
					ui.alert("재생할 수 없는 영상입니다.<br>펫TV 메인으로 이동합니다.",{ // 알럿 옵션들
					    tit:"ERROR",
					    ycb:function(){
					    	location.href="/tv/home/";
					    },
					    ybt:"확인" // 기본값 "확인"
					});
				}
			}
			
			

			//이전, 다음, 시리즈(시즌) 목록 정보 셋팅
			function fncDetailVdoList(data){
				var srisList = data.srisList; //시리즈 영상 목록
				var prevSrisInfo = data.prevSrisInfo; //이전 시리즈 영상 정보
				var nextSrisInfo = data.nextSrisInfo; //다음 시리즈 영상 정보
				var sesnList = data.sesnList; //시즌 영상 목록
				var prevSesnInfo = data.prevSesnInfo; //이전 시즌 영상 정보
				var nextSesnInfo = data.nextSesnInfo; //다음 시즌 영상 정보
				
				var prevSrisNum = -1; //이전 시리즈 영상순번
				var nextSrisNum = 0; //다음 시리즈 영상순번
				var prevSesnNum = -1; //이전 시즌 영상순번
				var nextSesnNum = 0; //다음 시즌 영상순번
				
				var html = "";
				if(sesnList != null && sesnList.length > 0){
					sesnYn = "Y";
					for(var i=0; i<sesnList.length; i++){
						html += '<div class="swiper-slide">'
						html += '	<div class="channel thumb-info">';
						html += '    	<div class="profile" style="background-image:url(../../_images/tv/@temp01.jpg);"></div>';
						html += '    	<div class="info">';
						html += '        	<div class="tit">'+ sesnList[i].ttl +'</div>';
						html += '    	</div>';
						html += '	</div>';
						html += '	<div name="thumbBox_'+ sesnList[i].vdId +'" class="thumb-box">';
						
						if(sesnList[i].vdId == nowVdId){
							prevSesnNum = i-1;
							nextSesnNum = i+1;
							
							$("#vdoTopPaging").html('<strong>'+ (i+1) +'</strong><em>/</em><span>'+ sesnList.length +'</span>');
						}
						
						if(sesnList[i].newYn == "Y"){
							html += '    	<i class="icon-n">N</i>';
						}
						
						var sesnBgUrl = "";
						if(sesnList[i].acPrflImgPath != null && sesnList[i].acPrflImgPath !== undefined){
							if(sesnList[i].acPrflImgPath.indexOf('cdn.ntruss.com') != -1){
								sesnBgUrl = sesnList[i].acPrflImgPath;
							}else{
								sesnBgUrl = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images"+ sesnList[i].acPrflImgPath +"?type=m&w=1440&h=810&quality=95&bgcolor=FFFFFF&extopt=3";
							}
						}
						//console.log("sesnList[i].progressBar ::: "+sesnList[i].progressBar);
						html += '    	<a href="#" class="thumb-img" onclick="fncTvDetail(\''+ sesnList[i].vdId +'\', \'S\'); return false;" style="background-image:url('+ sesnBgUrl +');" name="thumbImg_'+ sesnList[i].vdId +'" data-content="'+ sesnList[i].vdId +'" data-url="/tv/series/indexTvDetail?vdId='+ sesnList[i].vdId +'&sortCd='+ sortCd +'&listGb='+ listGb +'">';
						html += '       	<div class="time-tag"><span>'+ sesnList[i].acTotTimeStr +'</span></div>';
						if(Number(sesnList[i].progressBar) > 9){
							html += '       <div class="progress-bar" style="width:'+ sesnList[i].progressBar +'%;"></div>';
						}
						html += '    	</a>';
						html += '    	<div class="thumb-info">';
						html += '        	<div class="info">';
						html += '            	<div class="tlt">';
						html += '    				<a href="#" onclick="fncTvDetail(\''+ sesnList[i].vdId +'\', \'S\'); return false;" data-content="'+ sesnList[i].vdId +'" data-url="/tv/series/indexTvDetail?vdId='+ sesnList[i].vdId +'&sortCd='+ sortCd +'&listGb='+ listGb +'">';
						html +=							sesnList[i].ttl;
						html += '					</a>'
						html += '				</div>';
						html += '            	<div class="detail">';
						
						//html += '                	<span class="read play">'+ fnComma(sesnList[i].hits) +'</span>';
						html += '                	<span class="read like">'+ fnComma(sesnList[i].likeCnt) +'</span>';
						html += '            	</div>';
						html += '        	</div>';
						html += '    	</div>';
						html += '	</div>';
						html += '</div>';
					}
				}else{
					srisYn = "Y";
					for(var i=0; i<srisList.length; i++){
						html += '<div class="swiper-slide">'
						html += '	<div class="channel thumb-info">';
						html += '    	<div class="profile" style="background-image:url(../../_images/tv/@temp01.jpg);"></div>';
						html += '    	<div class="info">';
						html += '        	<div class="tit">'+ srisList[i].ttl +'</div>';
						html += '    	</div>';
						html += '	</div>';
						html += '	<div name="thumbBox_'+ srisList[i].vdId +'" class="thumb-box">';
						
						if(srisList[i].vdId == nowVdId){
							prevSrisNum = i-1;
							nextSrisNum = i+1;
							
							$("#vdoTopPaging").html('<strong>'+ (i+1) +'</strong><em>/</em><span>'+ srisList.length +'</span>');
						}
						
						if(srisList[i].newYn == "Y"){
							html += '    	<i class="icon-n">N</i>';
						}
						
						var srisBgUrl = "";
						if(srisList[i].acPrflImgPath != null && srisList[i].acPrflImgPath !== undefined){
							if(srisList[i].acPrflImgPath.indexOf('cdn.ntruss.com') != -1){
								srisBgUrl = srisList[i].acPrflImgPath;
							}else{
								srisBgUrl = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images"+ srisList[i].acPrflImgPath +"?type=m&w=1440&h=810&quality=95&bgcolor=FFFFFF&extopt=3";
							}
						}
						//console.log("srisList[i].progressBar ::: "+srisList[i].progressBar);
						html += '    	<a href="#" class="thumb-img" onclick="fncTvDetail(\''+ srisList[i].vdId +'\', \'S\'); return false;" style="background-image:url('+ srisBgUrl +');" name="thumbImg_'+ srisList[i].vdId +'" data-content="'+ srisList[i].vdId +'" data-url="/tv/series/indexTvDetail?vdId='+ srisList[i].vdId +'&sortCd='+ sortCd +'&listGb='+ listGb +'">';
						html += '        	<div class="time-tag"><span>'+ srisList[i].acTotTimeStr +'</span></div>';
						if(Number(srisList[i].progressBar) > 9){
							html += '        <div class="progress-bar" style="width:'+ srisList[i].progressBar +'%;"></div>';
						}
						html += '    	</a>';
						html += '    	<div class="thumb-info">';
						html += '        	<div class="info">';
						html += '            	<div class="tlt">';
						html += '    				<a href="#" onclick="fncTvDetail(\''+ srisList[i].vdId +'\', \'S\'); return false;" data-content="'+ srisList[i].vdId +'" data-url="/tv/series/indexTvDetail?vdId='+ srisList[i].vdId +'&sortCd='+ sortCd +'&listGb='+ listGb +'">';
						html +=							srisList[i].ttl;
						html += '					</a>'
						html += '				</div>';
						html += '            	<div class="detail">';
						
						//html += '                	<span class="read play">'+ fnComma(srisList[i].hits) +'</span>';
						html += '                	<span class="read like">'+ fnComma(srisList[i].likeCnt) +'</span>';
						html += '            	</div>';
						html += '        	</div>';
						html += '    	</div>';
						html += '	</div>';
						html += '</div>';
					}
				}
				
				if(nextSesnInfo !== null && nextSesnInfo !== undefined) {
					html += '<div class="swiper-slide season">'
					html += '	<div class="thumb-box">';
					html += '    	<div class="div-respon">';
					
					var nextSesnBgUrl = "";
					if(nextSesnInfo.acPrflImgPath != null && nextSesnInfo.acPrflImgPath !== undefined){
						if(nextSesnInfo.acPrflImgPath.indexOf('cdn.ntruss.com') != -1){
							nextSesnBgUrl = nextSesnInfo.acPrflImgPath;
						}else{
							nextSesnBgUrl = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images"+ nextSesnInfo.acPrflImgPath +"?type=m&w=1440&h=810&quality=95&bgcolor=FFFFFF&extopt=3";
						}
					}
					html += '        	<a href="#" class="thumb-img" onclick="fncTvDetail(\''+ nextSesnInfo.vdId +'\', \'S\'); return false;" style="background-image:url('+ nextSesnBgUrl +');" data-content="'+ nextSesnInfo.vdId +'" data-url="/tv/series/indexTvDetail?vdId='+ nextSesnInfo.vdId +'&sortCd='+ sortCd +'&listGb='+ listGb +'">';
					html += '            	<div class="season-list">';
					html += '                	<span>'+ fnComma(nextSesnInfo.vdCnt) +'</span>';
					html += '            	</div>';
					html += '        	</a>';
					html += '        	<div class="thumb-info">';
					html += '            	<div class="info">';
					html += '            		<div class="tlt">';
					html += '        				<a href="#" onclick="fncTvDetail(\''+ nextSesnInfo.vdId +'\', \'S\'); return false;" data-content="'+ nextSesnInfo.vdId +'" data-url="/tv/series/indexTvDetail?vdId='+ nextSesnInfo.vdId +'&sortCd='+ sortCd +'&listGb='+ listGb +'">';
					html +=								nextSesnInfo.sesnNm;
					html += '						</a>'
					html += '					</div>';
					html += '            	</div>';
					html += '        	</div>';
					html += '    	</div>';
					html += '	</div>';
					html += '</div>'
				}else if(nextSrisInfo !== null && nextSrisInfo !== undefined){
					html += '<div class="swiper-slide season">'
					html += '	<div class="thumb-box">';
					html += '    	<div class="div-respon">';
					
					var nextSrisBgUrl = "";
					if(nextSrisInfo.acPrflImgPath != null && nextSrisInfo.acPrflImgPath !== undefined){
						if(nextSrisInfo.acPrflImgPath.indexOf('cdn.ntruss.com') != -1){
							nextSrisBgUrl = nextSrisInfo.acPrflImgPath;
						}else{
							nextSrisBgUrl = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images"+ nextSrisInfo.acPrflImgPath +"?type=m&w=1440&h=810&quality=95&bgcolor=FFFFFF&extopt=3";
						}
					}
					html += '        	<a href="#" class="thumb-img" onclick="fncTvDetail(\''+ nextSrisInfo.vdId +'\', \'S\'); return false;" style="background-image:url('+ nextSrisBgUrl +');" data-content="'+ nextSrisInfo.vdId +'" data-url="/tv/series/indexTvDetail?vdId='+ nextSrisInfo.vdId +'&sortCd='+ sortCd +'&listGb='+ listGb +'">';
					html += '            	<div class="season-list">';
					html += '                	<span>'+ fnComma(nextSrisInfo.vdCnt) +'</span>';
					html += '            	</div>';
					html += '        	</a>';
					html += '        	<div class="thumb-info">';
					html += '            	<div class="info">';
					html += '            		<div class="tlt">';
					html += '        				<a href="#" onclick="fncTvDetail(\''+ nextSrisInfo.vdId +'\', \'S\'); return false;" data-content="'+ nextSrisInfo.vdId +'" data-url="/tv/series/indexTvDetail?vdId='+ nextSrisInfo.vdId +'&sortCd='+ sortCd +'&listGb='+ listGb +'">';
					html +=								nextSrisInfo.srisNm;
					html += '						</a>'
					html += '					</div>';
					html += '            	</div>';
					html += '        	</div>';
					html += '    	</div>';
					html += '	</div>';
					html += '</div>'
				}
				
				$("#listSrisSesn").html(html);
				
				if(boolPipNo){
					scrollActive(nowVdId); //현재 재생영상 표시 및 스크롤 이동
				}
				
				if(sesnYn == "Y"){
					//시즌 이전 영상ID
					if(prevSesnNum < 0){
						if(prevSesnInfo != null){
							prevSesnVdId = prevSesnInfo.vdId;
						}					
					}else{
						prevSesnVdId = sesnList[prevSesnNum].vdId;
					}
					
					//시즌 다음 영상ID
					if(nextSesnNum >= sesnList.length){
						if(nextSesnInfo != null){
							nextSesnVdId = nextSesnInfo.vdId;
						}
					}else{
						nextSesnVdId = sesnList[nextSesnNum].vdId;
					}
					
					if(prevSesnVdId == ""){
						//이전 시즌이 없는것이므로 이전시리즈 영상ID를 넣어준다.
						if(prevSrisInfo != null){
							prevSesnVdId = prevSrisInfo.vdId;
						}
					}
					
					if(nextSesnVdId == ""){
						//다음 시즌이 없는것이므로 다음시리즈 영상ID를 넣어준다.
						if(nextSrisInfo != null){
							nextSesnVdId = nextSrisInfo.vdId;
						}
					}
				}else{
					//시리즈 이전 영상ID
					if(prevSrisNum < 0){
						if(prevSrisInfo != null){
							prevSrisVdId = prevSrisInfo.vdId;
						}
					}else{
						prevSrisVdId = srisList[prevSrisNum].vdId;
					}
					
					//시리즈 다음 영상ID
					if(nextSrisNum >= srisList.length){
						if(nextSrisInfo != null){
							nextSrisVdId = nextSrisInfo.vdId;
						}
					}else{
						nextSrisVdId = srisList[nextSrisNum].vdId;
					}
				}
			
					//if(tabGb == "A"){
						fncDetailVdoApi(); //플레이어 셋팅
					//}
				
			}
			
			<!-- 시리즈 영상 플레이어 셋팅 -->
			function fncDetailVdoApi() {
				var event = {
					playing:fncPlayingSris //재생시작시 호출
					, pause:fncPauseSris // 일시정지시 호출
					, ended:fncEndedSris //재생 종료시 호출
					, muted:fncMutedSris //음소거 변화가 발생하면 호출 , 현재 상태값 전달
					, keepPlaying:fncKeepPlayingSris //영상 재생시 , 현재 재생위치 5초마다 보고
					, activeControlbar:fncActiveControlbarSris //컨트롤바가 활성/비활성시 호출
					, fullscreen:fncFullscreenSris //풀스크린 여부
				};
				
				if(sesnYn == "Y"){
					if(nextSesnVdId != ""){
						event.nextVideo = fncNextVideoSris //다음영상 UI 클릭시 실행 , 이벤트를 등록해야만 UI 노출됨
					}else if(nextSrisVdId != ""){
						event.nextVideo = fncNextVideoSris //다음영상 UI 클릭시 실행 , 이벤트를 등록해야만 UI 노출됨
					}
					
					if(prevSesnVdId != ""){
						event.prevVideo = fncPrevVideoSris //이전영상 UI 클릭시 실행 , 이벤트를 등록해야만 UI 노출됨
					}else if(prevSrisVdId != ""){
						event.prevVideo = fncPrevVideoSris //이전영상 UI 클릭시 실행 , 이벤트를 등록해야만 UI 노출됨
					}
				}else{
					if(nextSrisVdId != ""){
						event.nextVideo = fncNextVideoSris //다음영상 UI 클릭시 실행 , 이벤트를 등록해야만 UI 노출됨
					}
					if(prevSrisVdId != ""){
						event.prevVideo = fncPrevVideoSris //이전영상 UI 클릭시 실행 , 이벤트를 등록해야만 UI 노출됨
					}
				}
				
				var totTime = Number(acTotTime);
				var playTime = Number(acPlayTime);
				var startTime = 0;
				
				if(playTime < totTime){
					startTime = playTime;
				}
				
				var deviceGb = "";
				if("true" == "true"){
					deviceGb = "pc";
				}else{
					deviceGb = "mobile";
				}
				
				var adYn = false;
				if(srisAdYn == "Y"){
					adYn = true;
				}
				
				player = SGRPLAYER;
				player.setup('player', {
					height : "100%"
					, width : "100%"
					, video_id : outId
					, vtype : "mp4"
					, ui : deviceGb //UI 분기를 위하여 추가(mobile|pc)/현재 480px를 기점으로 모바일/pc ui가 자동 변경됨, 마우스액션같은건 분기처리됨
					, autoplay : autoPlayFlag //자동재생여부
					, start_time : startTime //입력된 초부터 시작(이어보기)
					, auto_next_play_event : autoNextPlayFlag //다음영상 자동재생 실행 여부
					, is_ad : adYn // 프리롤 광고 여부
					, uploader_id : sysRegr //업로드한 유저 아이디
					, viewer_id : "0" //시청하는 유저 아이디
					, controlBar: { //생략가능
						volumePanel : true  //볼륨컨트롤
						, playToggle : true //플레이 버튼
						, progressControl : true //프로그래시바
						, fullscreenToggle : true //플스크린버튼
						, playbackRateMenuButton : true //재생속도 버튼
						, pictureInPictureToggle : true  // PIP 버튼
						, timeDisplay : true //영상 시간 표시
						, frame_cover_fit : false //영상 프레임에 꽉채울지 여부
					}
					, events : event
			    });
				
				if("false" == "true"){
					clearTimer();
				}
			}
			<!-- //시리즈 영상 플레이어 셋팅 -->
			<!-- 시리즈 영상 플레이어 이벤트 -->
			function fncPlayingSris(){
			}
			function fncPauseSris(){
			}
			function fncEndedSris(){
				var mbrNo = "0";
				if (mbrNo != "0") {
				  	petTvViewHist(nowVdId, mbrNo, acTotTime, 0);
				}
			}
			function fncMutedSris(state){
				if(state==true) {
			    }else{
			    }
			}
			function fncActiveControlbarSris(state){
				if(state==true) {
				    //console.log('fncActiveControlbarSris', '컨트롤바 보임');
			    }else{
				    //console.log('fncActiveControlbarSris', '컨트롤바 숨김');
			    }
			}
			function fncKeepPlayingSris(sec){
				//console.log('fncKeepPlayingSris', '시청보고 5초마다 / 현재시간 : '+sec);
				
				if(firstVdoHits){
					//조회수	증가
					$.ajax({
						type: 'POST',
						url: '/tv/series/updateVdoHits',
						async: false,
						dataType: 'json',
						data : {
							vdId : nowVdId //영상ID
						},
						success: function(data) {
							//console.log(data.actGubun);
						},
						error: function(request,status,error) {
							ui.alert("오류가 발생되었습니다. 다시 시도하여 주십시오.");
						}
					});
					
					firstVdoHits = false;
				}
				
				var mbrNo = "0";
				if (mbrNo != "0") {
					//시청이력 저장
				  	petTvViewHist(nowVdId, mbrNo, Math.floor(sec), 0);
				}
			}
			function fncNextVideoSris(){
				
		    	if(sesnYn == "Y"){
			    	nowVdId = nextSesnVdId;
			    }else{
			    	nowVdId = nextSrisVdId;
			    }
			    
		    	fncVideoEvent();
			}
			function fncPrevVideoSris(){
				
		    	if(sesnYn == "Y"){
			    	nowVdId = prevSesnVdId;
			    }else{
			    	nowVdId = prevSrisVdId;
			    }
			    
		    	fncVideoEvent();
			}
			function fncFullscreenSris(state){
				if(state==true) {
			       
			    }else{
			        //console.log('fncFullscreenSris', '풀스크린 해제');
			        clearTimer();
			    }
			}
			<!-- //시리즈 영상 플레이어 이벤트 -->
			
			//추천 영상 목록 정보 셋팅
			function fncAdviceVdoList(data){
				var adviceVdoList = data.adviceVdoList; //시리즈 영상 목록
				
				var prevAdviceNum = -1; //이전 영상순번
				var nextAdviceNum = 0; //다음 영상순번
				
				var html = "";
				if(adviceVdoList != null && adviceVdoList.length > 0){
					for(var i=0; i<adviceVdoList.length; i++){
						var adSrisThumBgUrl = "";
						if(adviceVdoList[i].srisPrflImgPath != null && adviceVdoList[i].srisPrflImgPath !== undefined){
							if(adviceVdoList[i].srisPrflImgPath.indexOf('cdn.ntruss.com') != -1){
								adSrisThumBgUrl = adviceVdoList[i].srisPrflImgPath;
							}else{
								adSrisThumBgUrl = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images"+ adviceVdoList[i].srisPrflImgPath +"?type=m&w=130&h=73&quality=95&bgcolor=FFFFFF&extopt=3";
							}
						}
						
						html += '<div class="swiper-slide addTit">';
						html += '    <div class="channel-info  k0420" onclick="fncGoSrisList(\''+ adviceVdoList[i].srisNo +'\');" style="cursor:pointer;"><!-- 04.20 : 수정 -->';
						html += '        <div class="round-img-pf" style="background-image:url('+ adSrisThumBgUrl +');"></div>';
						html += '        <div class="ch-name">'+ adviceVdoList[i].srisNm +'</div>';
						html += '    </div>';
						html += '    <div class="channel thumb-info">';
						html += '        <div class="profile" style="background-image:url('+ adSrisThumBgUrl +');"></div>';
						html += '        <div class="info">';
						html += '            <div class="tit">'+ adviceVdoList[i].srisNm +'</div>';
						html += '        </div>';
						html += '    </div>';
						html += '    <div name="thumbBox_'+ adviceVdoList[i].vdId +'" class="thumb-box">';
						
						if(adviceVdoList[i].vdId == nowVdId){
							prevAdviceNum = i-1;
							nextAdviceNum = i+1;
						}
						
						if(adviceVdoList[i].newYn == "Y"){
							html += '    <i class="icon-n">N</i>';	
						}
						
						var adviceBgUrl = "";
						if(adviceVdoList[i].acPrflImgPath != null && adviceVdoList[i].acPrflImgPath !== undefined){
							if(adviceVdoList[i].acPrflImgPath.indexOf('cdn.ntruss.com') != -1){
								adviceBgUrl = adviceVdoList[i].acPrflImgPath;
							}else{
								adviceBgUrl = "https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images"+ adviceVdoList[i].acPrflImgPath +"?type=m&w=1440&h=810&quality=95&bgcolor=FFFFFF&extopt=3";
							}
						}
						//console.log("adviceVdoList[i].progressBar ::: "+adviceVdoList[i].progressBar);
						html += '        <a href="#" class="thumb-img" onclick="fncTvDetail(\''+ adviceVdoList[i].vdId +'\', \'A\'); return false;" style="background-image:url('+ adviceBgUrl +');" name="thumbImg_'+ adviceVdoList[i].vdId +'" data-content="'+ adviceVdoList[i].vdId +'" data-url="/tv/series/indexTvDetail?vdId='+ adviceVdoList[i].vdId +'&sortCd='+ sortCd +'&listGb='+ listGb +'">';
						html += '        	<div class="time-tag"><span>'+ adviceVdoList[i].acTotTimeStr +'</span></div>';
						if(Number(adviceVdoList[i].progressBar) > 9){
							html += '        	<div class="progress-bar" style="width:'+ adviceVdoList[i].progressBar +'%;"></div>';
						}
						html += '        </a>';
						html += '        <div class="thumb-info k0420"><!-- 04.20 : 수정 -->';
						html += '            <div class="info">';
						//html += '                <div class="tlt"><em>'+ (adviceVdoList[i].rate == "null" ? "0" : adviceVdoList[i].rate) +'%</em>'+ adviceVdoList[i].ttl +'</div>';
						html += '				 <div class="tlt">';
						html += '        		 	 <a href="#" onclick="fncTvDetail(\''+ adviceVdoList[i].vdId +'\', \'A\'); return false;" data-content="'+ adviceVdoList[i].vdId +'" data-url="/tv/series/indexTvDetail?vdId='+ adviceVdoList[i].vdId +'&sortCd='+ sortCd +'&listGb='+ listGb +'">';
						html +=					         adviceVdoList[i].ttl;
						html += '					 </a>'
						html += '				 </div>';
						html += '				 <div class="detail type-only">';
						
						//html += '    				 <span class="read play">'+ fnComma(adviceVdoList[i].hits) +'</span>';
						html += '    			 	 <span class="read like">'+ fnComma(adviceVdoList[i].likeCnt) +'</span>';
						html += '				 </div>';
						html += '            </div>';
						html += '        </div>';
						html += '    </div>';
						html += '</div>';
					}
				}
				
				$("#listAdvice").html(html);
				
				//scrollActive(nowVdId); //현재 재생영상 표시 및 스크롤 이동
				//스크롤 위치 처음으로 이동처리
				if("true" == "true"){ //PC
					$("#listAdvice").parent().animate({"scrollTop":"0px"}, 0);
				}else{
					$("#listAdvice").parent().animate({"scrollLeft":"0px"}, 0);
				}
				
				if(prevAdviceNum >= 0){
					prevAdviceVdId = adviceVdoList[prevAdviceNum].vdId;
				}
				
				if(nextAdviceNum < adviceVdoList.length){
					nextAdviceVdId = adviceVdoList[nextAdviceNum].vdId;
				}
				
				//console.log("prevAdviceVdId ::: >>> " + prevAdviceVdId);
				//console.log("nextAdviceVdId ::: >>> " + nextAdviceVdId);
				
				/*if(tabGb == "A"){
					fncAdviceVdoApi(); //플레이어 셋팅
				}*/
			}
			
			<!-- 추천 영상 플레이어 셋팅 -->
			<!-- 추천 영상 로직 변경으로 사용아함(추천 영상 영상 재생시 시리즈 영상 탭으로 이동 후 시리즈영상이 재생되면됨) -->
			<!-- //추천 영상 플레이어 이벤트 -->
			

			function fncVideoEvent(){
		    	history.pushState({vd_id : nowVdId}, "", "/tv/series/indexTvDetail?vdId="+ nowVdId +"&sortCd="+ sortCd +"&listGb="+ listGb);
		    	
		    	fncAutoFlag();
			}
			
			//영상 상세화면
			function fncTvDetail(vdId, gb){
				tabGb = gb; //현재 재생되는 영상의 탭 구분(S:시리즈 영상, A:추천 영상)
				
				nowVdId = vdId;
				
				fncVideoEvent();
			}
			
			//좋아요 저장/해제
			function fncLike(obj){
				var mbrNo = "0";
				if (mbrNo != "0") {
					petTvLikeDibs(obj, nowVdId, mbrNo, "10"); //10:좋아요, 20:찜
				}else{
					ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?',{
					    ycb:function(){ // 확인 버튼 클릭
					        // 로그인 페이지로 이동 (로그인 후 returnUrl로 이동);
					    	var url = "/tv/series/indexTvDetail" + encodeURIComponent("?vdId=" + nowVdId + "&sortCd=" + sortCd + "&listGb=" + listGb);
					    	if("false" == "true"){ //APP
					    		fncAppCloseMoveLogin(url);
					    	}else{
					    		location.href = "/indexLogin?returnUrl="+url;
					    		//storageHist.goBack("/indexLogin?returnUrl="+url);
					    	}
					    },
					    ncb:function(){ // 취소 버튼 클릭
					    	
					    },
					    ybt:'로그인',
					    nbt:'취소'
					});
				}
			}
			
			//찜 저장/해제
			function fncBookmark(obj){
				var mbrNo = "0";
				if (mbrNo != "0") {
					if("false" == "true"){
						petTvLikeDibs(obj, nowVdId, mbrNo, "20", "Y"); //10:좋아요, 20:찜
					}else{
						petTvLikeDibs(obj, nowVdId, mbrNo, "20", "N"); //10:좋아요, 20:찜
					}
				}else{
					ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?',{
					    ycb:function(){ // 확인 버튼 클릭
					        // 로그인 페이지로 이동 (로그인 후 returnUrl로 이동);
					    	var url = "/tv/series/indexTvDetail" + encodeURIComponent("?vdId=" + nowVdId + "&sortCd=" + sortCd + "&listGb=" + listGb);
					    	if("false" == "true"){ //APP
					    		fncAppCloseMoveLogin(url);
					    	}else{
					    		location.href = "/indexLogin?returnUrl="+url;
					    		//storageHist.goBack("/indexLogin?returnUrl="+url);
					    	}
					    },
					    ncb:function(){ // 취소 버튼 클릭
					    	
					    },
					    ybt:'로그인',
					    nbt:'취소'
					});
				}
			}
			
			//App일때 '마이 찜' 화면으로 화면 닫고 이동해야해서 추가된 함수
			function fncAppCloseMoveZzim(){
				var callParam = "";
				if(sortCd != ""){
					callParam = nowVdId+"."+sortCd+"."+listGb;
				}else{
					callParam = nowVdId+"."+listGb;
				}
				
				// 데이터 세팅
				toNativeData.func = "onCloseMovePage";
				toNativeData.moveUrl = "https://aboutpet.co.kr/mypage/tv/myWishList?callParam="+callParam;
				// APP 호출
				toNative(toNativeData);
			}
			
			//App일때 로그인 화면으로 화면 닫고 이동해야해서 추가된 함수
			function fncAppCloseMoveLogin(url){
				// 데이터 세팅
				toNativeData.func = "onCloseMovePage";
				toNativeData.moveUrl = "https://aboutpet.co.kr/indexLogin?returnUrl="+url;
				// APP 호출
				toNative(toNativeData);
			}
			
			//공유하기
			function fncVdoShare(id, gb) {
				petTvShare(id, nowVdId, '30');
				
				if(gb == "app"){
					// 데이터 세팅
					toNativeData.func = "onShare";
					toNativeData.image = $("#appImage").val();
					toNativeData.subject = $("#appSubject").val();
					toNativeData.link = $("#appLink").val();
					// 호출
					toNative(toNativeData);
				}
			}
			
			//펫TV 메인, 시리즈목록, 영상목록, 최근 시청한 영상으로 이동
			function fncToMove(flag){
				//pc, mw일때 이전페이지로 이동되어야함.
				if(flag == "web"){
					storageHist.goBack();
				}
				//App일때 PIP 모드 실행되야함.
				else if(flag == "app"){
					fncAppClassHide("N");
					
					// 데이터 세팅
					toNativeData.func = "onShowPIP";
					toNativeData.callback = "fncClosePIP";
					if("false" == "true"){
						if (window.matchMedia('(orientation: portrait)').matches) {
							var pipWidth = 190;
							var pipHeight = 106;
							var screenWidth = Math.floor(window.innerWidth*0.6);
							
							var reSizeWidth = screenWidth;
							var reSizeHeight = Math.floor(pipHeight * (screenWidth / pipWidth));
							
							toNativeData.width = reSizeWidth;
							toNativeData.height = reSizeHeight;
						}else{
							var pipWidth = 190;
							var pipHeight = 106;
							var screenWidth = Math.floor(window.innerHeight*0.6);
							
							var reSizeWidth = screenWidth;
							var reSizeHeight = Math.floor(pipHeight * (screenWidth / pipWidth));
							
							toNativeData.width = reSizeWidth;
							toNativeData.height = reSizeHeight;
						}
					}else{
						toNativeData.width = "";
						toNativeData.height = "";
					}
					// APP 호출
					toNative(toNativeData);
				}
				//APP이지만 PIP모드 실행불가일때 페이지 닫기
				//onNewPage를 통해서 연 화면만 닫을수 있음, 영상 상세는 onNewPage를 통해서 열기때문에 호출
				else if(flag == "no_pip"){
					// 데이터 세팅
					toNativeData.func = "onClose";
					// APP 호출
					toNative(toNativeData);
				}
			}
			
			// 하단바 댓글 버튼 클릭 시 댓글 등록 textarea focus (PC)
			function fncAplyContentFocus() {
				$("#aplyContent").focus();
			}
			
			// 하단바 댓글 버튼 클릭 시 댓글 layer open (MO, APP)
			function fncAplyLayerOpen() {
				$("#mobileAppScrollArea").scrollTop(0);
				selectTvDetailReplyList('Y', nowVdId); // 댓글 정보
				ui.commentBox.open(".tvcommentBox");
				ui.lock.using(true); //댓글 레이어 오픈 시 body 스크롤 lock
			}
			
			//App에서 PIP 해제시 호출, 미노출부분 노출처리
			function fncClosePIP(){
				fncAppClassHide("Y");
			}
			
			//App에서 PIP 호출시 영상영역을 제외한 나머지 미노출 처리
			function fncAppClassHide(flag){
				if(flag == "Y"){
					boolPipNo = true;
					
					$(".top-area").show(); //제목 영역
					$(".tab-area").show(); //탭 영역(시리즈 영상목록, 추천 영상)
					$(".tabWrap").show(); //탭 영역
					$(".div-right").show(); //영상정보 영역
					$("#video_detail").show(); //영상상세정보 영역
					$(".bottom-bar").show(); //하단바 영역
					$(".pop-relation-box").show(); //mo일때 연관상품 영역
					$(".type01").show(); //댓글 영역
					
					//App PIP 해제
					$("#wrap").removeAttr("style");
					//$(".videoAndListWrap").removeAttr("style");
					//$(".video-area").removeAttr("style");
					//$(".video-palyer").removeAttr("style");
					$("#player").removeAttr("style");
					
					$("body, html").css("overflow-y", "");
					//$(".inr").css("overflow-y", "");
					
					//console.log("fncAppClassHide");
					clearTimer();
					
					scrollActive(nowVdId);
				}else{
					boolPipNo = false;
					
					$(".top-area").hide(); //제목 영역
					$(".tab-area").hide(); //탭 영역(시리즈 영상목록, 추천 영상)
					$(".tabWrap").hide(); //탭 영역
					$(".div-right").hide(); //영상정보 영역
					$("#video_detail").hide(); //영상상세정보 영역
					$(".bottom-bar").hide(); //하단바 영역
					$(".pop-relation-box").hide(); //mo일때 연관상품 영역
					$(".type01").hide(); //댓글 영역
					
					//App PIP 실행
					$("#wrap").css("min-width", "0px");
					//$(".videoAndListWrap").css("height", "auto");
					//$(".video-area").css("height", "auto");
					//$(".video-palyer").css("padding-bottom", "0");
					$("#player").css("position", "inherit");
					if("false" == "true"){
						if (window.matchMedia('(orientation: portrait)').matches) {
							var pipWidth = 190;
							var pipHeight = 106;
							var screenWidth = Math.floor(window.innerWidth*0.6);
							
							var reSizeWidth = screenWidth;
							var reSizeHeight = Math.floor(pipHeight * (screenWidth / pipWidth));
						}else{
							var pipWidth = 190;
							var pipHeight = 106;
							var screenWidth = Math.floor(window.innerHeight*0.6);
							
							var reSizeWidth = screenWidth;
							var reSizeHeight = Math.floor(pipHeight * (screenWidth / pipWidth));
						}
						
						$("#player").css("width", reSizeWidth);
						$("#player").css("height", reSizeHeight);
					}else{
						$("#player").css("width", "100%");
						$("#player").css("height", "100%");
					}
					
					$("body, html").css("overflow-y", "hidden");
					//$(".inr").css("overflow-y", "hidden");
				}
			}
			
			//이미지 base64 변환
			function imgToBase64ByFileReader(url){
				var width = 130;
				var height = 73;
				
				return new Promise((resolve, reject) => {
					var image = new Image()
					image.crossOrigin="*";
					image.onload = () => {
				    	var w = image.naturalWidth > width ? width : image.naturalWidth;
				    	var h = image.naturalHeight > height ? height : image.naturalHeight;
				    	
				    	var canvas = document.createElement('canvas');
				      	canvas.width = w;
				      	canvas.height = h;
				      	canvas.getContext('2d').drawImage(image, 0, 0, w, h);
				      	
				      	var uri = canvas.toDataURL();
				      	resolve(uri);
					}
					
					image.src = url;
				});
			}
			
			//시리즈목록 이동
			function fncGoSrisList(srisNo){
				if("false" == "true"){
					var callParam = "";
					if(sortCd != ""){
						callParam = nowVdId+"."+sortCd+"."+listGb;
					}else{
						callParam = nowVdId+"."+listGb;
					}
					
					// 데이터 세팅
					toNativeData.func = "onCloseMovePage";
					toNativeData.moveUrl = "https://aboutpet.co.kr/tv/series/petTvSeriesList?srisNo="+ srisNo +"&sesnNo=1&callParam="+callParam;
					// APP 호출
					toNative(toNativeData);
				}else{
					location.href="/tv/series/petTvSeriesList?srisNo="+ srisNo +"&sesnNo=1";
					//storageHist.goBack("/tv/series/petTvSeriesList?srisNo="+ srisNo +"&sesnNo=1");
				}
			}
			
			//태그목록 이동
			function fncGoTagList(tagNo){
				if("false" == "true"){
					var callParam = "";
					if(sortCd != ""){
						callParam = nowVdId+"."+sortCd+"."+listGb;
					}else{
						callParam = nowVdId+"."+listGb;
					}
					
					// 데이터 세팅
					toNativeData.func = "onCloseMovePage";
					toNativeData.moveUrl = "https://aboutpet.co.kr/tv/collectTags?tagNo="+tagNo+"&callParam="+callParam;
					// APP 호출
					toNative(toNativeData);
				}else{
					location.href="/tv/collectTags?tagNo="+tagNo;
					//storageHist.goBack("/tv/collectTags?tagNo="+tagNo);
				}
			}
			
			//탭 클릭
			function fncClickTab(obj){
				ui.tab2(obj);
			}
			
			//타이머셋팅
			function setTimer(){
				if(seconds > 0){
					//console.log("seconds ::: " + seconds);
					seconds--;
					myTimer = setTimeout("setTimer()", 1000);
				}else{
					seconds = 5;
					$("#hideAfter3Sec").addClass("off");
				}
			}
			
			//타이머초기화
			function clearTimer(){
				if("false" == "true"){
					if($("#hideAfter3Sec").hasClass("off")){
						//console.log("숨겨져있어");
						$("#hideAfter3Sec").removeClass("off");
						clearTimeout(myTimer);
						setTimer();
					}else{
						//console.log("보이고있어");
						clearTimeout(myTimer);
						seconds = 5;
						setTimer();
					}
            	}
			}
			
			//쿠기 저장
			function setCookie( name, value, expirehours ) {
				var todayDate = new Date();
				todayDate.setHours( todayDate.getHours() + expirehours );
				document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
			}
		</script>
</head>


<% int mem_code=0;
if(session.getAttribute("num")!=null){
	mem_code=(int)session.getAttribute("num");
}
%>
<c:set var="mem_code" value="<%=mem_code%>"></c:set>
<c:if test='${ mem_code eq 0 }'>
	<c:import url="header.jsp" />
</c:if>
<c:if test='${ mem_code ne 0 }'>
	<c:import url="loginheader.jsp" />
</c:if>




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
		
		setCartCnt();
		
		
		// 검색창 문구
		getSearchInputAutoComplete();
		
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
	
	// 하루동안 열지않기
	function todaycloseWin(pNo) {
		setCookie("#popDispClsfNo"+pNo, "done" , 24 );
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
		search_data.search_term = searchWord;
		sendGtag('search');
		// 마지막 검색 페이지 진입 url 저장
		var lastUrl = window.location.href;
		if(lastUrl.indexOf("commonSearch") == -1){
			$.cookie("searchLastUrl", lastUrl, {path:'/'});
			$.cookie("searchLastFocus", "20", {path:'/'});
			location.href = "/commonSearch?focus=20"+((searchWord.trim() == "")? "":"&srchWord="+encodeURIComponent(searchWord.trim()))+"&cateCdL="+srchShopDispClsfNo;
		}else{
			var searchLastFocus = $.cookie("searchLastFocus");
			location.href = "/commonSearch?"+((searchLastFocus == "" || searchLastFocus == undefined )?"":"focus="+searchLastFocus)+((searchWord.trim() == "")? "":"&srchWord="+encodeURIComponent(searchWord.trim()))+"&cateCdL="+srchShopDispClsfNo;
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
			mbrNo = "C15992D7CD8BC0C31C4A04B025DDF693";
			if("" != "0"){
				mbrNo = "0";
			}
			
			// 요청구분
			section = "20";
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
		hiddenField.setAttribute("value", '');
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
		var url = "/tv/series/indexTvDetail";
		if("/tv/series/indexTvDetail" == "/event/indexSpecialExhibitionZone"){
			url = "/shop/home";
		}
		
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', 'lnbDispClsfNo');
		hiddenField.setAttribute('value', lnbDispClsfNo);
		form.appendChild(hiddenField);
		
		if("/tv/series/indexTvDetail" == "/shop/indexCategory"||
			"/tv/series/indexTvDetail" == "/event/indexExhibitionZone") {
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "cateCdL");
			hiddenField.setAttribute("value", cateCdL);	// 12564
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if("/tv/series/indexTvDetail" == "/shop/indexNewCategory" ||
				 "/tv/series/indexTvDetail" == "/shop/indexBestGoodsList") {
			var dispCornType = $("input[id^=dispCornType_]").val();
			form.setAttribute("method", "GET");
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "dispCornType");
			hiddenField.setAttribute("value", dispCornType);
			form.appendChild(hiddenField);
			document.body.appendChild(form);
		}else if("/tv/series/indexTvDetail" == "/pet/event/petshopEventList" ||
			"/tv/series/indexTvDetail" == "/shop/indexLive" ){				
			form.setAttribute("method", "GET");
		}else if("/tv/series/indexTvDetail" == "/event/shop/main"){
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
	
	function getSearchInputAutoComplete() { 
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
	}
	
	function clickLogin(){
		location.href = "/indexLogin?returnUrl="+location.pathname+location.search;
	}
	
	
	//장바구니 수 set, 캐시 이슈로 ajax 호출
	function setCartCnt(){
		$.ajax({
			url : "/order/getCartCnt"
			, dataType : "json"
			, type : "POST"
			, success : function(data){
				var $cartCntObj = $('.header .menu .cart').find('em');
				if($cartCntObj.length == 0){
					if(data.cartCnt != 0){
						var html = '<em class="n">'+data.cartCnt+'</em>';
						$('.header .menu .cart').html(html);
					}
				}else{
					if(data.cartCnt == 0){
						$cartCntObj.remove();
					}else{
						$cartCntObj.text(data.cartCnt);
					}
				}
			}
		});
	}

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
<!-- e : header 영역 -->
<!-- s : gnb 영역 -->
<script type="text/javascript">
function setCateList(dispClsfNo, upDispClsfNo) {
	var dispClsfNo2 ='';	
	if('12564' == upDispClsfNo ) {			// 강아지
		dispClsfNo2 = '300000173'
	} else if('12565' == upDispClsfNo ) {	// 고양이
		dispClsfNo2 = '300000174'
	} else if('14111' == upDispClsfNo ) {	// 관상어
		dispClsfNo2 = '300000175'
	} else if('14196' == upDispClsfNo ) {	// 소동물
		dispClsfNo2 = '300000176'
	}
	
	location.href = "/shop/indexCategory?dispClsfNo="+dispClsfNo+"&dispClsfNo2="+dispClsfNo2+"&cateCdL="+upDispClsfNo+"&cateCdM="+dispClsfNo;
}

function goIndexLoginSettings() {
	location.href = "/indexLoginSettings?returnUrl=" + window.location.pathname;
}

//시리즈 팝업
function seriesOpen(){
	var options = {
		url : "/tv/series/getSeriesList"
		, type : "POST"
		, dataType : "html"
		, data : { }
		, done : function(result){
			$("#gnbSrisListPopup").empty();
			$("#gnbSrisListPopup").html(result);
			ui.gnb.using("close"); //시리즈 목록 레이어 팝업 실행시 gnb메뉴(전체메뉴) 닫기
			ui.popLayer.open('popSeriesList');
		}
	};
	ajax.call(options);
}


function goMyPetLogGnb(){
	if( checkLoginGnb() && checkRegPetGnb() ){
		location.href = "https://aboutpet.co.kr/log/indexMyPetLog/?mbrNo=0";
	}
}


function checkLoginGnb(){
	if( "false" != "true" ){
		ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?',{ // 컨펌 창 옵션들
			ycb:function(){
				location.href = "https://aboutpet.co.kr/indexLogin";
			},
			ncb:function(){
				return false;
			},
			ybt:"로그인", // 기본값 "확인"
			nbt:"취소"  // 기본값 "취소"
		});
	}else{
		return true;
	}
}


function checkRegPetGnb(){	
	if( "" == null || "" == ""){
		ui.confirm('마이펫 등록 후 이용할 수 있어요<br/>펫정보를 등록할까요?',{ // 컨펌 창 옵션들
			ycb:function(){
				// 반려동물 등록 화면으로 이동.
				location.href = "https://aboutpet.co.kr/my/pet/petInsertView";
			},
			ncb:function(){
				//alert('취소');
				return false;
			},
			ybt:"예", // 기본값 "확인"
			nbt:"아니요"  // 기본값 "취소"
		});
	}else{
		return true;
	}
}

</script>
<nav class="gnb" id="gnb">
	<div class="inr">
		<div class="hdt">
			<div class="logo">aboutPet</div>
			<div class="bts"><button class="bt close">메뉴닫기</button></div>
		</div>
		<div class="cdt">
			<div class="menu">
				<ul class="list">
					<li class="tv active">
						<a class="bt" href="javascript:;">펫 TV</a>
						<div class="box">
							<ul class="sm">
								<li><a class="bt" href="/tv/petTvList?dispCornNo=567">신규영상</a></li>
								<li><a class="bt" href="/tv/petTvList?dispCornNo=568">인기영상</a></li>
								<li><a class="bt" href="/tv/petSchool">펫스쿨</a></li>
								<li><a class="bt" href="javascript:seriesOpen();">시리즈목록</a></li>
							</ul>
						</div>
					</li>
					<li class="log ">
						<a class="bt" href="javascript:;">펫로그</a>
						<div class="box">
							<ul class="sm">
								<li><a class="bt" href="javascript:goMyPetLogGnb();">MY 펫로그</a></li>
							</ul>
						</div>
					</li>
					<li class="shop ">
						<a class="bt" href="javascript:;">펫 샵</a>
					<div class="box">
							<div class="cate slideShop">
								<div class="swiper-container">
									<ul class="swiper-wrapper slide">
									<li class="swiper-slide active"><a data-ui-tab-btn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12564" href="javascript:;" class="bt">강아지</a></li>
												<li class="swiper-slide "><a data-ui-tab-btn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12565" href="javascript:;" class="bt">고양이</a></li>
												<li class="swiper-slide "><a data-ui-tab-btn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14111" href="javascript:;" class="bt">관상어</a></li>
												<li class="swiper-slide "><a data-ui-tab-btn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14196" href="javascript:;" class="bt">소동물</a></li>
												</ul>
								</div>
							</div>
							<div class="ctset active" data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12564">
									<ul class="sm">
								<li><a class="bt"  href="javascript:setCateList('12569', '12564');">사료</a></li>
								<li><a class="bt"  href="javascript:setCateList('12571', '12564');">간식</a></li>
								<li><a class="bt"  href="javascript:setCateList('12572', '12564');">건강관리</a></li>
								<li><a class="bt"  href="javascript:setCateList('12573', '12564');">장난감/훈련</a></li>
								<li><a class="bt"  href="javascript:setCateList('12575', '12564');">위생/배변</a></li>
								<li><a class="bt"  href="javascript:setCateList('12576', '12564');">미용/목욕</a></li>
								<li><a class="bt"  href="javascript:setCateList('12577', '12564');">급식/급수기</a></li>
								<li><a class="bt"  href="javascript:setCateList('12578', '12564');">하우스</a></li>
								<li><a class="bt"  href="javascript:setCateList('12579', '12564');">패션/의류</a></li>
								<li><a class="bt"  href="javascript:setCateList('12581', '12564');">목줄/하네스</a></li>
								<li><a class="bt"  href="javascript:setCateList('13998', '12564');">이동장</a></li>
								<li><a class="bt"  href="javascript:setCateList('100000196', '12564');">반려인용품</a></li>
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12565">
									<ul class="sm">
								<li><a class="bt"  href="javascript:setCateList('12673', '12565');">사료</a></li>
								<li><a class="bt"  href="javascript:setCateList('12675', '12565');">간식</a></li>
								<li><a class="bt"  href="javascript:setCateList('12676', '12565');">모래</a></li>
								<li><a class="bt"  href="javascript:setCateList('12677', '12565');">건강관리</a></li>
								<li><a class="bt"  href="javascript:setCateList('12678', '12565');">장난감/캣닢</a></li>
								<li><a class="bt"  href="javascript:setCateList('12679', '12565');">화장실/위생</a></li>
								<li><a class="bt"  href="javascript:setCateList('12680', '12565');">급식/급수기</a></li>
								<li><a class="bt"  href="javascript:setCateList('12682', '12565');">미용/목욕</a></li>
								<li><a class="bt"  href="javascript:setCateList('12683', '12565');">스크래쳐/캣타워</a></li>
								<li><a class="bt"  href="javascript:setCateList('12684', '12565');">하우스</a></li>
								<li><a class="bt"  href="javascript:setCateList('12685', '12565');">패션/의류</a></li>
								<li><a class="bt"  href="javascript:setCateList('14005', '12565');">이동장</a></li>
								<li><a class="bt"  href="javascript:setCateList('14006', '12565');">목줄/하네스</a></li>
								<li><a class="bt"  href="javascript:setCateList('100000198', '12565');">반려인용품</a></li>
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14111">
									<ul class="sm">
								<li><a class="bt"  href="javascript:setCateList('14112', '14111');">사료</a></li>
								<li><a class="bt"  href="javascript:setCateList('14114', '14111');">어항</a></li>
								<li><a class="bt"  href="javascript:setCateList('14115', '14111');">모터</a></li>
								<li><a class="bt"  href="javascript:setCateList('14116', '14111');">에어용품</a></li>
								<li><a class="bt"  href="javascript:setCateList('14117', '14111');">여과용품</a></li>
								<li><a class="bt"  href="javascript:setCateList('14118', '14111');">바닥재</a></li>
								<li><a class="bt"  href="javascript:setCateList('14119', '14111');">장식</a></li>
								<li><a class="bt"  href="javascript:setCateList('14120', '14111');">조명</a></li>
								<li><a class="bt"  href="javascript:setCateList('14121', '14111');">컨디셔너</a></li>
								<li><a class="bt"  href="javascript:setCateList('14122', '14111');">히터</a></li>
								<li><a class="bt"  href="javascript:setCateList('14123', '14111');">기타용품</a></li>
								<li><a class="bt"  href="javascript:setCateList('14262', '14111');">수초</a></li>
								<li><a class="bt"  href="javascript:setCateList('100000199', '14111');">해수용품</a></li>
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14196">
									<ul class="sm">
								<li><a class="bt"  href="javascript:setCateList('14197', '14196');">햄스터/저빌/래트</a></li>
								<li><a class="bt"  href="javascript:setCateList('14198', '14196');">토끼/기니피그/친칠라/데구</a></li>
								<li><a class="bt"  href="javascript:setCateList('14199', '14196');">고슴도치</a></li>
								<li><a class="bt"  href="javascript:setCateList('14200', '14196');">새</a></li>
								<li><a class="bt"  href="javascript:setCateList('14201', '14196');">곤충</a></li>
								<li><a class="bt"  href="javascript:setCateList('14202', '14196');">파충류</a></li>
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12569">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12571">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12572">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12573">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12575">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12576">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12577">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12578">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12579">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12581">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_13998">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_100000196">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12673">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12675">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12676">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12677">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12678">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12679">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12680">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12682">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12683">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12684">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_12685">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14005">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14006">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_100000198">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14112">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14114">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14115">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14116">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14117">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14118">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14119">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14120">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14121">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14122">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14123">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14262">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_100000199">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14197">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14198">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14199">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14200">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14201">
									<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_14202">
									<ul class="sm">
								</ul>
							</div>
							<!-- 							<div class="ctset" data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_6"> -->
<!-- 								플레이스 -->
<!-- 							</div> -->
						</div>
					</li>
					<li class="my ">
						<a class="bt" href="javascript:;">MY</a>
						<div class="box">
							<div class="cate slideShop">
								<div class="swiper-container">
									<ul class="swiper-wrapper slide">
										<li class="swiper-slide active"><a data-ui-tab-btn="tab_my_cate" data-ui-tab-val="tab_my_cate_1" href="javascript:;" class="bt">내 활동</a></li>
										<li class="swiper-slide"><a data-ui-tab-btn="tab_my_cate" data-ui-tab-val="tab_my_cate_2" href="javascript:;" class="bt">내 쇼핑정보</a></li>
										<li class="swiper-slide"><a data-ui-tab-btn="tab_my_cate" data-ui-tab-val="tab_my_cate_3" href="javascript:;" class="bt">내 정보 관리</a></li>
									</ul>              
								</div>
							</div>
							<div class="ctset ctset1 active" data-ui-tab-ctn="tab_my_cate" data-ui-tab-val="tab_my_cate_1">
								<ul class="sm">
									<li><a class="bt" href="/my/pet/myPetListView" data-content="0" data-url="/my/pet/myPetListView">마이펫 관리</a></li>
									<li><a class="bt" href="/mypage/tv/myWishList">마이 찜리스트</a></li>
									<li><a class="bt" href="/tv/series/indexTvRecentVideo">최근 본 영상</a></li>
								</ul>
							</div>
							<div class="ctset ctset2" data-ui-tab-ctn="tab_my_cate" data-ui-tab-val="tab_my_cate_2">
								<ul class="sm">
									<li><a class="bt" href="/mypage/order/indexDeliveryList" data-url="/mypage/order/indexDeliveryList" data-content="0">주문/배송</a></li>
									<li><a class="bt" href="/customer/inquiry/inquiryView" data-url="/customer/inquiry/inquiryView" data-content="0">1:1 문의</a></li>
									<li><a class="bt" href="/mypage/order/indexClaimList" data-url="/mypage/order/indexClaimList" data-content="0">취소/반품/교환</a></li>
									<li><a class="bt" href="/mypage/goodsCommentList" data-url="/mypage/goodsCommentList" data-content="0">상품 후기</a></li>
									<li><a class="bt" href="/mypage/indexIoAlarmList" data-url="/mypage/indexIoAlarmList" data-content="0">재입고 알림</a></li>
									<li><a class="bt" href="/mypage/service/indexAddressList" data-url="/mypage/service/indexAddressList" data-content="0">배송지 관리</a></li>
									<li><a class="bt" href="/mypage/info/coupon" data-url="/mypage/info/coupon" data-content="0">내 쿠폰</a></li>
									<li><a class="bt" href="/mypage/order/indexBillingCardList" data-content="0">결제 카드관리</a></li>
								</ul>
							</div>
							<div class="ctset ctset3" data-ui-tab-ctn="tab_my_cate" data-ui-tab-val="tab_my_cate_3">
								<ul class="sm">
									<li><a class="bt" href="/mypage/info/indexPswdUpdate" data-content="0" data-url="/mypage/info/indexPswdUpdate" >비밀번호 설정</a></li>
									<li><a class="bt" href="/mypage/info/indexManageCheck" data-content="0" data-url="/mypage/info/indexManageCheck" >회원정보 수정</a></li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="link">
				<ul class="list">
					<li><a href="/mypage/service/coupon" data-content="0" data-url="/mypage/service/coupon" class="bt">쿠폰존</a></li>
					<li><a href="/event/main" data-content="0" data-url="/event/main" class="bt">이벤트</a></li>
					<li><a href="/customer/faq/faqList" class="bt">FAQ</a></li>
					<li><a href="/customer/notice/indexNoticeList" class="bt">공지사항</a></li>
					<li><a href="/customer/notice/indexNoticeList" class="bt">입점ㆍ제휴문의</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>








<div class="layers tv seriesHome" id="gnbSrisListPopup"></div>
<!-- e : gnb 영역 -->			
<!-- s : LNB 영역 -->
<!-- e : LNB 영역 -->
<!-- s : 검색 영역 -->
<!-- e : 검색 영역 -->
				
<!-- s : 본문영역 -->			
		<input type="hidden" id="appImage" value=""/>
		<input type="hidden" id="appSubject" value=""/>
		<input type="hidden" id="appLink" value=""/>
		
		<!-- content 내용 부분입니다.	-->	
		<!-- 필요에 따라 로케이션 추가 : jsp:include page="/WEB-INF/tiles/b2c/include/location.jsp" -->
		
		<main class="container page tv detail" id="container">
            <div class="inr" id="hideAfter3Sec">
            	<div class="off-ly">
	            	<!-- 본문 -->
					<div class="contents" id="contents">
						<!-- PC 타이틀 영역 -->
						<!-- top-area -->
						<div class="top-area">
	                        <div class="div-flex">
	                            <p id="video_title">${pvdto.v_name}</p>
	                            <button class="btn-close app" id="btnClose" onclick="fncToMove('web');"><span>닫기</span></button>
									</div>
	                        <div class="thumb-info">
	                            <div id="sris_thum" class="round-img-pf" style="cursor: pointer; background-image: url(${pvdto.c_img});" onclick="fncGoSrisList('160')"></div>
	                            <div class="info">
	                                <div class="dash">
	                                    <span id="sris_name" class="name" style="cursor:pointer;" onclick="fncGoSrisList('160')">${pvdto.s_name}</span>
	                                    </div>
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <div class="videoAndListWrap">
	                        <!-- 동영상 영역 -->
	                        <div class="video-area">
	                            <div class="video-palyer">
	                                <div class="video" id="player">
	                                	<div id="sgrplayer_body_frame">
	                                	<div style="height: 450px; overflow: hidden;" id="div_sgrplayer_ym43zjn5c2e">
	                                	<div id="fullscrenn_target" style="height:100%">
	                                	<iframe id="sgrplayer_ym43zjn5c2e" name="sgrplayer_ifr" src=" ${pvdto.v_video} " frameborder="0" width="100%" height="100%" scrolling="no" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; fullscreen" allowfullscreen="">
	                                	</iframe>
	                                	<div id="sgrplayer_menu_body">
	                                	<div id="sgrplayer_menu"></div>
	                                	<div id="sgrplayer_menu2"></div>
	                                	</div>
	                                	</div>
	                                	</div>
	                                	</div>
	                                
	                                </div>
	                            </div>
	                        </div>
	                        <!-- //동영상 영역 -->
	                        
	                        <!-- 탭 wrap -->
	                        <div class="tab-area">
	                            <!-- tab wrap -->
	                            <div class="tabWrap">
	                                <!-- tap header -->
	                                <div class="head" style="padding:0 20px;">
	                                    <ul>
	                                        <li id="tab_sris" class="active" onclick="fncClickTab(this);"><span>시리즈 영상</span></li>
	                                        <li id="tab_tv" onclick="fncClickTab(this);"><span>추천 영상</span></li>
	                                    </ul>
	                                </div>
	                                <!-- //tab header -->
	                                <!-- tab content -->
	                                <div class="con">
	                                    <ul>
	                                    	<!-- 시리즈 영상(시즌) 영역 -->
	                                        <li>
	                                        	<!-- [시리즈명] 시즌명 -->
	                                            <div class="video-top" id="vdoTop">
	                                               	<p class="tit"><em id="video_list_title">[${pvdto.v_name}] 시즌${pvdto.s_season}</em></p>
	                                                <div class="paging" id="vdoTopPaging"> <!--  <strong>15</strong><em>/</em><span>15</span>  --> </div>
	                                            </div>
	                                            <!-- //[시리즈명] 시즌명 -->
	                                            <!-- 시리즈 영상(시즌) 목록 -->
	                                            <div class="tvSlid">
	                                                <div class="innerWrap" id="listSrisSesn">
	                                                
	                                                <c:forEach items="${ svlist }" var="svlist" varStatus="status"> 
	                                       			<div class="swiper-slide">
	                                                	<div class="channel thumb-info">    	
	                                                	<div class="profile" style="background-image:url(../../_images/tv/@temp01.jpg);"></div>    	
	                                                	<div class="info">        	
	                                                	<div class="tit">${svlist.v_name} </div>    	
	                                                	</div>	</div>	
	                                                	<div name="thumbBox_N2021062103300" class="thumb-box">    	
	                                                	<a href="video_detail.do?s_code=${svlist.s_code}&s_season=${svlist.s_season}&v_code=${svlist.v_code}" class="thumb-img" onclick="" style="background-image:url(${svlist.v_img});" name="thumbImg_N2021062103300" data-content="" data-url="">       	
	                                                	<div class="time-tag"><span>${svlist.v_time}</span></div></a>    	
	                                                	<div class="thumb-info">        	
	                                                	<div class="info">            	
	                                                	<div class="tlt">    				
	                                                	<a href="video_detail.do?s_code=${svlist.s_code}&s_season=${svlist.s_season}&v_code=${svlist.v_code}" onclick="" data-content="" data-url="">${svlist.v_name} </a></div>   
	                                                	<div class="detail">                	
	                                                	<span class="read like">${svlist.v_like}</span> </div> </div>  
	                                                	</div></div></div>
	                                               </c:forEach>   	
	                                                
	                                               		<div class="swiper-slide season">	
	                                               		<div class="thumb-box">    	
	                                               		<div class="div-respon">        	
	                                               		<a href="#" class="thumb-img" onclick="fncTvDetail('N2021071503358', 'S'); return false;" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021071503358/10/0ae5691f-b531-4bf6-b483-d88c13a7fd7b.jpg?type=m&amp;w=1440&amp;h=810&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);" data-content="N2021071503358" data-url="/tv/series/indexTvDetail?vdId=N2021071503358&amp;sortCd=&amp;listGb=HOME">            	
	                                               		<div class="season-list">                	
	                                               		<span>5</span> </div>        	</a>        	
	                                               		<div class="thumb-info">            	
	                                               		<div class="info">            		
	                                               		<div class="tlt">        				
	                                               		<a href="#" onclick="fncTvDetail('N2021071503358', 'S'); return false;" data-content="N2021071503358" data-url="/tv/series/indexTvDetail?vdId=N2021071503358&amp;sortCd=&amp;listGb=HOME">다른 시리즈	</a></div>            	
	                                               		</div></div></div></div></div></div>
	                                            </div>
	                                            <!-- //시리즈 영상(시즌) 목록 -->
	                                        </li>
	                                        <!-- //시리즈 영상(시즌) 영역 -->
	                                        
	                                        <!-- 추천 영상 영역 -->
	                                        <li class="k_overAuto_0420" style="width: 1220px;"><!-- 04.20 : 수정 -->
	                                        	<!-- 추천 영상 목록 -->
	                                            <div class="tvSlid"> 
	                                                <div class="innerWrap" id="listAdvice"><div class="swiper-slide addTit">    <div class="channel-info  k0420" onclick="fncGoSrisList('59');" style="cursor:pointer;"><!-- 04.20 : 수정 -->        <div class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/59/srisProfile/fa5de25b-073a-4691-bf22-b4fce664754b.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="ch-name">개놈프로젝트</div>    </div>    <div class="channel thumb-info">        <div class="profile" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/59/srisProfile/fa5de25b-073a-4691-bf22-b4fce664754b.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="info">            <div class="tit">개놈프로젝트</div>        </div>    </div>    <div name="thumbBox_N202104291208" class="thumb-box">        <a href="#" class="thumb-img" onclick="fncTvDetail('N202104291208', 'A'); return false;" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104081508020001200904859.jpg?type=m&amp;w=1440&amp;h=810&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);" name="thumbImg_N202104291208" data-content="N202104291208" data-url="/tv/series/indexTvDetail?vdId=N202104291208&amp;sortCd=&amp;listGb=HOME">        	<div class="time-tag"><span>04:35</span></div>        </a>        <div class="thumb-info k0420"><!-- 04.20 : 수정 -->            <div class="info">				 <div class="tlt">        		 	 <a href="#" onclick="fncTvDetail('N202104291208', 'A'); return false;" data-content="N202104291208" data-url="/tv/series/indexTvDetail?vdId=N202104291208&amp;sortCd=&amp;listGb=HOME">사람이 무서운 백구 해리					 </a>				 </div>				 <div class="detail type-only">    			 	 <span class="read like">0</span>				 </div>            </div>        </div>    </div></div><div class="swiper-slide addTit">    <div class="channel-info  k0420" onclick="fncGoSrisList('2');" style="cursor:pointer;"><!-- 04.20 : 수정 -->        <div class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/2/srisProfile/a0e33b22-8fef-4ef1-9ecc-19026b846db6.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="ch-name">구조해주세요 골든타임</div>    </div>    <div class="channel thumb-info">        <div class="profile" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/2/srisProfile/a0e33b22-8fef-4ef1-9ecc-19026b846db6.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="info">            <div class="tit">구조해주세요 골든타임</div>        </div>    </div>    <div name="thumbBox_N202104291350" class="thumb-box">        <a href="#" class="thumb-img" onclick="fncTvDetail('N202104291350', 'A'); return false;" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104081508080001200913062.jpg?type=m&amp;w=1440&amp;h=810&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);" name="thumbImg_N202104291350" data-content="N202104291350" data-url="/tv/series/indexTvDetail?vdId=N202104291350&amp;sortCd=&amp;listGb=HOME">        	<div class="time-tag"><span>03:57</span></div>        </a>        <div class="thumb-info k0420"><!-- 04.20 : 수정 -->            <div class="info">				 <div class="tlt">        		 	 <a href="#" onclick="fncTvDetail('N202104291350', 'A'); return false;" data-content="N202104291350" data-url="/tv/series/indexTvDetail?vdId=N202104291350&amp;sortCd=&amp;listGb=HOME">5cm로 세상을 만나는 아기고양이					 </a>				 </div>				 <div class="detail type-only">    			 	 <span class="read like">0</span>				 </div>            </div>        </div>    </div></div><div class="swiper-slide addTit">    <div class="channel-info  k0420" onclick="fncGoSrisList('17');" style="cursor:pointer;"><!-- 04.20 : 수정 -->        <div class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/17/srisProfile/8f26f299-e4b3-4e92-a728-0befc1220a8b.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="ch-name">니가 왜 거기서 살아?</div>    </div>    <div class="channel thumb-info">        <div class="profile" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/17/srisProfile/8f26f299-e4b3-4e92-a728-0befc1220a8b.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="info">            <div class="tit">니가 왜 거기서 살아?</div>        </div>    </div>    <div name="thumbBox_N202104291524" class="thumb-box">        <a href="#" class="thumb-img" onclick="fncTvDetail('N202104291524', 'A'); return false;" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104081508380001200913250.jpg?type=m&amp;w=1440&amp;h=810&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);" name="thumbImg_N202104291524" data-content="N202104291524" data-url="/tv/series/indexTvDetail?vdId=N202104291524&amp;sortCd=&amp;listGb=HOME">        	<div class="time-tag"><span>04:36</span></div>        </a>        <div class="thumb-info k0420"><!-- 04.20 : 수정 -->            <div class="info">				 <div class="tlt">        		 	 <a href="#" onclick="fncTvDetail('N202104291524', 'A'); return false;" data-content="N202104291524" data-url="/tv/series/indexTvDetail?vdId=N202104291524&amp;sortCd=&amp;listGb=HOME">하수구에 갇혔는데.. 너 왜 귀여워?					 </a>				 </div>				 <div class="detail type-only">    			 	 <span class="read like">1</span>				 </div>            </div>        </div>    </div></div><div class="swiper-slide addTit">    <div class="channel-info  k0420" onclick="fncGoSrisList('38');" style="cursor:pointer;"><!-- 04.20 : 수정 -->        <div class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/38/srisProfile/1ed588e6-65ff-444a-adbb-df4318b2d199.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="ch-name">동물원에서 생긴일</div>    </div>    <div class="channel thumb-info">        <div class="profile" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/38/srisProfile/1ed588e6-65ff-444a-adbb-df4318b2d199.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="info">            <div class="tit">동물원에서 생긴일</div>        </div>    </div>    <div name="thumbBox_N202104291549" class="thumb-box">        <a href="#" class="thumb-img" onclick="fncTvDetail('N202104291549', 'A'); return false;" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104081508240001200906875.jpg?type=m&amp;w=1440&amp;h=810&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);" name="thumbImg_N202104291549" data-content="N202104291549" data-url="/tv/series/indexTvDetail?vdId=N202104291549&amp;sortCd=&amp;listGb=HOME">        	<div class="time-tag"><span>00:29</span></div>        </a>        <div class="thumb-info k0420"><!-- 04.20 : 수정 -->            <div class="info">				 <div class="tlt">        		 	 <a href="#" onclick="fncTvDetail('N202104291549', 'A'); return false;" data-content="N202104291549" data-url="/tv/series/indexTvDetail?vdId=N202104291549&amp;sortCd=&amp;listGb=HOME">막 태어난 아기 사자의 매력					 </a>				 </div>				 <div class="detail type-only">    			 	 <span class="read like">0</span>				 </div>            </div>        </div>    </div></div><div class="swiper-slide addTit">    <div class="channel-info  k0420" onclick="fncGoSrisList('38');" style="cursor:pointer;"><!-- 04.20 : 수정 -->        <div class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/38/srisProfile/1ed588e6-65ff-444a-adbb-df4318b2d199.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="ch-name">동물원에서 생긴일</div>    </div>    <div class="channel thumb-info">        <div class="profile" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/38/srisProfile/1ed588e6-65ff-444a-adbb-df4318b2d199.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="info">            <div class="tit">동물원에서 생긴일</div>        </div>    </div>    <div name="thumbBox_N202104291555" class="thumb-box">        <a href="#" class="thumb-img" onclick="fncTvDetail('N202104291555', 'A'); return false;" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104081508200001200909093.jpg?type=m&amp;w=1440&amp;h=810&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);" name="thumbImg_N202104291555" data-content="N202104291555" data-url="/tv/series/indexTvDetail?vdId=N202104291555&amp;sortCd=&amp;listGb=HOME">        	<div class="time-tag"><span>01:04</span></div>        </a>        <div class="thumb-info k0420"><!-- 04.20 : 수정 -->            <div class="info">				 <div class="tlt">        		 	 <a href="#" onclick="fncTvDetail('N202104291555', 'A'); return false;" data-content="N202104291555" data-url="/tv/series/indexTvDetail?vdId=N202104291555&amp;sortCd=&amp;listGb=HOME">불곰 더위 탈출 시원한 여름나기					 </a>				 </div>				 <div class="detail type-only">    			 	 <span class="read like">0</span>				 </div>            </div>        </div>    </div></div><div class="swiper-slide addTit">    <div class="channel-info  k0420" onclick="fncGoSrisList('38');" style="cursor:pointer;"><!-- 04.20 : 수정 -->        <div class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/38/srisProfile/1ed588e6-65ff-444a-adbb-df4318b2d199.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="ch-name">동물원에서 생긴일</div>    </div>    <div class="channel thumb-info">        <div class="profile" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/38/srisProfile/1ed588e6-65ff-444a-adbb-df4318b2d199.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="info">            <div class="tit">동물원에서 생긴일</div>        </div>    </div>    <div name="thumbBox_N202104291559" class="thumb-box">        <a href="#" class="thumb-img" onclick="fncTvDetail('N202104291559', 'A'); return false;" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104081507580001200913265.jpg?type=m&amp;w=1440&amp;h=810&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);" name="thumbImg_N202104291559" data-content="N202104291559" data-url="/tv/series/indexTvDetail?vdId=N202104291559&amp;sortCd=&amp;listGb=HOME">        	<div class="time-tag"><span>03:08</span></div>        </a>        <div class="thumb-info k0420"><!-- 04.20 : 수정 -->            <div class="info">				 <div class="tlt">        		 	 <a href="#" onclick="fncTvDetail('N202104291559', 'A'); return false;" data-content="N202104291559" data-url="/tv/series/indexTvDetail?vdId=N202104291559&amp;sortCd=&amp;listGb=HOME">한창 호기심 천국인 아기 불곰 4남매!					 </a>				 </div>				 <div class="detail type-only">    			 	 <span class="read like">0</span>				 </div>            </div>        </div>    </div></div><div class="swiper-slide addTit">    <div class="channel-info  k0420" onclick="fncGoSrisList('68');" style="cursor:pointer;"><!-- 04.20 : 수정 -->        <div class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/68/srisProfile/7f1104c3-ce67-444f-a4ec-37a93afabcc1.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="ch-name">솟아라 호랑이 기운</div>    </div>    <div class="channel thumb-info">        <div class="profile" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/68/srisProfile/7f1104c3-ce67-444f-a4ec-37a93afabcc1.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="info">            <div class="tit">솟아라 호랑이 기운</div>        </div>    </div>    <div name="thumbBox_N202104291846" class="thumb-box">        <a href="#" class="thumb-img" onclick="fncTvDetail('N202104291846', 'A'); return false;" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104081506540001200900421.jpg?type=m&amp;w=1440&amp;h=810&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);" name="thumbImg_N202104291846" data-content="N202104291846" data-url="/tv/series/indexTvDetail?vdId=N202104291846&amp;sortCd=&amp;listGb=HOME">        	<div class="time-tag"><span>01:40</span></div>        </a>        <div class="thumb-info k0420"><!-- 04.20 : 수정 -->            <div class="info">				 <div class="tlt">        		 	 <a href="#" onclick="fncTvDetail('N202104291846', 'A'); return false;" data-content="N202104291846" data-url="/tv/series/indexTvDetail?vdId=N202104291846&amp;sortCd=&amp;listGb=HOME">프로 잠수 선수 백호 오딘의 수중 속 먹방					 </a>				 </div>				 <div class="detail type-only">    			 	 <span class="read like">0</span>				 </div>            </div>        </div>    </div></div><div class="swiper-slide addTit">    <div class="channel-info  k0420" onclick="fncGoSrisList('68');" style="cursor:pointer;"><!-- 04.20 : 수정 -->        <div class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/68/srisProfile/7f1104c3-ce67-444f-a4ec-37a93afabcc1.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="ch-name">솟아라 호랑이 기운</div>    </div>    <div class="channel thumb-info">        <div class="profile" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/68/srisProfile/7f1104c3-ce67-444f-a4ec-37a93afabcc1.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="info">            <div class="tit">솟아라 호랑이 기운</div>        </div>    </div>    <div name="thumbBox_N202104291847" class="thumb-box">        <a href="#" class="thumb-img" onclick="fncTvDetail('N202104291847', 'A'); return false;" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104081508360001200914484.jpg?type=m&amp;w=1440&amp;h=810&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);" name="thumbImg_N202104291847" data-content="N202104291847" data-url="/tv/series/indexTvDetail?vdId=N202104291847&amp;sortCd=&amp;listGb=HOME">        	<div class="time-tag"><span>04:49</span></div>        </a>        <div class="thumb-info k0420"><!-- 04.20 : 수정 -->            <div class="info">				 <div class="tlt">        		 	 <a href="#" onclick="fncTvDetail('N202104291847', 'A'); return false;" data-content="N202104291847" data-url="/tv/series/indexTvDetail?vdId=N202104291847&amp;sortCd=&amp;listGb=HOME">아기 백호 3남매의 무림 적응기 					 </a>				 </div>				 <div class="detail type-only">    			 	 <span class="read like">0</span>				 </div>            </div>        </div>    </div></div><div class="swiper-slide addTit">    <div class="channel-info  k0420" onclick="fncGoSrisList('72');" style="cursor:pointer;"><!-- 04.20 : 수정 -->        <div class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/72/srisProfile/776db73c-e2c3-4f52-a40f-fbb2ab1a3c0b.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="ch-name">아기와나</div>    </div>    <div class="channel thumb-info">        <div class="profile" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/72/srisProfile/776db73c-e2c3-4f52-a40f-fbb2ab1a3c0b.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="info">            <div class="tit">아기와나</div>        </div>    </div>    <div name="thumbBox_N202104291875" class="thumb-box">        <a href="#" class="thumb-img" onclick="fncTvDetail('N202104291875', 'A'); return false;" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104191158360001200902296.jpg?type=m&amp;w=1440&amp;h=810&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);" name="thumbImg_N202104291875" data-content="N202104291875" data-url="/tv/series/indexTvDetail?vdId=N202104291875&amp;sortCd=&amp;listGb=HOME">        	<div class="time-tag"><span>01:42</span></div>        </a>        <div class="thumb-info k0420"><!-- 04.20 : 수정 -->            <div class="info">				 <div class="tlt">        		 	 <a href="#" onclick="fncTvDetail('N202104291875', 'A'); return false;" data-content="N202104291875" data-url="/tv/series/indexTvDetail?vdId=N202104291875&amp;sortCd=&amp;listGb=HOME">똥꼬발랄 장군이와 아기돼지 난이의 좌충우돌 여름이야기 EP1					 </a>				 </div>				 <div class="detail type-only">    			 	 <span class="read like">0</span>				 </div>            </div>        </div>    </div></div><div class="swiper-slide addTit">    <div class="channel-info  k0420" onclick="fncGoSrisList('34');" style="cursor:pointer;"><!-- 04.20 : 수정 -->        <div class="round-img-pf" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/34/srisProfile/bc89bc3e-e6b5-4cde-971f-5a4d96765fdf.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="ch-name">폭군 길들이기</div>    </div>    <div class="channel thumb-info">        <div class="profile" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/series/34/srisProfile/bc89bc3e-e6b5-4cde-971f-5a4d96765fdf.jpg?type=m&amp;w=130&amp;h=73&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);"></div>        <div class="info">            <div class="tit">폭군 길들이기</div>        </div>    </div>    <div name="thumbBox_N202104292107" class="thumb-box">        <a href="#" class="thumb-img" onclick="fncTvDetail('N202104292107', 'A'); return false;" style="background-image:url(https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N20210428/202104081508360001200914015.jpg?type=m&amp;w=1440&amp;h=810&amp;quality=95&amp;bgcolor=FFFFFF&amp;extopt=3);" name="thumbImg_N202104292107" data-content="N202104292107" data-url="/tv/series/indexTvDetail?vdId=N202104292107&amp;sortCd=&amp;listGb=HOME">        	<div class="time-tag"><span>04:54</span></div>        </a>        <div class="thumb-info k0420"><!-- 04.20 : 수정 -->            <div class="info">				 <div class="tlt">        		 	 <a href="#" onclick="fncTvDetail('N202104292107', 'A'); return false;" data-content="N202104292107" data-url="/tv/series/indexTvDetail?vdId=N202104292107&amp;sortCd=&amp;listGb=HOME">사육사 엄마 멘붕.. 불한당 라쿤 4남매					 </a>				 </div>				 <div class="detail type-only">    			 	 <span class="read like">1</span>				 </div>            </div>        </div>    </div></div></div>
	                                            </div>
	                                            <!-- //추천 영상 목록 -->
	                                        </li>
	                                        <!-- //추천 영상 영역 -->
	                                    </ul>
	                                </div>
	                                <!-- //tab content -->
	                            </div>
	                            <!-- // tab wrap -->
	                        </div>
	                        <!-- tab-area -->
	                        
	                        <!-- 영상정보 레이아웃 -->
	                        <div class="div-right">
	                            <button class="btn-video-layer">영상정보</button> <!-- 버튼 클릭시 on 클래스 추가 -->
	                        </div>
	                        <div class="tvVideoInfoBoth layer-detail">
	                        	<!-- 영상 상세정보 영역 -->
	                            <div id="video_detail">
	                            <div class="cont day">등록일 : ${pvdto.v_date}</div>
	                            <div class="cont">${pvdto.v_content}</div>
	                            <br>
	                            <br>
	                          <%--   <div class="cont tag"><span style="cursor:pointer;" onclick="">${pvdto.v_content}</span></div> --%>
	                            <div class="cont">	</div></div>
	                            <!-- //영상 상세정보 영역 -->
	                        </div>
	                            <!-- //영상 상세정보 영역 -->
	                        </div>
	                        <!-- // 영상정보 레이아웃 -->
	                    </div>
					</div><!-- contents -->
				</div><!-- off-ly -->
            </div><!-- inr -->
            
            <!-- 하단바(좋아요, 댓글, 공유, 북마크 레이어) -->
            <div class="bottom-bar">
                <div class="inner">
                    <ul class="bar-btn-area">
                    	<li class="like_li">
                            <button id="video_like" class="btn-like" onclick="fncLike(this);" data-content="" data-url="fncLike(this);"></button>
                        </li>
                        <li class="comment_li">
                            <button id="video_reply" class="btn-comment" onclick="fncAplyContentFocus();"
                             data-url="fncAplyContentFocus();" data-content=""></button>
                        </li>
                        <li class="share_li">
                        	<button class="btn-share" id="vdoClipboard" data-message="링크가 복사되었어요"  data-clipboard-text="" onclick="fncVdoShare(this.id, 'web');" data-content="" data-url="fncVdoShare(this.id, 'web');"><span>공유</span></button>
								</li>
                        <li class="bookmark_li">
                            <button id="video_mark" class="btn-bookmark" onclick="fncBookmark(this);" data-content="" data-url="fncBookmark(this);"><span>찜</span></button>
                        </li>
                    </ul>
                    <buttron class="tvConnectedTing" style="display:none;">연관상품</buttron>
                    <div class="btn-with-wrap" style="display:none;">
                        <button id="videoTing" class="btn-with-prd" data-content="" data-url="">
                            <strong id="goodsThums" style="background-image:url(../../_images/tv/@temp01.jpg);"></strong>
                        </button>
                        <span class="num" id="goodsNum">0</span>
                    </div>
                </div>
            </div>
            <!-- //하단바(좋아요, 댓글, 공유, 북마크 레이어) -->
            
            <!-- 연관상품 레이어-->
            <!-- // 연관상품 레이어-->
            
            <!-- 댓글 -->
           	<script type="text/javascript">
	//ipad check logic
	function ipadCheck(){
		const iPad = (navigator.userAgent.match(/(iPad)/) /* iOS pre 13 */ ||  (navigator.platform === 'MacIntel' && navigator.maxTouchPoints > 1) /* iPad OS 13 */);
		if(iPad){
			$.setCookie("DEVICE_GB", "MO" , 24 );
			window.location.reload();
		}
	}
		
	// scalable No
	$.scalableN = function(){
		var viewportmeta = document.querySelector('meta[name="viewport"]');
	    viewportmeta.content = 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no';
	}
		
	// scalable Yes
	$.scalableY = function(){
		var viewportmeta = document.querySelector('meta[name="viewport"]');
	    viewportmeta.content = 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no';
	}
	
	// 쿠키 세팅하기
	$.setCookie = function(name, value, expirehours ) {
		var todayDate = new Date();
		todayDate.setHours( todayDate.getHours() + expirehours );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	}
	
	// 쿠키 불러오기
	$.getCookie = function(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
	$(function(){
		if(document.cookie.indexOf("DEVICE_GB") == -1){
			ipadCheck();
		} else {
			if("MO" == $.getCookie("DEVICE_GB")){
				$.scalableN();
			} else {
				$.scalableY();
			}
		}
	});
</script><!-- MO scalable 스크립트 적용 -->
<script type="text/javascript">
	let dataMoreGb = false;
	let replyVdId = "";
	let replyAplySeq = 0;
	let sessionPrflImg = "";
	let pageMov = false;
	let resetPrflImg = true;
	let gb = "";
	let selectTagGb = false;
	
	// 댓글 리스트 조회
	function selectTvDetailReplyList(clear, vdId) {
		// 자동재생으로 페이지 이동 시
		if (replyVdId != vdId) {
			pageMov = true;
			fncReplyRptpPopClose("Y");
			$(".tv.detail .petTvReplyConfirm .btnCancel").trigger("click");
			if ($("#petTvReplyModifyAlert").css("display") == "block") {
				fncReplyModifyReset();
			}
			if ($("#petTvReplyTagArea").css("display") == "block") {
				$("#petTvReplyTagArea").hide();
				$("#tagListArea").html("");
			}
			if ($("#petTvReplyMentionArea").css("display") == "block") {
				$("#petTvReplyMentionArea").hide();
				$("#mentionListArea").html("");
			}
		}
		// 영상 ID 변경
		replyVdId = vdId;
		
		// 영상 상세 정보
		$("#indexTvDetailForm #vdId").val(replyVdId);
		$("#indexTvDetailForm #mbrNo").val("0");
		
		if (clear == 'N') {
	    	let page = $("#page").val()*1 + 1;
	    	$("#page").val(page);
		} else {
			$("#page").val(1);
			dataMoreGb = false;
		}
    	
    	let data = {
			vdId : replyVdId
    		, page : $("#page").val()
    	}
/*    	$.ajax({
			url : "/tv/reply/selectTvDetailReplyList"
			, type : "POST"
			, dataType : "json"
			, data : data
			, success : function(data) {
				fncReplyLoad(data, clear);
			}, error : function(request, status, error) {
				ui.alert("오류가 발생되었습니다. 다시 시도하여 주십시오.");
			}
		}); */
	}
	
	// 댓글 목록 호출
	function fncReplyLoad(data, clear) {
		// 댓글 입력 영역 프로필 이미지 수정
		if (resetPrflImg) {
			if ("0" != "0") {
				if (data.mbvo.prflImg == null || data.mbvo.prflImg == "") {
					sessionPrflImg = "";
					$("#aplyContsSpan").css("background-image", "");
				} else {
					sessionPrflImg = 'https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images'+ data.mbvo.prflImg +'?type=f&w=124&h=124&quality=90&align=4';
					$("#aplyContsSpan").css("background-image", "url("+sessionPrflImg+")");
				}
			} else {
				sessionPrflImg = "";
				$("#aplyContsSpan").css("background-image", "");
			}
		}
		resetPrflImg = true;
		
		let so = data.so;
		let paging = data.paging;
		let rplCnt = paging.totalRecord;
		$("#replyTotCnt").html("댓글 " + rplCnt + "개");
		$("#video_reply").html(rplCnt);
		fncReplyList(data, clear);
		
		if (data.paging.totalRecord > data.paging.rows) {
			dataMoreGb = true;
		}
		
		if(paging.page >= paging.totalRecord/paging.rows){
			dataMoreGb = false;
		}
		
		$("#page").val(data.page);
	}
	
	// 댓글 리스트 생성
	function fncReplyList(data, clear) {
		let replyList = data.replyList;
		let html = '';
		let tvDetailRplList = [];
		let dateStr = "";
		let aplyStr = "";
		let dateStrRpl = "";
		
		if (replyList.length == 0) {
			html += '<li class="nodata"><p class="txt">첫 번째 댓글을 작성해 보세요.</p></li>';
			$("#replyTotCnt").html("댓글 0개");
			$("#video_reply").html(fnComma(replyList.length));
		} else {
			for(let i=0; i<replyList.length; i++) {
				dateStr = elapsedTime(replyList[i].sysRegDtm);
				
				aplyStr = replyList[i].aply;
				aplyStr = aplyStr.replace(/#[^#\s'><&]+|@[^@\s~'><&]+/gm, function (tag){
					//return (tag.indexOf('#') == 0) ? '<a href="javascript:fncGetPetTvReplyTagNo(\'' + tag.replace('#','') + '\');" style="color:#669aff;">' + tag + '</a>' : '<span style="font-weight:bold;">' + tag + '</span>';
					return '<span style="font-weight:bold;">' + tag + '</span>';
				});
				
				html += '<li id="aply-' + replyList[i].aplySeq + '">';
				html += '<div class="pic"><img src="' + 'https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images'+ replyList[i].prflImg +'?type=f&w=124&h=124&quality=90&align=4' + '" onerror="this.src=\'../../_images/common/img-default-profile@2x.png\'" /></div>';
				html += '<div class="con">';
				html += '<div class="tit">' + replyList[i].nickNm + '</div>'; 
				html += '<div class="txt">' + aplyStr + '</div>';
				html += '<div id="modifyReplyData' + replyList[i].aplySeq + '" style="display:none;">' + replyList[i].aply + '</div>';
				html += '<div class="date">' + dateStr + '</div><div class="date" name="modifyDate" style="display:none;">수정 중···</div></div>';
				html += '<div class="menu dopMenuIcon" onClick="ui.popSel.open(this)">';
				html += '<div class="popSelect">';
				html += '<input type="text" class="popSelInput">';
				html += '<div class="popSelInnerWrap"><ul>';
				if (replyList[i].mbrNo == "0") {
					html += '<li><a class="bt" style="color: #000000;" href="javascript:fncUpdateReply(' + replyList[i].aplySeq + ');" data-url="/tv/reply/saveTvDetailReply" data-content=""><b class="t">수정</b></a></li>';
					html += '<li><a class="bt" style="color: #000000;" href="javascript:fncRemoveReply(' + replyList[i].aplySeq + ');" data-url="/tv/reply/deleteTvDetailReply" data-content=""><b class="t">삭제</b></a></li>';
				} else if (replyList[i].mbrNo != "0") {
					html += '<li><a class="bt" style="color: #000000;" href="javascript:fncReplyRptpPopOpen(' + replyList[i].aplySeq + ');" data-url="" data-content=""><b class="t">신고</b></a></li>';
				}
				html += '</ul></div></div></div></li>';
				
				tvDetailRplList = replyList[i].tvDetailRplList;
				if (tvDetailRplList.length != 0) {
					dateStrRpl = elapsedTime(tvDetailRplList[0].rplRegDtm);
					html += '<li class="depth2">';
					html += '<div class="pic"><img src="../../_images/tv/admin_prfl_img.png" onerror="this.src=\'../../_images/common/icon-img-profile-default-b@2x.png\'" /></div>';
					html += '<div class="con">';
					html += '<div class="tit">운영자</div>';
					html += '<div class="txt">' + tvDetailRplList[0].rpl + '</div>';
					html += '<div class="date">' + dateStrRpl + '</div></div></li>';
				}
			}
		}
		if (clear == "Y") {
			$("#replyListArea").empty();
		}
		$("#replyListArea").append(html);
		pageMov = false;
	}
	
	// 댓글 태그 클릭 시 태그 번호 조회
	function fncGetPetTvReplyTagNo(tagNm) {
		$.ajax({
			url : "/tv/reply/getPetTvReplyTagNo",
			data : {
				tagNm : tagNm
			},
			success : function(data) {
				location.href="/tv/collectTags?tagNo="+data.tagNo;
				//storageHist.goBack("/tv/collectTags?tagNo="+data.tagNo);
			}
		});
	}
	// 댓글 멘션 클릭 이벤트
	/* function fncReplyMentionClick(nickNm) {
		$.ajax({
			url : "/common/getMentionInfo",
			data : {
				nickNm : nickNm
			},
			success : function(data) {
				let msg = "";
				if (data.info == null) {
					msg = "존재하지 않는 회원입니다.";
					fncPetTvReplyToastAlert(msg);
				} else {
					if (data.info.mbrStatCd == "50") {
						msg = "탈퇴한 회원입니다.";
						fncPetTvReplyToastAlert(msg);
					} else if (data.info.petLogUrl == null || data.info.petLogUrl == "") {
						msg = "반려동물을 등록하지 않은 회원입니다.";
						fncPetTvReplyToastAlert(msg);
					} else if (data.info.petLogUrl != null && data.info.petLogUrl != "") {
						location.href = "/log/indexMyPetLog/" + data.info.petLogUrl + "?mbrNo=" + data.info.mbrNo;
					}
				}
			}
		});
	} */
	
	// 토스트 알림
	function fncPetTvReplyToastAlert(msg) {
		ui.toast(msg, {
			bot:74
			, sec:2000
		});
	}
	
	// 영상 상세 댓글 등록/수정
	function fncSaveReply() {
		if (pageMov) {
			return;
		}
		let sendData = $("#indexTvDetailForm").serializeJson();
		let aplySaveContent = $("#aplyContent").val();
		let tagNmArr = [];
		let nickNmArr = [];
		
		aplySaveContent.replace(/#[^#\s'><&]+|@[^@\s~'><&]+/gm, function (tag){
			if (tag.indexOf('#') == 0) {
				tagNmArr.push(tag.replace('#', ''));
			}
			if (tag.indexOf('@') == 0) {
				nickNmArr.push(tag.replace('@', ''));
			}
		});
		
		if (!aplySaveContent) {
			ui.alert('댓글을 입력해 주세요');
			return;
		}
		$.extend(sendData, {
			aply : aplySaveContent
			, tagNmArr : tagNmArr
			, nickNmArr : nickNmArr
			, nickNm : ""
			, landingUrl : "https://aboutpet.co.kr" + "/tv/series/indexTvDetail" + "?vdId=" + replyVdId + "&sortCd="+ sortCd +"&listGb="+ listGb
		});
		
		$.ajax({
			url : "/tv/reply/saveTvDetailReply"
			, type : "POST"
			, dataType : "json"
			, data : sendData
			, success : function(result) {
				if (result.replyGb == "U") {
					// 댓글 수정
					ui.toast('댓글이 수정되었어요', {
						bot:74
						, sec:2000
					});
					// 수정된 댓글
					let updateReply = result.po.aply;
					// 댓글 수정 (새로고침 X)
					$("#aply-" + sendData.aplySeq)[0].scrollIntoView({behavior:'smooth', block:'center'});
					$("#aply-" + sendData.aplySeq).find("#modifyReplyData" + sendData.aplySeq).html(updateReply);
					
					updateReply = updateReply.replace(/#[^#\s'><&]+|@[^@\s~'><&]+/gm, function (tag){
						//return (tag.indexOf('#')== 0) ? '<a href="javascript:fncGetPetTvReplyTagNo(\'' + tag.replace('#','') + '\');" style="color:#669aff;">' + tag + '</a>' : '<span style="font-weight:bold;">' + tag + '</span>';
						return '<span style="font-weight:bold;">' + tag + '</span>';
					});
					
					$("#aply-" + sendData.aplySeq).find(".txt").html(updateReply);
					$("#aply-" + sendData.aplySeq).find(".date").show();
					$("#aply-" + sendData.aplySeq).find("div[name=modifyDate]").hide();
					fncReplyModifyReset();
					
					userActionLog(sendData.vdId, "etc"); //클릭 이벤트-댓글수정(기타 모든 클릭)
				} else if (result.replyGb == "I") {
					// 댓글 등록
					ui.toast('댓글이 등록되었어요', {
						bot:74
						, sec:2000
					});
					$("#mobileAppScrollArea").scrollTop(0);
					$("#aplyContent").val("");
					$("#aplyContent").blur();
					fncBtnDispGb("N");
					// 댓글 영역 새로고침
					dataMoreGb = false;
					resetPrflImg = false;
					selectTvDetailReplyList('Y', replyVdId);
					
					// 댓글 영역으로 스크롤 이동
					$("#aplyContent")[0].scrollIntoView({block:'center'});
					
					userActionLog(sendData.vdId, "reply"); //클릭 이벤트-댓글입력
				}
			}, error : function(request, status, error) {
				ui.alert("오류가 발생되었습니다. 다시 시도하여 주십시오.");
			}
		});
	}
	
	// 댓글 수정 후/댓글 수정 중 자동재생으로 페이지 이동 시
	function fncReplyModifyReset() {
		$("#petTvReplyModifyAlert").hide();
		$("#aplyContent").val("");
		$("#aplyContent").blur();
		fncBtnDispGb("N");
		$("#indexTvDetailForm #aplySeq").val("");
		replyAplySeq = 0;
	}
	
	// 영상 상세 댓글 수정 textarea 댓글내용 update
	function fncUpdateReply(aplySeq) {
		// 이전 수정 댓글 - 수정 중 해제
		if (replyAplySeq != 0) {
			fncUpdateDivHide();
		}
		
		// 수정 중인 댓글 번호
		$("#indexTvDetailForm #aplySeq").val(aplySeq);
		replyAplySeq = aplySeq;
		
		// 현재 수정 중인 댓글 - 수정 중 노출
		$("#petTvReplyModifyAlert").show();
		$("#aply-" + aplySeq).find(".date").hide();
		$("#aply-" + aplySeq).find("div[name=modifyDate]").show();
		
		let updateReplyContent = $("#aply-" + aplySeq).find("#modifyReplyData" + aplySeq).text();
		
		$("#aplyContent").val(updateReplyContent);
		fncBtnDispGb("Y");
		$("#aplyContent").blur();
		$("#aplyContent").focus();
		$("#aplyContent")[0].scrollIntoView({block:'center'});
	}
	
	function fncUpdateDivHide() {
		$("#aply-" + replyAplySeq).find(".date").show();
		$("#aply-" + replyAplySeq).find("div[name=modifyDate]").hide();
	}
	
	// 영상 상세 댓글 삭제
	function fncRemoveReply(aplySeq) {
		ui.confirm('댓글을 삭제할까요?',{
		    ycb:function(){ // 확인 버튼 클릭
		    	if (pageMov) {
					return;
				}
		    	let sendData = $("#indexTvDetailForm").serializeJson();
				sendData.aplySeq = aplySeq;
				
				if (replyAplySeq != 0) {
					fncUpdateDivHide();
					$("#aplyContent").val("");
					fncBtnDispGb("N");
					$("#petTvReplyModifyAlert").hide();
					$("#indexTvDetailForm #aplySeq").val("");
				}
				
				$.ajax({
					url : "/tv/reply/deleteTvDetailReply"
					, type : "POST"
					, dataType : "json"
					, data : sendData
					, success : function(result) {
						resetPrflImg = false;
						ui.toast('댓글이 삭제되었어요', {
							bot:74
							, sec:2000
						});
						$("#mobileAppScrollArea").scrollTop(0);
						// 댓글 영역 새로고침
						selectTvDetailReplyList('Y', replyVdId);
						
						// 댓글 영역으로 스크롤 이동
						$("#aplyContent")[0].scrollIntoView({block:'center'});
						
						userActionLog(sendData.vdId, "etc"); //클릭 이벤트-댓글삭제(기타 모든 클릭)
					}, error : function(request, status, error) {
						ui.alert("오류가 발생되었습니다. 다시 시도하여 주십시오.");
					}
				});
		    },
		    ncb:function(){ // 취소 버튼 클릭
		    	
		    },
		    ybt:'예',
		    nbt:'아니오',
		    cls:'petTvReplyConfirm'
		});
	}
	
	// 영상 상세 댓글 신고 팝업 열기
	function fncReplyRptpPopOpen(aplySeq) {
		if ("0" == "0") {
			ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?',{
			    ycb:function(){ // 확인 버튼 클릭
			        // 로그인 페이지로 이동 (로그인 후 returnUrl로 이동);
					//location.href = "/indexLogin?returnUrl=/tv/series/indexTvDetail" + "?vdId=" + replyVdId + "&sortCd="+ sortCd +"&listGb="+ listGb;
					
					var url = "/tv/series/indexTvDetail" + encodeURIComponent("?vdId=" + replyVdId + "&sortCd=" + sortCd + "&listGb=" + listGb);
			    	if("false" == "true"){ //APP
			    		fncAppCloseMoveLogin(url);
			    	}else{
			    		location.href = "/indexLogin?returnUrl="+url;
			    		//storageHist.goBack("/indexLogin?returnUrl="+url);
			    	}
			    },
			    ncb:function(){ // 취소 버튼 클릭
			    	
			    },
			    ybt:'로그인',
			    nbt:'취소',
			    cls:'petTvReplyConfirm'
			});
		} else {
			$.ajax({
				url : "/tv/reply/tvDetailReplyRptpDupChk"
				, type : "POST"
				, dataType : "json"
				, data : {
					aplySeq : aplySeq
					, vdId : replyVdId
					, mbrNo : "0"
				}
				, success : function(result) {
					if (result.dupChkCnt > 0) {
						ui.toast('이미 신고한 댓글이에요', {
							bot:74
							, sec:2000
						});
					} else {
						$("#tvDetailReplyRptpForm").trigger("reset");
						$("#tvDetailReplyRptpForm .tit,#tvDetailReplyRptpForm .txt").css("color", "#000000;");
						$("#petTvReplyRptpBtn").addClass("disabled");
						$("#indexTvDetailForm #aplySeq").val(aplySeq);
						ui.popLayer.open("popReportPetTvReply");
						$("#popReportPetTvReply .pct.h_auto_p").scrollTop(0);
						
						if (!isUserPauseClick) {
							SGRPLAYER.pause(); // 신고 팝업 열리면 영상 재생 멈춤
						}
					}
				}, error : function(request, status, error) {
					ui.alert("오류가 발생되었습니다. 다시 시도하여 주십시오.");
				}
			});
		}
	}
	
	// 영상 상세 댓글 신고 팝업 닫기
	function fncReplyRptpPopClose(gbData) {
		ui.popLayer.close("popReportPetTvReply");
		$("#indexTvDetailForm #aplySeq").val("");
		
		if (gbData != "Y") {
			if (!isUserPauseClick) {
				SGRPLAYER.play(); // 신고 팝업 닫히면 영상 다시 재생
			}
		}
	}
	
	// 영상 상세 댓글 신고
	function fncTvDetailReplyRptp() {
		if (pageMov) {
			return;
		}
		let sendData = $("#indexTvDetailForm").serializeJson();
		$.extend(sendData, {
			rptpRsnCd : $("#popReportPetTvReply input[name=rptpRsnCd]:checked").val()
			, rptpContent : $("#popReportPetTvReply #rptpContent").val()
		});
		
		if (!sendData.rptpRsnCd) {
			ui.toast('신고 사유를 선택해 주세요');
			return;
		}
		
		$.ajax({
			url : "/tv/reply/insertTvDetailReplyRptp"
			, type : "POST"
			, dataType : "json"
			, data : sendData
			, success : function(result) {
				fncReplyRptpPopClose();
				ui.toast('신고가 완료되었어요', {
					bot:74
					, sec:2000
				});
				
				if (result.rptpCnt == 5) {
					// 새로고침 X
					$("#aply-" + sendData.aplySeq).remove();
				}
				
				if (!isUserPauseClick) {
					SGRPLAYER.play(); // 신고 팝업 닫히면 영상 다시 재생
				}
			}, error : function(request, status, error) {
				ui.alert("오류가 발생되었습니다. 다시 시도하여 주십시오.");
			}
		});
	}
	
	// 영상 상세 댓글 등록 로그인 체크
	function fncReplyRegLoginChk(regYn) {
		if ("0" == "0") {
			$("#aplyContent").blur();
			ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?',{
			    ycb:function(){ // 확인 버튼 클릭
			        // 로그인 페이지로 이동 (로그인 후 returnUrl로 이동);
					//location.href = "/indexLogin?returnUrl=/tv/series/indexTvDetail" + "?vdId=" + replyVdId + "&sortCd="+ sortCd +"&listGb="+ listGb;
					
			    	var url = "/tv/series/indexTvDetail" + encodeURIComponent("?vdId=" + replyVdId + "&sortCd=" + sortCd + "&listGb=" + listGb);
			    	if("false" == "true"){ //APP
			    		fncAppCloseMoveLogin(url);
			    	}else{
			    		location.href = "/indexLogin?returnUrl="+url;
			    		//storageHist.goBack("/indexLogin?returnUrl="+url);
			    	}
			    },
			    ncb:function(){ // 취소 버튼 클릭
			    	
			    },
			    ybt:'로그인',
			    nbt:'취소',
			    cls:'petTvReplyConfirm'
			});
		} else {
			if (regYn == "Y") {
				fncSaveReply();
			}
		}
	}
	
	// 댓글 수정 중 alert 닫기 버튼 클릭 시
	function fncCloseModifyAlert() {
		ui.confirm('댓글 수정을 취소할까요?',{
		    ycb:function(){ // '네' 버튼 클릭
		    	$("#petTvReplyModifyAlert").hide();
				fncUpdateDivHide();
				$("#aplyContent").val("");
				fncBtnDispGb("N");
				$("#indexTvDetailForm #aplySeq").val("");
				replyAplySeq = 0;
				$("#aplyContent").blur();
		    },
		    ncb:function(){ // '아니오' 버튼 클릭
		    	$("#aplyContent").focus();
		    },
		    ybt:'예',
		    nbt:'아니오',
		    cls:'petTvReplyConfirm'
		});
	}
	
	// 버튼 show/hide function
	function fncBtnDispGb(dispGb) {
		if (dispGb == "Y") {
			//$("#aplyContentRegBtn").show();
			$("#aplyContentRegBtn").siblings("button.del").css('visibility','hidden');
		} else {
			//$("#aplyContentRegBtn").hide();
			$("#aplyContentRegBtn").siblings("button.del").hide();
		}
	}
	
	// MO WEB/APP 댓글 레이어 닫기
	function fncReplyLayerPopClose(closeThis) {
		// MO WEB/APP 댓글 수정중에 댓글 레이어 닫을 때 댓글 수정 초기화
		if ($("#petTvReplyModifyAlert").css("display") == "block") {
			fncReplyModifyReset();
		}
		ui.commentBox.close(closeThis);
		ui.lock.using(false); //댓글 레이어 close 시 body 스크롤 unlock
		ui.dim.close();
	}
	
	// 태그,멘션 검색 후 li 태그 클릭 시 이벤트
	function selectTag(searchText, selTag){
		let element = document.getElementById('aplyContent');
		let strOriginal = element.value;
		let iStartPos = element.selectionStart;
		let iEndPos = element.selectionEnd;
		let strFront = "";
		let strEnd = "";
		let pos = '';
		if (searchText != '') {
			/* element.value = element.value.substring(0, iStartPos - searchText.length) + selTag + element.value.substring(iStartPos + searchText.length); */
			let space = element.value.substring(iStartPos + searchText.length -2).substring(0, 1) == ' ' ? '' : ' ';
			pos = (element.value.substring(0, iStartPos - searchText.length) + selTag + space);
			let serchTxtLen = 2;
			if (searchText.length == 1) {
				serchTxtLen = 1;
			}
			element.value = element.value.substring(0, iStartPos - searchText.length) + selTag + space + element.value.substring(iStartPos + searchText.length - serchTxtLen);
		}
		
		if (gb == '#') {
			$("#petTvReplyTagArea").hide();
			$("#tagListArea").html("");
		} else if (gb == '\@') {
			$("#petTvReplyMentionArea").hide();
			$("#mentionListArea").html("");
		}
		gb = "";
		selectTagGb = true;
	}
	
	$(document).ready(function(){
		if ("true" == "true") {
			$(window).scroll(function(){
				let scrollT = $(this).scrollTop(); //스크롤바의 상단위치
				let scrollH = $(this).height(); //스크롤바를 갖는 div의 높이
				let contentH = $(document).height(); //문서 전체 내용을 갖는 div의 높이
				
		        if(Math.ceil(scrollT + scrollH) >= contentH) { // 스크롤바가 아래 쪽에 위치할 때
		        	if (dataMoreGb) {
		        		dataMoreGb = false;
		        		selectTvDetailReplyList('N', replyVdId);
		        	}
	        	}
		    });
		} else {
			$("#mobileAppScrollArea").scroll(function(){
				let scrollT = $(this).scrollTop(); //스크롤바의 상단위치
				let scrollH = $(this).height(); //스크롤바를 갖는 div의 높이
				let contentH = $(this).prop('scrollHeight'); //문서 전체 내용을 갖는 div의 높이
				
		        if(Math.ceil(scrollT + scrollH) >= contentH) { // 스크롤바가 아래 쪽에 위치할 때
		        	if (dataMoreGb) {
		        		dataMoreGb = false;
		        		selectTvDetailReplyList('N', replyVdId);
		        	}
	        	}
		    });
		}
		
		$(document).on("input", "#aplyContent", function(){
			let textLength = $(this)[0].textLength;
			if (textLength == 0) {
				fncBtnDispGb("N");
			} else {
				fncBtnDispGb("Y");
			}
		});
		
		$(document).on("click", "#replyTextarea .del", function(){
			$("#aplyContentRegBtn").hide();
			$("#aplyContent").focus();
			$("#petTvReplyTagArea").hide();
			$("#petTvReplyMentionArea").hide();
			$("#tagListArea").html("");
			$("#mentionListArea").html("");
			gb = '';
		});
		
		$(document).on("change", "input[name=rptpRsnCd]", function() {
			if ($("input[name=rptpRsnCd]:checked").val() != undefined) {
				$("#petTvReplyRptpBtn").removeClass("disabled");
			} else {
				$("#petTvReplyRptpBtn").addClass("disabled");
			}
		});
		
		$(document).on("blur", "textarea[name=aplyContent]", function(){
			$("#petTvReplyTagArea").hide();
			$("#petTvReplyMentionArea").hide();
			$("#tagListArea").html("");
			$("#mentionListArea").html("");
			if (selectTagGb) {
				$("#aplyContent").focus();
				selectTagGb = false;
			}
		});
		
		// 댓글 입력 시 해시태그, 멘션 스크립트
		$(document).on("input", "textarea[name=aplyContent]", function(e) {
			let element = document.getElementById('aplyContent');
			let strOriginal = element.value;
			let strOrginal2 = strOriginal.substring(0, element.selectionStart);
			let index = strOrginal2.lastIndexOf('#');
			if (index < strOrginal2.lastIndexOf('\@') && element.selectionStart > strOrginal2.lastIndexOf('\@')) {
				index = strOrginal2.lastIndexOf('\@');
			}
			
			if (element.selectionStart == 0) {
				gb = '';
				$("#petTvReplyTagArea").hide();
				$("#petTvReplyMentionArea").hide();
				$("#tagListArea").html("");
				$("#mentionListArea").html("");
			}
			
			let txt = strOrginal2.substring(index, element.selectionStart);
			txt = txt.substring(0, 1);
			
			gb = txt;
			// hashtag
			if (gb.indexOf('#') > -1) {
				$("#petTvReplyMentionArea").hide();
				let iStartPos = element.selectionStart;
				let iEndPos = element.selectionEnd;
				let strFront = "";
				let strEnd = "";
				
				if(iStartPos == iEndPos) {
					String.prototype.startsWith = function(str) {
						if (this.length < str.length) { return false; }
						return this.indexOf(str) == 0;
					}
					strFront = strOriginal.substring(0, iStartPos);
					strFrontArr = strFront.split('#');
					let tagTxt = strFrontArr[strFrontArr.length - 1];
					strEnd = strOriginal.substring(iStartPos, strOriginal.length);
					strEnd = strEnd.split(' ')[0];
					strEnd = strEnd.split('#')[0];
					let searchTagTxt = '';
					if (tagTxt != undefined) {
						if (tagTxt.length > 0) {
							let lastStr = tagTxt.slice(tagTxt.length-1, tagTxt.length);
							let regTxt = /^[ㄱ-ㅎㅏ-ㅣ|가-힣|a-z|A-Z|0-9|\*]+$/;
							if (regTxt.test(lastStr) && tagTxt.split(' ').length == 1) {
								searchTagTxt = tagTxt.split(' ')[0];
							}
						} else if (strEnd != '') {
							searchTagTxt = strEnd;
						}
					}
					//////////////////////////////////////////////////
					// xhr 통신 추가 start
					// searchTagTxt 로 태그검색하시면 됩니다.
					if( searchTagTxt != '' && searchTagTxt.substring(0, 1).search(/['><]/gi) == -1 ){
						let options  = {
							url : "/log/getAutocomplete"
				            , data : {
				            	searchText : searchTagTxt
				            	, label : "pet_log_autocomplete"
			            		, size : "30"
				            }
				        	, async : false
				            , done : function(result){
			                	let resBody = JSON.parse(result);
			                	$("#tagListArea").html("");
			                    
								if(resBody.STATUS.CODE != "200"){
									alert("Error = " + resBody.STATUS.MESSAGE);
								}else{
									if(resBody.DATA.TOTAL > 0){
										let addHtml = "";
										let item = resBody.DATA.ITEMS;
										
										for (let i = 0; i < item.length; i++) {
											addHtml += '<li style="cursor:pointer;" onmousedown="selectTag(\''+searchTagTxt.trim() + '\', \'' + item[i].KEYWORD + '\');"><a href="javascript:void(0);">#' + item[i].KEYWORD + '</a></li>';
										}
										
										$("#petTvReplyTagArea").show();
										$("#tagListArea").append(addHtml);
									}else{
										//alert("검색 결과값이 없습니다.");
									}
								}
				            }
				        };
				        ajax.call(options);
					} else{ 
						$("#petTvReplyTagArea").hide();
						$("#tagListArea").html("");
					}
					// xhr 통신 추가 end
					//////////////////////////////////////////////////
				} else return;
			}
			
			// mention
			if (gb.indexOf('\@') > -1) {
				$("#petTvReplyTagArea").hide();
				let iStartPos = element.selectionStart;
				let iEndPos = element.selectionEnd;
				let strFront = "";
				let strEnd = "";
				if(iStartPos == iEndPos) {
					String.prototype.startsWith = function(str) {
						if (this.length < str.length) { return false; }
						return this.indexOf(str) == 0;
					}
					strFront = strOriginal.substring(0, iStartPos);
					strFrontArr = strFront.split('\@');
					let mentionTxt = strFrontArr[strFrontArr.length - 1];
					strEnd = strOriginal.substring(iStartPos, strOriginal.length);
					strEnd = strEnd.split(' ')[0];
					strEnd = strEnd.split('@')[0];
					let searchMentionTxt = '';
					if (mentionTxt != undefined) {
						if (mentionTxt.length > 0) {
							let lastStr = mentionTxt.slice(mentionTxt.length-1, mentionTxt.length);
							let regTxt = /^[ㄱ-ㅎㅏ-ㅣ|가-힣|a-z|A-Z|0-9|\*]+$/;
							if (regTxt.test(lastStr) && mentionTxt.split(' ').length == 1) {
								searchMentionTxt = mentionTxt.split(' ')[0];
							}
						} else if (strEnd != '') {
							searchMentionTxt = strEnd;
						}
					}
					//////////////////////////////////////////////////
					// xhr 통신 추가 start
					// searchMentionTxt 로 멘션검색하시면 됩니다.
					if( searchMentionTxt != '' && searchMentionTxt.substring(0, 1).search(/['><]/gi) == -1 ){
						
				        
				        let options  = {
							url : "/log/getAutocomplete"
				            , data : {
				            	searchText : searchMentionTxt
				            	, label : "log_member_nick_name"
			            		, size : "30"
				            }
				        	, async : false
				            , done : function(result){
			                	let resBody = JSON.parse(result);
			                	$("#mentionListArea").html("");
			                    
								if(resBody.STATUS.CODE != "200"){
									alert("Error = " + resBody.STATUS.MESSAGE);
								}else{
									if(resBody.DATA.TOTAL > 0){
										let addHtml = "";
										let item = resBody.DATA.ITEMS;
										
										for(let i = 0; i < item.length; i++){
											let pic = 'https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images'+ item[i].PRFL_IMG +'?type=f&w=124&h=124&quality=90&align=4';
											if (item[i].PRFL_IMG == null || item[i].PRFL_IMG == '') {
												pic = '../../_images/common/icon-img-profile-default-m@2x.png'
											}
											
											addHtml += '<li style="cursor:pointer;" onmousedown="selectTag(\''+searchMentionTxt.trim() + '\', \'' + item[i].KEYWORD + '\');"><a href="javascript:void(0);"><span class="pic"><img src="'+ pic + '"></span><span class="txt">' + item[i].KEYWORD + '</span></a></li>';
										};
										
										$("#petTvReplyMentionArea").show();
										$("#mentionListArea").append(addHtml);
									}else{
										//alert("검색 결과값이 없습니다.");
									}
								}
				            }
				        };
				        ajax.call(options);
					} else{
						$("#petTvReplyMentionArea").hide();
						$("#mentionListArea").html("");
					}
					// xhr 통신 추가 end
					//////////////////////////////////////////////////
				} else return;
			}
		});
		
		//댓글 레이어 .head 스크롤로 close 시 body 스크롤 unlock
		$(".commentBoxAp.tvcommentBox").bind("popCloseEvent",function(){
			ui.lock.using(false);
			ui.dim.close();
        });
		
		//댓글 50자 초과 입력 시 토스트 알림 노출
		$(document).on("input", "#aplyContent", function(){
			if ($(this).val().length > 300) {
				$(this).val($(this).val().substring(0,300));
				ui.toast('300자 까지 입력 가능합니다.', {
					bot:74
					, sec:2000
				});
			}
		});
		
		//댓글 신고 사유 200자 초과 입력 시 토스트 알림 노출
		$(document).on("input", "#rptpContent", function(){
			if ($(this).val().length > 200) {
				$(this).val($(this).val().substring(0,200));
				ui.toast('200자 까지 입력 가능합니다.', {
					bot:74
					, sec:2000
				});
			}
		});
		
		//댓글 옵션 영역 외의 영역 클릭 시 댓글 옵션 영역 hide 처리
		$(document).on("click", ".tv.detail .commentBoxAp.tvcommentBox .menu.dopMenuIcon", function(e) {
			$(".tv.detail .commentBoxAp.tvcommentBox .head,body").one("click", function(e){
				if (!$(e.target).hasClass("popSelect") && !$(e.target).hasClass("dopMenuIcon")) {
					$(".tv.detail").find(".popSelInnerWrap").css({height:0});
				}
			});
		});
	});
</script>

<form name="indexTvDetailForm" id="indexTvDetailForm" method="post">
	<input type="hidden" name="mbrNo" id="mbrNo" value="0" />
	<input type="hidden" name="vdId" id="vdId" value="" />
	<input type="hidden" name="aplySeq" id="aplySeq" value="" />
</form>
<input type="hidden" id="page" name="page" value="0" />
<div class="commentBoxAp tvcommentBox type01">
	<div class="head">
		<div class="con">
			<div class="tit" id="replyTotCnt"></div>
			<a href="javascript:;" class="close" id="moReplyLayerCloseBtn" onClick="fncReplyLayerPopClose(this);"></a>
		</div>
	</div>
	<div class="con">
		<div class="box" id="mobileAppScrollArea" style="height: calc(100% - 78px); padding-top: 78px;">
			<div class="commendListBox">
				<ul id="replyListArea"></ul>
			</div>
		</div>
		<div class="input" id="replyTextarea">
			<span id="aplyContsSpan"></span>
			<textarea type="text" id="aplyContent" name="aplyContent" onfocus="fncReplyRegLoginChk();"
			placeholder="로그인 후 댓글을 입력해 주세요"></textarea>
			<button id="aplyContentRegBtn" onClick="fncReplyRegLoginChk('Y');"  data-url="/tv/reply/saveTvDetailReply" data-content="">등록</button>
		</div>
		
		<div class="fixed_box" style="top:-46px;">
			<div class="tagList" id="petTvReplyTagArea">
				<ul id="tagListArea"></ul>
			</div>
			<div class="userList" id="petTvReplyMentionArea">
				<ul id="mentionListArea"></ul>
			</div>
		    <div class="alert-commentBox" id="petTvReplyModifyAlert" style="display:none;">
		        <p><span class="icon-speechBubble"></span>댓글을 수정 중입니다.</p>
		        <button class="close" onclick="fncCloseModifyAlert();"></button>
		    </div>
		</div>
	</div>
</div>
<!-- //댓글 -->
            
            <!-- 연관상품 장바구니 -->
            <!-- //연관상품 장바구니 -->
		            
        </main><!-- container --><!-- location 영역 포함  -->			
		<!-- e : 본문영역 -->
				
		<!-- s : layerPop 영역 -->
		<!-- popup 내용 부분입니다. -->
		<!-- s : 댓글 신고 팝업 -->
		<form name="tvDetailReplyRptpForm" id="tvDetailReplyRptpForm" method="post">
			<article class="popLayer a popSample1 pc_popSize_500" id="popReportPetTvReply">
				<div class="pbd">
					<div class="phd">
						<div class="in">
							<h1 class="tit">신고 접수<button type="button" class="btnPopClose" onclick="fncReplyRptpPopClose();">닫기</button></h1>
						</div>
					</div>
					<div class="pct h_auto_p">
						<main class="poptents">
							<div class="lay-gray-box">
								신고접수 시 운영정책에 따라 검토 후 해당글이 삭제됩니다.<br />
								신고 관련된 자세한 사항은 고객센터로 연락주세요.
							</div>
							<div class="member-input">
								<ul class="list">
									<li>
										<strong class="tit mb18">신고 사유</strong>
										<div class="flex-wrap">
											<label class="radio"><input type="radio" name="rptpRsnCd" value="10"><span class="txt">혐오 콘텐츠</span></label>
										</div>
										<div class="flex-wrap">
											<label class="radio"><input type="radio" name="rptpRsnCd" value="20"><span class="txt">지적 재산권 위반</span></label>
										</div>
										<div class="flex-wrap">
											<label class="radio"><input type="radio" name="rptpRsnCd" value="30"><span class="txt">기타</span></label>
										</div>
									</li>
								</ul>
							</div>
							<div class="textarea m"><textarea name="rptpContent" id="rptpContent" placeholder="신고사유를 입력해주세요. 선택사항입니다." style="height:260px;"></textarea></div>
							<div class="log_btnWrap">
								<a href="javascript:fncReplyRptpPopClose();" class="btn lg onWeb_if">취소</a>
								<a href="javascript:fncTvDetailReplyRptp();" class="btn a lg disabled" id="petTvReplyRptpBtn" style="pointer-events: auto;"
								 data-url="/tv/reply/insertTvDetailReplyRptp" data-content="">완료</a>
							</div>
						</main>
					</div>
				</div>
			</article>
		</form>
		<!-- e : 댓글 신고 팝업 --><!-- e : layerPop 영역 -->
		
		<!-- s : menubar 영역 -->
		<!-- e : menubar 영역 -->
		
		<!-- s : footer 영역 -->
		<!-- e : footer 영역 -->
	</div>
</body>
</html>
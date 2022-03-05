<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% int mem_code= 0;
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


<div class="layers">
	<!-- 레이어팝업 넣을 자리 -->
	<!-- 등급안내 팝업 추가 2021.05.13 -->
	<article class="popLayer a popLank " id="popLank">
		<div class="pbd">
			<div class="phd">
				<div class="in">
					<h1 class="tit"></h1>
					<button type="button" class="btnPopClose">닫기</button>
				</div>
			</div>
			<div class="pct">
				<main class="poptents">
					<div class="rankCont">
						<div class="rank_imgBox rank_pc">
							<img src="/_images/common/img-level-pc.png"
								alt="어바웃펫 패미리 등급별 혜택 이미지">
						</div>
					</div>
				</main>
			</div>
		</div>
	</article>
	<!-- //등급안내 팝업 추가 2021.05.13 -->
</div>
<!--// header pc-->
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
		location.href = "https://aboutpet.co.kr:443/log/indexMyPetLog/F3989679D6?mbrNo=951865";
	}
}


function checkLoginGnb(){
	if( "true" != "true" ){
		ui.confirm('로그인 후 서비스를 이용할 수 있어요.<br>로그인 할까요?',{ // 컨펌 창 옵션들
			ycb:function(){
				location.href = "https://aboutpet.co.kr:443/indexLogin";
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
	if( "30532" == null || "30532" == ""){
		ui.confirm('마이펫 등록 후 이용할 수 있어요<br/>펫정보를 등록할까요?',{ // 컨펌 창 옵션들
			ycb:function(){
				// 반려동물 등록 화면으로 이동.
				location.href = "https://aboutpet.co.kr:443/my/pet/petInsertView";
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
			<div class="bts">
				<button class="bt close">메뉴닫기</button>
			</div>
		</div>
		<div class="cdt">
			<div class="menu">
				<ul class="list">
					<li class="tv active"><a class="bt" href="javascript:;">펫
							TV</a>
						<div class="box">
							<ul class="sm">
								<li><a class="bt" href="/tv/petTvList?dispCornNo=567">신규영상</a></li>
								<li><a class="bt" href="/tv/petTvList?dispCornNo=568">인기영상</a></li>
								<li><a class="bt" href="/tv/petSchool">펫스쿨</a></li>
								<li><a class="bt" href="javascript:seriesOpen();">시리즈목록</a></li>
							</ul>
						</div></li>
					<li class="log "><a class="bt" href="javascript:;">펫로그</a>
						<div class="box">
							<ul class="sm">
								<li><a class="bt" href="javascript:goMyPetLogGnb();">MY
										펫로그</a></li>
							</ul>
						</div></li>
					<li class="shop "><a class="bt" href="javascript:;">펫 샵</a>
						<div class="box">
							<div class="cate slideShop">
								<div class="swiper-container">
									<ul class="swiper-wrapper slide">
										<li class="swiper-slide active"><a
											data-ui-tab-btn="tab_shop_cate"
											data-ui-tab-val="tab_shop_cate_12564" href="javascript:;"
											class="bt">강아지</a></li>
										<li class="swiper-slide "><a
											data-ui-tab-btn="tab_shop_cate"
											data-ui-tab-val="tab_shop_cate_12565" href="javascript:;"
											class="bt">고양이</a></li>
										<li class="swiper-slide "><a
											data-ui-tab-btn="tab_shop_cate"
											data-ui-tab-val="tab_shop_cate_14111" href="javascript:;"
											class="bt">관상어</a></li>
										<li class="swiper-slide "><a
											data-ui-tab-btn="tab_shop_cate"
											data-ui-tab-val="tab_shop_cate_14196" href="javascript:;"
											class="bt">소동물</a></li>
									</ul>
								</div>
							</div>
							<div class="ctset active" data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12564">
								<ul class="sm">
									<li><a class="bt"
										href="javascript:setCateList('12569', '12564');">사료</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12571', '12564');">간식</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12572', '12564');">건강관리</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12573', '12564');">장난감/훈련</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12575', '12564');">위생/배변</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12576', '12564');">미용/목욕</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12577', '12564');">급식/급수기</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12578', '12564');">하우스</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12579', '12564');">패션/의류</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12581', '12564');">목줄/하네스</a></li>
									<li><a class="bt"
										href="javascript:setCateList('13998', '12564');">이동장</a></li>
									<li><a class="bt"
										href="javascript:setCateList('100000196', '12564');">반려인용품</a></li>
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12565">
								<ul class="sm">
									<li><a class="bt"
										href="javascript:setCateList('12673', '12565');">사료</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12675', '12565');">간식</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12676', '12565');">모래</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12677', '12565');">건강관리</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12678', '12565');">장난감/캣닢</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12679', '12565');">화장실/위생</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12680', '12565');">급식/급수기</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12682', '12565');">미용/목욕</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12683', '12565');">스크래쳐/캣타워</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12684', '12565');">하우스</a></li>
									<li><a class="bt"
										href="javascript:setCateList('12685', '12565');">패션/의류</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14005', '12565');">이동장</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14006', '12565');">목줄/하네스</a></li>
									<li><a class="bt"
										href="javascript:setCateList('100000198', '12565');">반려인용품</a></li>
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14111">
								<ul class="sm">
									<li><a class="bt"
										href="javascript:setCateList('14112', '14111');">사료</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14114', '14111');">어항</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14115', '14111');">모터</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14116', '14111');">에어용품</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14117', '14111');">여과용품</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14118', '14111');">바닥재</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14119', '14111');">장식</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14120', '14111');">조명</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14121', '14111');">컨디셔너</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14122', '14111');">히터</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14123', '14111');">기타용품</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14262', '14111');">수초</a></li>
									<li><a class="bt"
										href="javascript:setCateList('100000199', '14111');">해수용품</a></li>
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14196">
								<ul class="sm">
									<li><a class="bt"
										href="javascript:setCateList('14197', '14196');">햄스터/저빌/래트</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14198', '14196');">토끼/기니피그/친칠라/데구</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14199', '14196');">고슴도치</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14200', '14196');">새</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14201', '14196');">곤충</a></li>
									<li><a class="bt"
										href="javascript:setCateList('14202', '14196');">파충류</a></li>
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12569">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12571">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12572">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12573">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12575">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12576">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12577">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12578">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12579">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12581">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_13998">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_100000196">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12673">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12675">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12676">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12677">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12678">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12679">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12680">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12682">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12683">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12684">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_12685">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14005">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14006">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_100000198">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14112">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14114">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14115">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14116">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14117">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14118">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14119">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14120">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14121">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14122">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14123">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14262">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_100000199">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14197">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14198">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14199">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14200">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14201">
								<ul class="sm">
								</ul>
							</div>
							<div class="ctset " data-ui-tab-ctn="tab_shop_cate"
								data-ui-tab-val="tab_shop_cate_14202">
								<ul class="sm">
								</ul>
							</div>
							<!-- 							<div class="ctset" data-ui-tab-ctn="tab_shop_cate" data-ui-tab-val="tab_shop_cate_6"> -->
							<!-- 								플레이스 -->
							<!-- 							</div> -->
						</div></li>
					<li class="my "><a class="bt" href="javascript:;">MY</a>
						<div class="box">
							<div class="cate slideShop">
								<div class="swiper-container">
									<ul class="swiper-wrapper slide">
										<li class="swiper-slide active"><a
											data-ui-tab-btn="tab_my_cate" data-ui-tab-val="tab_my_cate_1"
											href="javascript:;" class="bt">내 활동</a></li>
										<li class="swiper-slide"><a data-ui-tab-btn="tab_my_cate"
											data-ui-tab-val="tab_my_cate_2" href="javascript:;"
											class="bt">내 쇼핑정보</a></li>
										<li class="swiper-slide"><a data-ui-tab-btn="tab_my_cate"
											data-ui-tab-val="tab_my_cate_3" href="javascript:;"
											class="bt">내 정보 관리</a></li>
									</ul>
								</div>
							</div>
							<div class="ctset ctset1 active" data-ui-tab-ctn="tab_my_cate"
								data-ui-tab-val="tab_my_cate_1">
								<ul class="sm">
									<li><a class="bt" href="/my/pet/myPetListView"
										data-content="951865" data-url="/my/pet/myPetListView">마이펫
											관리</a></li>
									<li><a class="bt" href="/mypage/tv/myWishList">마이 찜리스트</a></li>
									<li><a class="bt" href="/tv/series/indexTvRecentVideo">최근
											본 영상</a></li>
								</ul>
							</div>
							<div class="ctset ctset2" data-ui-tab-ctn="tab_my_cate"
								data-ui-tab-val="tab_my_cate_2">
								<ul class="sm">
									<li><a class="bt" href="/mypage/order/indexDeliveryList"
										data-url="/mypage/order/indexDeliveryList"
										data-content="951865">주문/배송</a></li>
									<li><a class="bt" href="/customer/inquiry/inquiryView"
										data-url="/customer/inquiry/inquiryView" data-content="951865">1:1
											문의</a></li>
									<li><a class="bt" href="/mypage/order/indexClaimList"
										data-url="/mypage/order/indexClaimList" data-content="951865">취소/반품/교환</a></li>
									<li><a class="bt" href="/mypage/goodsCommentList"
										data-url="/mypage/goodsCommentList" data-content="951865">상품
											후기</a></li>
									<li><a class="bt" href="/mypage/indexIoAlarmList"
										data-url="/mypage/indexIoAlarmList" data-content="951865">재입고
											알림</a></li>
									<li><a class="bt" href="/mypage/service/indexAddressList"
										data-url="/mypage/service/indexAddressList"
										data-content="951865">배송지 관리</a></li>
									<li><a class="bt" href="/mypage/info/coupon"
										data-url="/mypage/info/coupon" data-content="951865">내 쿠폰</a></li>
									<li><a class="bt"
										href="/mypage/order/indexBillingCardList"
										data-content="951865">결제 카드관리</a></li>
								</ul>
							</div>
							<div class="ctset ctset3" data-ui-tab-ctn="tab_my_cate"
								data-ui-tab-val="tab_my_cate_3">
								<ul class="sm">
									<li><a class="bt" href="/mypage/info/indexPswdUpdate"
										data-content="951865" data-url="/mypage/info/indexPswdUpdate">비밀번호
											설정</a></li>
									<li><a class="bt" href="/mypage/info/indexManageCheck"
										data-content="951865" data-url="/mypage/info/indexManageCheck">회원정보
											수정</a></li>
								</ul>
							</div>
						</div></li>
				</ul>
			</div>
			<div class="link">
				<ul class="list">
					<li><a href="/mypage/service/coupon" data-content="951865"
						data-url="/mypage/service/coupon" class="bt">쿠폰존</a></li>
					<li><a href="/event/main" data-content="951865"
						data-url="/event/main" class="bt">이벤트</a></li>
					<li><a href="/customer/faq/faqList" class="bt">FAQ</a></li>
					<li><a href="/customer/notice/indexNoticeList" class="bt">공지사항</a></li>
					<li><a href="/customer/notice/indexNoticeList" class="bt">입점ㆍ제휴문의</a></li>
					<li><a href="/indexSettingTerms" class="bt">서비스 이용약관</a></li>
					<!-- 21.07.06 APET-1200 lcm01 -->
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
<script type="text/javascript" src="/_script/orderPayment.js"></script>

<style>
.custom_ellipsis_dlvr {
	display: -webkit-box;
	text-overflow: ellipsis;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 1;
	overflow: hidden;
}
</style>
<main class="container page shop od order" id="container">
	<!-- 페이지 헤더 -->
	<div class="pageHeadPc">
		<div class="inr">
			<div class="hdt">
				<h3 class="tit">주문결제</h3>
			</div>
		</div>
	</div>

	<div class="inr">

		<!-- 본문 -->
		<%-- 
		<form id="order_payment_form" name="order_payment_form" method="post">

			<input type="hidden" id="order_payment_ord_no" name="ordNo"
				value="${ord_code+1 }"> <input type="hidden" id="mbrNo"
				name="mbrNo" value="${mem_code }"> <input type="hidden"
				id="gsptNo" name="gsptNo" value="${shopDTO.opt_code}"> <input
				type="hidden" id="ordNm" name="ordNm" value="${address.recipient }">
			<input type="hidden" id="ordrEmail" name="ordrEmail"
				value="${address.mem_email }"> <input type="hidden"
				id="ordrTel" name="ordrTel" value="${address.contact }"> <input
				type="hidden" id="ordrMobile" name="ordrMobile"
				value="${address.contact }"> <input type="hidden"
				id="mbrDlvraNo" name="mbrDlvraNo" value="73379"> <input
				type="hidden" name="adr_name" id="adr_name"
				value="${address.adr_name }" /> <input type="hidden"
				name="adr_detail" id="adr_detail" value="${address.adr_detail }" />
			<input type="hidden" name="requests" id="requests"
				value="${address.requests }" /> <input type="hidden" name="contact"
				id="contact" value="${address.contact }" /> <input type="hidden"
				name="totalPay" id="totalPay" value="${totalPrice}" /> <input
				type="hidden" name="adr_code" id="adr_code"
				value="${address.adr_code}" /> <input type="hidden" name="dr_enter"
				id="dr_enter" value="${address.dr_enter }" /> <input type="hidden"
				name="totalCnt" id="totalCnt" value="${totalCnt }" /> <input
				type="hidden" name="dr_loc" id="dr_loc" value="${address.dr_loc }" />
			<input type="hidden" name="mem_point" id="mem_point" value="">
			<input type="hidden" name="PayMethod" id="payMethod" value="신용카드">
			<input type="hidden" name="SelectCardCode" id="selectCardCode"
				value="일시불"> <input type="hidden" name="GoodsName"
				id="goodsName" value="${shopDTO.item_name }"> <input
				type="hidden" name="BuyerName" id="buyerName"
				value='${address.recipient }'> <input type="hidden"
				name="BuyerEmail" id="buyerEmail" value=' ${address.mem_email }'>
			<input type="hidden" name="BuyerTel" id="buyerTel"
				value='${address.contact }'>
			<!-- 옵션 -->

			<!-- 카드 옵션 -->
			<input type="hidden" name="SelectQuota" id="selectQuota" value="00" />
		</form>
 --%> 
				<input type="hidden" id="gb10Cnt" value="1" /> <input type="hidden"
					id="ciCtfVal"
					value="aEL7QxvYRJ7gX3y+1Cip7SJ3/5c+n6YH6yw+IZJekppByvFGWlx9YLG18yg+nq4EqpY7Csg3rU+MIRLzDtMhcw==" />
				<div class="contents" id="contents">
					<div class="ordersets">
						<section class="sect usrs">
							<div class="hdts">
								<span class="tit">주문 고객 정보</span>
							</div>
							<div class="cdts">
								<div class="box">
									<div class="usr" id="memDiv">
										<em class="nm" id="memDiv-mbrNm">${orderDTO.mem_name },</em><i class="tel"
											id="memDiv-mobile">${orderDTO.contact }</i>
									</div>
									<!-- <div class="bts"><a href="/mypage/info/indexManageDetail" class="btn c sm btMyMod">개인정보수정</a></div> -->

									<input type="hidden" id="memberYn" value="Y">
								</div>
							</div>
						</section>
						<section class="sect addr">
							<c:if test="${ orderDTO ne null }">
							
							<div class="hdts">
								<span class="tit">배송지</span>
							</div>
							<div class="cdts">
								<div class="adrset">
									<input type="hidden" id="adr_name" value="${orderDTO.adr_name }">
									<input type="hidden" id="adr_detail" value="${orderDTO.adr_detail }"> 
									<input type="hidden" id="recipient" value="${orderDTO.recipient }">
									<input type="hidden" id="d_contact" value="${orderDTO.d_contact }"> 
									
									<div class="name tx">
										<em class="t" id="dlvraGbNmEm">${orderDTO.adr_name }</em>
										<em class="bdg" id="dftDelivery">기본배송지</em>
									</div>
									<div class="adrs" id="dlvraAdrsDiv">${orderDTO.adr_detail }</div>
									<div class="tels" id="dlvraTelsDiv">${orderDTO.recipient }/${orderDTO.d_contact }</div>
								
									<div class="bts"><a href="javascript:;" onclick="changeDel();" class="btn c sm btnDeMod">배송지 변경</a></div>
								
								</div>

							</div>
							
							
							
							</c:if>
							<c:if test="${ orderDTO eq null }">		
									<!-- 배송지 없을 경우 -->
									<input type="hidden" id="order_payment_post_no_new" value="">
									<input type="hidden" id="order_payment_road_addr" value="">
									<input type="hidden" id="order_payment_mbr_dlvra_no" value="">
									<input type="hidden" id="order_payment_demand_goods_rcv_pst_cd" value="">
									<input type="hidden" id="order_payment_demand_goods_rcv_pst_etc" value="">
									<input type="hidden" id="order_payment_demand_pbl_gate_ent_mtd_cd" value="">
									<input type="hidden" id="order_payment_demand_pbl_gate_pswd" value="">
									<input type="hidden" id="order_payment_dlvr_demand" value="">
									<input type="hidden" id="order_payment_dlvr_demand_yn" value="N">

									<div class="hdts"><span class="tit">배송지</span></div>
									<div class="cdts">
										<ul class="adrlist">
											<li class="name">
												<div class="dt">배송지 명칭</div>
												<div class="dd"><span class="input"><input type="text" maxlength="20" id="adr_name" placeholder="배송지 명칭을 입력해주세요."></span></div>
											</li>
											<li class="usr">
												<div class="dt">받는 사람</div>
												<div class="dd"><span class="input"><input type="text" maxlength="20" id="recipient" placeholder="이름을 입력해주세요."></span></div>
											</li>
											<li class="tel">
												<div class="dt">휴대폰번호</div>
												<div class="dd"><span class="input"><input type="text" maxlength="11" id="d_contact" placeholder="'-'빼고 숫자만 입력해주세요."></span></div>
											</li>
											<li class="arr">
												<div class="dt">주소</div>
												<div class="dd">
													<div class="adrbox a1">
														<div class="adr" id="addressInfo">주소를 검색해주세요.</div>
														<a href="javascript:execDaumPostcode();" class="btAdr" >주소검색</a>
													</div>
													<div class="adrbox a2" id="addressInfoDetail" style="display:none;">
														<span class="input"><input type="text" maxlength="30" id="adr_detail" placeholder="상세주소를 입력하세요."></span>
													</div>
												</div>
										
										<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
										<script>
										    function execDaumPostcode() {
										        new daum.Postcode({
										            oncomplete: function(data) {
										                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
										
										                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
										                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										                var addr = ''; // 주소 변수
										                var extraAddr = ''; // 참고항목 변수
										
										                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
										                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
										                    addr = data.roadAddress;
										                } else { // 사용자가 지번 주소를 선택했을 경우(J)
										                    addr = data.jibunAddress;
										                }
										
										                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
										                if(data.userSelectedType === 'R'){
										                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
										                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
										                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
										                        extraAddr += data.bname;
										                    }
										                    // 건물명이 있고, 공동주택일 경우 추가한다.
										                    if(data.buildingName !== '' && data.apartment === 'Y'){
										                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
										                    }
										                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
										                    if(extraAddr !== ''){
										                        extraAddr = ' (' + extraAddr + ')';
										                    }
										                 
										                
										                }
										
										                // 우편번호와 주소 정보를 해당 필드에 넣는다.
										                var text = '['+data.zonecode+']'+addr;
										                
										                document.getElementById("addressInfo").innerText = "";
										                document.getElementById("addressInfo").innerText = text;
										                // 커서를 상세주소 필드로 이동한다.										                
														
										                $("div[id=addressInfoDetail]").css("display","");
										                $("div[id=addressInfoDetail]").focus();
										            }
										        }).open();
										       
										    }
										</script>	
												
											</li>
										</ul>
										
										<!-- 
										<div class="saves">
											<div class="pp"><label class="checkbox"><input type="checkbox" id="order_payment_adrs_insert_yn" checked value="Y"><span class="txt" ><em class="tt">등록한 정보를 회원정보에 반영합니다. (휴대폰번호/주소)</em></span></label></div>
											<div class="pp"><label class="checkbox"><input type="checkbox" id="order_payment_adrs_dft_yn" checked value="Y"><span class="txt" ><em class="tt">기본 배송지로 등록</em></span></label></div>
										</div>
										 -->
									</div>
							</c:if>
						</section>
						
						
<script type="text/javascript">

	function changeDel() {
		
		$.ajax({
			url : "changeDel.do"
				, type : "GET"
				, dataType : "text"
				,cache:false
				,success: function(result) {
					$(".addr").empty();
					$(".addr").append(result);
				}
		});
	}
								
	function undoDel() {
								
		$.ajax({
			url : "undoDel.do"
				, type : "GET"
				, dataType : "text"
				, data : { "mem_code" : ${ mem_code } }
				,cache:false
				,success: function(result) {
					$(".addr").empty();
					$(".addr").append(result);
				}
		});
}
							
</script>
						
	
				<input type="hidden" id="preBookYn" value="N" />
				<section class="sect deli">
					<div class="hdts">
						<span class="tit">상품배송</span>
					</div>
					<div class="cdts">
						<ul id="dlvrArea" class="drlist">
							<li><label class="radio"> <input type="radio"
									name="rdb_deli_a" value="1">
									<div class="txt iconArea icon_20">
										<div class="hdd">
											<span class="tts">당일배송</span>
										</div>
										<div class="cdd pd_tog_box" style="display: none;">
											<ul class="lst">
												<li>
													<div class="tt">${shopDTO.item_name }</div>
													<div class="tt">${shopDTO.item_name }</div>
													<div class="ts">${totalCnt }개 / ${shopDTO.item_price * totalCnt }원</div>
												</li>
											</ul>
										</div>
									</div>
							</label></li>
							<li><label class="radio"> <input type="radio"
									name="rdb_deli_a" value="2">
									<div class="txt iconArea icon_21">
										<div class="hdd">
											<span class="tts">새벽배송</span>
										</div>
										<div class="cdd pd_tog_box" style="display: none;">
											<ul class="lst">
												<li>
													<div class="tt">${shopDTO.item_name }</div>
													<div class="tt">${shopDTO.item_name }</div>
													<div class="ts">${totalCnt }개 / ${shopDTO.item_price * totalCnt }원</div>
												</li>
											</ul>
										</div>
									</div>
							</label></li>
							<li><label class="radio"> <input type="radio"
									name="rdb_deli_a" value="3">
									<div class="txt iconArea icon_10">
										<div class="hdd">
											<span class="tts">택배배송</span> <span class="msg"><span>1~2일
													소요 예정</span><span>16시 이전 주문 : 다음날 도착 (98%)<br>16시 이후
													주문 : 2일 이내 도착
											</span></span>
										</div>
										<div class="cdd pd_tog_box " style="display: none;">
											<ul class="lst">
												<li>
													<div class="tt">${shopDTO.item_name }</div>
													<div class="tt">${shopDTO.item_name }</div>
													<div class="ts">${totalCnt }개 / ${shopDTO.item_price * totalCnt }원</div>
												</li>
											</ul>
										</div>
									</div>
							</label></li>
						</ul>
					</div>
				</section>
				<c:if test="${totalPrice >20000 }">
					<section class="sect disc" id="existCoupon">
						<div class="hdts">
							<span class="tit">할인 혜택</span>
						</div>
						<div class="cdts">
							<div class="cpset">
								<!-- @@ 02.22 변경 -->
								<div class="ht">상품/배송비 쿠폰</div>
								<div class="dt">
									<input type="hidden" id="tot_goods_cp_dc_amt"
										name="tot_goods_cp_dc_amt" value="0" /> <input type="hidden"
										id="tot_dlvr_cp_dc_amt" name="tot_dlvr_cp_dc_amt" value="0" />
									<em class="prc"><b class="p"
										id="tot_goodsdlvr_cp_dc_amt_view">${item_fee }</b><i class="w">원</i></em>
									<span class="txt">할인적용</span>
								</div>
							</div>
							<!-- <div class="nodata"><p class="p">사용 가능한 할인 쿠폰이 없습니다.</p></div> -->
						</div>
					</section>
				</c:if>
				<c:if test="${totalPrice <20000 }">
					<section class="sect disc" id="notExistCoupon"
						style="display: none">
						<div class="hdts">
							<span class="tit">할인 혜택</span>
						</div>
						<div class="cdts">
							<div class="nodata">
								<p class="p">사용 가능한 할인 쿠폰이 없습니다.</p>
							</div>
						</div>
					</section>
				</c:if>
				<input type="hidden" id="gsPntRate" value="0.001">

				<section class="sect pont">
					<div class="hdts">
						<span class="tit">GS&POINT</span>
					</div>
					<div class="cdts" id="getGsPointDiv">
						<div class="ptset">
							<span class="input amt"><input type="text" value=""
								disabled></span> <a href="javascript:;" class="btn md d"
								id="getGsPointBtn" onclick="selectCertType('gsPoint')">포인트
								조회</a>
						</div>
					</div>
					<div class="cdts" id="useGsPointDiv" style="display: none">
						<div class="ptset">
							<span class="input amt"><input type="text" id="useGsPoint"
								name="useGsPoint" value="0"
								onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"></span>
							<input type="hidden" id="order_payment_use_gs_point" value="0">
							<a href="javascript:;" class="btn md d btnAll"
								onclick="useAllGsPoint('Y', '');">모두 사용</a>
						</div>
						<div class="ptt">
							<b class="t">사용 가능한 포인트</b> <em class="prc"><b class="b"
								id="usableGsPointTxt"></b><i class="w">P</i></em> <b class="t">(포인트
								10p부터 사용 가능)</b> <input type="hidden" id="usableGsPoint" value="0">
						</div>

					</div>
				</section>

				<script type="text/javascript">
							$("label.radio").click(function(event) {
								$(".pd_tog_box").removeClass("open");
								$(".pd_tog_box").css("display","none");
								
								
								$(this).find('div.cdd').css("display","");
								$(this).find('div.cdd').addClass("open");
								var dr_code = $(this).children().val();
								$(this).children().attr('id','dt_code');
							
								
								var form = document.getElementById("order_payment_form");		
								var input1 = document.createElement("input");
								
								input1.setAttribute("type", "hidden");
								input1.setAttribute("name", "dr_code");
								input1.setAttribute("value", dr_code);
								
								form.appendChild(input1);
								
							});
							
							
							$("#useGsPoint").keyup(function(event) {
								if($(this).val()>10){
								$("#order_payment_gs_point_view").text($(this).val())
								}
							});
						</script>

				<script type="text/javascript">
						function selectCertType(text) {
							$("span.disabled").children("input[type=text]").attr("disabled",false);
							$("span.disabled").children("input[type=text]").val(0);
							$("#getGsPointDiv").css("display","none");
							$("#useGsPointDiv").css("display","");
							
							
							$.ajax({
								url : "/AboutPet/Project/aboutPet/memberPoint.do"
									, type : "GET"
									, dataType : "text"
									, data : {
										"mem_code":${mem_num}
									}
									,cache:false
									,success: function(result) {
										$("#usableGsPointTxt").text(result);
										$("#usableGsPoint").val(result);
									}
							});
							
						}
						
						</script>


				<section class="sect binf">
					<div class="hdts">
						<span class="tit">결제 수단</span>
					</div>
					<div class="cdts">
						<ul class="bilist">
							<li id="commonPayLi">
								<div class="hht">
									<label class="radio" onclick="selectCommonPayment();">
										<input type="radio" name="rd_bill_set" id="commonPay"
										value="common">
										<div class="txt">
											<em class="tt">일반 결제</em>
										</div>
									</label>
								</div>
								<div class="ddt">
									<ul class="biltab">
										<li class="card active " id="cardLi"><button
												type="button" data-ui-tab-btn="tab_bils"
												data-ui-tab-val="tab_bils_1" class="btn" value="10"
												onclick="selectPayMethod('10');">
												<span class="txt">신용카드</span>
											</button></li>
									</ul>
									<div data-ui-tab-ctn="tab_bils" data-ui-tab-val="tab_bils_1">
										<div class="cardinfo">
											<!--@@ 02.17 추가 -->
											<div class="select cd">
												<select id="order_payment_cardc" name="order_payment_cardc">
													<option value="" selected>카드선택</option>
													<option value="BC카드">BC카드</option>
													<option value="KB국민카드">KB국민카드</option>
													<option value="삼성카드">삼성카드</option>
													<option value="신한카드">신한카드</option>
													<option value="현대카드">현대카드</option>
													<option value="롯데카드">롯데카드</option>
													<option value="씨티카드">씨티카드</option>
													<option value="NH농협카드">NH농협카드</option>
													<option value="수협카드">수협카드</option>
													<option value="우리카드">우리카드</option>
													<option value="하나카드">하나카드</option>
													<option value="광주카드">광주카드</option>
													<option value="전북카드">전북카드</option>
													<option value="제주카드">제주카드</option>
												</select>
											</div>
											<div class="select nm">
												<select id="order_payment_halbu" name="order_payment_halbu"
													onchange="selHalbu(this.value);">
													<option value="00" selected>일시불</option>
												</select>
											</div>
										</div>
									</div>
									<div data-ui-tab-ctn="tab_bils" data-ui-tab-val="tab_bils_2"></div>
									<div data-ui-tab-ctn="tab_bils" data-ui-tab-val="tab_bils_3"></div>
									<div data-ui-tab-ctn="tab_bils" data-ui-tab-val="tab_bils_4"></div>
									<div data-ui-tab-ctn="tab_bils" data-ui-tab-val="tab_bils_5"></div>
									<div data-ui-tab-ctn="tab_bils" data-ui-tab-val="tab_bils_6"></div>
								</div>
							</li>
						</ul>
						<div class="defbilchk" onclick="checkedDefaultPayMethod();">
							<label class="checkbox" onclick="checkedDefaultPayMethod();">
								<input type="checkbox" id="order_payment_default_pay_method"
								checked> <span class="txt">기본 결제수단으로 저장</span>
							</label>
						</div>
					</div>
				</section>

				<script type="text/javascript">
							$(document).ready(function() {
								$("#commonPay").click();
							});
							$("#order_payment_cardc").on("change",function(event){
								$("#payMethod").val($(this).val());
							});	
							
							</script>

				<section class="sect bprc">
					<div class="hdts">
						<span class="tit">결제 금액</span>
					</div>
					<div class="cdts">
						<ul class="prcset">
							<li>
								<div class="dt">총 상품금액</div>
								<div class="dd">
									<span class="prc"><em class="p">${totalPrice}</em><i
										class="w">원</i></span> <input type="hidden"
										id="order_payment_total_goods_amt" name="totGoodsAmt"
										value="${totalPrice}" />
								</div>
							</li>

							<c:if test="${totalPrice >20000}">
								<li id="couponDcLi">
									<div class="dt">쿠폰 할인</div>
									<div class="dd">

										<span class="prc dis"><em class="p"
											id="order_payment_total_dc_amt_view">${item_fee }</em><i
											class="w">원</i></span> <input type="hidden"
											id="order_payment_total_dc_amt" value="0" />
									</div>
								</li>
							</c:if>
							<li id="pointDcLi">
								<div class="dt">포인트 할인</div>
								<div class="dd">
									<span class="prc dis"><em class="p"
										id="order_payment_gs_point_view">0</em><i class="w">P</i></span> <input
										type="hidden" id="order_payment_gs_point" value="0" />
								</div>
							</li>
							<li>
								<div class="dt">배송비</div>
								<div class="dd">
									<span class="prc"><em class="p"
										id="tt">${item_fee }</em><i
										class="w">원</i></span> <input type="hidden" id="gb_01_total_dlvr_amt"
										value="0" /> <input type="hidden" id="item_fee"
										value="${item_fee }" /> <input type="hidden"
										id="order_payment_total_dlvr_amt" value="0" />
								</div>
							</li>
						</ul>
						<div class="tot">
							<div class="dt">총 결제금액</div>
							<div class="dd">
								<span class="prc"><em class="p"
									id="order_payment_total_pay_amt_view"></em><i class="w">원</i></span> <input
									type="hidden" id="order_payment_total_pay_amt_ex_point"
									name="order_payment_total_pay_amt_ex_point" value="0" /> <input
									type="hidden" id="order_payment_total_pay_amt"
									name="order_payment_total_pay_amt" value="6500" />
							</div>
						</div>

						<script type="text/javascript">
								$(document).ready(function() {
								var cupon = $("#order_payment_total_dc_amt_view").text();
								var totalPay = ${totalPrice + item_fee } - cupon;	
								$("#order_payment_total_pay_amt_view").text(totalPay);
								});
								
								$("#useGsPoint").keyup(function(event) {
									var cupon = $("#order_payment_total_dc_amt_view").text();
									var totalPay = ${totalPrice + item_fee } - cupon;
									
										
										totalPay = totalPay - $("#useGsPoint").val();
										$("#order_payment_total_pay_amt_view").text(totalPay);
										$("#order_payment_total_pay_amt_ex_point").val(totalPay);

									});
								
								
								
								
								</script>
						<div class="gdpnt">
							구매확정 후 GS&POINT <em class="p"
								id="order_payment_total_save_amt_view"></em>
						</div>
						<input type="hidden" name="mem_point"
							id="order_payment_total_save_amt" value="" />
					</div>
				</section>

				<script type="text/javascript">
						
						$("#useGsPoint").blur( function(event) {
							var mem_point = $("#usableGsPointTxt").text();
							//alert(mem_point);
							mem_point = mem_point - $("#useGsPoint").val();
							$("#order_payment_total_save_amt_view").text(mem_point);
							$("#order_payment_total_save_amt").val(mem_point);
						});
						
						</script>
				<section class="sect agre">
					<div class="hdts"></div>
					<div class="cdts">
						<!-- <ul class="agreeset">
									<li class="all">
										<span class="checkbox">
											<input type="checkbox" id="chkAllTerms" name="chkAllTerms" onclick="selectAll(this)">
											<span class="txt"><em class="tt st">주문상품 및 결제대행 이용약관에 모두 동의합니다.</em></span>
										</span>
									</li>
									<li>
										<span class="checkbox">
											<input type="checkbox" id="chk1" name="ordTerms" onclick="checkSelectAll()">
											<span class="txt"><em class="tt">주문할 상품의 상품명, 상품가격, 배송정보를 확인하였으며, 구매에 동의하시겠습니까?(전자상거래법 제8조 제2항)</em></span>
										</span>
									</li>
									<li>
										<span class="checkbox">
											<input type="checkbox" id="chk2" data-terms-no="48" id="terms_48" data-index="4" name="ordTerms" onclick="checkSelectAll()">
											<span class="txt"><a href="javascript:;" name="termPopBtn" data-index="4" class="tt lk">개인정보 수집 및 이용 동의</a></span>
										</span>
									</li>
								</ul> -->
						<ul class="agreeset">
							<li class="all"><span class="checkbox"> <input
									type="checkbox" id="chkAllTerms" name="chkAllTerms"
									onclick="selectAll(this)"> <span class="txt"><em
										class="tt st">주문상품 및 결제대행 이용약관에 모두 동의합니다.</em></span>
							</span></li>
							<li><span class="checkbox"> <input type="checkbox"
									id="chk1" name="ordTerms" onclick="checkSelectAll()"> <span
									class="txt"><em class="tt">주문할 상품의 상품명, 상품가격, 배송정보를
											확인하였으며, 구매에 동의하시겠습니까?(전자상거래법 제8조 제2항)</em></span>
							</span></li>
						</ul>
						<div class="bts">
							<a href="javascript:;" name="contentPopBtn"
								class="btn a lg btnBill" onclick="payDone()"> <span
								class="prc"><em class="p"
									id="order_payment_end_pay_amt_view">${totalPrice}</em><i
									class="w">원</i></span> <span class="txt">결제하기</span>
							</a>
						</div>
					</div>
				</section>
			</div>
			<script type="text/javascript">
			
			
					
					function payDone() {
						
						var form = document.createElement("form");		//
						document.body.appendChild(form);					
						form.setAttribute("method", "POST");
						form.setAttribute("action", "itemOrder.do");

						var mem_code = document.createElement('input');
						mem_code.setAttribute('type', 'hidden');
						mem_code.setAttribute('name', 'mem_code');
						mem_code.setAttribute('value', "${ mem_num }");
						form.appendChild(mem_code);
						
						var mem_name = document.createElement('input');
						mem_name.setAttribute('type', 'hidden');
						mem_name.setAttribute('name', 'mem_name');
						mem_name.setAttribute('value', "${ orderDTO.mem_name }");
						form.appendChild(mem_name);
						
						var adr_code =document.createElement('input');
						adr_code.setAttribute('type', 'hidden');
						adr_code.setAttribute('name', 'adr_code');
						adr_code.setAttribute('value', "${ orderDTO.adr_code }");
						form.appendChild(adr_code);
						
						var adr_name = document.createElement('input');
						adr_name.setAttribute('type', 'hidden');
						adr_name.setAttribute('name', 'adr_name');
						adr_name.setAttribute('value', $("input[id=adr_name]").val());
						form.appendChild(adr_name);

						var adr_detail = document.createElement('input');
						adr_detail.setAttribute('type', 'hidden');
						adr_detail.setAttribute('name', 'adr_detail');
						if ( $("div[id=addressInfo]").text() != "" ) {						
							adr_detail.setAttribute('value', $("div[id=addressInfo]").text() + " " + $("input[id=adr_detail]").val() );
						} else {
						 	adr_detail.setAttribute('value', $("input[id=adr_detail]").val() );
						}
						form.appendChild(adr_detail);
						
						var recipient = document.createElement('input');
						recipient.setAttribute('type', 'hidden');
						recipient.setAttribute('name', 'recipient');
						recipient.setAttribute('value', $("input[id=recipient]").val());
						form.appendChild(recipient);
						
						var d_contact = document.createElement('input');
						d_contact.setAttribute('type', 'hidden');
						d_contact.setAttribute('name', 'd_contact');
						d_contact.setAttribute('value', $("input[id=d_contact]").val());
						form.appendChild(d_contact);
						
						var f_price = document.createElement('input');
						f_price.setAttribute('type', 'hidden');
						f_price.setAttribute('name', 'f_price');
						f_price.setAttribute('value', " ${ totalPrice }");
						form.appendChild(f_price);
						
						var item_fee = document.createElement('input');
						item_fee.setAttribute('type', 'hidden');
						item_fee.setAttribute('name', 'item_fee');
						item_fee.setAttribute('value', $("input[id=item_fee]").val());
						form.appendChild(item_fee);
						
						
						alert($("#order_payment_cardc").val());
						var card = $("#order_payment_cardc").val();
						var card_input = document.createElement('input');
						card_input.setAttribute('type', 'hidden');
						card_input.setAttribute('name', 'card');
						card_input.setAttribute('value',card);
						form.appendChild(card_input);
						
						var mem_point= $("#order_payment_total_save_amt").val();
						var mem_point_input = document.createElement('input');
						mem_point_input.setAttribute('type', 'hidden');
						mem_point_input.setAttribute('name', 'mem_point');
						mem_point_input.setAttribute('value',mem_point);
						form.appendChild(mem_point_input);
						
							
						var dt_code = $("#dt_code").val();
						var input1 = document.createElement("input");
						input1.setAttribute("type", "hidden");
						input1.setAttribute("name", "dt_code");
						input1.setAttribute("value", dt_code);
						
						form.appendChild(input1);
						
						
	

						form.submit();
						
					}
					</script>
			<div class="banners">
				<div class="uibanners">
					<div class="banner_slide">
						<div class="swiper-container slide">
							<ul class="swiper-wrapper list"></ul>
							<div class="swiper-pagination"></div>
							<div class="sld-nav">
								<button type="button" class="bt prev">이전</button>
								<button type="button" class="bt next">다음</button>
							</div>
							<!-- @@ 03.18 추가 -->
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</main>
<script type="text/javascript">
		
		
		
		</script>
<!-- location 영역 포함  -->
<!-- e : 본문영역 -->

<!-- s : layerPop 영역 -->
<!-- popup 내용 부분입니다. -->
<article class="popLayer a popDeliReq noClickClose" id="popDeliReq1">
</article>

<article class="popLayer a popCardinput noClickClose" id="popCardinput"></article>

<article class="popLayer a popBilPwdMod noClickClose"
	id="popBilPwdConfirm"></article>

<article class="popLayer a popDeliPop" id="popupAddressList1">
</article>

<article class="popLayer a popDeliMod" id="addressAddPop"></article>

<article class="popLayer a popCoupon" id="popCoupon"></article>
<!-- 약관팝업 -->

<!-- 주소 검색 팝업 -->
<div class="layers" id="orderAddLayers"></div>

<div class="layers" style="display: none;">
	<!-- 이용 약관 -->

	<!-- 이용 약관 -->
</div>
<!-- e : layerPop 영역 -->

<!-- s : menubar 영역 -->
<script type="text/javascript">
	$(document).ready(function(){
		$("li[id^=liTag_]").one('click', function(){
			$(this).addClass("active");
	    });
		
	});
</script>

<nav class="menubar">
	<div class="inr">
		<ul class="menu">
			<!--  펫로그 파트너사인 경우 메뉴가 비활성 -->
			<li id="liTag_20" class="tv "><a href="#"
				onclick="location.href='https://aboutpet.co.kr:443/tv/home/'"
				class="bt"><span>TV</span></a></li>
			<li id="liTag_30" class="log "><a href="#"
				onclick="location.href='https://aboutpet.co.kr:443/log/home/'"
				class="bt"><span>로그</span></a></li>
			<li id="liTag_10" class="shop "><a href="#"
				onclick="location.href='https://aboutpet.co.kr:443/shop/home/'"
				class="bt"><span>샵</span></a></li>
			<li id="liTag_00" class="my "><a href="#"
				onclick="location.href='https://aboutpet.co.kr:443/mypage/indexMyPage/'"
				class="bt"><span>MY</span></a></li>
		</ul>
	</div>
</nav>
<!-- e : menubar 영역 -->

<!-- s : footer 영역 -->
<script type="text/javascript">
	/* 사업자정보 팝업 */
	function openLicensee(licensee) {
		var url = "http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no="+licensee;
		window.open(url, "communicationViewPopup", "width=750, height=700;");
	}
	
	/* Escrow */
	function openEscrow() {
		var options = {
			url : "/introduce/terms/indexEscrow",
			params : {},
			width : 640,
			height: 690,
			callBackFnc : "",
			modal : true
		};
		pop.open("escrow", options);
	}
	
	// 이용약관 pop
	function openTerms(termsCd , settingYn){
		if("false" == "true"){
			var url = "/introduce/terms/indexTermsApp?termsCd="+ termsCd +"&settingYn="+ settingYn;
			window.open(url, "termsContentPop");
		}else{
			var options = {
				url : "/introduce/terms/indexTerms"
				, data : {
					termsCd : termsCd
					, settingYn : settingYn
				}
				, dataType : "html"
				, done : function(html){
					$("#layers").html(html);
					ui.popLayer.open("termsContentPop");
				}
			}
			ajax.call(options);
		}
	}
	// 입점/제휴 문의 pop
	function openPartnershipInquiry(){
			var options = {
				url : "/customer/notice/indexPartnerNoticeList"
				, data : ''
				, dataType : "html"
				, done : function(html){
					$("#layers").html(html);
					ui.popLayer.open("popInqry");
				}
			}
			ajax.call(options);
		} 
	function convertVerBtn(gb){
		if(gb == 'MO'){
			$.cookie("DEVICE_GB", "MO",  {path: '/'});
	 		window.location.reload();
		}else{
			$.cookie("DEVICE_GB", "PC",{path: '/'});
	 		window.location.reload();
		}		
	}
</script>

<!-- footer -->
<footer class="footer" id="footer">
	<div class="inr">
		<div class="link">
			<ul class="list">
				<li><a href="#"
					onclick="openTerms('2001' , 'Y'); return false;">서비스 이용약관</a></li>
				<li><a href="#"
					onclick="openTerms('2002' , 'Y'); return false;">개인정보 처리방침</a></li>
				<li><a href="#" onclick="openPartnershipInquiry()">입점/제휴 문의</a></li>
				<!-- 무조건 모바일웹으로 들어간 1경우에만 나타나게 만들기 -->
		</div>
		<div class="info">
			<ul class="list">
				<li>(주)어바웃펫 대표 : 김경환, 나옥귀</li>
				<li>사업자 등록번호 : 120-87-90035</li>
				<li class="dn">통신판매업신고번호 : 제 2020-서울강남-03142호</li>
				<li>개인정보관리자 : 정명성 hello@aboutpet.co.kr</li>
				<li>TEL : 1644-9601</li>
			</ul>
			<p class="adr">서울특별시 강남구 테헤란로 151 (역삼하이츠빌딩) 지하2층</p>
		</div>
		<div class="copy">&copy; copyright (c) www.aboutpet.co.kr all
			rights reserved.</div>
	</div>
</footer>
<!--// footer -->

<div id="layers"></div>
<!-- e : footer 영역 -->
</div>
</body>
</html>

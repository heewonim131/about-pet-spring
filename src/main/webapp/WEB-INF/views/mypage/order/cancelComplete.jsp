<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<main class="container lnb page shop my" id="container">
<div class="inr" style="min-height: 465px;">
<!-- 본문 -->
<div class="contents" id="contents" style="min-height: 637px;">
<!--
		<div class="pc-tit">
			<h2>취소완료</h2>
		</div>
		-->
<div class="exchange-area pc-reposition success2">
	<div class="complete i1">
		<!-- i1 : 취소 //i2 : 반품  //i3 : 교환 // -->
	<span>주문 취소</span>가 완료되었습니다.
</div>
<div class="item-box pc-reposition">
	<p class="tit">예상 환불 금액</p>
	<div class="price-area">
		<div class="gray-box">
			<div class="list">
				<ul>
					<li>
						<p class="txt1">환불 금액</p>
						<p class="txt2">${ return_amt }원</p>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div class="item-box pc-reposition">
	<p class="tit pc-m0">환불수단</p>
	<p class="order-text">
		<!-- <strong>일반결제</strong>간편카드 -->
		${ pd_method }
	</p>
	<div class="info-txt pc-reposition">
		<ul>
			<li>주문 시 결제 수단으로 환불됩니다.<br>단, 가상계좌의 경우 입력하신 환불 계좌로
				환불됩니다.
			</li>
			<li>결제수단에 따라 환불 소요 기간에 차이가 있습니다.&nbsp;(영업일 기준)<br>신용카드
				: 3~7일 소요<br>실시간 계좌이체 : 2일 소요<br>가상계좌 : 1일 소요
			</li>
			<li>카드사/은행 사정에 따라 환불 일정이 달라질 수 있습니다.</li>
		</ul>
	</div>
</div>


<!-- // 04.06 : 추가 -->
<div class="btnSet space pc-reposition">
	<a href="/mypage/order/indexClaimList" data-content=""
		data-url="/mypage/order/indexClaimList" class="btn lg d">취소/반품/교환
		목록</a> <a href="/shop/home/" class="btn lg b">계속 쇼핑하기</a>
</div>
	<!-- 
	<div class="cart-add pc-reposition">
		<p class="tit">
			상품을 다시 장바구니에 <br> 담으시겠어요?
		</p>
		<div class="scroll-x">
			<div
				class="scroll swiper-container swiper-container-initialized swiper-container-horizontal">
				<ul class="scroll-list swiper-wrapper"
					style="transform: translate3d(0px, 0px, 0px);">
		<li class="swiper-slide swiper-slide-active"
			style="width: 311.333px; margin-right: 18px;">
			<div class="cart">
				<div class="pic">
					<a href="/goods/indexGoodsDetail?goodsId=PI000013349"
						data-url="/goods/indexGoodsDetail?goodsId=PI000013349">
						<img
						src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/PI000013349/PI000013349_1.jpg?type=f&amp;w=259&amp;h=259&amp;quality=90&amp;align=4"
						alt="내추럴키티 스팀 참치뱃살 30g" class="img">
					</a>
				</div>
				<div class="name">
					<div class="tit">내추럴키티 스팀 참치뱃살 30g</div>
					<div class="stt">1개 / 기본단품</div>
					<div class="price">
						<span class="prc"><em class="p">1,700</em><i
							class="w">원</i></span>
				</div>
				<a href="javascript:;"
					onclick="cartGoods.insertCart('PI000013349', '355374', '', '', '', 'N');"
					data-content="PI000013349"
								data-url="https://aboutpet.co.kr/order/indexCartList/"
								class="btn sm icon2">담기</a>
						</div>
					</div>
				</li>
			</ul>
			<div class="swiper-pagination"></div>
			<span class="swiper-notification" aria-live="assertive"
				aria-atomic="true"></span>
		</div>
		<div class="remote-area">
			<button class="swiper-button-next swiper-button-disabled"
				type="button" tabindex="0" role="button" aria-label="Next slide"
				aria-disabled="true"></button>
			<button class="swiper-button-prev swiper-button-disabled"
				type="button" tabindex="0" role="button"
				aria-label="Previous slide" aria-disabled="true"></button>
				</div>
			</div>
		
		</div>
		 -->	
			</div>
		</div>

	</div>
</main>
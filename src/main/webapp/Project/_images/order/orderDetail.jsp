<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<main class="container lnb page shop order my" id="container">

	<form id="claim_request_list_form">
		<input type="hidden" id="delivery_detail_ord_no" name="ordNo" value="">
		<input type="hidden" id="delivery_detail_ord_dtl_seq" name="ordDtlSeq"
			value=""> <input type="hidden" id="clm_tp_cd" name="clmTpCd"
			value=""> <input type="hidden" id="clm_rsn_cd"
			name="clmRsnCd" value=""> <input type="hidden" id="mngb"
			name="mngb" value="OD">
	</form>

	<div class="inr" style="min-height: 467px;">
<!-- 본문 -->
<div class="contents" id="contents" style="min-height: 639px;">
<!-- PC 타이틀 모바일에서 제거  -->
<div class="pc-tit">
	<h2>주문 상세</h2>
</div>
<!-- // PC 타이틀 모바일에서 제거  -->
<!-- 주문 배송 -->

<div class="delivery-oder-area">
	<div class="inr-box border-on">
		<div class="item-list">
			<div class="top" style="padding-top: 0;">
<div class="tit">
	<p class="data">
		<fmt:formatDate value="${ odto.ord_date }" pattern="yyyy.MM.dd" />
</p>
<span class="icon-left-gap">주문번호 ${ odto.ord_code }</span>
</div>
<c:choose>
<c:when
	test="${ (odto.ord_status eq '결제완료') or (odto.ord_status eq '배송준비중') }">
<a href="javascript:void(0);" class="btn sm ord-del-btn"
	data-content="${ odto.ord_code }"
data-url="/mypage/order/orderDelete"
onclick="location.href='${pageContext.request.contextPath}/Project/mypage/order/cancelReq.do?ordNo=${ odto.ord_code }&oddNo=all'">
전체주문취소 </a>
</c:when>
<c:otherwise>
<a href="javascript:void(0);" class="btn sm ord-del-btn"
	data-content="${ odto.ord_code }"
data-url="/mypage/order/orderDelete"
onclick="orderDeliveryListBtn.goOrderDelete('${ odto.ord_code }');return false;">
주문내역삭제 </a>
</c:otherwise>
</c:choose>
</div>
<!-- 취소아이템리스트 -->
<!-- orderstatus는 주문취소가 아닌데 oilist oitem의 cc_code가 널이 아니면 -->
<c:forEach items="${ oilist }" var="oitem">
<c:if test="${ odto.ord_code eq oitem.ord_code }">
<c:if
	test="${ (odto.ord_status ne '주문취소') and (oitem.cc_code ne null) }">

<div class="bottom">
	<div class="t-box">
		<p class="tit t2">주문취소</p>
		<p
			class="icon-t 
<c:if test="${ (odto.dt_type eq '택배') or (odto.dt_type eq '업체') }">t2</c:if>
<c:if test="${ odto.dt_type eq '새벽' }">t3</c:if>">
		<!-- x 당일 / t2 택배 / t2 업체  -->
		${ odto.dt_type }배송
	</p>
</div>

<div class="g-box dlvr-current-status">
	<p class="lt">결제 취소 : 영업일 기준 3~7일 소요</p>
</div>

<div class="float-bx">
	<div class="untcart">
		<!-- .disabled -->
		<div class="box">
			<div class="tops">
				<div class="pic">
					<a href="javascript:void(0);"
						data-content="${ oitem.ord_code }"
						data-url="/mypage/orderDetail.do?ordNo=${ oitem.ord_code }"
						onclick="location.href='orderDetail.do?ordNo=${ oitem.ord_code }');">
						<img src="${ oitem.item_img }"
						alt="${ oitem.item_name }" class="img">
					</a>
				</div>
				<div class="name">
					<div class="tit k0421">
						<a href="javascript:void(0);"
							data-content="${ oitem.ord_code }"
							data-url="/mypage/orderDetail.do?ordNo=${ oitem.ord_code }"
							onclick="location.href='orderDetail.do?ordNo=${ oitem.ord_code }');">${ oitem.item_name }</a>
					</div>
					<div class="stt">
						${ oitem.odd_cnt }개
						<c:if test="${ oitem.opt_name ne null }">/ ${ oitem.opt_name }</c:if>
					</div>
					<div class="prcs">
						<span class="prc"><em class="p"><fmt:formatNumber
									value="${ oitem.item_price }" /></em><i class="w">원</i></span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="btn-bx pc-t2">
		<div class="btnSet">
			<a href="javascript:void(0);"
				data-content="${ odto.ord_code }"
				data-url="/mypage/order/indexClaimDetail?clmNo=${ odto.ord_code }"
				onclick="orderDeliveryListBtn.goOrderClaimDetail('${ odto.ord_code }','10' )"
					class="btn c"> 취소 상세 </a>
			</div>
		</div>

	</div>
</div>
</c:if>
</c:if>
</c:forEach>


<div class="bottom">
	<div class="t-box">
		<p
			class="tit
<c:if test="${ (odto.ord_status eq '결제완료') or (odto.ord_status eq '배송중') or (odto.ord_status eq '배송준비중') }">t3</c:if>
<c:if test="${ (odto.ord_status eq '주문취소') or (odto.ord_status eq '상품교환') or (odto.ord_status eq '상품반품') }">t2</c:if>">
${ odto.ord_status }</p>
<p
	class="icon-t 
<c:if test="${ (odto.dt_type eq '택배') or (odto.dt_type eq '업체') }">t2</c:if>
<c:if test="${ odto.dt_type eq '새벽' }">t3</c:if>">
${ odto.dt_type }배송</p>
</div>

<div class="g-box">
	<p class="lt">
		<c:if
test="${ (odto.ord_status eq '결제완료') or (odto.ord_status eq '배송준비중') or (odto.ord_status eq '배송중') or (odto.ord_status eq '상품교환') }">
<c:choose>
	<c:when test="${ odto.dt_type eq '당일' }">
		<fmt:formatDate value="${ odto.ord_date }"
			pattern="MM월 dd일(E)" /> 도착 예정</c:when>
	<c:when test="${ odto.dt_type eq '새벽' }">
		<fmt:formatDate value="${ odto.ord_date }"
			pattern="MM월 dd일(E)" /> 도착 예정</c:when>
	<c:when test="${ odto.dt_type eq '택배' }">배송 평균 1~2일 소요 예정</c:when>
	<c:when test="${ odto.dt_type eq '업체' }">배송 평균 2~7일 소요 예정</c:when>
</c:choose>
</c:if>
<c:if test="${ odto.ord_status eq '주문취소'}">결제 취소 : 영업일 기준 3~7일 소요</c:if>
<c:if test="${ odto.ord_status eq '상품반품'}">결제 환불 : 영업일 기준 3~7일 소요</c:if>
<c:if
	test="${ (odto.ord_status eq '배송완료') or (odto.ord_status eq '구매확정') }">
<fmt:formatDate value="${ odto.d_time }" pattern="MM월 dd일(E)" /> 배송 완료</c:if>
</p>
<c:if
	test="${ (odto.dt_type eq '택배') and ( (odto.ord_status eq '배송중') or (odto.ord_status eq '배송완료') or (odto.ord_status eq '구매확정') ) }">
<a href="javascript:;" class="detail-btn" data-target="order"
	data-action="goodsflow"
	data-url="https://aboutpet.co.kr/mypage/order/goodsflow/599693">배송조회</a>
</c:if>
</div>


<c:forEach items="${ oilist }" var="oitem">
<c:if test="${ oitem.cc_code eq null }">
<div class="float-bx">
	<div class="untcart">
		<!-- .disabled -->
	<div class="box">
		<div class="tops">
			<div class="pic">
				<a href="javascript:void(0);"
					data-content="${ oitem.ord_code }"
					data-url="/mypage/order/indexDeliveryDetail?ordNo=${ oitem.ord_code }"
					onclick="orderDeliveryListBtn.goOrderDetail('${ oitem.ord_code }');return false;">
					<img src="${ oitem.item_img }" alt="${ oitem.item_name }"
					class="img">
				</a>
			</div>
			<div class="name">
				<div class="tit k0421">
					<a href="javascript:void(0);"
						data-content="${ oitem.ord_code }"
						data-url="/mypage/order/indexDeliveryDetail?ordNo=${ oitem.ord_code }"
						onclick="orderDeliveryListBtn.goOrderDetail('${ oitem.ord_code }');return false;">${ oitem.item_name }</a>
				</div>
				<div class="stt">
					${ oitem.odd_cnt }개
					<c:if test="${ oitem.opt_name ne null }">/ ${ oitem.opt_name }</c:if>
				</div>
				<div class="prcs">
					<span class="prc"><em class="p"><fmt:formatNumber
								value="${ oitem.item_price }" /></em><i class="w">원</i></span>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="btn-bx pc-t2">

	<c:choose>
		<c:when
			test="${ (odto.ord_status eq '결제완료') or (odto.ord_status eq '배송준비중') }">
			<div class="btnSet">
				<a href="/customer/inquiry/inquiryView?popupChk=popOpen"
					data-content="${ oitem.ord_code }"
					data-url="/customer/inquiry/inquiryView"
					class="btn c cs-btn">고객센터 문의</a>
			</div>
			<div class="btnSet">
				<a href="javascript:void(0);"
					data-content="${ oitem.ord_code }"
					data-url="/mypage/service/popupGoodsCommentReg"
					onclick="location.href='${pageContext.request.contextPath}/Project/mypage/order/cancelReq.do?ordNo=${odto.ord_code}&oddNo=${oitem.odd_code}'"
					class="btn c completeBtn">주문취소</a>
			</div>
		</c:when>
		<c:when test="${ odto.ord_status eq '주문취소' }">
			<div class="btnSet">
				<a href="javascript:void(0);"
					data-content="${ odto.ord_code }"
					data-url="/mypage/order/indexClaimDetail?clmNo=${ odto.ord_code }"
					onclick="orderDeliveryListBtn.goOrderClaimDetail('${ odto.ord_code }','10' )"
					class="btn c"> 취소 상세 </a>
			</div>
		</c:when>
		<c:when test="${ odto.ord_status eq '상품교환' }">
			<div class="btnSet">
				<a href="javascript:void(0);"
					data-content="${ odto.ord_code }"
					data-url="/mypage/order/indexClaimDetail?clmNo=${ odto.ord_code }"
					onclick="orderDeliveryListBtn.goOrderClaimDetail('${ odto.ord_code }','10' )"
					class="btn c"> 교환 상세 </a>
			</div>
		</c:when>
		<c:when test="${ odto.ord_status eq '상품반품' }">
			<div class="btnSet">
				<a href="javascript:void(0);"
					data-content="${ odto.ord_code }"
					data-url="/mypage/order/indexClaimDetail?clmNo=${ odto.ord_code }"
					onclick="orderDeliveryListBtn.goOrderClaimDetail('${ odto.ord_code }','10' )"
					class="btn c"> 반품 상세 </a>
			</div>
		</c:when>
		<c:when
			test="${ (odto.ord_status eq '배송중') or (odto.ord_status eq '배송완료') }">
			<div class="btnSet">
				<a href="javascript:void(0);"
					onclick="cartGoods.insertCart('${ oitem.item_code }', '367898', '','','','N');"
					data-content="${ oitem.item_code }"
					data-url="https://aboutpet.co.kr/order/indexCartList/"
					class="btn c add-cart-btn">장바구니 담기</a> <a
					href="/customer/inquiry/inquiryView?popupChk=popOpen"
					data-content="${ oitem.ord_code }"
					data-url="/customer/inquiry/inquiryView"
					class="btn c cs-btn">고객센터 문의</a>
			</div>
			<div class="btnSet">
				<a href="javascript:void(0);"
					data-content="${ oitem.ord_code }"
					data-url="/mypage/service/popupGoodsCommentReg"
					onclick="orderDeliveryListBtn.openGoodsComment('${ oitem.item_code }','${ oitem.ord_code }','1', '', '');return false;"
					class="btn c completeBtn">구매확정</a>
			</div>
		</c:when>
		<c:when test="${ odto.ord_status eq '구매확정' }">
			<div class="btnSet">
				<a href="javascript:void(0);"
					onclick="cartGoods.insertCart('${ oitem.item_code }', '367898', '','','','N');"
					data-content="${ oitem.item_code }"
					data-url="https://aboutpet.co.kr/order/indexCartList/"
					class="btn c add-cart-btn">장바구니 담기</a> <a
					href="/customer/inquiry/inquiryView?popupChk=popOpen"
					data-content="${ oitem.ord_code }"
					data-url="/customer/inquiry/inquiryView"
					class="btn c cs-btn">고객센터 문의</a>
			</div>
			<div class="btnSet">
				<a href="javascript:void(0);"
					data-content="${ oitem.ord_code }"
					data-url="/mypage/service/popupGoodsCommentReg"
					onclick="orderDeliveryListBtn.openGoodsComment('${ oitem.item_code }','${ oitem.ord_code }','1', '', '');return false;"
					class="btn c completeBtn">후기작성</a>
			</div>
		</c:when>

	</c:choose>

	</div>

</div>
</c:if>
</c:forEach>


		</div>
	</div>
</div>

<div class="ordersets pc-cut">
	<section class="sect addr">
		<div class="hdts">
			<span class="tit">배송지</span>
		</div>
		<div class="cdts">
			<div class="adrset">
				<div class="name">
					<em class="t g">${ adto.adr_name }</em>
</div>
<div class="adrs">${ adto.adr_detail }</div>
<div class="tels">${ adto.recipient }/${ adto.contact }</div>
</div>
<div class="adrreq">
	<!-- 배송요청사항 노출을 위해 주석 -->
<div class="pwf">
	<em class="t"> ${ adto.dr_loc }</em> <em class="p"> 공동현관
비밀번호 입력&nbsp; ${ adto.dr_enter }</em>
<div class="txt custom_ellipsis_dlvr">${ adto.requests }</div>
			</div>
		</div>
	</div>
</section>
<section class="sect bprc">
	<div class="hdts">
		<span class="tit">결제 정보</span>
	</div>
	<div class="cdts">
		<ul class="prcset">

			<li>
				<div class="dt">상품금액</div>
				<div class="dd">
					<span class="prc"><em class="p"><fmt:formatNumber
			value="${ pdto.pm_price - fee }" /></em><i class="w">원</i></span>
	</div>
</li>
<li>
	<div class="dt">배송비</div>
	<div class="dd">
		<span class="prc"><em class="p"><fmt:formatNumber
			value="${ fee }" /></em><i class="w">원</i></span>
		</div>
	</li>
</ul>

<div class="tot">
	<div class="dt">최종 결제금액</div>
	<div class="dd">
		<span class="prc"><em class="p"><fmt:formatNumber
		value="${ pdto.pm_price }" /></em><i class="w">원</i></span>
			</div>
		</div>
	</div>
</section>

<section class="sect binf">
	<div class="hdts">
		<span class="tit">결제 수단</span>
	</div>
	<div class="cdts">
		<div class="result">
			<div class="hd">
				<em class="b">${ pdto.pd_method }</em>
<c:if test="${ pdto.pd_method eq '카드' }">
<a href="#" data-content="C202106190038509"
	data-url="/mypage/order/popupCreditCardByOrderNo"
	onclick="orderDeliveryDetailBtn.openCreditCard('petsbepe3m01012106190326573610');return false;"
	class="btn sm">카드영수증</a>
</c:if>
</div>
<div class="dd">
	<c:if test="${ pdto.pd_method eq '카드' }">체크카드 (1234-****-****-5678) / 일시불</c:if>
			</div>
		</div>
	</div>
</section>

<section class="sect bprc">
	<div class="hdts">
		<span class="tit">포인트 적립/혜택</span>
	</div>
	<div class="cdts">
		<ul class="prcset">
			<li>
				<div class="dt">
					구매 적립 <span class="alert_pop" data-pop="popCpnGud"> <span
						class="bubble_txtBox" style="width: 267px;"> <span
			class="tit">구매 적립</span> <span class="info-txt"> <span>
					<span> 결제 금액 기준 총 적립 포인트입니다. </span> <span> 포인트는
						구매확정 시 지급됩니다. </span> <span> 적립 포인트 산정 시 쿠폰 할인 금액, 배송비,
						취소/반품 상품 금액은 제외됩니다. </span>
			</span>
		</span>
	</span>
	</span>
</div>
<div class="dd">
	<span class="prc"> <em class="p"> ${ point }</em> <i
								class="w">P</i>
							</span>
						</div>
					</li>
				</ul>
			</div>
		</section>
		<div class="my_btnWrap t2">
			<div class="btnSet">
				<a href="orderList.do" data-content="" data-url="orderList.do"
					class="btn lg d">주문/배송 목록</a> <a href="shop_home.do"
					class="btn lg b">계속 쇼핑하기</a>
			</div>
		</div>

	</div>
</div>
<!-- // 주문 배송 -->

		</div>

	</div>
</main>
<script>
</script>

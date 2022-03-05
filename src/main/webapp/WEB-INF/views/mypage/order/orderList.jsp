<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="../../js/cart.js"></script>
<main class="container lnb page my" id="container">
	<div class="inr">
		<!-- 본문 -->
<div class="contents" id="contents">
	<div class="pc-tit">
		<h2>주문/배송</h2>
	</div>
	<!-- 주문 배송 -->
<div class="delivery-oder-area" id="deliveryList">
	<div class="inr-box piner">
		<div class="pc-re-po01">
			<div class="oder-step ptb_memOrderbox">
<!-- 				<nav class="menushop re-po01">
					<button type="button" class="bt st"></button>
					<div class="list">
						<ul class="menu">
							<li class="active"><a href="#" id="period_type_3"
								data-content="951865"
								data-url="/mypage/order/indexDeliveryList?page=1&rows=20&period=3&ordAcptDtmStart=2021-04-25&ordAcptDtmEnd=2021-07-24&arrOrdDtlStatCd="
								class="bt"
								onclick="orderDeliveryList.setPeriod(3);return false;">최근
			3개월</a></li>
	<li><a href="#" id="period_type_6" data-content="951865"
		data-url="/mypage/order/indexDeliveryList?page=1&rows=20&period=6&ordAcptDtmStart=2021-04-25&ordAcptDtmEnd=2021-07-24&arrOrdDtlStatCd="
		class="bt"
		onclick="orderDeliveryList.setPeriod(6);return false;">최근
			6개월</a></li>
	<li><a href="#" id="period_type_9" data-content="951865"
		data-url="/mypage/order/indexDeliveryList?page=1&rows=20&period=9&ordAcptDtmStart=2021-04-25&ordAcptDtmEnd=2021-07-24&arrOrdDtlStatCd="
		class="bt"
		onclick="orderDeliveryList.setPeriod(9);return false;">최근
			9개월</a></li>
	<li><a href="#" id="period_type_12" data-content="951865"
		data-url="/mypage/order/indexDeliveryList?page=1&rows=20&period=12&ordAcptDtmStart=2021-04-25&ordAcptDtmEnd=2021-07-24&arrOrdDtlStatCd="
		class="bt"
		onclick="orderDeliveryList.setPeriod(12);return false;">최근
			12개월</a></li>
	<li><a href="#" id="period_type_0" data-content="951865"
		data-url="/mypage/order/indexDeliveryList?page=1&rows=20&period=0&ordAcptDtmStart=2021-04-25&ordAcptDtmEnd=2021-07-24&arrOrdDtlStatCd="
		class="bt"
		onclick="orderDeliveryList.setPeriod(0);return false;">직접
					입력</a></li>
		</ul>
	</div>
</nav> -->
 <!-- open 클래스 추가 시 open -->
<!--
<div class="dummy-gray-line " style="margin-bottom: 10px;">
<div class="dummy-gray-line open">
	<div class="layout-date-picker noIcon">
		<span class="uiDate"><input type="text"
			value="2021.04.25" class="datepicker" title="날짜"
			id="delivery_start_dt" readonly="readonly"></span> <span
			class="gap-area">-</span> <span class="uiDate"><input
			type="text" value="2021.07.24" class="datepicker" title="날짜"
			id="delivery_end_dt" readonly="readonly"></span> <a href="#"
			data-content="951865"
			data-url="/mypage/order/indexDeliveryList?page=1&rows=20&period=3&ordAcptDtmStart=2021-04-25&ordAcptDtmEnd=2021-07-24&arrOrdDtlStatCd="
			onclick="orderDeliveryList.search();return false;"
		class="btn lg">조회</a>
					</div>
				</div>
			</div> -->
		</div>
	</div>
</div>

<div class="inr-box piner">
	<div class="oder-step">
		<div class="step-list">
			<ul>
				<li id="stepOne"><a href="#" data-content="951865"
					data-url="/mypage/order/indexDeliveryList?page=1&rows=20&period=3&ordAcptDtmStart=2021-04-25&ordAcptDtmEnd=2021-07-24&arrOrdDtlStatCd=110"
					onclick="orderDeliveryList.searchStauts('110','stepOne');return false;"><p
			class="num">0</p></a>
	<p class="txt">입금대기</p></li>
<li id="stepTwo"><a href="#" data-content="951865"
	data-url="/mypage/order/indexDeliveryList?page=1&rows=20&period=3&ordAcptDtmStart=2021-04-25&ordAcptDtmEnd=2021-07-24&arrOrdDtlStatCd=120"
	onclick="orderDeliveryList.searchStauts('1230','stepTwo');return false;">$
		<p class="num">3</p>
</a>
	<p class="txt">결제완료</p></li>
<li id="stepThree"><a href="#" data-content="951865"
	data-url="/mypage/order/indexDeliveryList?page=1&rows=20&period=3&ordAcptDtmStart=2021-04-25&ordAcptDtmEnd=2021-07-24&arrOrdDtlStatCd=1340"
	onclick="orderDeliveryList.searchStauts('140','stepThree');return false;"><p
			class="num">2</p></a>
	<p class="txt">배송준비중</p></li>
<li id="stepFour"><a href="#" data-content="951865"
	data-url="/mypage/order/indexDeliveryList?page=1&rows=20&period=3&ordAcptDtmStart=2021-04-25&ordAcptDtmEnd=2021-07-24&arrOrdDtlStatCd=150"
	onclick="orderDeliveryList.searchStauts('150','stepFour');return false;"><p
			class="num">1</p></a>
	<p class="txt">배송중</p></li>
<li id="stepFive"><a href="#" data-content="951865"
	data-url="/mypage/order/indexDeliveryList?page=1&rows=20&period=3&ordAcptDtmStart=2021-04-25&ordAcptDtmEnd=2021-07-24&arrOrdDtlStatCd=160"
	onclick="orderDeliveryList.searchStauts('160','stepFive');return false;"><p
			class="num">0</p></a>
	<p class="txt">배송완료</p></li>
<li id="stepSix"><a href="#" data-content="951865"
	data-url="/mypage/order/indexDeliveryList?page=1&rows=20&period=3&ordAcptDtmStart=2021-04-25&ordAcptDtmEnd=2021-07-24&arrOrdDtlStatCd=170"
	onclick="orderDeliveryList.searchStauts('170','stepSix');return false;"><p
							class="num">2</p></a>
					<p class="txt">구매확정</p></li>
			</ul>
		</div>
	</div>
</div>

<form id="delivery_list_form">
	<input type="hidden" id="delivery_list_page" name="page" value="1" />
	<input type="hidden" id="delivery_list_rows" name="rows" value="20" />
	<input type="hidden" id="delivery_list_totalPage" value="1" /> <input
		type="hidden" name="period" value="3" /> <input type="hidden"
		name="ordAcptDtmStart" value="2021-04-25" /> <input type="hidden"
		name="ordAcptDtmEnd" value="2021-07-24" /> <input type="hidden"
		id="callAjaxdeliveryHtml" name="callAjaxdeliveryHtml" value="N" />
</form>

<c:if test="${ empty olist }">
<div class="statusDeliveryList" id="noDataDeliveryList"
	style="height: 428px;">
	<section class="no_data i1 auto_h">
		<div class="inr">
			<div class="msg">주문 내역이 없습니다.</div>
		</div>
	</section>
</div>
</c:if>

<c:if test="${ not empty olist }">
<c:forEach items="${ olist }" var="order">
<div class="inr-box statusDeliveryList">
	<div class="item-list">
		<div class="top" style="padding-top: 0;">
<div class="tit">
	<p class="data">
		<fmt:formatDate value="${ order.ord_date }"
			pattern="yyyy.MM.dd" />
	</p>
	<a href="javascript:void(0);" class="detail-btn"
		data-content="${ order.ord_code }"
		data-url="/mypage/orderDetail.do?ord_code=${ order.ord_code }"
		onclick="location.href='${pageContext.request.contextPath}/Project/mypage/order/orderDetail.do?ord_code=${ order.ord_code }'">주문상세
	</a>
</div>
<!-- 주문내역삭제 버튼 Flag eq Y -->
<c:choose>
	<c:when
		test="${ (order.ord_status eq '결제완료') or (order.ord_status eq '배송준비중') }">
		<a href="javascript:void(0);" class="btn sm ord-del-btn"
			data-content="${ order.ord_code }"
			data-url="/mypage/cancelReq"
			onclick="location.href='${pageContext.request.contextPath}/Project/mypage/order/cancelReq.do?ord_code=${ order.ord_code }&oddNo=all'">
			전체주문취소 </a>
	</c:when>
	<c:otherwise>
		<a href="javascript:void(0);" class="btn sm ord-del-btn"
			data-content="${ order.ord_code }"
			data-url="/mypage/order/orderDelete"
			onclick="orderDeliveryListBtn.goOrderDelete('${ order.ord_code }');return false;">
			주문내역삭제 </a>
	</c:otherwise>
</c:choose>
	</div>
</div>
<!-- 취소아이템리스트 -->
<!-- orderstatus는 주문취소가 아닌데 oilist oitem의 cc_code가 널이 아니면 -->
<c:forEach items="${ oilist }" var="oitem">
<c:if test="${ order.ord_code eq oitem.ord_code }">
<c:if
	test="${ (order.ord_status ne '주문취소') and (oitem.cc_code ne null) }">

	<div class="item-list">
		<div class="bottom">
			<div class="t-box">
				<p class="tit t2">주문취소</p>
				<p
					class="icon-t 
	<c:if test="${ (order.dt_type eq '택배') or (order.dt_type eq '업체') }">t2</c:if>
	<c:if test="${ order.dt_type eq '새벽' }">t3</c:if>">
					<!-- x 당일 / t2 택배 / t2 업체  -->
					${ order.dt_type }배송
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
									data-url="/mypage/orderDetail.do?ord_code=${ oitem.ord_code }"
									onclick="location.href='${pageContext.request.contextPath}/Project/mypage/order/orderDetail.do?ord_code=${ oitem.ord_code }');">
									<img src="${ oitem.item_img }"
									alt="${ oitem.item_name }" class="img">
								</a>
							</div>
							<div class="name">
								<div class="tit k0421">
									<a href="javascript:void(0);"
										data-content="${ oitem.ord_code }"
										data-url="/mypage/orderDetail.do?ord_code=${ oitem.ord_code }"
										onclick="location.href='${pageContext.request.contextPath}/Project/mypage/order/orderDetail.do?ord_code=${ oitem.ord_code }');">${ oitem.item_name }</a>
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
							data-content="${ order.ord_code }"
							data-url="/mypage/order/indexClaimDetail?clmNo=${ order.ord_code }"
							onclick="orderDeliveryListBtn.goOrderClaimDetail('${ order.ord_code }','10' )"
							class="btn c"> 취소 상세 </a>
					</div>
				</div>

			</div>
		</div>
	</div>
</c:if>
</c:if>
</c:forEach>

<!-- 주문상품리스트 -->
<div class="item-list">
	<div class="bottom">
		<div class="t-box">
			<p
				class="tit
	<c:if test="${ (order.ord_status eq '결제완료') or (order.ord_status eq '배송중') or (order.ord_status eq '배송준비중') }">t3</c:if>
	<c:if test="${ (order.ord_status eq '주문취소') or (order.ord_status eq '상품교환') or (order.ord_status eq '상품반품') }">t2</c:if>">
		${ order.ord_status }</p>
	<p
		class="icon-t 
	<c:if test="${ (order.dt_type eq '택배') or (order.dt_type eq '업체') }">t2</c:if>
	<c:if test="${ order.dt_type eq '새벽' }">t3</c:if>">
		${ order.dt_type }배송</p>
</div>

<div class="g-box dlvr-current-status">
	<p class="lt">
		<c:if
			test="${ (order.ord_status eq '결제완료') or (order.ord_status eq '배송준비중') or (order.ord_status eq '배송중') or (order.ord_status eq '상품교환') }">
			<c:choose>
				<c:when test="${ order.dt_type eq '당일' }">
					<fmt:formatDate value="${ order.ord_date }"
						pattern="MM월 dd일(E)" /> 도착 예정</c:when>
				<c:when test="${ order.dt_type eq '새벽' }">
					<fmt:formatDate value="${ order.ord_date }"
						pattern="MM월 dd일(E)" /> 도착 예정</c:when>
				<c:when test="${ order.dt_type eq '택배' }">배송 평균 1~2일 소요 예정</c:when>
				<c:when test="${ order.dt_type eq '업체' }">배송 평균 2~7일 소요 예정</c:when>
			</c:choose>
		</c:if>
		<c:if test="${ order.ord_status eq '주문취소'}">결제 취소 : 영업일 기준 3~7일 소요</c:if>
		<c:if test="${ order.ord_status eq '상품반품'}">결제 환불 : 영업일 기준 3~7일 소요</c:if>
		<c:if
			test="${ (order.ord_status eq '배송완료') or (order.ord_status eq '구매확정') }">
			<fmt:formatDate value="${ order.d_time }"
				pattern="MM월 dd일(E)" /> 배송 완료</c:if>
	</p>
	<c:if
		test="${ (order.dt_type eq '택배') and ( (order.ord_status eq '배송중') or (order.ord_status eq '배송완료') or (order.ord_status eq '구매확정') ) }">
		<a href="javascript:;" class="detail-btn" data-target="order"
			data-action="goodsflow"
			data-url="https://aboutpet.co.kr/mypage/order/goodsflow/599693">배송조회</a>
	</c:if>
</div>

<c:forEach items="${ oilist }" var="oitem">
	<c:if
		test="${ (order.ord_code eq oitem.ord_code) and (oitem.cc_code eq null) }">
		<div class="float-bx">
			<div class="untcart">
				<!-- .disabled -->
				<div class="box">
					<div class="tops">
						<div class="pic">
							<a href="javascript:void(0);"
								data-content="${ oitem.ord_code }"
								data-url="/mypage/orderDetail.do?ord_code=${ oitem.ord_code }"
								onclick="location.href='${pageContext.request.contextPath}/Project/mypage/order/orderDetail.do?ord_code=${ oitem.ord_code }');">
								<img src="${ oitem.item_img }"
								alt="${ oitem.item_name }" class="img">
							</a>
						</div>
						<div class="name">
							<div class="tit k0421">
								<a href="javascript:void(0);"
									data-content="${ oitem.ord_code }"
									data-url="/mypage/orderDetail.do?ord_code=${ oitem.ord_code }"
									onclick="location.href='${pageContext.request.contextPath}/Project/mypage/order/orderDetail.do?ord_code=${ oitem.ord_code }');">${ oitem.item_name }</a>
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
						test="${ (order.ord_status eq '결제완료') or (order.ord_status eq '배송준비중') }">
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
								onclick="location.href='${pageContext.request.contextPath}/Project/mypage/order/cancelReq.do?ord_code=${ order.ord_code }&oddNo=${oitem.odd_code}'"
								class="btn c completeBtn">주문취소</a>
						</div>
					</c:when>
					<c:when test="${ order.ord_status eq '주문취소' }">
						<div class="btnSet">
							<a href="javascript:void(0);"
								data-content="${ order.ord_code }"
								data-url="/mypage/order/indexClaimDetail?clmNo=${ order.ord_code }"
								onclick="orderDeliveryListBtn.goOrderClaimDetail('${ order.ord_code }','10' )"
								class="btn c"> 취소 상세 </a>
						</div>
					</c:when>
					<c:when test="${ order.ord_status eq '상품교환' }">
						<div class="btnSet">
							<a href="javascript:void(0);"
								data-content="${ order.ord_code }"
								data-url="/mypage/order/indexClaimDetail?clmNo=${ order.ord_code }"
								onclick="orderDeliveryListBtn.goOrderClaimDetail('${ order.ord_code }','10' )"
								class="btn c"> 교환 상세 </a>
						</div>
					</c:when>
					<c:when test="${ order.ord_status eq '상품반품' }">
						<div class="btnSet">
							<a href="javascript:void(0);"
								data-content="${ order.ord_code }"
								data-url="/mypage/order/indexClaimDetail?clmNo=${ order.ord_code }"
								onclick="orderDeliveryListBtn.goOrderClaimDetail('${ order.ord_code }','10' )"
								class="btn c"> 반품 상세 </a>
						</div>
					</c:when>
					<c:when
						test="${ (order.ord_status eq '배송중') or (order.ord_status eq '배송완료') }">
						<div class="btnSet">
							<a href="javascript:void(0);"
								onclick="cartGoods.insertCart('${ oitem.item_code }', '367898', '','','','N');"
								data-content="${ oitem.item_code }"
								data-url="https://aboutpet.co.kr/order/indexCartList/"
								class="btn c add-cart-btn">장바구니 담기</a>
							<a href="/customer/inquiry/inquiryView?popupChk=popOpen"
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
					<c:when test="${ order.ord_status eq '구매확정' }">
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
</c:forEach>
</c:if>
<!-- <button class="btn-fixed-round t2" onclick="searchAllOrder();">전체주문보기</button> -->
<!-- 하단 gnb 있을 시 t2추가 -->
<!-- 주문/배송 목록 include -->
<!-- 주문/배송 form,목록 include -->
</div>


<!-- // 주문 배송 -->

		</div>

	</div>
</main>
<script>
$("#orderli").addClass("active");
</script>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<main class="container lnb page shop order" id="container">
<div class="inr" style="min-height: 448px;">
<!-- 본문 -->
<!-- 비교용 업체 번호 -->

<div class="contents" id="contents" style="min-height: 620px;">
<div class="pc-tit"><h2>취소신청</h2></div>

<form id="cancelReqForm" name="cancelReqForm" method="post">
<input type="hidden" name="ord_code" value="${odto.ord_code}">
<div class="oder-cancel border-on margin">
<ul>
<!-- 상품 리스트 -->
<c:forEach items="${ oilist }" var="oitem">
<c:if test="${ oitem.cc_code eq null }">
	<li>
<!-- 	<input type="hidden" id="ordDtlSeq0"
		name="arrOrdDtlSeq" data-mki="N" value="1"> -->
		<div class="untcart cancel">
			<input type="hidden" name="odd_code" value="${oitem.odd_code}">
			<label class="checkbox"> <input type="checkbox"
				id="oddCode${oitem.odd_code}" ><span class="txt"></span>
				<!-- name="odd_code" -->
			</label>
			<div class="box">
				<div class="tops">
					<div class="pic">
						<a href="상품상세?item_code=${ oitem.item_code }"
							data-content="PI000012386"
							data-url="상품상세?item_code=${ oitem.item_code }"> <img
							src="${ oitem.item_img }" alt="${ oitem.item_name }"
							class="img">
						</a>
					</div>
					<div class="name">
						<div class="tit">${ oitem.item_name }</div>
						<div class="stt">
							${ oitem.odd_cnt }개
							<c:if test="${ oitem.opt_name ne null }"> | ${ oitem.opt_name }</c:if>
						</div>
						<div class="price">
							<span class="prc"><em class="p"><fmt:formatNumber
										value="${ oitem.item_price }" /></em><i class="w">원</i></span>
						</div>
					</div>
				</div>
				<div class="amount">
					<div class="uispiner" data-min="1" data-max="1">
						<!-- <input type="hidden" id="arrClmQty0" name="arrClmQty"
							value="0" disabled="disabled"> -->
							<input type="text"
							value="${ oitem.odd_cnt }" class="amt" id="clmQty0"
							name="clmQty" data-saleamt="${ oitem.item_price }"
							readonly="readonly">
						<button type="button" class="bt minus" disabled="disabled">수량더하기</button>
						<button type="button" class="bt plus" disabled="disabled">수량빼기</button>
					</div>
				</div>
			</div>
		</div></li>
</c:if>
</c:forEach>
</ul>
</div>
<div class="exchange-area pc-reposition">

	<div class="item-box pc-reposition">
		<p class="tit">취소 사유</p>
		<div class="sub-tit">사유 선택</div>
		<div class="flex-wrap">
			<label class="radio"><input type="radio"
				name="rcc_code" value="1"><span class="txt">단순변심</span></label>
			<label class="radio"><input type="radio"
				name="rcc_code" value="2"><span class="txt">주문실수</span></label>
			<label class="radio"><input type="radio"
				name="rcc_code" value="3"><span class="txt">배송지연</span></label>
			<label class="radio"><input type="radio"
				name="rcc_code" value="4"><span class="txt">상품품절</span></label>
		</div>
		<!-- <p class="info-t2">옵션(사이즈, 색상 등) 변경을 원하시는 경우는 마이페이지에서 신청이 불가합니다. 고객센터로 연락주시기 바랍니다.</p> -->
	<p class="sub-tit pc-reposition">상세 사유 입력</p>
	<div class="textarea">
		<textarea placeholder="내용을 입력해주세요." id="clmRsnContent"
			name="cc_desc"></textarea>
	</div>
</div>

<input type="hidden" name="pd_code" value="${pdto.pd_code}">
<div class="item-box pc-reposition">
	<p class="tit">예상 환불 금액</p>
	<div class="price-area">
		<div class="gray-box">
			<div class="list">
				<ul>
					<li>
						<p class="txt1">환불 금액</p>
						<!-- 체크에 따라서............... -->
						<input type="hidden" name="return_amt" value="${ returnAmt + returnFee - extraFee }">
						<p class="txt2" id="goodsTotalAmt">${ returnAmt + returnFee - extraFee }원
			</p> <!-- goodsTotalAmt-->
		</li>
		<li style="display: none">
			<p class="txt1">환불 포인트</p>
			<p class="txt2" id="pointTotalAmt">0P</p> <!-- gs포인트 추후 추가 예정 -->
			</li>
		</ul>
	</div>
</div>


<div class="list" id="divCal">
	<ul>
		<li>
			<p class="txt1">상품 금액</p>
			<p class="txt2" id="goodsAmt">${ returnAmt }원
		</p> <!-- goodsTotalAmt -->
	</li>

	<li>
		<p class="txt1">배송비</p>
		<p class="txt2" id="orgDlvrcAmt">${ returnFee }원</p> <!-- orgDlvrcAmt -->
	</li>
	<li>
		<p class="txt1">쿠폰 할인</p>
		<p class="txt2 color" id="cpDcAmt">0원</p> <!-- cpDcAmt-->
	</li>
	<li>
		<p class="txt1">
			추가배송비<span class="alert_pop" data-pop="popCpnGud"> <!-- 04.20 : 추가 -->
				<span class="bubble_txtBox" style="width: 267px;"> <span
					class="tit">추가배송비</span> <span class="info-txt"> <span>
							<span> 취소/반품/교환 시 발생한 배송비 금액입니다.</span> <span>
								도서/산간지역의 경우 반품/교환 시 추가 배송비가 발생할 수 있습니다.</span> <span>
								취소/반품/교환으로 인해 무료배송 조건이 충족되지 못할경우 배송비가 추가로 발생할 수 있습니다.</span>
					</span>
				</span>
			</span>
			</span>
		</p>
		<p class="txt2 color" id="clmDlvrcAmt">${ extraFee }원</p>
		<!--<div class="dd"> -->
		<!--	<span class="prc c_r" id="clmDlvrcAmtli"><em class="p" id="clmDlvrcAmtPre"></em><i class="w" id="clmDlvrcAmt"></i>원</span> -->
		<!--</div> -->
				</li>

			</ul>
		</div>

	</div>
</div>
<div class="item-box pc-reposition last">
	<p class="tit">환불수단</p>
<input type="hidden" name="pd_method" value="${ pdto.pd_method }">
	<p class="means">
		<!-- <span>일반결제</span>간편카드 -->
		${ pdto.pd_method }
		<br>
	</p>
</div>
<div class="info-txt t2 pc-reposition">
	<ul>
		<li>주문 시 결제 수단으로 환불됩니다. <br>단, 가상계좌의 경우 입력하신 환불 계좌로
			환불됩니다.
		</li>
	</ul>
</div>
<div class="btnSet space pc-reposition">
	<a href="#" data-content="" data-url="orderList.do"
		onclick="goOrderList();" class="btn lg d">취소</a>
<a href="#" data-content=""
	data-url="/mypage/insertClaimCancelExchangeRefund"
	onclick="cancelSubmit();" class="btn lg a"
						id="cancelSubmit">취소 신청</a>
				</div>
			</div>
<input type="hidden" name="order_cnt" value="${ order_cnt }">
</form>
</div>
</div>

</main>
<script>
	if ('${checkOdd}' == 'all') $("input[type=checkbox]").prop('checked',true);
	else $("#oddCode${checkOdd}").prop('checked',true);
	
	// 주문목록으로 돌아감
	function goOrderList(){	
		ui.confirm("주문/배송 목록으로 돌아갈까요?",{
			ycb:function(){
				location.href='${pageContext.request.contextPath}/Project/mypage/order/orderList.do'							
			},					
			ybt:'예',
			nbt:'아니요'	
		});	
	}
	
	
	function cancelSubmit(){
		if ($("input[type=checkbox]:checked").length == 0) {
			ui.alert("취소할 상품을 선택해 주세요.");
		} else {
			// 취소 다시한번 확인
			ui.confirm("선택한 상품의 주문을 취소할까요?",{
				ycb:function(){	
					// alert("test")
					$("#cancelReqForm").submit();									
				},					
				ybt:'예',
				nbt:'아니요'
			});
		}
	}
</script>
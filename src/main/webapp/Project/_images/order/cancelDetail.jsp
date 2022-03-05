<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<main class="container lnb page shop order my" id="container">
	<div class="inr" style="min-height: 448px;">
		<!-- 본문 -->
		<div class="contents" id="contents" style="min-height: 620px;">
			<!-- PC 타이틀 모바일에서 제거  -->
			<div class="pc-tit">
				<h2>취소상세</h2>
			</div>
			<!-- // PC 타이틀 모바일에서 제거  -->
			<!-- 주문 배송 -->

			<div class="delivery-oder-area">
				<div class="inr-box border-on cucu">
					<div class="item-list">
						<div class="top b">
							<div class="tit">
								<p class="data">2021.08.09</p>
								<span class="icon-left-gap">주문번호 C202108090109014</span>
							</div>
						</div>
					</div>
					<!--클레임 상태 색상 설정 -->
					<!--빨강 : 반품신청/반품진행중/교환신청/교환진행중-->
					<!--회색 : 주문취소-->
					<!--검정 : 반품완료/반품거부/교환완료/교환거부-->
					<div class="item-list">
						<div class="bottom">
							<div class="t-box">
								<p class="tit g ">
									<!--클레임 상태 텍스트 설정 -->
									<!--주문 취소 -->
									주문취소
								</p>
								<p class="icon-t t2">업체배송</p>
							</div>
							<ul class="opts">
								<li class="opt"><span class="dt">결제 취소 : 영업일 기준 3~7일
										소요</span></li>
							</ul>
							<div class="float-bx">
								<div class="untcart">
									<!-- .disabled -->
									<div class="box">
										<div class="tops">
											<div class="pic">
												<a href="/goods/indexGoodsDetail?goodsId=GP251019606"
													data-url="/goods/indexGoodsDetail?goodsId=GP251019606">
													<img
													src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/21/01/03/2506194/2506194_detail_03.jpg?type=f&amp;w=259&amp;h=259&amp;quality=90&amp;align=4"
													alt="고위드테일 테린 오리" class="img">
												</a>
											</div>
											<div class="name">
												<div class="tit k0421">
													<a href="/goods/indexGoodsDetail?goodsId=GP251019606"
														data-url="/goods/indexGoodsDetail?goodsId=GP251019606">
														고위드테일 테린 오리</a>
												</div>
												<div class="stt">
													1개
													<!-- 상품 구성 유형 : 묶음 -->
													| 고위드테일 테린 오리 120g
												</div>
												<div class="prcs">
													<span class="prc"><em class="p">7,000</em><i
														class="w">원</i></span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 모바일 일경우 아래를 실행시킴 -->
				</div>
				<div class="ordersets pc-cut">

					<!-- PC일경우 아래를 실행시킴 -->
					<section class="sect addr onWeb_b">
						<div class="hdts">
							<span class="tit">취소 정보</span>
						</div>
						<!--취소일시 MO-->
						<div class="cdts-area">
							<ul class="prcset">
								<li>
									<div class="dt">취소일시</div>
									<div class="dd">
										<span class="prc"><em class="p">2021.08.10 00:47</em></span>
									</div>
								</li>
							</ul>
						</div>
						<!--반품일시 MO-->
						<!--교환일시 MO-->
					</section>

					<section class="sect addr">
						<div class="hdts">
							<span class="tit">취소 사유</span>
						</div>
						<div class="cdts">
							<div class="adrset">
								<div class="name">
									<em class="t g">단순변심</em>
								</div>
								<div class="adrs" style="margin-top: 2px;"></div>
							</div>
						</div>
					</section>

					<!--취소/반품 이고    클레임접수상태 취소 및  주문 접수 상태가 아닐때-->
					<section class="sect bprc">
						<div class="hdts">
							<span class="tit">환불 정보</span>
						</div>
						<div class="cdts">
							<dl class="denor-gray">
								<!--환불금액과 환불포인트가 각각 0원과 0P가 아닐때만 노출되도록 -->
								<dt>환불 금액</dt>
								<dd class="refund_val" style="margin-top: 0px;">11,000원</dd>
								<dd class="refund_valZero" style="display: none;">0P</dd>
							</dl>
							<ul class="prcset">
								<li>
									<div class="dt">상품 금액</div>
									<div class="dd">
										<span class="prc"><em class="p">7,000</em><i class="w">원</i></span>
									</div>
								</li>
								<li>
									<div class="dt">배송비</div>
									<div class="dd">
										<span class="prc"> <em class="p"> 4,000</em><i
											class="w">원</i></span>
									</div>
								</li>
								<li>
									<div class="dt">쿠폰 할인</div>
									<div class="dd">
										<span class="prc dis"><em class="p">0</em><i class="w">원</i></span>
									</div>
								</li>
							</ul>

							<!-- div class="tot">
										<div class="dt">총 결제금액</div>
										<div class="dd">
											<span class="prc"><em class="p">32,500</em><i class="w">원</i></span>
										</div>
									</div -->
						</div>
					</section>
					<!-- 가상계좌로 결제하지 않은 경우 -->
					<section class="sect binf">
						<div class="hdts">
							<span class="tit">환불 수단</span>
						</div>
						<div class="cdts">
							<div class="result">
								<div class="hd">
									<em class="b" style="color: #669aff;">간편카드</em>
									<!-- 무통장입금 이외 결제수단 : 신용카드 type 으로 show -->
									<i class="t c">KB국민카드 (5365********9327)</i>
									<!-- 무통장입금 -->
								</div>
							</div>
						</div>
					</section>
					<!-- 가상계좌로 결제한 경우 환불계좌 받은 부분 show  -->
					<section class="sect bprc">
						<div class="bts">
							<div class="btnSet">
								<a href="/mypage/order/indexClaimList" data-content=""
									data-url="/mypage/order/indexClaimList" class="btn lg d">취소/반품/교환
									목록</a> <a href="/shop/home/" class="btn lg b">계속 쇼핑하기</a>
							</div>
						</div>
					</section>

				</div>
			</div>
			<!-- // 주문 배송 -->

		</div>

	</div>
</main>
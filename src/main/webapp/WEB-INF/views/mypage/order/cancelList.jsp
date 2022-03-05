<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<main class="container lnb page 1dep 2dep" id="container">
	<div class="inr" style="min-height: 448px;">
<!-- 본문 -->
<div class="contents" id="contents" style="min-height: 620px;">
<!-- PC 타이틀 모바일에서 제거  -->
<div class="pc-tit">
	<h2>취소/반품/교환</h2>
</div>

<form id="claim_list_form">

	<input type="hidden" id="claim_list_page" name="page" value="1">
	<input type="hidden" id="claim_list_rows" name="rows" value="20">
	<input type="hidden" id="claim_list_totalPage" value="1"> <input
		type="hidden" name="clmAcptDtmStart" value="2021-05-11"> <input
		type="hidden" name="clmAcptDtmEnd" value="2021-08-10"> <input
		type="hidden" id="callAjaxClaimHtml" name="callAjaxClaimHtml"
		value="N">

	<div class="delivery-oder-area h100" id="claimList">
		<div class="inr-box pc-re-po01">
			<div class="oder-step">
				<nav class="menushop re-po01">
					<button type="button" class="bt st">최근 3개월</button>
					<div class="list">
						<ul class="menu">
							<li class="active"><a href="#" id="period_type_3"
								data-content="953741"
								data-url="/mypage/order/indexClaimList?page=1&amp;rows=20&amp;period=3&amp;clmAcptDtmStart=2021-05-11&amp;clmAcptDtmEnd=2021-08-10"
								class="bt"
								onclick="orderClaimList.setPeriod(3);return false;">최근
									3개월</a></li>
							<li><a href="#" id="period_type_6" data-content="953741"
								data-url="/mypage/order/indexClaimList?page=1&amp;rows=20&amp;period=6&amp;clmAcptDtmStart=2021-05-11&amp;clmAcptDtmEnd=2021-08-10"
								class="bt"
								onclick="orderClaimList.setPeriod(6);return false;">최근
									6개월</a></li>
							<li><a href="#" id="period_type_9" data-content="953741"
								data-url="/mypage/order/indexClaimList?page=1&amp;rows=20&amp;period=9&amp;clmAcptDtmStart=2021-05-11&amp;clmAcptDtmEnd=2021-08-10"
								class="bt"
								onclick="orderClaimList.setPeriod(9);return false;">최근
									9개월</a></li>
							<li><a href="#" id="period_type_12" data-content="953741"
								data-url="/mypage/order/indexClaimList?page=1&amp;rows=20&amp;period=12&amp;clmAcptDtmStart=2021-05-11&amp;clmAcptDtmEnd=2021-08-10"
								class="bt"
								onclick="orderClaimList.setPeriod(12);return false;">최근
									12개월</a></li>
							<li><a href="#" id="period_type_0" data-content="953741"
								data-url="/mypage/order/indexClaimList?page=1&amp;rows=20&amp;period=0&amp;clmAcptDtmStart=2021-05-11&amp;clmAcptDtmEnd=2021-08-10"
								class="bt"
								onclick="orderClaimList.setPeriod(0);return false;">직접 입력</a></li>
							<input type="hidden" name="period" value="1">
						</ul>
					</div>
				</nav>
				<div class="dummy-gray-line ">
					<!-- open 클래스 추가 시 open -->
					<div class="layout-date-picker noIcon">
						<span class="uiDate"><input type="text"
							value="2021.05.11" placeholder="YYYY.MM.DD"
							class="datepicker hasDatepicker" title="날짜" id="start_dt"
							readonly="">
						<button type="button" class="ui-datepicker-trigger">달력</button></span>
						<span class="gap-area">-</span> <span class="uiDate"><input
							type="text" value="2021.08.10" placeholder="YYYY.MM.DD"
							class="datepicker hasDatepicker" title="날짜" id="end_dt"
							eadonly="readonly" readonly="">
						<button type="button" class="ui-datepicker-trigger">달력</button></span>
						<a href="#" data-content="953741"
							data-url="/mypage/order/indexClaimList?page=1&amp;rows=20&amp;period=1&amp;clmAcptDtmStart=2021-05-11&amp;clmAcptDtmEnd=2021-08-10"
							onclick="orderClaimList.search();return false;" class="btn lg">조회</a>
					</div>
				</div>
			</div>
		</div>
		<div class="inr-box">
			<div class="item-list">
				<div class="top">
					<div class="tit">
						<p class="data">2021.08.09</p>
						<a href="#" class="detail-btn" data-content="C202108090109014"
							data-url="/mypage/order/indexDeliveryDetail?ordNo=C202108090109014"
							onclick="orderClaimList.goOrderDetail('C202108090109014');return false;">주문상세
						</a>
					</div>
					<a href="#" class="btn sm"
						onclick="goOrderDelete('C202108090109014');return false;">주문내역삭제</a>
				</div>
			</div>
			<!--클레임 상태 색상 설정 -->
			<!--빨강 t4 : 반품신청/반품진행중/교환신청/교환진행중-->
			<!--회색 t2 : 주문취소-->
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
						<li class="opt"><span class="dt">결제 취소 : 영업일 기준
								3~7일 소요</span></li>
					</ul>
					<div class="float-bx">
						<div class="untcart">
							<!-- .disabled -->
							<div class="box">
								<div class="tops">
									<div class="pic">
										<a href="#" data-content="C202108090109014"
											data-url="/mypage/order/indexDeliveryDetail?ordNo=C202108090109014"
											onclick="orderClaimList.goOrderDetail('C202108090109014');return false;">
											<img
											src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/21/01/03/2506194/2506194_detail_03.jpg?type=f&amp;w=259&amp;h=259&amp;quality=90&amp;align=4"
											alt="고위드테일 테린 오리" class="img">
										</a>
									</div>
									<div class="name">
										<div class="tit">
											<a href="#" data-content="C202108090109014"
												data-url="/mypage/order/indexDeliveryDetail?ordNo=C202108090109014"
												onclick="orderClaimList.goOrderDetail('C202108090109014');return false;">고위드테일
												테린 오리</a>
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
						<div class="btn-bx pc-t2">
							<div class="btnSet">
								<a href="#"
									onclick="goClaimDetail('C20210809010901402', '10');return false;"
									class="btn c"> 취소 상세 </a> <a
									href="/customer/inquiry/inquiryView?popupChk=popOpen"
									data-content="C202108090109014"
									data-url="/customer/inquiry/inquiryView" class="btn c">고객센터
									문의</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--클레임 상태 색상 설정 -->
			<!--빨강 t4 : 반품신청/반품진행중/교환신청/교환진행중-->
			<!--회색 t2 : 주문취소-->
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
						<li class="opt"><span class="dt">결제 취소 : 영업일 기준
								3~7일 소요</span></li>
					</ul>
					<div class="float-bx">
						<div class="untcart">
							<!-- .disabled -->
							<div class="box">
								<div class="tops">
									<div class="pic">
										<a href="#" data-content="C202108090109014"
											data-url="/mypage/order/indexDeliveryDetail?ordNo=C202108090109014"
											onclick="orderClaimList.goOrderDetail('C202108090109014');return false;">
											<img
											src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/GI251017498/5a8019f1-da33-47fa-849d-950a4482aae1.jpg?type=f&amp;w=259&amp;h=259&amp;quality=90&amp;align=4"
											alt="고위드테일 테린 맛보기 240g" class="img">
										</a>
									</div>
									<div class="name">
										<div class="tit">
											<a href="#" data-content="C202108090109014"
												data-url="/mypage/order/indexDeliveryDetail?ordNo=C202108090109014"
												onclick="orderClaimList.goOrderDetail('C202108090109014');return false;">고위드테일
												테린 맛보기 240g</a>
										</div>
										<div class="stt">1개</div>
										<div class="prcs">
											<span class="prc"><em class="p">16,000</em><i
												class="w">원</i></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="btn-bx pc-t2">
							<div class="btnSet">
								<a href="#"
									onclick="goClaimDetail('C20210809010901401', '10');return false;"
									class="btn c"> 취소 상세 </a> <a
									href="/customer/inquiry/inquiryView?popupChk=popOpen"
									data-content="C202108090109014"
									data-url="/customer/inquiry/inquiryView" class="btn c">고객센터
									문의</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="inr-box">
			<div class="item-list">
				<div class="top">
					<div class="tit">
						<p class="data">2021.07.25</p>
						<a href="#" class="detail-btn" data-content="C202107250082071"
							data-url="/mypage/order/indexDeliveryDetail?ordNo=C202107250082071"
							onclick="orderClaimList.goOrderDetail('C202107250082071');return false;">주문상세
						</a>
					</div>
					<a href="#" class="btn sm"
						onclick="goOrderDelete('C202107250082071');return false;">주문내역삭제</a>
				</div>
			</div>
			<!--클레임 상태 색상 설정 -->
			<!--빨강 t4 : 반품신청/반품진행중/교환신청/교환진행중-->
			<!--회색 t2 : 주문취소-->
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
						<li class="opt"><span class="dt">결제 취소 : 영업일 기준
								3~7일 소요</span></li>
					</ul>
					<div class="float-bx">
						<div class="untcart">
							<!-- .disabled -->
							<div class="box">
								<div class="tops">
									<div class="pic">
										<a href="#" data-content="C202107250082071"
											data-url="/mypage/order/indexDeliveryDetail?ordNo=C202107250082071"
											onclick="orderClaimList.goOrderDetail('C202107250082071');return false;">
											<img
											src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/GI251017498/5a8019f1-da33-47fa-849d-950a4482aae1.jpg?type=f&amp;w=259&amp;h=259&amp;quality=90&amp;align=4"
											alt="고위드테일 테린 맛보기 240g" class="img">
										</a>
									</div>
									<div class="name">
										<div class="tit">
											<a href="#" data-content="C202107250082071"
												data-url="/mypage/order/indexDeliveryDetail?ordNo=C202107250082071"
												onclick="orderClaimList.goOrderDetail('C202107250082071');return false;">고위드테일
												테린 맛보기 240g</a>
										</div>
										<div class="stt">1개</div>
										<div class="prcs">
											<span class="prc"><em class="p">16,000</em><i
												class="w">원</i></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="btn-bx pc-t2">
							<div class="btnSet">
								<a href="#"
									onclick="goClaimDetail('C20210725008207101', '10');return false;"
									class="btn c"> 취소 상세 </a> <a
									href="/customer/inquiry/inquiryView?popupChk=popOpen"
									data-content="C202107250082071"
									data-url="/customer/inquiry/inquiryView" class="btn c">고객센터
									문의</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="inr-box">
			<div class="item-list">
				<div class="top">
					<div class="tit">
						<p class="data">2021.07.25</p>
						<a href="#" class="detail-btn" data-content="C202107250081863"
							data-url="/mypage/order/indexDeliveryDetail?ordNo=C202107250081863"
							onclick="orderClaimList.goOrderDetail('C202107250081863');return false;">주문상세
						</a>
					</div>
					<a href="#" class="btn sm"
						onclick="goOrderDelete('C202107250081863');return false;">주문내역삭제</a>
				</div>
			</div>
			<!--클레임 상태 색상 설정 -->
			<!--빨강 t4 : 반품신청/반품진행중/교환신청/교환진행중-->
			<!--회색 t2 : 주문취소-->
			<!--검정 : 반품완료/반품거부/교환완료/교환거부-->
			<div class="item-list">
				<div class="bottom">
					<div class="t-box">
						<p class="tit g ">
							<!--클레임 상태 텍스트 설정 -->
							<!--주문 취소 -->
							주문취소
						</p>
						<p class="icon-t">당일배송</p>
					</div>

					<ul class="opts">
						<li class="opt"><span class="dt">결제 취소 : 영업일 기준
								3~7일 소요</span></li>
					</ul>
					<div class="float-bx">
						<div class="untcart">
							<!-- .disabled -->
							<div class="box">
								<div class="tops">
									<div class="pic">
										<a href="#" data-content="C202107250081863"
											data-url="/mypage/order/indexDeliveryDetail?ordNo=C202107250081863"
											onclick="orderClaimList.goOrderDetail('C202107250081863');return false;">
											<img
											src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/GS251019895/0d137478-0acc-4646-91d3-5c3d1427905b.jpg?type=f&amp;w=259&amp;h=259&amp;quality=90&amp;align=4"
											alt="[4개세트] 펫츠프라임 건강한 믹스져키 100g" class="img">
										</a>
									</div>
									<div class="name">
										<div class="tit">
											<a href="#" data-content="C202107250081863"
												data-url="/mypage/order/indexDeliveryDetail?ordNo=C202107250081863"
												onclick="orderClaimList.goOrderDetail('C202107250081863');return false;">[4개세트]
												펫츠프라임 건강한 믹스져키 100g</a>
										</div>
										<div class="stt">1개</div>
										<div class="prcs">
											<span class="prc"><em class="p">6,000</em><i
												class="w">원</i></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="btn-bx pc-t2">
							<div class="btnSet">
								<a href="#"
									onclick="goClaimDetail('C20210725008186301', '10');return false;"
									class="btn c"> 취소 상세 </a> <a
									href="/customer/inquiry/inquiryView?popupChk=popOpen"
									data-content="C202107250081863"
									data-url="/customer/inquiry/inquiryView" class="btn c">고객센터
									문의</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="inr-box">
			<div class="item-list">
				<div class="top">
					<div class="tit">
						<p class="data">2021.07.25</p>
						<a href="#" class="detail-btn" data-content="C202107250081862"
							data-url="/mypage/order/indexDeliveryDetail?ordNo=C202107250081862"
							onclick="orderClaimList.goOrderDetail('C202107250081862');return false;">주문상세
						</a>
					</div>
					<a href="#" class="btn sm"
						onclick="goOrderDelete('C202107250081862');return false;">주문내역삭제</a>
				</div>
			</div>
			<!--클레임 상태 색상 설정 -->
			<!--빨강 t4 : 반품신청/반품진행중/교환신청/교환진행중-->
			<!--회색 t2 : 주문취소-->
			<!--검정 : 반품완료/반품거부/교환완료/교환거부-->
			<div class="item-list">
				<div class="bottom">
					<div class="t-box">
						<p class="tit g ">
							<!--클레임 상태 텍스트 설정 -->
							<!--주문 취소 -->
							주문취소
						</p>
						<p class="icon-t t2">택배배송</p>
					</div>

					<ul class="opts">
						<li class="opt"><span class="dt">결제 취소 : 영업일 기준
								3~7일 소요</span></li>
					</ul>
					<div class="float-bx">
						<div class="untcart">
							<!-- .disabled -->
							<div class="box">
								<div class="tops">
									<div class="pic">
										<a href="#" data-content="C202107250081862"
											data-url="/mypage/order/indexDeliveryDetail?ordNo=C202107250081862"
											onclick="orderClaimList.goOrderDetail('C202107250081862');return false;">
											<img
											src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/petsbe/20/08/32/2502389/2502389_detail_083.jpg?type=f&amp;w=259&amp;h=259&amp;quality=90&amp;align=4"
											alt="네츄럴코어 연어껍질 스틱 70g" class="img">
										</a>
									</div>
									<div class="name">
										<div class="tit">
											<a href="#" data-content="C202107250081862"
												data-url="/mypage/order/indexDeliveryDetail?ordNo=C202107250081862"
												onclick="orderClaimList.goOrderDetail('C202107250081862');return false;">네츄럴코어
												연어껍질 스틱 70g</a>
										</div>
										<div class="stt">
											1개
											<!-- 상품 구성 유형 : 묶음 -->
											| 네츄럴코어 연어껍질 스틱 70g
										</div>
										<div class="prcs">
											<span class="prc"><em class="p">4,000</em><i
												class="w">원</i></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="btn-bx pc-t2">
							<div class="btnSet">
								<a href="#"
									onclick="goClaimDetail('C20210725008186201', '10');return false;"
									class="btn c"> 취소 상세 </a> <a
									href="/customer/inquiry/inquiryView?popupChk=popOpen"
									data-content="C202107250081862"
									data-url="/customer/inquiry/inquiryView" class="btn c">고객센터
									문의</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="inr-box">
			<div class="item-list">
				<div class="top">
					<div class="tit">
						<p class="data">2021.07.25</p>
						<a href="#" class="detail-btn" data-content="C202107250081860"
							data-url="/mypage/order/indexDeliveryDetail?ordNo=C202107250081860"
							onclick="orderClaimList.goOrderDetail('C202107250081860');return false;">주문상세
						</a>
					</div>
					<a href="#" class="btn sm"
						onclick="goOrderDelete('C202107250081860');return false;">주문내역삭제</a>
				</div>
			</div>
			<!--클레임 상태 색상 설정 -->
			<!--빨강 t4 : 반품신청/반품진행중/교환신청/교환진행중-->
			<!--회색 t2 : 주문취소-->
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
						<li class="opt"><span class="dt">결제 취소 : 영업일 기준
								3~7일 소요</span></li>
					</ul>
					<div class="float-bx">
						<div class="untcart">
							<!-- .disabled -->
							<div class="box">
								<div class="tops">
									<div class="pic">
										<a href="#" data-content="C202107250081860"
											data-url="/mypage/order/indexDeliveryDetail?ordNo=C202107250081860"
											onclick="orderClaimList.goOrderDetail('C202107250081860');return false;">
											<img
											src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/goods/GI251017498/5a8019f1-da33-47fa-849d-950a4482aae1.jpg?type=f&amp;w=259&amp;h=259&amp;quality=90&amp;align=4"
											alt="고위드테일 테린 맛보기 240g" class="img">
										</a>
									</div>
									<div class="name">
										<div class="tit">
											<a href="#" data-content="C202107250081860"
												data-url="/mypage/order/indexDeliveryDetail?ordNo=C202107250081860"
												onclick="orderClaimList.goOrderDetail('C202107250081860');return false;">고위드테일
												테린 맛보기 240g</a>
										</div>
										<div class="stt">1개</div>
										<div class="prcs">
											<span class="prc"><em class="p">16,000</em><i
												class="w">원</i></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="btn-bx pc-t2">
							<div class="btnSet">
								<a href="#"
									onclick="goClaimDetail('C20210725008186001', '10');return false;"
									class="btn c"> 취소 상세 </a> <a
									href="/customer/inquiry/inquiryView?popupChk=popOpen"
									data-content="C202107250081860"
									data-url="/customer/inquiry/inquiryView" class="btn c">고객센터
									문의</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 취소/반품/교환 include -->
				</div>
			</form>

		</div>
	</div>

</main>
<script>
$("#cancelli").addClass("active");
</script>
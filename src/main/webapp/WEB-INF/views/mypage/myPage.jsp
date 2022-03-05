<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main class="container lnb page my home" id="container">
	<div class="inr" style="min-height: 479px;">
		<!-- 본문 -->
		<div class="contents" id="contents" style="min-height: 651px;">
			<!-- 회원정보  -->
			<section class="sect top">
				<dl>
					<dt class="pic">
						<img class="thumb" src="${ memberDTO.mem_img }" onclick="">
					</dt>
					<dd class="info-bx">
						<p>
							<span class="nm" onclick="">${ memberDTO.nickname }님</span>
							<!-- mong2mom -->
							<button class="btn re" onclick="location.href='manageCheck.jsp'"
								data-content="" data-url="manageCheck.jsp">수정</button>
						</p>
						<ul class="data">
							<li><span>등급</span> <a class="rank_icon"
								href="javascript:rankBox();"><i class="label welcome">${ memberDTO.gr_name }</i></a>
							</li>
							<li><span id="gsPointTit">GS&amp;POINT</span> <c:if
									test="${ memberDTO.mem_point eq 0 }">
									<a href="javascript:fnGetGsrPoint();" id="searchPoint"
										class="bt point">포인트조회</a>
								</c:if> <c:if test="${ memberDTO.mem_point ne 0 }">
									<em class="blue" id="gsPoint">${ memberDTO.mem_point } </em>P
					</c:if></li>
						</ul>
					</dd>
				</dl>
			</section>
			<section class="myinfo">
				<!-- 마이펫관리 -->
				<div class="sect line">
					<dl class="my">
						<dt>
							<span>마이펫 관리</span> <a href="#"
								onclick="location.href='myPetList.do'" class="next"
								data-content="953741" data-url="myPetList.do"></a>
						</dt>
						<dd>
							<c:if test="${ empty petlist }">
								<div class="pet">
									<p class="ex">
										마이펫 등록하고&nbsp;<span>예방접종 내역을 관리하세요.</span>
									</p>
									<button class="btn add" onclick="location.href='petInsertView.do'"
										data-content="954275" data-url="petInsertView.do">마이펫
										등록하기</button>
								</div>
							</c:if>

							<c:if test="${ not empty petlist }">
								<ul class="img-set">
									<c:forEach items="${ petlist }" var="petDTO">
										<li><img src="${ petDTO.pet_img }"
											onclick="location.href='myPetView.do?petNo=${ petDTO.pet_code }'"
											style="cursor: pointer; height: 100%; width: 100%;"
											data-url="myPetView.do?petNo=${ petDTO.pet_code }"
											data-content="953741" /></li>
									</c:forEach>
								</ul>
								<button class="btn re" onclick="location.href='myPetList.do'"
									data-url="myPetList.do" data-content="953741">설정</button>
							</c:if>
						</dd>
					</dl>
				</div>
				<dl class="zzim">
					<dt>
						<span>마이 찜리스트</span>
					</dt>
					<dd>
						<a href="/mypage/myWishList" class="allmore"
							data-url="/mypage/myWishList" data-content="953741">전체보기</a>
						<ul class="zzim-list">
							<li><b>TV</b> <a href="myWishTv.do" data-url="myWishTv.do"
								data-content="953741">${ tvMark }</a></li>
							<li><b>로그</b> <a href="myWishLog.do" data-url="myWishLog.do"
								data-content="953741">${ logMark }</a></li>
							<li><b>샵</b> <a href="myWishShop.do"
								data-url="myWishShop.do" data-content="953741">${ itemMark }</a>
							</li>
						</ul>
					</dd>
				</dl>

				<!-- 최근 본 영상  -->
				<dl class="sect watch">
					<dt>
						<a href="myRecentTv.do" data-url="myRecentTv.do"
							data-content="953741"> <span>최근 본 영상</span> <c:if
								test="${ empty mtlist }">
								<span class="next all">펫TV 바로가기</span>
							</c:if> <c:if test="${ not empty mtlist }">
								<span class="next all">전체보기</span>
							</c:if>
						</a>
					</dt>
					<dd class="recent">
						<c:if test="${ empty mtlist }">
							<p class="nodata">최근 시청한 영상이 없습니다. 반려동물과 함께하는 펫TV를 시청해보세요.</p>
						</c:if>
						<c:if test="${ not empty mtlist }">
							<div class="swiper-div">
								<div
									class="swiper-container swiper-container-initialized swiper-container-horizontal">
									<ul class="swiper-wrapper">
										<c:set var="flag" value="false" />
										<c:forEach items="${ mtlist }" var="mtDTO" varStatus="status">
											<c:if test="${ not flag }">
												<li class="swiper-slide swiper-slide-active"
													style="margin-right: 18px;">
													<div class="thumb-box">
														<div class="circular">
															<a href="영상링크 경로?v_code="
																data-content="N2021053103242" data-url="">
																<div class="inner"
																	style="background-image:url(${ mtDTO.v_img });"></div>
															</a>
															<!-- <div class="inner" style="background-image:url(../../_images/tv/@temp01.jpg);"></div> -->
															<div class="circlePie" data-p="0">
																<canvas width="100" height="100"></canvas>
															</div>
														</div>
														<div class="info">
															<div class="tlt">${ mtDTO.v_name }</div>
														</div>
													</div>
												</li>
												<c:if test="${ status.count ge 6 }">
													<c:set var="flag" value="true" />
												</c:if>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</div>

						</c:if>
					</dd>
				</dl>
				<!-- 나의 쇼핑 정보 -->
				<dl class="sect shop line">
					<dt>
						<span>내 쇼핑정보</span>
					</dt>
					<dd>
						<ul class="coupon">
							<li><a class="my1" href="myCouponList.do"
								data-url="myCouponList.do" data-content="953741"> <c:if
										test="${ couponCnt ne 0 }">
										<em>${ couponCnt }</em>
									</c:if> <span>내쿠폰</span>
							</a></li>
							<li><a class="my2" href="myRecentShop.do"
								data-url="myRecentShop.do" data-content="953741"> <span>최근본상품</span></a>
							</li>
							<li><a class="my3" href="myWishShop.do"
								data-url="myWishShop.do" data-content="953741"> <c:if
										test="${ itemMark ne 0 }">
										<em>${ itemMark }</em>
									</c:if> <span>찜한상품</span></a></li>
							<li><a class="my4" href="cartList.do"> <c:if
										test="${ cartCnt ne 0 }">
										<em>${ cartCnt }</em>
									</c:if> <span>장바구니</span></a></li>
						</ul>
						<div class="barwrap">
							<ul class="bar">
								<li><a href="${pageContext.request.contextPath}/Project/mypage/order/orderList.do" data-url="orderList.do"
									data-content="953741"> <span class="tit">주문/배송</span> <span
										class="next"></span>
								</a></li>
								<li>
									<!-- <span class="tit new">취소/반품/교환</span> --> <a
									href="/mypage/order/indexClaimList"
									data-url="/mypage/order/indexClaimList" data-content="953741">
										<span class="tit">취소/반품/교환</span> <span class="next"></span>
								</a>
								</li>
								<li><a href="myAlarmList.do" data-url="myAlarmList.do"
									data-content="953741"> <span class="tit">재입고 알림</span> <span
										class="next"></span>
								</a></li>
								<li><a href="/mypage/service/coupon"
									data-url="/mypage/service/coupon" data-content="953741"> <span
										class="tit">쿠폰존</span> <span class="next"></span>
								</a></li>
							</ul>
							<ul class="bar line">
								<li><a href="/customer/inquiry/inquiryView"
									data-url="/customer/inquiry/inquiryView" data-content="953741">
										<span class="tit">1:1 문의</span> <span class="next"></span>
								</a></li>
								<li><a href="/mypage/goodsCommentList"
									data-url="/mypage/goodsCommentList" data-content="953741">
										<span class="tit">상품 후기</span> <span class="next"></span>
								</a></li>
								<li><a href="/mypage/service/indexAddressList" data-url=""
									data-content="953741"> <span class="tit">배송지 관리</span> <span
										class="next"></span>
								</a></li>
								<li><a href="/mypage/order/indexBillingCardList"
									data-url="/mypage/order/indexBillingCardList"
									data-content="953741"> <span class="tit">결제 카드 관리</span> <span
										class="next"></span>
								</a></li>
							</ul>
						</div>
						<div class="line mt25"
							onclick="location.href='/mypage/info/indexInvitePage'"
							data-content="953741" data-url="/mypage/info/indexInvitePage">
							<div class="invite">
								<span class="ex">어바웃펫에 <em>친구를 초대 </em>하고<span
									class="block">친구와 함께 혜택을 받아보세요</span></span>
							</div>
						</div>
					</dd>
				</dl>
			</section>
		</div>

	</div>
</main>

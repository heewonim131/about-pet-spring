<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="lnb my" id="lnb">
	<div class="inr" style="bottom: 40px;">
		<div class="myCate">
			<ul class="menu">
				<li class="open"><a class="bt " href="${pageContext.request.contextPath}/Project/mypage/myPage.do"
					data-url="myPage.do" data-content="954216"><b class="t">내
							활동</b></a>
					<ul class="sm">
						<li class=""><a class="bt" href="myPetList.do"
							data-url="myPetList.do" data-content="954216"><b class="t">마이펫
									관리</b></a></li>
						<li class=""><a class="bt" href="myWishTv.do"
							data-url="myWishTv.do" data-content="954216"><b class="t">마이
									찜리스트</b></a></li>
						<li class=""><a class="bt" href="myRecentTv.do"
							data-url="myRecentTv.do" data-content="954216"><b class="t">최근
									본 영상</b></a></li>
						<li class=""><a class="bt" href="myRecentShop.do"
							data-url="myRecentShop.do" data-content="954216"><b class="t">최근
									본 상품</b></a></li>
					</ul></li>
				<li class="open"><a class="bt " href="javascript:;"><b
						class="t">나의 쇼핑정보</b></a>
					<ul class="sm">
						<li id="orderli" class=""><a class="bt" href="${pageContext.request.contextPath}/Project/mypage/order/orderList.do"
							data-url="orderList.do" data-content="954216"><b class="t">주문/배송</b></a></li>
						<li id="cancelli" class=""><a class="bt"
							href="/mypage/order/indexClaimList"
							data-url="/mypage/order/indexClaimList" data-content="954216"><b
								class="t">취소/반품/교환</b></a></li>
						<li class=""><a class="bt" href="myAlarmList.do"
							data-url="myAlarmList.do" data-content="954216"><b class="t">재입고
									알림</b></a></li>
						<li class=""><a class="bt" href="myCouponList.do"
							data-url="myCouponList.do" data-content="954216"><b class="t">내
									쿠폰</b></a></li>
						<li class=""><a class="bt"
							href="/customer/inquiry/inquiryView"
							data-url="/customer/inquiry/inquiryView" data-content="954216"><b
								class="t">1:1 문의</b></a></li>
						<li class=""><a class="bt" href="/mypage/goodsCommentList"
							data-url="/mypage/goodsCommentList" data-content="954216"><b
								class="t">상품 후기</b></a></li>
						<li class=""><a class="bt"
							href="/mypage/service/indexAddressList"
							data-url="/mypage/service/indexAddressList" data-content="954216"><b
								class="t">배송지 관리</b></a></li>
						<li class=""><a class="bt"
							href="/mypage/order/indexBillingCardList"
							data-url="/mypage/order/indexBillingCardList"
							data-content="954216"><b class="t">결제 카드 관리</b></a></li>
					</ul></li>
				<li class="open"><a class="bt " href="javascript:;"><b
						class="t">내 정보 관리</b></a>
					<ul class="sm">
						<li class=""><a class="bt" href="pswdUpdate.jsp"
							data-url="pswdUpdate.jsp" data-content="954216"><b class="t">비밀번호
									설정</b></a></li>
						<li class=""><a class="bt" href="manageCheck.jsp"><b
								class="t" data-url="manageCheck.jsp" data-content="954216">회원정보
									수정</b></a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>
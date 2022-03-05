<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 배송지 없을 경우 -->
<input type="hidden" id="order_payment_post_no_new" value="">
<input type="hidden" id="order_payment_road_addr" value="">
<input type="hidden" id="order_payment_mbr_dlvra_no" value="">
<input type="hidden" id="order_payment_demand_goods_rcv_pst_cd" value="">
<input type="hidden" id="order_payment_demand_goods_rcv_pst_etc"
	value="">
<input type="hidden" id="order_payment_demand_pbl_gate_ent_mtd_cd"
	value="">
<input type="hidden" id="order_payment_demand_pbl_gate_pswd" value="">
<input type="hidden" id="order_payment_dlvr_demand" value="">
<input type="hidden" id="order_payment_dlvr_demand_yn" value="N">

<div class="hdts">
	<span class="tit">배송지</span>
</div>
<div class="cdts">
	<ul class="adrlist">
		<li class="name">
			<div class="dt">배송지 명칭</div>
			<div class="dd">
				<span class="input"><input type="text" maxlength="20"
					id="adr_name" placeholder="배송지 명칭을 입력해주세요."></span>
			</div>
		</li>
		<li class="usr">
			<div class="dt">받는 사람</div>
			<div class="dd">
				<span class="input"><input type="text" maxlength="20"
					id="recipient" placeholder="이름을 입력해주세요."></span>
			</div>
		</li>
		<li class="tel">
			<div class="dt">휴대폰번호</div>
			<div class="dd">
				<span class="input"><input type="text" maxlength="11"
					id="d_contact" placeholder="'-'빼고 숫자만 입력해주세요."></span>
			</div>
		</li>
		<li class="arr">
			<div class="dt">주소</div>
			<div class="dd">
				<div class="adrbox a1">
					<div class="adr" id="addressInfo">주소를 검색해주세요.</div>
					<a href="javascript:execDaumPostcode();" class="btAdr">주소검색</a>
				</div>
				<div class="adrbox a2" id="addressInfoDetail" style="display: none;">
					<span class="input"><input type="text" maxlength="30"
						id="adr_detail" placeholder="상세주소를 입력하세요."></span>
				</div>
			</div> <script
				src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
				function execDaumPostcode() {
					new daum.Postcode(
							{
								oncomplete : function(data) {
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
									if (data.userSelectedType === 'R') {
										// 법정동명이 있을 경우 추가한다. (법정리는 제외)
										// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
										if (data.bname !== ''
												&& /[동|로|가]$/g.test(data.bname)) {
											extraAddr += data.bname;
										}
										// 건물명이 있고, 공동주택일 경우 추가한다.
										if (data.buildingName !== ''
												&& data.apartment === 'Y') {
											extraAddr += (extraAddr !== '' ? ', '
													+ data.buildingName
													: data.buildingName);
										}
										// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
										if (extraAddr !== '') {
											extraAddr = ' (' + extraAddr + ')';
										}

									}

									// 우편번호와 주소 정보를 해당 필드에 넣는다.
									var text = '[' + data.zonecode + ']' + addr;

									document.getElementById("addressInfo").innerText = "";
									document.getElementById("addressInfo").innerText = text;
									// 커서를 상세주소 필드로 이동한다.										                

									$("div[id=addressInfoDetail]").css(
											"display", "");
									$("div[id=addressInfoDetail]").focus();
								}
							}).open();

				}
			</script>

		</li>
	</ul>
</div>



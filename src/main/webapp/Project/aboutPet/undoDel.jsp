<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="hdts">
	<span class="tit">배송지</span>
</div>
<div class="cdts">
	<div class="adrset">
		<input type="hidden" id="order_payment_gb_nm" value="집"> <input
			type="hidden" id="order_payment_mbr_dlvra_no" value="73379">
		<input type="hidden" id="order_payment_post_no_new" value="18527">
		<input type="hidden" id="order_payment_road_addr"
			value="${orderDTO.adr_detail }"> <input type="hidden"
			id="order_payment_road_dtl_addr" value="302호"> <input
			type="hidden" id="order_payment_adrs_nm" value="박호진"> <input
			type="hidden" id="order_payment_adrs_mobile" value="01074567760">
		<input type="hidden" id="order_payment_demand_goods_rcv_pst_cd"
			value="10"> <input type="hidden"
			id="order_payment_demand_goods_rcv_pst_etc" value=""> <input
			type="hidden" id="order_payment_demand_pbl_gate_ent_mtd_cd"
			value="10"> <input type="hidden"
			id="order_payment_demand_pbl_gate_pswd" value="종 5725"> <input
			type="hidden" id="order_payment_dlvr_demand" value=""> <input
			type="hidden" id="order_payment_dlvr_demand_yn" value="Y">
		<div class="name tx">
			<em class="t" id="dlvraGbNmEm">${orderDTO.adr_name }</em> <em
				class="bdg" id="dftDelivery">기본배송지</em>
		</div>
		<div class="adrs" id="dlvraAdrsDiv">${orderDTO.adr_detail }</div>
		<div class="tels" id="dlvraTelsDiv">${orderDTO.recipient }/${orderDTO.d_contact }</div>

		<div class="bts">
			<a href="javascript:;" onclick="changeDel();"
				class="btn c sm btnDeMod">배송지 변경</a>
		</div>

	</div>

</div>

<script type="text/javascript">
	function changeDel() {

		$.ajax({
			url : "changeDel.do",
			type : "GET",
			dataType : "text",
			cache : false,
			success : function(result) {
				$(".addr").empty();
				$(".addr").append(result);
			}
		});
	}
</script>
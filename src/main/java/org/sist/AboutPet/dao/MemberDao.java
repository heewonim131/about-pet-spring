package org.sist.AboutPet.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.sist.AboutPet.vo.Address;
import org.sist.AboutPet.vo.Cancel;
import org.sist.AboutPet.vo.Member;
import org.sist.AboutPet.vo.Order;
import org.sist.AboutPet.vo.Payment;
import org.sist.AboutPet.vo.Pet;
import org.sist.AboutPet.vo.Video;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface MemberDao {
	
	// 회원정보
	@Select(" SELECT MEM_IMG, MEM_ID, NICKNAME, MEM_NAME, CONTACT " + 
			"	, MEM_EMAIL, GR_NAME, MEM_INVITE, MEM_POINT, MTAG " + 
			"	FROM MEMBER M JOIN GRADE G ON G.GR_CODE = M.GR_CODE " + 
			"	WHERE MEM_ID = '${mem_id}'")
	public Member getMyInfo(@Param("mem_id") String mem_id)
			throws ClassNotFoundException, SQLException;

	// 마이펫 리스트
	@Select(" SELECT PET_CODE, PET_IMG, PET_NAME, PT_NAME, PET_GEN, PET_AGE " + 
			"	FROM PET P JOIN PET_TYPE PT ON P.PT_CODE = PT.PT_CODE " + 
			"		JOIN MEMBER M on P.MEM_CODE = M.MEM_CODE " + 
			"	WHERE MEM_ID = '${mem_id}' " + 
			"	ORDER BY PET_CODE DESC ")
	public List<Pet> getPetList(@Param("mem_id") String mem_id)
			throws ClassNotFoundException, SQLException;
	
	// 찜 개수
	@Select(" SELECT COUNT(*) ${wish_cate} " + 
			"	FROM ${wish_cate} JOIN MEMBER M on ${wish_cate}.MEM_CODE = M.MEM_CODE " + 
			"	WHERE MEM_ID = '${mem_id}' ")
	public int getWishCnt(@Param("mem_id") String mem_id, @Param("wish_cate") String wish_cate)
			throws ClassNotFoundException, SQLException;
	
	// 최근 본 영상
	@Select(" SELECT V.V_CODE, V_TYPE, V_IMG, V_TIME, VV_DATE " + 
			"		, NVL(S_NAME, EDU_CATE) S_NAME " + 
			"		, NVL(EDU_TITLE, V_NAME) V_NAME " + 
			"	FROM VIDEO V JOIN VIDEO_VIEW VV ON V.V_CODE = VV.V_CODE " + 
			"		LEFT JOIN SERIES_VIDEO SV ON V.V_CODE = SV.V_CODE " + 
			"		LEFT JOIN SERIES S ON SV.S_CODE = S.S_CODE " + 
			"		LEFT JOIN EDU_VIDEO EV ON V.V_CODE = EV.V_CODE " + 
			"		LEFT JOIN PET_EDU E ON EV.EDU_CODE = E.EDU_CODE " + 
			"			JOIN MEMBER M ON M.MEM_CODE = VV.MEM_CODE " + 
			"	WHERE MEM_ID = '${mem_id}' " + 
			"	ORDER BY VV_DATE DESC ")
	public List<Video> getRecentTv(@Param("mem_id") String mem_id) throws ClassNotFoundException, SQLException;
	
	// 쿠폰 개수
	@Select(" SELECT COUNT(*) COUPON_CNT " +
			"	FROM MEM_COUPON C JOIN MEMBER M ON M.MEM_CODE = C.MEM_CODE " +
			"	WHERE MEM_ID = '${mem_id}' AND MC_USED = #{mc_used} ")
	public int getCouponCnt(@Param("mem_id") String mem_id, @Param("mc_used") int mc_used) throws ClassNotFoundException, SQLException;

	// 장바구니 상품 개수
	@Select(" SELECT SUM(CART_CNT) CART_CNT " +
			"	FROM CART C JOIN MEMBER M ON M.MEM_CODE = C.MEM_CODE " +
			"	WHERE MEM_ID = '${mem_id}' ")
	public int getCartCnt(@Param("mem_id") String mem_id) throws ClassNotFoundException, SQLException;


	// 주문내역 - 주문 리스트
	@Select(" SELECT T.* " + 
			" FROM " + 
			"    ( SELECT OL.ORD_CODE, ORD_DATE, ORD_STATUS, DT_TYPE, D_TIME " + 
			"        , ROW_NUMBER() OVER(PARTITION BY OL.ORD_CODE ORDER BY D_TIME) RN " + 
			"    FROM ORDER_LIST OL JOIN ORDER_DETAIL OD ON OL.ORD_CODE = OD.ORD_CODE " + 
			"        JOIN DEL_TYPE DT ON DT.DT_CODE = OD.DT_CODE " + 
			"        JOIN MEMBER M ON M.MEM_CODE = OL.MEM_CODE " + 
			"    WHERE MEM_ID = '${mem_id}' " + 
			"    ORDER BY ORD_CODE DESC )T " + 
			" WHERE RN = 1 ")
	public List<Order> getOrderList(@Param("mem_id") String mem_id) throws ClassNotFoundException, SQLException;
	
	// 주문내역 - 주문 상품 리스트
	@Select(" SELECT OL.ORD_CODE, OD.ODD_CODE, ODD_CNT, IT.ITEM_CODE, CC_CODE " + 
			"    , ITEM_NAME, ITEM_IMG, OPT_NAME, ITEM_PRICE, SALE_RATE, EXTRA_PRICE " + 
			" FROM ORDER_LIST OL JOIN ORDER_DETAIL OD ON OL.ORD_CODE = OD.ORD_CODE " + 
			"    JOIN STOCK ST ON OD.ST_CODE = ST.ST_CODE " + 
			"    JOIN ITEM_OPTION IO ON IO.OPT_CODE = ST.OPT_CODE " + 
			"    JOIN ITEM IT ON IT.ITEM_CODE = IO.ITEM_CODE " + 
			"    JOIN ITEM_SALE SL ON IT.ITEM_CODE = SL.ITEM_CODE " + 
			"    JOIN MEMBER M ON M.MEM_CODE = OL.MEM_CODE " + 
			"    LEFT JOIN CANCEL C ON OD.ODD_CODE = C.ODD_CODE " + 
			" WHERE MEM_ID = '${mem_id}' " + 
			" ORDER BY OD.ODD_CODE DESC ")
	public List<Order> getOrderItemList(@Param("mem_id") String mem_id) throws ClassNotFoundException, SQLException;

	// 주문상세 - 주문
	@Select(" SELECT T.* " + 
			" FROM " + 
			"    ( SELECT OL.ORD_CODE, ORD_DATE, ORD_STATUS, DT_TYPE, D_TIME " + 
			"        , ROW_NUMBER() OVER(PARTITION BY OL.ORD_CODE ORDER BY D_TIME) RN " + 
			"    FROM ORDER_LIST OL JOIN ORDER_DETAIL OD ON OL.ORD_CODE = OD.ORD_CODE " + 
			"        JOIN DEL_TYPE DT ON DT.DT_CODE = OD.DT_CODE " + 
			"        JOIN MEMBER M ON M.MEM_CODE = OL.MEM_CODE " + 
			"    WHERE OL.ORD_CODE = #{ord_code} " + 
			"    ORDER BY OL.ORD_CODE DESC )T " + 
			" WHERE RN = 1 ")
	public Order getOrderDetail(@Param("ord_code") String ord_code) throws ClassNotFoundException, SQLException;
	
	// 주문상세 - 주문 상품
	@Select(" SELECT OL.ORD_CODE, OD.ODD_CODE, ODD_CNT, IT.ITEM_CODE, CC_CODE " + 
			"    , ITEM_NAME, ITEM_IMG, OPT_NAME, ITEM_PRICE, SALE_RATE, EXTRA_PRICE " + 
			" FROM ORDER_LIST OL JOIN ORDER_DETAIL OD ON OL.ORD_CODE = OD.ORD_CODE " + 
			"    JOIN STOCK ST ON OD.ST_CODE = ST.ST_CODE " + 
			"    JOIN ITEM_OPTION IO ON IO.OPT_CODE = ST.OPT_CODE " + 
			"    JOIN ITEM IT ON IT.ITEM_CODE = IO.ITEM_CODE " + 
			"    JOIN ITEM_SALE SL ON IT.ITEM_CODE = SL.ITEM_CODE " + 
			"    JOIN MEMBER M ON M.MEM_CODE = OL.MEM_CODE " + 
			"    LEFT JOIN CANCEL C ON OD.ODD_CODE = C.ODD_CODE " + 
			" WHERE OL.ORD_CODE = #{ord_code} " + 
			" ORDER BY OD.ODD_CODE DESC ")
	public List<Order> getOrderItemDetail(@Param("ord_code") String ord_code) throws ClassNotFoundException, SQLException;
	
	// 배송지
	@Select(" SELECT ADR_NAME, RECIPIENT, AD.CONTACT " + 
			"    , ADR_DETAIL, DR_LOC, DR_ENTER, REQUESTS " + 
			" FROM ADDRESS AD JOIN DEL_REQUEST DR ON AD.ADR_CODE = DR.ADR_CODE " + 
			"    JOIN ORDER_LIST OL ON AD.ADR_CODE = OL.ADR_CODE " + 
			"    JOIN MEMBER MB ON OL.MEM_CODE = MB.MEM_CODE " + 
			" WHERE OL.ORD_CODE = #{ord_code} ")
	public Address getAddress(@Param("ord_code") String ord_code) throws ClassNotFoundException, SQLException;
	
	// 결제정보
	@Select(" SELECT PM.PM_CODE, PD_METHOD, PD_CODE " + 
			" FROM PAYMENT PM JOIN PAYMENT_DETAIL PD ON PM.PM_CODE = PD.PM_CODE " + 
			"    JOIN ORDER_LIST OL ON OL.ORD_CODE = PM.ORD_CODE " + 
			"    JOIN MEMBER MB ON MB.MEM_CODE = OL.MEM_CODE " + 
			" WHERE OL.ORD_CODE = #{ord_code} " +
			" ORDER BY OL.ORD_CODE DESC ")
	public Payment getPayDetail(@Param("ord_code") String ord_code) throws ClassNotFoundException, SQLException;
	
	// 취소 insert
	@Insert(" INSERT INTO CANCEL (CC_CODE, ODD_CODE, PD_CODE " +
			"			, RCC_CODE, CC_DESC, CC_DATE) " + 
			" VALUES (SEQ_CANCEL.NEXTVAL, ${odd_code}, ${pd_code} " +
			"			, ${rcc_code}, '${cc_desc}', sysdate) ")
	@Transactional(isolation = Isolation.READ_COMMITTED)
	public int insertCancel(Cancel cancel)
			throws ClassNotFoundException, SQLException;
	
	// 주문 update
	@Update(" UPDATE ORDER_LIST " + 
			" SET ORD_STATUS = '주문취소' " + 
			" WHERE ORD_CODE = #{ord_code} ")
	@Transactional(isolation = Isolation.READ_COMMITTED)
	public int updateCancel(@Param("ord_code") String ord_code)
			throws ClassNotFoundException, SQLException;
	
}

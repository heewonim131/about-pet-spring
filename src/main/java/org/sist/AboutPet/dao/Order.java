package org.sist.AboutPet.dao;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.sist.AboutPet.vo.Address;
import org.sist.AboutPet.vo.OrderAndPayment;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Repository
public interface Order {
	
	
	@Insert(" INSERT INTO ORDER_LIST "
			+ " (ORD_CODE,MEM_CODE,ADR_CODE,ORD_DATE,ORD_STATUS) " 
			+ " values "
			+ " (item_ORD_seq.nextval,#{mem_code},#{adr_code},SYSDATE ,'결제완료') "		
			)
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void insertOrderList(OrderAndPayment oap);
	
	@Insert("INSERT INTO ORDER_DETAIL(ODD_CODE,ORD_CODE,ST_CODE,ODD_CNT,DT_CODE,D_TIME) "
			+ "values (seq_odd_code.nextval,ITEM_ORD_SEQ.currval,1,1,${dt_code},sysdate) ")
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void insertOrderDetail(OrderAndPayment oap);
	
	@Insert("INSERT INTO PAYMENT(PM_CODE,ORD_CODE,PM_PRICE) "
            + "values (item_Payment_seq.nextval,ITEM_ORD_SEQ.currval,#{f_price}) ")
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void insertPayMent(OrderAndPayment oap);
	
	@Insert("INSERT INTO PAYMENT_DETAIL(PD_CODE,PM_CODE,PD_METHOD,PD_PRICE) "
            + "values (item_PaymentDetail_seq.nextval,item_Payment_seq.currval,#{card},#{f_price}) ")
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void insertPayMentDetail(OrderAndPayment oap);
	
	@Update("UPDATE member " + 
			"SET mem_point = #{mem_point} " + 
			"WHERE mem_code = #{mem_code}")
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void updatePoint(OrderAndPayment oap);
	
	

	@Select("SELECT MEM_POINT "
			+ "FROM member "
			+ "where mem_code = #{mem_code}")
	public String memberPoint(int mem_code) throws ClassNotFoundException,SQLException;

	@Select("SELECT * FROM member WHERE mem_code = #{ mem_code }")
	public Address orderMem(int mem_code);
	
	@Select("SELECT i.item_code, o.opt_code, opt_name, (EXTRA_PRICE+item_price) as price   " + 
			"FROM item i LEFT OUTER JOIN item_option o ON i.item_code = o.item_code  " + 
			"            LEFT OUTER JOIN stock s ON o.opt_code = s.opt_code " + 
			"WHERE i.item_code = #{ item_code } AND rownum = 1")
	public OrderAndPayment selectOptItem(int item_code);
	
	// 배송지 가져오는 쿼리
	@Select("SELECT adr_name,adr.adr_code,mem_name, m.contact , recipient, adr.contact as d_contact, adr_detail " + 
			"FROM member m JOIN ADDRESS adr ON m.mem_code = adr.mem_code  " + 
			"              JOIN DEL_REQUEST del ON adr.adr_code = del.dr_code " + 
			"WHERE m.mem_code = #{ mem_code }")
	public Address memberDel(int mem_code);
	
	
	@Select("SELECT item_fee  " + 
			"FROM item i JOIN company compp ON i.cpn_code = compp.cpn_code  " + 
			"WHERE item_code = #{ item_code }")
	public String selectFee(int item_code);
	
	
	@Select("SELECT ord_code  " + 
			"FROM ORDER_LIST  " + 
			"where rownum =1  " + 
			"order by ord_code desc")
	public String newOrdCode();
	
	
	
	
	
	

}

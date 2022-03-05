package org.sist.AboutPet.dao;

import org.apache.ibatis.annotations.Select;
import org.sist.AboutPet.vo.ShopITEM;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public interface Shop {
	
	@Select("SELECT i.item_code, item_name, st_code, st_avail ,(EXTRA_PRICE+item_price) as item_price  " + 
 			"FROM item i LEFT OUTER JOIN item_option o ON i.item_code = o.item_code " + 
 			"            LEFT OUTER JOIN stock s ON o.opt_code = s.opt_code " + 
 			"WHERE i.item_code = #{item_code} AND rownum = 1")
	public ShopITEM selectOptItem(int item_code);
	
	

}

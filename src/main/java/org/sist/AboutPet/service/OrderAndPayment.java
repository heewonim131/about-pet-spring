package org.sist.AboutPet.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public interface OrderAndPayment {
	
	public void insertOrderAll( org.sist.AboutPet.vo.OrderAndPayment orderAndPayment   );

}

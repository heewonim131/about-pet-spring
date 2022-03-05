package org.sist.AboutPet.service;

import org.sist.AboutPet.dao.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ABOrderAndPayment implements OrderAndPayment {
	
	@Autowired
	private Order order;
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void insertOrderAll(org.sist.AboutPet.vo.OrderAndPayment oap) {
			order.insertOrderList(oap);
			order.insertOrderDetail(oap);
			order.insertPayMent(oap);
			order.insertPayMentDetail(oap);
			order.updatePoint(oap);
	}

}

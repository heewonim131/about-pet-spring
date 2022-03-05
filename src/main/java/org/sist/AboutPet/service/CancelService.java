package org.sist.AboutPet.service;

import java.sql.SQLException;
import java.util.List;

import org.sist.AboutPet.vo.Cancel;
import org.springframework.stereotype.Service;

@Service
public interface CancelService {

	// 주문취소 트랜잭션
	public void insertCancel(List<Cancel> cancellist) throws ClassNotFoundException, SQLException;
	public void insertAndUpdateCancel(List<Cancel> cancellist, String ord_code) throws ClassNotFoundException, SQLException;
	
}

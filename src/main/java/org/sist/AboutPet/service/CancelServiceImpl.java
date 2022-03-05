package org.sist.AboutPet.service;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import org.sist.AboutPet.dao.MemberDao;
import org.sist.AboutPet.vo.Cancel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CancelServiceImpl implements CancelService {
	
	@Autowired
	private MemberDao memberDao;

	@Override
	@Transactional
	public void insertCancel(List<Cancel> cancellist) throws ClassNotFoundException, SQLException {
		int irowCnt;
		Iterator<Cancel> ir = cancellist.iterator();
		while (ir.hasNext()) {
			Cancel cancel = ir.next();
			System.out.println(cancel.getOdd_code()+"service");
			irowCnt = this.memberDao.insertCancel(cancel);
		}
	}
	@Override
	@Transactional
	public void insertAndUpdateCancel(List<Cancel> cancellist, String ord_code) throws ClassNotFoundException, SQLException {
		insertCancel(cancellist);
		int urowCnt = this.memberDao.updateCancel(ord_code);
	}

	
}

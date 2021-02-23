package tw.hanjee.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import tw.hanjee.order.dao.IvDao;
import tw.hanjee.order.model.Iv;
import tw.hanjee.order.service.Iv_Service;
@Service
@EnableTransactionManagement
@Transactional
public class Iv_Service_Impl implements Iv_Service {
	@Autowired
	IvDao ivDao;

	@Override
	public void insertIv(Iv iv) {
		ivDao.insertIv(iv);
	}

	@Override
	public List<Iv> selectByIvNumber(String iv_number) {
		
		return ivDao.selectByIvNumber(iv_number);
	}

	@Override
	public void updatePro_no(Integer iv_no, Integer ord_no) {
		ivDao.updatePro_no(iv_no, ord_no);
		
	}

	@Override
	public List<Iv> selectByIvNO(Integer iv_no) {
		return ivDao.selectByIvNO(iv_no);
	
	}

}

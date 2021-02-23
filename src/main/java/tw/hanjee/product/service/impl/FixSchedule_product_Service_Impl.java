package tw.hanjee.product.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import tw.hanjee.product.dao.FixSchedule_productDao;
import tw.hanjee.product.model.FixSchedule_product;
import tw.hanjee.product.service.FixSchedule_product_Service;
@Service
@EnableTransactionManagement
@Transactional
public class FixSchedule_product_Service_Impl implements FixSchedule_product_Service {
	@Autowired
	FixSchedule_productDao fixSchedule_productDao;
	@Override
	public List<FixSchedule_product> getAllFixScheduleProduct(String fixSch_name) {
		
		return fixSchedule_productDao.getAllFixScheduleProduct(fixSch_name);
	}
	@Override
	public List<FixSchedule_product> getFixScheduleProductById(Integer fixSch_no) {
		
		return fixSchedule_productDao.getFixScheduleProductById(fixSch_no);
	}
	@Override
	public void updateStockQuantity(Integer fixSch_no, Integer buyQuantity) {
		fixSchedule_productDao.updateStockQuantity(fixSch_no,buyQuantity);
		
	}
	@Override
	public List<FixSchedule_product> getFixSchProduct(String search) {
		
		return fixSchedule_productDao.getFixSchProduct(search);
	}
	@Override
	public void UpdateFixSchProduct(FixSchedule_product fixSchedule_product) {
		fixSchedule_productDao.UpdateFixSchProduct(fixSchedule_product);
		
	}
	@Override
	public void AddFixSchProduct(FixSchedule_product fixSchedule_product) {
		fixSchedule_productDao.AddFixSchProduct(fixSchedule_product);
		
	}

}

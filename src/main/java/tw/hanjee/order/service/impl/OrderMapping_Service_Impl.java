package tw.hanjee.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import tw.hanjee.order.dao.OrderMappingDao;
import tw.hanjee.order.model.OrderMapping;
import tw.hanjee.order.service.OrderMapping_Service;
@Service
@EnableTransactionManagement
@Transactional
public class OrderMapping_Service_Impl implements OrderMapping_Service {
	@Autowired
	OrderMappingDao orderMappingDao;
	@Override
	public void insertOrderMapping(OrderMapping orderMapping) {
		orderMappingDao.insertOrderMapping(orderMapping);

	}
	@Override
	public List<OrderMapping> selectOrderMappingByOrderNo(Integer ord_no) {
		
		return orderMappingDao.selectOrderMappingByOrderNo(ord_no);
	}

}

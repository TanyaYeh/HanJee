package tw.hanjee.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import tw.hanjee.order.dao.OrderMainDao;
import tw.hanjee.order.model.OrderMain;
import tw.hanjee.order.service.OrderMain_Service;
@Service
@EnableTransactionManagement
@Transactional
public class OrderMain_Service_Impl implements OrderMain_Service {
	@Autowired
	OrderMainDao orderMainDao;
	@Override
	public void insertOrderMain(OrderMain orderMain) {
		orderMainDao.insertOrderMain(orderMain);

	}
	@Override
	public List<OrderMain> selectOrderMainByMemberId(Integer member_id) {
		
		return orderMainDao.selectOrderMainByMemberId(member_id);
	}
	@Override
	public List<OrderMain> selectOrderMainByOrderNo(Integer order_no) {
		
		return orderMainDao.selectOrderMainByOrderNo(order_no);
	}
	@Override
	public void updateOrdId(String ord_id, Integer ord_no) {
		orderMainDao.updateOrdId(ord_id, ord_no);
		
	}
	@Override
	public List<OrderMain> getOrders(String search) {
		
		return orderMainDao.getOrders(search);
	}
	@Override
	public void updateOrder(Integer ord_no, String recipient, String recipient_phone, String recipient_address,
			String note) {
		 orderMainDao.updateOrder(ord_no, recipient, recipient_phone, recipient_address, note);
		
	}
	@Override
	public void deleteOrder(Integer ord_no) {
		orderMainDao.deleteOrder(ord_no);
		
	}

}

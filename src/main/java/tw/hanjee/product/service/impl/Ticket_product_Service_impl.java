package tw.hanjee.product.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import tw.hanjee.product.dao.Ticket_productDao;
import tw.hanjee.product.model.Ticket_product;
import tw.hanjee.product.service.Ticket_product_Service;

@Service
@EnableTransactionManagement
@Transactional
public class Ticket_product_Service_impl implements Ticket_product_Service {
	@Autowired
	Ticket_productDao ticket_productDao;

	@Override
	public List<Ticket_product> getAllTicketProduct() {

		return ticket_productDao.getAllTicketProduct();
	}

	@Override
	public List<Ticket_product> getselect() {

		return ticket_productDao.getselect();
	}

	@Override
	public List<Ticket_product> getselectBySED(String selectStart, String selectEnd, String selectDate) {

		return ticket_productDao.getselectBySED(selectStart, selectEnd, selectDate);
	}

	@Override
	public List<Ticket_product> getShoppingcartInfo(Integer pro_no) {

		return ticket_productDao.getShoppingcartInfo(pro_no);
	}

	@Override
	public void updateStockQuantity(Integer pro_no, Integer buyQuantity) {
		ticket_productDao.updateStockQuantity(pro_no, buyQuantity);

	}

	@Override
	public List<Ticket_product> getTicketProduct(String search) {
		return ticket_productDao.getTicketProduct(search);
		
	}

	@Override
	public void UpdateTicketProduct(Ticket_product ticket_product) {
		ticket_productDao.UpdateTicketProduct(ticket_product);
		
	}

	@Override
	public void AddTicketProduct(Ticket_product ticket_product) {
		ticket_productDao.AddTicketProduct(ticket_product);
		
	}

}

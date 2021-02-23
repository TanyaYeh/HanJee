package tw.hanjee.product.dao;

import java.sql.Timestamp;
import java.util.List;

import tw.hanjee.product.model.Ticket_product;

public interface Ticket_productDao {


	List<Ticket_product> getAllTicketProduct();
	List<Ticket_product> getTicketProduct(String search);
	List<Ticket_product> getselect();
	List<Ticket_product> getselectBySED(String selectStart,String selectEnd,String selectDate);
	List<Ticket_product> getShoppingcartInfo(Integer pro_no);
	
	void updateStockQuantity(Integer pro_no,Integer buyQuantity);
	void UpdateTicketProduct(Ticket_product ticket_product);
	void AddTicketProduct(Ticket_product ticket_product);
}

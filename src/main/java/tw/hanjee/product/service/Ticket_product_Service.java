package tw.hanjee.product.service;

import java.sql.Timestamp;
import java.util.List;

import tw.hanjee.product.model.Ticket_product;

public interface Ticket_product_Service {
	public List<Ticket_product> getAllTicketProduct();
	
	public List<Ticket_product> getTicketProduct(String search);

	public List<Ticket_product> getselect();
	
	public List<Ticket_product> getselectBySED(String selectStart,String selectEnd,String selectDate);

	public List<Ticket_product> getShoppingcartInfo(Integer pro_no);
	public void updateStockQuantity(Integer pro_no,Integer buyQuantity);
	public void UpdateTicketProduct(Ticket_product ticket_product);
	public void AddTicketProduct(Ticket_product ticket_product);

}

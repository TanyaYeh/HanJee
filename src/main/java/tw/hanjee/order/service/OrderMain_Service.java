package tw.hanjee.order.service;

import java.util.List;

import tw.hanjee.order.model.OrderMain;

public interface OrderMain_Service {
	public void insertOrderMain(OrderMain orderMain);
	public List<OrderMain> selectOrderMainByMemberId(Integer member_id);
	public List<OrderMain> selectOrderMainByOrderNo(Integer order_no);
	public void updateOrdId(String ord_id, Integer ord_no);
	public List<OrderMain> getOrders(String search);
	public void updateOrder(Integer ord_no, String recipient,String recipient_phone,String recipient_address,String note);
	public void deleteOrder(Integer ord_no) ;
}

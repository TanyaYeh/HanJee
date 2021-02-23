package tw.hanjee.order.dao;

import java.util.List;

import tw.hanjee.order.model.OrderMain;
import tw.hanjee.order.model.OrderMapping;
import tw.hanjee.product.model.FixSchedule_product;

public interface OrderMainDao {

	public void insertOrderMain(OrderMain orderMain);
	public List<OrderMain> selectOrderMainByMemberId(Integer member_id);
	public List<OrderMain> selectOrderMainByOrderNo(Integer order_no);
	public void updateOrdId(String ord_id,Integer ord_no);
	public List<OrderMain> getOrders(String search);
	public void updateOrder(Integer ord_no, String recipient,String recipient_phone,String recipient_address,String note) ;
	public void deleteOrder(Integer ord_no) ;
}

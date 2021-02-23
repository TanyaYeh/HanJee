package tw.hanjee.order.dao;

import java.util.List;

import tw.hanjee.order.model.OrderMapping;

public interface OrderMappingDao {

	public void insertOrderMapping(OrderMapping orderMapping);
	public List<OrderMapping> selectOrderMappingByOrderNo(Integer ord_no);
}

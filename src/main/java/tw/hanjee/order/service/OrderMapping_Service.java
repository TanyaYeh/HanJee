package tw.hanjee.order.service;

import java.util.List;

import tw.hanjee.order.model.OrderMapping;

public interface OrderMapping_Service {
	public void insertOrderMapping(OrderMapping orderMapping);
	public List<OrderMapping> selectOrderMappingByOrderNo(Integer ord_no);
}

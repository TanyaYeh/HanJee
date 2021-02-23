package tw.hanjee.product.service;

import java.util.List;

import tw.hanjee.product.model.FixSchedule_product;

public interface FixSchedule_product_Service {
	public List<FixSchedule_product> getAllFixScheduleProduct(String fixSch_name);
	public List<FixSchedule_product> getFixScheduleProductById(Integer fixSch_no);
	public void  updateStockQuantity(Integer fixSch_no,Integer buyQuantity);
	List<FixSchedule_product> getFixSchProduct(String search);
	public void UpdateFixSchProduct(FixSchedule_product fixSchedule_product);
	public void AddFixSchProduct(FixSchedule_product fixSchedule_product);

}

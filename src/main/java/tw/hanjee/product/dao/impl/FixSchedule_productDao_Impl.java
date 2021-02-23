package tw.hanjee.product.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.product.dao.FixSchedule_productDao;
import tw.hanjee.product.model.FixSchedule_product;
import tw.hanjee.product.model.Ticket_product;
@Repository
public class FixSchedule_productDao_Impl implements FixSchedule_productDao {
	@Autowired
	SessionFactory factory;
	@SuppressWarnings("unchecked")
	@Override
	public List<FixSchedule_product> getAllFixScheduleProduct(String fixSch_name) {
		String hql = "From FixSchedule_product f WHERE (1=1)";
		if(!fixSch_name.equals("")) {
			hql+=" AND f.fixSch_name like :name";
		}
		Query q =factory.getCurrentSession().createQuery(hql);
		if(!fixSch_name.equals("")) {
			q.setParameter("name", "%"+fixSch_name+"%");
		}
		
		List<FixSchedule_product> fProducts=q.getResultList();
		return fProducts;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<FixSchedule_product> getFixScheduleProductById(Integer fixSch_no) {
		String hql = "From FixSchedule_product f WHERE f.fixSch_no= :fixSch_no";
		Query q =factory.getCurrentSession().createQuery(hql);
		return q.setParameter("fixSch_no", fixSch_no).getResultList();
	}
	@Override
	public void updateStockQuantity(Integer fixSch_no, Integer buyQuantity) {
		//拿取現在資料庫的商品資料
				//List<Ticket_product> ticket = getShoppingcartInfo(pro_no);
				String hql="update FixSchedule_product f set f.fixSch_available =f.fixSch_available-:fixSch_available where f.fixSch_no = :fixSch_no";
				Query q = factory.getCurrentSession().createQuery(hql);
				//拿取商品庫存減去購買數量為新的庫存數量
				q.setParameter("fixSch_available", buyQuantity);
				q.setParameter("fixSch_no", fixSch_no);
				q.executeUpdate();
		
	}
	@Override
	public List<FixSchedule_product> getFixSchProduct(String search) {
		String hql = "FROM FixSchedule_product f WHERE (1=1)";
		if(!search.equals("")) {
			hql+=" AND (f.fixSch_name like :search OR f.fixSch_description like :search) ";
		}
		hql+="ORDER BY f.fixSch_no asc";
		Query q = factory.getCurrentSession().createQuery(hql);
		if(!search.equals("")) {
			q.setParameter("search", "%"+search+"%");
		}
		
		
		@SuppressWarnings("unchecked")
		List<FixSchedule_product> fixSchproduct = q.getResultList();
		return fixSchproduct;
	}
	
	@Override
	public void UpdateFixSchProduct(FixSchedule_product fixSchedule_product) {
		factory.getCurrentSession().update(fixSchedule_product);
		
	}
	@Override
	public void AddFixSchProduct(FixSchedule_product fixSchedule_product) {
		factory.getCurrentSession().save(fixSchedule_product);
		
	}

}

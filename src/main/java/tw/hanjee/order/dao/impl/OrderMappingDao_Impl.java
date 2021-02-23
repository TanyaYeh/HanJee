package tw.hanjee.order.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.order.dao.OrderMappingDao;
import tw.hanjee.order.model.OrderMapping;
@Repository
public class OrderMappingDao_Impl implements OrderMappingDao {
	@Autowired
	SessionFactory factory;
	@Override
	public void insertOrderMapping(OrderMapping orderMapping) {
		factory.getCurrentSession().save(orderMapping);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<OrderMapping> selectOrderMappingByOrderNo(Integer ord_no) {
		String hql = "FROM OrderMapping  WHERE ord_no= :ord_no";
		Query q = factory.getCurrentSession().createQuery(hql);
		q.setParameter("ord_no", ord_no);
		List<OrderMapping> orderDetail = q.getResultList();
		return orderDetail;
	}
}

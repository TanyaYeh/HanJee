package tw.hanjee.order.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import tw.hanjee.order.dao.OrderMainDao;
import tw.hanjee.order.model.OrderMain;
import tw.hanjee.order.model.OrderMapping;
import tw.hanjee.product.model.FixSchedule_product;
@Repository
public class OrderMainDao_Impl implements OrderMainDao {
	@Autowired
	SessionFactory factory;

	@Override
	public void insertOrderMain(OrderMain orderMain) {
		factory.getCurrentSession().save(orderMain);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderMain> selectOrderMainByMemberId(Integer member_id) {
		String hql = "FROM OrderMain o WHERE o.member_id= :member_id AND o.isDelete=0 ORDER BY ord_date DESC";
		Query q = factory.getCurrentSession().createQuery(hql);
		q.setParameter("member_id", member_id);
		List<OrderMain> order = q.getResultList();
		return order;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<OrderMain> selectOrderMainByOrderNo(Integer order_no) {
		String hql = "FROM OrderMain o WHERE ord_no= :order_no";
		Query q = factory.getCurrentSession().createQuery(hql);
		q.setParameter("order_no", order_no);
		List<OrderMain> orders = q.getResultList();
		return  orders;
		
	}

	@Override
	public void updateOrdId(String ord_id, Integer ord_no) {
		String hql = "update OrderMain o set o.ord_id = :ord_id where o.ord_no = :ord_no";
		Query q = factory.getCurrentSession().createQuery(hql);
		q.setParameter("ord_id", ord_id);
		q.setParameter("ord_no", ord_no);
		q.executeUpdate();

	}

	@Override
	public List<OrderMain> getOrders(String search) {
		String hql = "FROM OrderMain o WHERE o.isDelete=0";
		if(!search.equals("")) {
			hql+=" AND (o.ord_id like :search OR o.recipient like :search OR o.manager_id like :search)";
		}
		hql+=" ORDER BY o.update_time DESC";
		Query q = factory.getCurrentSession().createQuery(hql);
		if(!search.equals("")) {
			q.setParameter("search", "%"+search+"%");
		}
		
		
		@SuppressWarnings("unchecked")
		List<OrderMain> orders = q.getResultList();
		return orders;
		
	}

	
	@Override
	public void updateOrder(Integer ord_no, String recipient,String recipient_phone,String recipient_address,String note) {
		String hql = "update OrderMain o set o.recipient = :recipient,o.recipient_phone = :recipient_phone,o.recipient_address = :recipient_address,o.note = :note where o.ord_no = :ord_no";
		
		Query q = factory.getCurrentSession().createQuery(hql);
		q.setParameter("recipient", recipient);
		q.setParameter("recipient_phone", recipient_phone);
		q.setParameter("recipient_address", recipient_address);
		q.setParameter("note", note);
		q.setParameter("ord_no", ord_no);
		
		q.executeUpdate();
		
	}

	@Override
	public void deleteOrder(Integer ord_no) {
        String hql = "update OrderMain o set o.isDelete = 1 where o.ord_no = :ord_no";
		
		Query q = factory.getCurrentSession().createQuery(hql);
		q.setParameter("ord_no", ord_no);
		q.executeUpdate();
		
	}
	

}

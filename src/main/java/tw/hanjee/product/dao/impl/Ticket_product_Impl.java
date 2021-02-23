package tw.hanjee.product.dao.impl;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.product.dao.Ticket_productDao;
import tw.hanjee.product.model.Ticket_product;

@Repository
public class Ticket_product_Impl implements Ticket_productDao {
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket_product> getAllTicketProduct() {
		String hql = "From Ticket_product";
		return factory.getCurrentSession().createQuery(hql).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket_product> getselect() {
		String hql="Select pro_no,pro_start,pro_end,pro_date From Ticket_product";
		List<Ticket_product> product =  factory.getCurrentSession().createQuery(hql).getResultList();
		return product;
	}

	@Override
	public List<Ticket_product> getselectBySED( String selectStart,String selectEnd,String selectDate) {
		String hql = "FROM Ticket_product t WHERE (1=1)";
		if(!selectStart.equals("--請選擇--")) {
			hql+=" AND t.pro_start = :start";
		}
		if(!selectEnd.equals("--請選擇--")) {
			hql+=" and t.pro_end= :end";
		}
		Date date = null;
		if(!selectDate.equals("--請選擇--")) {
			hql+=" and t.pro_date= :date";
			
			try {
			    date = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").parse(selectDate);
			} catch (Exception e) {
			    
			}
		}
		Query q = factory.getCurrentSession().createQuery(hql);
		if(!selectStart.equals("--請選擇--")) {
			q.setParameter("start", selectStart);
		}
		if(!selectEnd.equals("--請選擇--")) {
			q.setParameter("end", selectEnd);
		}
		
		if(!selectDate.equals("--請選擇--")) {
			q.setParameter("date", date);
		}
		
		@SuppressWarnings("unchecked")
		List<Ticket_product> product = q.getResultList();
		return product;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Ticket_product> getShoppingcartInfo(Integer pro_no) {
		String hql="From Ticket_product where pro_no= :pro_no";
		return factory.getCurrentSession().createQuery(hql).setParameter("pro_no", pro_no).getResultList();
		 
	}

	@Override
	public void updateStockQuantity(Integer pro_no, Integer buyQuantity) {
		//拿取現在資料庫的商品資料
		//List<Ticket_product> ticket = getShoppingcartInfo(pro_no);
		String hql="update Ticket_product t set t.pro_sto =t.pro_sto-:pro_sto where t.pro_no = :pro_no";
		Query q = factory.getCurrentSession().createQuery(hql);
		//拿取商品庫存減去購買數量為新的庫存數量
		q.setParameter("pro_sto", buyQuantity);
		q.setParameter("pro_no", pro_no);
		q.executeUpdate();
	}

	@Override
	public List<Ticket_product> getTicketProduct(String search) {
		String hql = "FROM Ticket_product t WHERE (1=1)";
		if(!search.equals("")) {
			hql+=" AND (t.pro_start like :search OR t.pro_end like :search OR t.pro_name like :search OR t.pro_cat like :search)";
		}
		
		Query q = factory.getCurrentSession().createQuery(hql);
		if(!search.equals("")) {
			q.setParameter("search", "%"+search+"%");
		}
		
		
		@SuppressWarnings("unchecked")
		List<Ticket_product> product = q.getResultList();
		return product;
		
	}

	@Override
	public void UpdateTicketProduct(Ticket_product ticket_product) {
		factory.getCurrentSession().update(ticket_product);
		
	}

	@Override
	public void AddTicketProduct(Ticket_product ticket_product) {
		factory.getCurrentSession().save(ticket_product);
		
	}
	
	
	
	
}

package tw.hanjee.schedule.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.schedule.dao.CityDao;
import tw.hanjee.schedule.dao.PlaceDao;
import tw.hanjee.schedule.model.CityBean;
import tw.hanjee.schedule.model.PlaceBean;



@Repository
public class PlaceDaoImpl implements Serializable, PlaceDao {

	private static final long serialVersionUID = 1L;
	private Integer pla_no = 0;
	private String tagName = "";
	private Integer selected = -1;
	@Autowired
	SessionFactory factory;
	
	@Autowired
	CityDao cd;

	public PlaceDaoImpl() {
	}

	@Override
	public PlaceBean getPlaceById() {
		Session session = factory.getCurrentSession();
		PlaceBean pb = null;
		pb = session.get(PlaceBean.class, pla_no);
		return pb;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<PlaceBean> getPlace() {
		
		String hql = "FROM PlaceBean";
		Session session = factory.getCurrentSession();
		
		return session.createQuery(hql).getResultList();
	}

	@Override
	public Integer getPlace_no() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getSelected() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String getSelectTag() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getTagName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setCity_no(Integer pla_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setSelected(Integer pla_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setTagName(String tagName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PlaceBean getPlace(Integer pla_no) {
		Session session = factory.getCurrentSession();
		return session.get(PlaceBean.class, pla_no);
	}
	
	
	
	
}

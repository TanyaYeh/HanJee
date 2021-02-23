package tw.hanjee.schedule.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.schedule.dao.CityDao;
import tw.hanjee.schedule.model.CityBean;

@Repository
public class CityDaioImpl implements Serializable, CityDao {
	private static final long serialVersionUID = 1L;
	private Integer city_no = 0;
	private String tagName = "";
	private Integer selected = -1;
	
	@Autowired
	SessionFactory factory;
	@Autowired
	CityDao cd;
	
	public CityDaioImpl() {
		
	}
	
	@Override
	public CityBean getCityById() {
		Session session = factory.getCurrentSession();
		CityBean cb = null;
		cb = session.get(CityBean.class, city_no);
		return cb;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CityBean> getCity() {
		List<CityBean> list = new ArrayList<>();
		String hql = "FROM CityBean";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql)
					  .getResultList();
		return list;
	}
	
	@Override
	public int getSelected() {
		return selected;
	}
	
	@Override
	public void setSelected(Integer selected) {
		this.selected = selected;
	}
	
	@Override
	public String getTagName() {
		return tagName;
	}
	
	@Override
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	
	@Override
	public Integer getCity_no() {
		return city_no;
	}
	
	@Override
	public void setCity_no(Integer city_no) {
		this.city_no = city_no;
	}

	@Override
	public String getSelectTag() {
		String ans = "";
		List<CityBean> cb = getCity();
		ans += "<SELECT name='" + getTagName() + "'>";
		for (CityBean bean : cb) {
			Integer city_no = bean.getCity_no();
			String name = bean.getCity_name();
			if (city_no == selected) {
				ans += "<option value='" + city_no + "' selected>" + name + "</option>";
			} else {
				ans += "<option value='" + city_no + "'>" + name + "</option>";
			}
		}
		ans += "</SELECT>";
		return ans;
	}
}

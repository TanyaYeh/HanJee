package tw.hanjee.schedule.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.hanjee.schedule.dao.CityDao;
import tw.hanjee.schedule.model.CityBean;
import tw.hanjee.schedule.service.CityService;
@Service
public class CityServiceImpl implements Serializable, CityService{
	private static final long serialVersionUID = 1L;
	@Autowired
	CityDao cd;
	
	public CityServiceImpl() {
		
	}

	
	@Transactional
	@Override
	public CityBean getCityById() {
		return cd.getCityById();
	}
	@Transactional
	@Override
	public List<CityBean> getCity() {
		return cd.getCity();
	}
	
	@Override
	public Integer getCity_no() {
		return cd.getCity_no();
	}
	
	@Override
	public int getSelected() {
		return cd.getSelected();
	}
	@Transactional
	@Override
	public String getSelectTag() {
		return cd.getSelectTag();
	}

	@Override
	public String getTagName() {
		return cd.getTagName();
	}

	@Override
	public void setCity_no(Integer city_no) {
	cd.setCity_no(city_no);
	}

	@Override
	public void setSelected(Integer city_no) {
		cd.setSelected(city_no);
	}

	@Override
	public void setTagName(String tagName) {
		cd.setTagName(tagName);
	}

}

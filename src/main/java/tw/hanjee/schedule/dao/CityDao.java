package tw.hanjee.schedule.dao;

import java.util.List;

import tw.hanjee.schedule.model.CityBean;

public interface CityDao {

	CityBean getCityById();

	List<CityBean> getCity();

	Integer getCity_no();
	
	int getSelected();

	String getSelectTag();

	String getTagName();
	
	void setCity_no(Integer city_no);
	
	void setSelected(Integer city_no);

	void setTagName(String tagName);
}

package tw.hanjee.schedule.service;

import java.util.List;

import tw.hanjee.schedule.model.CityBean;

public interface CityService {
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

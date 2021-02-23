package tw.hanjee.schedule.dao;

import java.util.List;

import tw.hanjee.schedule.model.PlaceBean;



public interface PlaceDao {
	PlaceBean getPlaceById();
	PlaceBean getPlace(Integer pla_no);
	List<PlaceBean> getPlace();

	Integer getPlace_no();
	
	int getSelected();

	String getSelectTag();

	String getTagName();
	
	void setCity_no(Integer pla_no);
	
	void setSelected(Integer pla_no);

	void setTagName(String tagName);
}

package tw.hanjee.schedule.service;

import java.util.List;

import tw.hanjee.schedule.model.PlaceBean;

public interface PlaceService {
	PlaceBean getPlaceById();

	List<PlaceBean> getPlace();
	PlaceBean getPlace(Integer pla_no);
}

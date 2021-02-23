package tw.hanjee.schedule.service;

import java.util.List;

import tw.hanjee.schedule.model.PlaceBean;
import tw.hanjee.schedule.model.PlaceDetailBean;

public interface IplaceService {

	List<PlaceBean> selectAttractionGetList(Integer pla_no);

	PlaceBean selectAttractionsGetBean(Integer pla_no);
	
	List<PlaceDetailBean> selectAllAttraction();

}

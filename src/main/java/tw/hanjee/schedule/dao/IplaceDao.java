package tw.hanjee.schedule.dao;

import java.util.List;

import tw.hanjee.schedule.model.PlaceBean;
import tw.hanjee.schedule.model.PlaceDetailBean;

public interface IplaceDao {

	PlaceBean selectAttractionsGetBean(Integer pla_no);

	List<PlaceBean> selectAttractionGetList(Integer pla_no);

	List<PlaceDetailBean> selectAllAttraction();
	
}
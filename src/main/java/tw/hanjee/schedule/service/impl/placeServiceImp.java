package tw.hanjee.schedule.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.hanjee.schedule.dao.IplaceDao;
import tw.hanjee.schedule.model.PlaceBean;
import tw.hanjee.schedule.model.PlaceDetailBean;
import tw.hanjee.schedule.service.IplaceService;


@Transactional
@Service
public class placeServiceImp implements IplaceService {

	@Autowired
	IplaceDao iplaceDao;
	
	@Override
	public List<PlaceBean> selectAttractionGetList(Integer pla_no) {
		
		return (List<PlaceBean>) iplaceDao.selectAttractionGetList(pla_no);
	}

	@Override
	public PlaceBean selectAttractionsGetBean(Integer pla_no) {
		
		return iplaceDao.selectAttractionsGetBean(pla_no);
	}

	@Override
	public List<PlaceDetailBean> selectAllAttraction() {
		
		return iplaceDao.selectAllAttraction();
	}

}

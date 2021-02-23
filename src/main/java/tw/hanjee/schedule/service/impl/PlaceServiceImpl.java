package tw.hanjee.schedule.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.hanjee.schedule.dao.PlaceDao;
import tw.hanjee.schedule.model.PlaceBean;
import tw.hanjee.schedule.service.PlaceService;
@Transactional
@Service
public class PlaceServiceImpl implements PlaceService{

	@Autowired
	PlaceDao pd;
	
	@Override
	public PlaceBean getPlaceById() {
		return pd.getPlaceById();
	}

	@Override
	public List<PlaceBean> getPlace() {
		return pd.getPlace();
	}

	@Override
	public PlaceBean getPlace(Integer pla_no) {
		return pd.getPlace(pla_no);
	}

}

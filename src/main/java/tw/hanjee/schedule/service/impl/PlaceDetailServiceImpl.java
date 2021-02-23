package tw.hanjee.schedule.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.hanjee.schedule.dao.PlaceDetailDao;
import tw.hanjee.schedule.model.PlaceDetailBean;
import tw.hanjee.schedule.service.PlaceDetailService;

@Service
@Transactional
public class PlaceDetailServiceImpl implements PlaceDetailService{
@Autowired
PlaceDetailDao pdd;

public boolean saveLntLat(PlaceDetailBean pdb) {
	return pdd.saveLntLat(pdb);
}

@Override
public PlaceDetailBean getPDBByPla_no(Integer pla_no) {
	return pdd.getPDBByPla_no(pla_no);
}
}

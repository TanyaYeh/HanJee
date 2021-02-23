package tw.hanjee.schedule.service;

import tw.hanjee.schedule.model.PlaceDetailBean;

public interface PlaceDetailService {
	boolean saveLntLat(PlaceDetailBean pdb);
	PlaceDetailBean getPDBByPla_no(Integer pla_no);
}

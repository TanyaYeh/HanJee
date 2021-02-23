package tw.hanjee.schedule.dao;

import tw.hanjee.schedule.model.PlaceDetailBean;

public interface PlaceDetailDao {
	boolean saveLntLat(PlaceDetailBean pdb);
	PlaceDetailBean getPDBByPla_no(Integer pla_no);
}

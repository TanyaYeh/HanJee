package tw.hanjee.schedule.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import tw.hanjee.schedule.model.DailyScheduleBean;
import tw.hanjee.schedule.model.PlaceBean;
import tw.hanjee.schedule.model.PlaceDetailBean;
import tw.hanjee.schedule.model.ScheduleBean;

public interface IscheduleDao {

	PlaceBean getAttractionsBean(Integer pla_no);
	PlaceDetailBean getAttractionDetail(Integer pla_no);
	public PlaceBean getPlaceBeanByLan(Double pla_lan);
	public Map<java.sql.Date, List<DailyScheduleBean>> eachdaySch(java.sql.Date queryDate);
	public List<ScheduleBean> queryAllSchList(Integer member_id);
	public boolean saveSchedule(ScheduleBean schb);
	public boolean saveDailySchedule(DailyScheduleBean dailyschb);
}
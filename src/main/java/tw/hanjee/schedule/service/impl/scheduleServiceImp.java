package tw.hanjee.schedule.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.hanjee.schedule.dao.IscheduleDao;
import tw.hanjee.schedule.model.DailyScheduleBean;
import tw.hanjee.schedule.model.PlaceBean;
import tw.hanjee.schedule.model.PlaceDetailBean;
import tw.hanjee.schedule.model.ScheduleBean;
import tw.hanjee.schedule.service.IscheduleService;

@Transactional
@Service
public class scheduleServiceImp implements IscheduleService {

	@Autowired
	IscheduleDao ischeduleDao;
	
	@Override
	public PlaceBean getAttractionsBean(Integer pla_no) {
		
		return ischeduleDao.getAttractionsBean(pla_no);
	}

	@Override
	public PlaceDetailBean getAttractionDetail(Integer pla_no) {
		
		return ischeduleDao.getAttractionDetail(pla_no);
	}

	@Override
	public PlaceBean getPlaceBeanByLan(Double pla_lan) {
		
		return ischeduleDao.getPlaceBeanByLan(pla_lan);
	}

	@Override
	public Map<Integer, List<java.sql.Date>> memberHangoutDate(Integer member_id) {
		Map<Integer, List<java.sql.Date>> memOutDate = new LinkedHashMap<Integer, List<java.sql.Date>>();
		List<java.sql.Date> hangOutDate = new ArrayList<java.sql.Date>();
		List<ScheduleBean> allSchList = ischeduleDao.queryAllSchList(member_id);
		for(ScheduleBean sdB:allSchList) {
			for(DailyScheduleBean eachsdB:sdB.getDailySchedule()) {
				hangOutDate.add(eachsdB.getSch_Daily());
			}
		}
		memOutDate.put(member_id, hangOutDate);
		
		return memOutDate;
	}

	@Override
	public Map<java.sql.Date, List<DailyScheduleBean>> eachdaySch(java.sql.Date queryDate) {
		return ischeduleDao.eachdaySch(queryDate);
	}

	@Override
	public List<ScheduleBean> queryAllSchList(Integer member_id) {
		return ischeduleDao.queryAllSchList(member_id);
	}

	@Override
	public Map<Integer, Map<java.sql.Date, List<Integer>>> queryDatePlaceBymemberIDDate(java.sql.Date queryDate, Integer member_id) {
		List<Integer> putplace=new ArrayList<Integer>();
		Map<java.sql.Date, List<Integer>> datePlace=new LinkedHashMap<java.sql.Date, List<Integer>>();
		Map<Integer, Map<java.sql.Date, List<Integer>>> memberOnDatePlace = new LinkedHashMap<Integer, Map<java.sql.Date,List<Integer>>>();
		Map<java.sql.Date, List<DailyScheduleBean>> allSchonDate = eachdaySch(queryDate);
		Set<Integer> sch_noSet = new HashSet<Integer>();
		List<ScheduleBean> allMemSch=queryAllSchList(member_id);
		for(ScheduleBean sch_no:allMemSch) {
			sch_noSet.add(sch_no.getSch_no());
		}
		for(DailyScheduleBean dscb:allSchonDate.get(queryDate)) {
			for(Integer sch_no:sch_noSet) {
				if(dscb.getScheduleBean().getSch_no()==sch_no) {
					putplace.add(dscb.getSch_Pla1());
					putplace.add(dscb.getSch_Pla2());
					putplace.add(dscb.getSch_Pla3());
					putplace.add(dscb.getSch_Pla4());
					putplace.add(dscb.getSch_Pla5());
				}
			}
			
		}
		datePlace.put(queryDate, putplace);
		memberOnDatePlace.put(member_id, datePlace);
		
		return memberOnDatePlace;
	}

	@Override
	public boolean saveSchedule(ScheduleBean schb) {
		
		return ischeduleDao.saveSchedule(schb);
	}

	@Override
	public boolean saveDailySchedule(DailyScheduleBean dailyschb) {
		// TODO Auto-generated method stub
		return ischeduleDao.saveDailySchedule(dailyschb);
	}

}

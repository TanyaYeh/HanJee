package tw.hanjee.schedule.dao.impl;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.schedule.dao.ScheduleDao;
import tw.hanjee.schedule.model.PlaceBean;
@Repository
public class ScheduleDaoImpl implements ScheduleDao, Serializable{
	
	private static final long serialVersionUID = 1L;
	@Autowired
	SessionFactory factory;
	@Autowired
	ScheduleDao scheduleDao;
	
	public int saveSchedule(PlaceBean pb) {
		int n = 0;
		Session session = factory.getCurrentSession();
		
		return n;
	}
	
	
}

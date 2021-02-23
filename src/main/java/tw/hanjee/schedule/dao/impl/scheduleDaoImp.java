package tw.hanjee.schedule.dao.impl;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.dao.MemberDao;
import tw.hanjee.schedule.dao.IscheduleDao;
import tw.hanjee.schedule.model.DailyScheduleBean;
import tw.hanjee.schedule.model.PlaceBean;
import tw.hanjee.schedule.model.PlaceDetailBean;
import tw.hanjee.schedule.model.ScheduleBean;

@Repository
public class scheduleDaoImp implements IscheduleDao {
	@Autowired
	SessionFactory factory;
	@Autowired
	MemberDao md;

	@Override
	public PlaceBean getAttractionsBean(Integer pla_no) {
		Session session = factory.getCurrentSession();
		String hql = "FROM PlaceBean p WHERE p.pla_no = :pno";
		PlaceBean plab = null;
		try {
			plab = (PlaceBean) session.createQuery(hql).setParameter("pno", pla_no).getSingleResult();

		} catch (NoResultException e) {
			System.out.println("沒有找到結果");
			e.printStackTrace();
		}

		return plab;
	}

	@Override
	public PlaceDetailBean getAttractionDetail(Integer pla_no) {
		Session session = factory.getCurrentSession();
		String hql = "FROM PlaceDetailBean pd WHERE pd.pla_no = :pno";
		PlaceDetailBean pladat = null;

		try {
			pladat = (PlaceDetailBean) session.createQuery(hql).setParameter("pno", pla_no).getSingleResult();

		} catch (NoResultException e) {
			System.out.println("沒有找到結果");
			e.printStackTrace();
		}

		return pladat;
	}

	@Override
	public PlaceBean getPlaceBeanByLan(Double pla_lan) {
		String hql = "From PlaceDetailBean pdb where pdb.pla_lan = :pla_lan";
		Session session = factory.getCurrentSession();
		
		PlaceBean plaBean = null;

		try {
			PlaceDetailBean pldb = (PlaceDetailBean) session.createQuery(hql).setParameter("pla_lan", pla_lan)
					.getSingleResult();
			plaBean = pldb.getPlaceBean();
		} catch (NoResultException e) {
			System.out.println("沒有找到結果");
			e.printStackTrace();
		}

		return plaBean;
	}

	@Override
	public Map<java.sql.Date, List<DailyScheduleBean>> eachdaySch(java.sql.Date queryDate) {
		Map<java.sql.Date, List<DailyScheduleBean>> memDatesch = new LinkedHashMap<java.sql.Date, List<DailyScheduleBean>>();
		Session session = factory.getCurrentSession();
		
		String hql="From DailyScheduleBean where sch_Daily = :md";
	
		List<DailyScheduleBean> byMemb=(List<DailyScheduleBean>) session.createQuery(hql).setParameter("md", queryDate).getResultList();
		memDatesch.put(queryDate, byMemb);	
		return memDatesch;
	}

	@Override
	public List<ScheduleBean> queryAllSchList(Integer member_id) {
		Session session = factory.getCurrentSession();
		String hql="From ScheduleBean where member_id = :mid";
		List<ScheduleBean> allSchList=session.createQuery(hql).setParameter("mid", md.getMember_id(member_id).getMember_id()).getResultList();
		return allSchList;
	}
	@Override
	public boolean saveSchedule(ScheduleBean schb) {
		Session session = factory.getCurrentSession();
		session.save(schb);

		return true;
		
	}
	@Override
	public boolean saveDailySchedule(DailyScheduleBean dailyschb) {
		Session session = factory.getCurrentSession();
		session.save(dailyschb);

		return true;
		
	}
}

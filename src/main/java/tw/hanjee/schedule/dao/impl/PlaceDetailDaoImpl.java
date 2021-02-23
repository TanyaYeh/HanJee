package tw.hanjee.schedule.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.schedule.dao.PlaceDetailDao;
import tw.hanjee.schedule.model.PlaceBean;
import tw.hanjee.schedule.model.PlaceDetailBean;

@Repository
public class PlaceDetailDaoImpl implements PlaceDetailDao{
	@Autowired
	SessionFactory factory;
	
	boolean success = false;
		public boolean saveLntLat(PlaceDetailBean pdb) {
			Session session=factory.getCurrentSession();
			session.update(pdb);
			success = true;
			return success;
		}
		public PlaceDetailBean getPDBByPla_no(Integer pla_no) {
			Session session=factory.getCurrentSession();
			PlaceDetailBean pdb = session.get(PlaceBean.class, pla_no).getPlaceDetailBean();
			return pdb;
		}
}

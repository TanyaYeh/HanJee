package tw.hanjee.schedule.dao.impl;




import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.schedule.dao.IplaceDao;
import tw.hanjee.schedule.model.PlaceBean;
import tw.hanjee.schedule.model.PlaceDetailBean;



@Repository
public class placeDaoImp implements IplaceDao {
	
	@Autowired
	SessionFactory factory;
	

	
//	@SuppressWarnings("unchecked")
//	@Override
//	public  List<PlaceBean> selectAttractionsName(Integer pla_no) {   //當點擊時顯示單一景點名稱
//		Session session = factory.getCurrentSession();
//		
//		String hql="FROM PlaceBean p ,PlaceDetailBean pd WHERE p.pla_no = pd.pla_no and p.pla_no= :pno ";
//		List<PlaceBean> list = session.createQuery(hql).setParameter("pno", pla_no).getResultList();
//		Iterator<PlaceBean> it = list.iterator();
//		while(it.hasNext()) {
//			Object[] obj=(Object[])it.next(); 
//			PlaceBean pla = (PlaceBean)obj[0];
//			PlaceDetailBean plad = (PlaceDetailBean)obj[1];
//			list.
//			
//		}
//		
//		return plab;
//		
//	}
	
	@Override
	public List<PlaceBean> selectAttractionGetList(Integer pla_no) {   
		Session session = factory.getCurrentSession();
		String hql="FROM PlaceBean p WHERE p.pla_no = :pno ";

		@SuppressWarnings("unchecked")
		List<PlaceBean> plab = session.createQuery(hql).setParameter("pno", pla_no).getResultList();

		return plab;
		
	}
	
	@Override
	public PlaceBean selectAttractionsGetBean(Integer pla_no) {   
		Session session = factory.getCurrentSession();
		String hql="FROM PlaceBean p WHERE p.pla_no = :pno";
		PlaceBean plab = null;
		try {
			plab =(PlaceBean)session.createQuery(hql).setParameter("pno", pla_no).getSingleResult();
			
		}catch(NoResultException e) {
			System.out.println("沒有找到結果");
			e.printStackTrace();
		}
		
		return plab;
	}
	
	@Override
	public List<PlaceDetailBean> selectAllAttraction(){   
		Session session = factory.getCurrentSession();
		String hql="FROM PlaceDetailBean";

		@SuppressWarnings("unchecked")
		List<PlaceDetailBean> plab = session.createQuery(hql).getResultList();

		return plab;
		
	}


	
}

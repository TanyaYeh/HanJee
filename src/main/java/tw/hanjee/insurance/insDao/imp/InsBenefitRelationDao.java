package tw.hanjee.insurance.insDao.imp;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.insurance.insDao.IFinsBenefitRelationDao;
import tw.hanjee.insurance.insModel.InsBenefitRelation;


@Repository
public class InsBenefitRelationDao implements IFinsBenefitRelationDao {
	
	@Autowired
	SessionFactory factory;

	@Override
	public List<InsBenefitRelation> getAllRelation() {
		Session session = factory.getCurrentSession();
		String hqlstr = "FROM InsBenefitRelation";
		return session.createQuery(hqlstr).getResultList();
	}

	@Override
	public InsBenefitRelation getInsBenefitRelation(int id) {
		Session session = factory.getCurrentSession();
		return session.get(InsBenefitRelation.class, id);
	}

}

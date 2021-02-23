package tw.hanjee.insurance.insDao.imp;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.insurance.insDao.IFinsLocationFeeDao;
import tw.hanjee.insurance.insModel.InsLocationFee;
@Repository
public class InsLocationFeeDao implements IFinsLocationFeeDao {
	@Autowired
	SessionFactory factory;

	@Override
	public List<InsLocationFee> getAllLocation() {
		Session session = factory.getCurrentSession();
		String hqlstr="FROM InsLocationFee";
		return session.createQuery(hqlstr).getResultList();
	}

	@Override
	public InsLocationFee getInsLocationFee(int id) {
		Session session = factory.getCurrentSession();
		return session.get(InsLocationFee.class, id);
	}

}

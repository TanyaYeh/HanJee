package tw.hanjee.insurance.insDao.imp;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.insurance.insDao.IFinsProfileDao;
import tw.hanjee.insurance.insModel.InsProfiles;

@Repository
public class InsProfileDao implements IFinsProfileDao {
	@Autowired
	SessionFactory factory;
	
	@Override
	public void add(InsProfiles insp) {
		Session session = factory.getCurrentSession();
		session.save(insp);
	}

	@Override
	public void update(InsProfiles insp) {
		Session session = factory.getCurrentSession();
		session.update(insp);
	}

	@Override
	public void delete(int insId) {
		Session session = factory.getCurrentSession();
		InsProfiles insp = new InsProfiles();
		insp.setInsId(insId);
		session.delete(insp);
	}

	@Override
	public InsProfiles query(int insId) {
		Session session = factory.getCurrentSession();
		return session.get(InsProfiles.class, insId);
	}



	@Override
	public int countA() {
		Session session = factory.getCurrentSession();
		String hqlstr= "select count(*) from InsProfiles where insPlan='planA'";
		int count = ((Number)session.createQuery(hqlstr).uniqueResult()).intValue();
		return count;
	}

	@Override
	public int countB() {
		Session session = factory.getCurrentSession();
		String hqlstr= "select count(*) from InsProfiles where insPlan='planB'";
		int count = ((Number)session.createQuery(hqlstr).uniqueResult()).intValue();
		return count;
	}

	@Override
	public int countC() {
		Session session = factory.getCurrentSession();
		String hqlstr= "select count(*) from InsProfiles where insPlan='planC'";
		int count = ((Number)session.createQuery(hqlstr).uniqueResult()).intValue();
		return count;
	}

	@Override
	public int countM() {
		Session session = factory.getCurrentSession();
		String hqlstr= "select count(*) from InsProfiles where insGender='Male'";
		int count = ((Number)session.createQuery(hqlstr).uniqueResult()).intValue();
		return count;
	}

	@Override
	public int countF() {
		Session session = factory.getCurrentSession();
		String hqlstr= "select count(*) from InsProfiles where insGender='Female'";
		int count = ((Number)session.createQuery(hqlstr).uniqueResult()).intValue();
		return count;
	}

}

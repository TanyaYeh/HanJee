package tw.hanjee.friend.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.friend.dao.interface1.IPerson_InfoDAO;
import tw.hanjee.friend.model.Person_InfoBean;

@Repository
public class Person_InfoDAO implements IPerson_InfoDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public void insertInf(Person_InfoBean pIBean) {
		Session session = factory.getCurrentSession();
		session.save(pIBean);
		}

	@Override
	public void updateInf(Person_InfoBean pIBean) {
		Session session = factory.getCurrentSession();
		session.update(pIBean);
	}

	@Override
	public Person_InfoBean queryInf(Integer member_id) {
		Session session = factory.getCurrentSession();
		
		return session.get(Person_InfoBean.class, member_id);
	}
	
	
	public List<Person_InfoBean> queryAllInf() {
		Session session = factory.getCurrentSession();
		String hql = "From Person_InfoBean";
		
		return session.createQuery(hql, Person_InfoBean.class).getResultList();
	}
	
}

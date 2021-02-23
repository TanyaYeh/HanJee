package tw.hanjee.friend.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.friend.dao.interface1.ISen_MachineDAO;
import tw.hanjee.friend.model.Sen_MachineBean;

@Repository
public class Sen_MachineDAO implements ISen_MachineDAO {
	@Autowired
	SessionFactory factory;
	
	@Override
	public List<Sen_MachineBean> querySentence() {
		Session session = factory.getCurrentSession();
		String hql = "From Sen_MachineBean";
		System.out.println("123");
	
		
		return session.createQuery(hql,Sen_MachineBean.class).getResultList();
	}
	
	@Override
	public Sen_MachineBean querySentenceByid(int sentence_id) {
		Session session = factory.getCurrentSession();
		
		return session.get(Sen_MachineBean.class, sentence_id);
	}
	
}

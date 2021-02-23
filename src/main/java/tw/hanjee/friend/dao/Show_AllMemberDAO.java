package tw.hanjee.friend.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.friend.dao.interface1.IShow_AllMemberDAO;
import tw.hanjee.model.MemberBean;

@Repository
public class Show_AllMemberDAO implements IShow_AllMemberDAO {

	@Autowired
	SessionFactory factory;
	
	@Override
	public List<MemberBean> query() {
		Session session = factory.getCurrentSession();
//		MemberBean mb = new MemberBean();
		String hql = "From MemberBean";
//		System.out.println(session.createQuery(hql,MemberBean.class).getResultList());
		return session.createQuery(hql,MemberBean.class).getResultList();
	}
	
}

package tw.hanjee.forum.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.forum.dao.ForumDao;
import tw.hanjee.forum.model.ForumBean;

@Repository
public class ForumDaoImpl implements ForumDao {
	
	@Autowired
	SessionFactory factory;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ForumBean> getAllForum() {
		Session session = factory.getCurrentSession();
		String fhq = "From ForumBean";
		List<ForumBean> fbBList=session.createQuery(fhq).getResultList();
		return fbBList;
	}

	@Override
	public ForumBean getForumNo(int forum_no) {
		 Session session = factory.getCurrentSession();
		 ForumBean fpb = session.get(ForumBean.class, forum_no);		 
		return fpb;
	}
	
	
	

	@Override
	public void addForum(ForumBean Forum) {
		 Session session = factory.getCurrentSession();
		session.save(Forum);
	}

	@Override
	public void deleteForumByPrimaryKey(Integer key) {
		 Session session = factory.getCurrentSession();
		 String hql="From ForumBean where forum_no= :abc";
		 System.out.println("我在HQL下一行");
		 ForumBean fDel=(ForumBean) session.createQuery(hql).setParameter("abc", key).getSingleResult();
		 session.delete(fDel);
		
	}

	@Override
	public void updateForum(ForumBean bean) {
		Session session = factory.getCurrentSession();
		session.update(bean);
	}
	
	
	
	
		
	}
	


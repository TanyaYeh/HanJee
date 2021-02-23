package tw.hanjee.forum.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.forum.dao.CommentDao;
import tw.hanjee.forum.model.CommentBean;
import tw.hanjee.forum.model.PostBean;

@Repository
public class CommentDaoImpl implements CommentDao {

	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<CommentBean> getAllCom() {
		Session session = factory.getCurrentSession();
		String hql = "From PostBean";
		return session.createQuery(hql).getResultList();
	}

	@Override
	public CommentBean getCommentByNo(int com_no) {
		Session session = factory.getCurrentSession();
		CommentBean pb = session.get(CommentBean.class, com_no);
		return pb;
	}

	@Override
	public void addCom(CommentBean com) {
		Session session = factory.getCurrentSession();
		System.out.println(com.getCom_text());
		System.out.println("我在@Repository");
		System.out.println(com.getPostBean().getPost_no());
		System.out.println(com.getCom_text());
		session.save(com);
	}

	@Override
	public void deleteComByPrimaryKey(Integer key) {
		
		Session session = factory.getCurrentSession();
		System.out.println("我現在找不到");
		System.out.println("我現在找不到"+key);
		
		String hql="From CommentBean where com_no= :comkey";
		CommentBean a = session.get(CommentBean.class, key);
//		CommentBean cb=(CommentBean) session.createQuery(hql).setParameter("comkey", key).getSingleResult();
		System.out.println("我現在找不到"+a.getCom_no());
		a.getPostBean().getComment().remove(a);
		session.delete(a);
//		session.flush();
		
	}
	@Override
	public List<CommentBean> getallComByPost(PostBean pb) {
		Session session = factory.getCurrentSession();
		String hql="From CommentBean where postBean= :mpb";
		List<CommentBean> list = session.createQuery(hql).setParameter("mpb",pb).getResultList();
		return list;
	}

}

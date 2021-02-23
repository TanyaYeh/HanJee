package tw.hanjee.forum.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.forum.dao.PostDao;
import tw.hanjee.forum.model.ForumBean;
import tw.hanjee.forum.model.PostBean;

@Repository
public class PostDaoImpl implements PostDao {
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<PostBean> getAllPost() {
		Session session = factory.getCurrentSession();
		String hql = "FROM PostBean";
		return session.createQuery(hql).getResultList();
	}

	//////////////以下為詳細資料///////////////////
	@Override
	public PostBean getPostByNo(Integer post_no) {
		Session session = factory.getCurrentSession();
		PostBean pb = session.get(PostBean.class, post_no);
		return pb;
	}

	@Override
	public void addPost(PostBean post) {
		Session session = factory.getCurrentSession();
		System.out.println("我在DAO0000000000000000"+post.getMb().getNickname());
		session.save(post);		
	}

	
//	刪除資料
	@Override
	public void deletePostByPrimaryKey(Integer key) {
		Session session = factory.getCurrentSession();
		PostBean PostD=getPostByNo(key);
		 
		 session.delete(PostD);
	}

	@Override
	public void updatePost(PostBean bean) {
		Session session = factory.getCurrentSession();
		session.update(bean);
		
	}

	@Override
	public List<PostBean> eachForumPost(ForumBean fb) {
		Session session = factory.getCurrentSession();
		String hql="From PostBean where forumBean = :mfid";
		session.createQuery(hql).setParameter("mfid", fb).getResultList();
		return session.createQuery(hql,PostBean.class).setParameter("mfid", fb).getResultList();
	}	
	
}


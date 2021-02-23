package tw.hanjee.friend.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.friend.dao.interface1.IFriend_RelationDAO;
import tw.hanjee.friend.model.Friend_RelationBean;
import tw.hanjee.model.MemberBean;

@Repository
public class Friend_RelationDAO implements IFriend_RelationDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public void insert(Friend_RelationBean fRBean) {
		Session session = factory.getCurrentSession();
		
		session.save(fRBean);
	}
	
	@Override        //這裡不直接用bean去刪，因為要嘗試讓rel_no做點事
	public void delete(Integer rel_no) {
		Session session = factory.getCurrentSession();
		
		String hql = "delete from Friend_RelationBean where rel_no= :rel_no";
		session.createQuery(hql, Friend_RelationBean.class).setParameter("rel_no", rel_no).executeUpdate();
	}
	
	@Override        
	public void deleteByBean(Friend_RelationBean frBean) {
		Session session = factory.getCurrentSession();
		session.delete(frBean);
	}
	
	
	@Override
	public void update(Friend_RelationBean frb) {
		Session session = factory.getCurrentSession();
		session.update(frb);
	}
	
//	@Override
//	public void updateByColumn(Friend_RelationBean frb) {
//		Session session = factory.getCurrentSession();
//		String hql = "Update Friend_RelationBean set meet_day= :date and status= :status where mid= :mid and fid= :fid";
//		Query<Friend_RelationBean> query = session.createQuery(hql,Friend_RelationBean.class);
//		query.executeUpdate();
//		
//	}
	
	@Override
	public  Friend_RelationBean query(Integer rel_no) {
		Session session = factory.getCurrentSession();
		
		return session.get(Friend_RelationBean.class,rel_no);
	}
	
	@Override
	public  List<Friend_RelationBean> queryByMemberId(Integer member_id) {
		Session session = factory.getCurrentSession();
		
		String hql = "From Friend_RelationBean where member_id= :id";
		
		
		return session.createQuery(hql, Friend_RelationBean.class).setParameter("id", member_id).getResultList();
	}
	
	@Override
	public  List<Friend_RelationBean> queryByFriendId(Integer friend_id) {
		Session session = factory.getCurrentSession();
		
		String hql = "From Friend_RelationBean where friend_id= :id";
		
		
		return session.createQuery(hql, Friend_RelationBean.class).setParameter("id", friend_id).getResultList();
	}

	public Friend_RelationBean queryIdBean(Integer member_id) {
		Session session = factory.getCurrentSession();
		
		return session.get(Friend_RelationBean.class, member_id);
	}

	@Override
	public Friend_RelationBean queryByTwoId(Integer member_id, Integer friend_id) {
		try {
			
			Session session = factory.getCurrentSession();
			String hql = "From Friend_RelationBean where friend_id= :fid and member_id = :mid";
			Friend_RelationBean fr=(Friend_RelationBean) session.createQuery(hql).setParameter("fid", friend_id).setParameter("mid", member_id).getSingleResult();
			return fr;
		}catch(Exception e) {
			return null;
		}
	}

}

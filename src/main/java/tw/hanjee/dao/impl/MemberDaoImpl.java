package tw.hanjee.dao.impl;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.dao.MemberDao;
import tw.hanjee.model.MemberBean;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SessionFactory factory;

	@Override
	public boolean accountExists(String account) {

		boolean exist = false;
		String hql = "FROM MemberBean m WHERE m.account = :maccount";
		@SuppressWarnings("unchecked")
		List<MemberBean> lmb = (List<MemberBean>) factory.getCurrentSession().createQuery(hql)
				.setParameter("maccount", account).getResultList();
		if (lmb.size() > 0) {
			exist = true;
		}
		return exist;
	}

	@Override
	public int saveMember(MemberBean mb) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberBean checkaccountPassword(String account, String password) {
		MemberBean mb = null;
		String hql = "FROM MemberBean m WHERE m.account = :maccount and m.password = :pwsd";
		try {
			mb = (MemberBean) factory.getCurrentSession().createQuery(hql).setParameter("maccount", account)
					.setParameter("pwsd", password).getSingleResult();
		} catch (NoResultException ex) {
			;
		} catch (NonUniqueResultException ex) {
			throw new RuntimeException("帳號資料有誤(NonUnique)，應重建初始資料");
		}
		return mb;
	}

	public MemberDaoImpl() {
	}



	@Override
	public boolean save(MemberBean bean) {
		Session session = factory.getCurrentSession();
		boolean exist = false;
		session.save(bean);
		exist = true;
		return exist;
	}

	@Override
	public void updateMember(MemberBean bean) {
		Session session = factory.getCurrentSession();
		session.update(bean);

	}

	@Override
	public boolean deleteMemberByAccount(String account) {
		boolean exist = false;
		Session session = factory.getCurrentSession();
		MemberBean member = null;
		String hql = "From MemberBean where account = :maccount";
		member=(MemberBean) session.createQuery(hql).setParameter("maccount", account);
		session.delete(member);
		exist = true;
		return exist;
	}

	@Override
	public MemberBean getMember_id(Integer member_id) {
//			CustomerBean bean = null;
//			Session session = factory.getCurrentSession();
//			bean = session.get(CustomerBean.class, id);
//			return bean;
		MemberBean bean = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean cb WHERE cb.member_id = :id";
		try {
			bean = (MemberBean) session.createQuery(hql).setParameter("id", member_id).getSingleResult();
		} catch (NoResultException e) {
			; // 表示查無紀錄
		}

		return bean;

	}
	@Override
	public MemberBean queryByMember_id(Integer member_id) {
		String hql ="From MemberBean where member_id = :id";
		MemberBean mb = null;
		try {
		mb = (MemberBean)factory.getCurrentSession().createQuery(hql).setParameter("id", member_id).getSingleResult();
		}catch(NoResultException ex) {
			;
		} catch(NonUniqueResultException ex) {
			throw new RuntimeException("帳號資料有誤(NonUnique)，應重建初始資料");
		} 	
		return mb;
		
	}
}

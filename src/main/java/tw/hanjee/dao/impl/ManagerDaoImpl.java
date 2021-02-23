package tw.hanjee.dao.impl;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.dao.ManagerDao;
import tw.hanjee.model.ManagerBean;
import tw.hanjee.model.MemberBean;

@Repository
public class ManagerDaoImpl implements ManagerDao {

	@Autowired
	SessionFactory factory;

	@Override
	public boolean manager_NameExists(String manager_Name) {

		boolean exist = false;
		String hql = "FROM ManagerBean m WHERE m.manager_Name = :mmanager_Name";
		@SuppressWarnings("unchecked")
		List<ManagerBean> lmb = (List<ManagerBean>) factory.getCurrentSession().createQuery(hql)
				.setParameter("mmanager_Name", manager_Name).getResultList();
		if (lmb.size() > 0) {
			exist = true;
		}
		return exist;
	}

	@Override
	public ManagerBean checkaccountPassword(String manager_Name, String manager_Pwd) {
		ManagerBean mb = null;
		String hql = "FROM ManagerBean m WHERE m.manager_Name = :mmanager_Name and m.manager_Pwd = :pwsd";
		try {
			mb = (ManagerBean) factory.getCurrentSession().createQuery(hql).setParameter("mmanager_Name", manager_Name)
					.setParameter("pwsd", manager_Pwd).getSingleResult();
		} catch (NoResultException ex) {
			;
		} catch (NonUniqueResultException ex) {
			throw new RuntimeException("沒有這個管理員");
		}
		return mb;
	}

	public ManagerDaoImpl() {
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

	public Map<Integer, MemberBean> queryAllMember() {

		String hql = "From MemberBean";
		Session session = factory.getCurrentSession();
		Map<Integer, MemberBean> map = new LinkedHashMap<>();
		List<MemberBean> lmb = session.createQuery(hql).getResultList();
		System.out.println(lmb);
		for(MemberBean mb:lmb) {
			map.put(mb.getMember_id(), mb);
		}
		
		
//		Iterator<MemberBean> mb = lmb.iterator();
//		while (mb.hasNext()) {
//			map.put(mb.next().getMember_id(), mb.next());
//		}
		return map;
	}

}

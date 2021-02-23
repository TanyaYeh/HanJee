package tw.hanjee.order.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.hanjee.order.dao.IvDao;
import tw.hanjee.order.model.Iv;

@Repository
public class IvDao_Impl implements IvDao {
	@Autowired
	SessionFactory factory;

	@Override
	public void insertIv(Iv iv) {
		factory.getCurrentSession().save(iv);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Iv> selectByIvNumber(String iv_number) {
		String hql="From Iv Where iv_number = :iv_number";
		return factory.getCurrentSession().createQuery(hql).setParameter("iv_number", iv_number).getResultList();
	}

	@Override
	public void updatePro_no(Integer iv_no,Integer ord_no) {
		String hql="update Iv i set i.ord_no = :ord_no where i.iv_no = :iv_no";
		if(!iv_no.equals(null)) {

			Query q =factory.getCurrentSession().createQuery(hql);
			q.setParameter("ord_no", ord_no);
			q.setParameter("iv_no", iv_no);
			q.executeUpdate();
			System.out.println("ord_no:"+ord_no+"修改成功");
		}else {
			System.out.println("ord_no:"+ord_no+"修改失敗");
		}
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Iv> selectByIvNO(Integer iv_no) {
		String hql="From Iv Where iv_no = :iv_no";
		return factory.getCurrentSession().createQuery(hql).setParameter("iv_no", iv_no).getResultList();
	}

}

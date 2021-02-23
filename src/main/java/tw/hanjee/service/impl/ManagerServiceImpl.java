package tw.hanjee.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tw.hanjee.dao.ManagerDao;
import tw.hanjee.model.ManagerBean;
import tw.hanjee.model.MemberBean;
import tw.hanjee.service.ManagerService;




@Service
@Transactional
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	ManagerDao dao;
	@Autowired
	SessionFactory factory;
	public ManagerServiceImpl() {
	
	}

	@Override
	public MemberBean getMember_id(Integer member_id) {
		return dao.getMember_id(member_id);
	}

	@Override
	public ManagerBean checkaccountPassword(String manager_Name, String manager_Pwd) {
		return dao.checkaccountPassword(manager_Name, manager_Pwd);
	}

	@Override
	public boolean manager_NameExists(String manager_Name) {
		return dao.manager_NameExists(manager_Name);
	}

	@Override
	public Map<Integer, MemberBean> queryAllMember() {
		return dao.queryAllMember();
	}

	
	
	
	
	
	
}

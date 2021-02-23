package tw.hanjee.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.hanjee.dao.MemberDao;
import tw.hanjee.model.MemberBean;
import tw.hanjee.service.MemberService;



@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao  dao;
	
	public MemberServiceImpl() {
	
	}
	@Override
	public boolean accountExists(String account) {
		boolean exist = false;
		exist = dao.accountExists(account);
		return exist;
	}
	@Override
	public MemberBean checkaccountPassword(String account, String password) {
		MemberBean mb = null;
		mb = dao.checkaccountPassword(account, password);
		return mb;
	}
	@Override
	public boolean save(MemberBean bean) {
		return dao.save(bean);
	}
	@Override
	public void updateMember(MemberBean bean) {
		dao.updateMember(bean);
		
	}
	@Override
	public boolean deleteMemberByAccount(String account) {
		return dao.deleteMemberByAccount(account);
	}
	@Override
	public MemberBean getMember_id(Integer member_id) {
		return dao.getMember_id(member_id);
	}
	@Override
	public MemberBean queryByMember_id(Integer member_id) {
		return dao.queryByMember_id(member_id);
	}
	
	
}

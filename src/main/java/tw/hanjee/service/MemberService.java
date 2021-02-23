package tw.hanjee.service;

import java.util.Map;

import tw.hanjee.model.MemberBean;

public interface MemberService {

	MemberBean getMember_id(Integer member_id);
	boolean accountExists(String account);

	MemberBean checkaccountPassword(String account, String password);
	boolean save(MemberBean bean);

	void updateMember(MemberBean bean);
	public MemberBean queryByMember_id(Integer member_id);
	boolean deleteMemberByAccount(String account);
	
}
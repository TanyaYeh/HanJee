package tw.hanjee.dao;

import tw.hanjee.model.MemberBean;

public interface MemberDao {
	public boolean accountExists(String account);

	public int saveMember(MemberBean mb) ;
	MemberBean getMember_id(Integer member_id);
	public MemberBean checkaccountPassword(String account, String password);
	
	boolean save(MemberBean bean);

	void updateMember(MemberBean bean);
	public MemberBean queryByMember_id(Integer member_id);
	boolean deleteMemberByAccount(String account);
	
}

package tw.hanjee.service;

import java.util.Map;

import tw.hanjee.model.ManagerBean;
import tw.hanjee.model.MemberBean;


public interface ManagerService {
	MemberBean getMember_id(Integer member_id);
	ManagerBean checkaccountPassword(String manager_Name, String manager_Pwd);
	boolean manager_NameExists(String manager_Name);
	Map<Integer,MemberBean> queryAllMember();
}
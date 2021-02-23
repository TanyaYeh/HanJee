package tw.hanjee.friend.service.interface1;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import tw.hanjee.friend.model.Friend_RelationBean;
import tw.hanjee.friend.model.Person_InfoBean;
import tw.hanjee.model.MemberBean;

public interface IFriend_RelationService {

	void frinsert(Friend_RelationBean fRBean);

	void frdelete(Integer rel_no);

	void frupdate(Friend_RelationBean frb);

	Friend_RelationBean frquery(Integer rel_no);

	List<Friend_RelationBean> queryByMemberId(Integer member_id);

	List<MemberBean> samquery();

	List<Friend_RelationBean> queryByFriendId(Integer friend_id);
	
	Friend_RelationBean queryIdBean(Integer member_id);
	
	public Friend_RelationBean queryByTwoId(Integer member_id, Integer friend_id);

	void deleteByBean(Friend_RelationBean frBean);

	String getConInf(Integer num) throws IOException;

	Set<Integer> getAllfriendID(Integer member_id);

	Map<Integer, Person_InfoBean> invitationRequest(Integer member_id);

	Set<Integer> getAllNofriendIDandSelfID(Integer member_id);
}
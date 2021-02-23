package tw.hanjee.friend.dao.interface1;

import java.util.List;

import org.hibernate.query.Query;

import tw.hanjee.friend.model.Friend_RelationBean;
import tw.hanjee.model.MemberBean;

public interface IFriend_RelationDAO {

	void insert(Friend_RelationBean fRBean);

	void delete(Integer rel_no);

	void update(Friend_RelationBean frb);

	Friend_RelationBean query(Integer rel_no);

	List<Friend_RelationBean> queryByMemberId(Integer member_id);

	List<Friend_RelationBean> queryByFriendId(Integer friend_id);
	
	Friend_RelationBean queryIdBean(Integer member_id);
	
	Friend_RelationBean queryByTwoId(Integer member_id, Integer friend_id);

	void deleteByBean(Friend_RelationBean frBean);

}
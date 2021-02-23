package tw.hanjee.forum.dao;



import java.util.List;

import tw.hanjee.forum.model.ForumBean;

public interface ForumDao {
	
	List<ForumBean> getAllForum();
	
	public ForumBean getForumNo(int forum_no);
	
	void addForum(ForumBean Forum);
	
	void deleteForumByPrimaryKey(Integer key);

	void updateForum(ForumBean bean);

}

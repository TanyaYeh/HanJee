package tw.hanjee.forum.service;

import java.util.List;

import tw.hanjee.forum.model.ForumBean;

public interface ForumService {

	List<ForumBean> getAllForum();

	public ForumBean getForumNo(Integer forum_no);

	void addForum(ForumBean Forum);

	void deleteForumByPrimaryKey(Integer key);

	void updateForum(ForumBean bean);

}

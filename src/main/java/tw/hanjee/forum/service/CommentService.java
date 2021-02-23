package tw.hanjee.forum.service;

import java.util.List;

import tw.hanjee.forum.model.CommentBean;
import tw.hanjee.forum.model.PostBean;

public interface CommentService {
	List<CommentBean> getAllCom();

	public CommentBean getCommentByNo(int com_no);
	
	void addCom(CommentBean com);
	
	void deleteComByPrimaryKey(Integer key);
	List<CommentBean> getallComByPost(PostBean pb);
	
}

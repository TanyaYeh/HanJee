package tw.hanjee.forum.dao;

import java.util.List;

import tw.hanjee.forum.model.ForumBean;
import tw.hanjee.forum.model.PostBean;

public interface PostDao {
	
	List<PostBean>  getAllPost();
	List<PostBean> eachForumPost(ForumBean fb);
	public PostBean getPostByNo(Integer post_no);

//新增
	void addPost(PostBean post);
	
	
	void deletePostByPrimaryKey(Integer key);
	
	void updatePost(PostBean bean);
	
}

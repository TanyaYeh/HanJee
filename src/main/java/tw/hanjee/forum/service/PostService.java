package tw.hanjee.forum.service;

import java.util.List;

import tw.hanjee.forum.model.ForumBean;
import tw.hanjee.forum.model.PostBean;

public interface PostService {
	List<PostBean>  getAllPost();

	public PostBean getPostByOn(Integer postId);
	
	void addPost(PostBean post);
	
	void deletePostByPrimmaryKey(Integer key);
	List<PostBean> eachForumPost(ForumBean fb);
	void updatePost(PostBean bean);
}

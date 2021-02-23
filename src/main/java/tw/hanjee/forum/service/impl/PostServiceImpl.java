package tw.hanjee.forum.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.hanjee.forum.dao.PostDao;
import tw.hanjee.forum.model.ForumBean;
import tw.hanjee.forum.model.PostBean;
import tw.hanjee.forum.service.PostService;

@Service
public class PostServiceImpl implements PostService {
	@Autowired
	PostDao pdao;

	@Transactional
	@Override
	public List<PostBean> getAllPost() {

		return pdao.getAllPost();
	}

	@Transactional
	@Override
	public PostBean getPostByOn(Integer PostId) {
		return pdao.getPostByNo(PostId);

	}
	
//	新增
	@Transactional
	@Override
	public void addPost(PostBean post) {
		System.out.println("我在SERVICE"+post.getMb().getNickname());
		pdao.addPost(post);
	}
	 
	@Transactional
	@Override
	public void deletePostByPrimmaryKey(Integer key) {
		pdao.deletePostByPrimaryKey(key);
		
	}
	
	@Transactional
	@Override
	public void updatePost(PostBean bean) {
		pdao.updatePost(bean);
		
	}
	@Transactional
	@Override
	public List<PostBean> eachForumPost(ForumBean fb) {
		return pdao.eachForumPost(fb);
	}


	
	

}

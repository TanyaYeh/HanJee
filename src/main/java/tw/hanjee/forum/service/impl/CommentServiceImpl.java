package tw.hanjee.forum.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.hanjee.forum.dao.CommentDao;
import tw.hanjee.forum.model.CommentBean;
import tw.hanjee.forum.model.PostBean;
import tw.hanjee.forum.service.CommentService;
@Service
@Transactional
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	CommentDao cdao;

	@Override
	public List<CommentBean> getAllCom() {

		return cdao.getAllCom();
	}

	@Override
	public CommentBean getCommentByNo(int com_no) {
		
		return cdao.getCommentByNo(com_no);
	}
	
	@Override
	public void addCom(CommentBean com) {
		System.out.println("我在SERVICE");
		System.out.println(com.getPostBean().getPost_no());
		System.out.println(com.getCom_text());
		
		cdao.addCom(com);

	}

	@Override
	public void deleteComByPrimaryKey(Integer key) {
		//CommentBean tempcom = cdao.getCommentByNo(key);
	cdao.deleteComByPrimaryKey(key);
	}

	@Override
	public List<CommentBean> getallComByPost(PostBean pb) {
		
		return cdao.getallComByPost(pb);
	}
	


}

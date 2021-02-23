package tw.hanjee.forum.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.hanjee.forum.dao.ForumDao;
import tw.hanjee.forum.model.ForumBean;
import tw.hanjee.forum.service.ForumService;
@Transactional
@Service
public class ForumServiceImpl implements ForumService {

	@Autowired
	ForumDao formDao;

	
	@Override
	public List<ForumBean> getAllForum() {
		
		return formDao.getAllForum();
	}

	
	@Override
	public ForumBean getForumNo(Integer forum_no) {
		
		return formDao.getForumNo(forum_no);
	}

	
	@Override
	public void addForum(ForumBean Forum) {
		formDao.addForum(Forum);

	}

	
	@Override
	public void deleteForumByPrimaryKey(Integer key) {
		formDao.deleteForumByPrimaryKey(key);

	}

	
	@Override
	public void updateForum(ForumBean bean) {
		formDao.updateForum(bean);

	}

}

package tw.hanjee.friend.service;

import java.util.List;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.hanjee.friend.dao.interface1.ISen_MachineDAO;
import tw.hanjee.friend.model.Sen_MachineBean;
import tw.hanjee.friend.service.interface1.ISen_MachineService;

@Service
@Transactional
public class Sen_MachineService implements ISen_MachineService {
	@Autowired
	ISen_MachineDAO dao;
	@Autowired
	SessionFactory factory;
	@Override
	public List<Sen_MachineBean> queryAllSentence() {
		
		return dao.querySentence();
	}
	
	@Override
	public Sen_MachineBean querySentenceByID(int sentence_id) {
		
		return dao.querySentenceByid(sentence_id);
	}
	
}

package tw.hanjee.friend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.hanjee.friend.dao.interface1.IPerson_InfoDAO;
import tw.hanjee.friend.model.Person_InfoBean;
import tw.hanjee.friend.service.interface1.IPerson_InfoService;

@Service
@Transactional
public class Person_InfoService implements IPerson_InfoService {
	@Autowired
	IPerson_InfoDAO IIDAO;

	@Override
	public void AddInf(Person_InfoBean pIBean) {
		IIDAO.insertInf(pIBean);
	}
	
	@Override
	public void changeInf(Person_InfoBean pIBean) {
		IIDAO.updateInf(pIBean);
	}
	
	@Override
	public Person_InfoBean showInf(Integer member_id) {
		
		return IIDAO.queryInf(member_id);
	}
	
	public List<Person_InfoBean> queryAllInf(){
		
		return IIDAO.queryAllInf();
	}
	
}

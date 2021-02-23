package tw.hanjee.friend.service.interface1;

import java.util.List;

import tw.hanjee.friend.model.Person_InfoBean;

public interface IPerson_InfoService {

	void AddInf(Person_InfoBean pIBean);

	void changeInf(Person_InfoBean pIBean);

	Person_InfoBean showInf(Integer member_id);
	
	List<Person_InfoBean> queryAllInf();

}
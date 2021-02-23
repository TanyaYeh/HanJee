package tw.hanjee.friend.dao.interface1;

import java.util.List;

import tw.hanjee.friend.model.Person_InfoBean;

public interface IPerson_InfoDAO {

	void insertInf(Person_InfoBean pIBean);

	void updateInf(Person_InfoBean pIBean);
	
	Person_InfoBean queryInf(Integer member_id);
	
	List<Person_InfoBean> queryAllInf();

}
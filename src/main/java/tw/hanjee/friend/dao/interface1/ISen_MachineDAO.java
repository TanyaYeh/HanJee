package tw.hanjee.friend.dao.interface1;

import java.util.List;

import tw.hanjee.friend.model.Sen_MachineBean;

public interface ISen_MachineDAO {

	List<Sen_MachineBean> querySentence();

	Sen_MachineBean querySentenceByid(int sentence_id);

}
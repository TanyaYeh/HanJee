package tw.hanjee.friend.service.interface1;

import java.util.List;

import tw.hanjee.friend.model.Sen_MachineBean;

public interface ISen_MachineService {

	List<Sen_MachineBean> queryAllSentence();

	Sen_MachineBean querySentenceByID(int sentence_id);

}
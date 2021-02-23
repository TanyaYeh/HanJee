package tw.hanjee.friend.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Session;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;

import tw.hanjee.friend.dao.interface1.IFriend_RelationDAO;
import tw.hanjee.friend.dao.interface1.IPerson_InfoDAO;
import tw.hanjee.friend.dao.interface1.IShow_AllMemberDAO;

import tw.hanjee.friend.model.Friend_RelationBean;
import tw.hanjee.friend.model.Person_InfoBean;
import tw.hanjee.friend.service.interface1.IFriend_RelationService;
import tw.hanjee.friend.service.interface1.IPerson_InfoService;
import tw.hanjee.model.MemberBean;

@Service
@Transactional
public class Friend_RelationService implements IFriend_RelationService {
	@Autowired
	IFriend_RelationDAO frDAO;

	@Autowired
	IShow_AllMemberDAO samdao;
	
	@Autowired
	IPerson_InfoDAO piDAO;
	
	@Autowired
	IPerson_InfoService piService;

	@Override
	public void frinsert(Friend_RelationBean fRBean) {

		frDAO.insert(fRBean);
	}

	@Override
	public void frdelete(Integer rel_no) {

		frDAO.delete(rel_no);
	}

	@Override
	public void deleteByBean(Friend_RelationBean frBean) {

		frDAO.deleteByBean(frBean);
	}

	@Override
	public void frupdate(Friend_RelationBean frb) {

		frDAO.update(frb);
	}

	@Override
	public Friend_RelationBean frquery(Integer rel_no) {

		return frDAO.query(rel_no);
	}

	@Override
	public List<Friend_RelationBean> queryByMemberId(Integer member_id) {

		return frDAO.queryByMemberId(member_id);
	}

	@Override
	public List<Friend_RelationBean> queryByFriendId(Integer friend_id) {

		return frDAO.queryByFriendId(friend_id);
	}

	public Friend_RelationBean queryIdBean(Integer member_id) {

		return frDAO.queryIdBean(member_id);
	}

	@Override
	public Friend_RelationBean queryByTwoId(Integer member_id, Integer friend_id) {
		// TODO Auto-generated method stub
		return frDAO.queryByTwoId(member_id, friend_id);
	}

	//////////////////////////////////////////////////////////////////////////////////////

	@Override
	public List<MemberBean> samquery() {

		return samdao.query();
	}

//////////////////////////////////////////////////////////////////////////////////////

	@Override
	public String getConInf(Integer num) throws IOException {

		String[] conArray = { "%E7%89%A1%E7%BE%8A%E5%BA%A7/ar-BBNYkY5", "%E9%87%91%E7%89%9B%E5%BA%A7/ar-BBNYefU",
				"%E9%9B%99%E5%AD%90%E5%BA%A7/ar-BBNYcrB", "%E5%B7%A8%E8%9F%B9%E5%BA%A7/ar-BBNYhd5",
				"%E7%8D%85%E5%AD%90%E5%BA%A7/ar-BBNYhd6", "%E8%99%95%E5%A5%B3%E5%BA%A7/ar-BBNY6BJ",
				"%E5%A4%A9%E7%A7%A4%E5%BA%A7/ar-BBNYhd4", "%E5%A4%A9%E8%A0%8D%E5%BA%A7/ar-BBNY6BI",
				"%E5%B0%84%E6%89%8B%E5%BA%A7/ar-BBNYcrA", "%E6%91%A9%E7%BE%AF%E5%BA%A7/ar-BBNYjGC",
				"%E6%B0%B4%E7%93%B6%E5%BA%A7/ar-BBNYjGI", "%E9%9B%99%E9%AD%9A%E5%BA%A7/ar-BBNYjGJ" };

		List<String> list = new ArrayList<String>();

		Document doc = Jsoup.connect("https://www.msn.com/zh-tw/lifestyle/horoscope/" + conArray[num]).timeout(60000)
				.maxBodySize(60000000).get();

		Element content = doc.getElementById("content");
		Elements links = content.getElementsByTag("p");

		for (Element link : links) {
			System.out.println(link.text());
			list.add(link.text());

		}
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(list);
		System.out.println(jsonString);

		return jsonString;
	}

	//查詢所有FRIENDID
		@Override
		public Set<Integer> getAllfriendID(Integer member_id) {
			Set<Integer> friendIDSet = new HashSet<Integer>();
			List<Friend_RelationBean> imInmemIDList = queryByMemberId(member_id);
			List<Friend_RelationBean> imInfriIDList = queryByFriendId(member_id);
			for (Friend_RelationBean imInmemID : imInmemIDList) {
				if (imInmemID.getStatus() == 1) {
					friendIDSet.add(imInmemID.getFb().getMember_id());
				}
			}
			for (Friend_RelationBean imInfriID : imInfriIDList) {
				if (imInfriID.getStatus() == 1) {
					friendIDSet.add(imInfriID.getMb().getMember_id());
				}
			}
			return friendIDSet;
		}

	//查詢所有邀請
		@Override
		public Map<Integer, Person_InfoBean> invitationRequest(Integer member_id) {
			Map<Integer, Person_InfoBean> invitationRequestmap = new LinkedHashMap<Integer, Person_InfoBean>();
			List<Friend_RelationBean> imInfriIDList = queryByFriendId(member_id);
			for (Friend_RelationBean imInfriID : imInfriIDList) {
				if (imInfriID.getStatus() == 0) {
					Integer inviteFromId = imInfriID.getMb().getMember_id();

					invitationRequestmap.put(inviteFromId, piDAO.queryInf(inviteFromId));
				}
			}

			return invitationRequestmap;
		}

//查詢所有(除了自己和朋友)的ID
		@Override
		public Set<Integer> getAllNofriendIDandSelfID(Integer member_id) {
			Set<Integer> friendIDSet = new HashSet<Integer>();
			List<Friend_RelationBean> imInmemIDList = queryByMemberId(member_id);
			List<Friend_RelationBean> imInfriIDList = queryByFriendId(member_id);
			
			for (Friend_RelationBean imInmemID : imInmemIDList) {
					friendIDSet.add(imInmemID.getFb().getMember_id());
			}
			for (Friend_RelationBean imInfriID : imInfriIDList) {
					friendIDSet.add(imInfriID.getMb().getMember_id());
			}
			friendIDSet.add(member_id);
			System.out.println("888888888888888888888888888888888888888888888888888"+friendIDSet);
			Set<Integer> allIDSet = new HashSet<Integer>();
			List<Person_InfoBean> allpibean = piService.queryAllInf();
			System.out.println("9999999999999999999999999999999999999999999999999999"+allpibean);
			for(Person_InfoBean alpbean:allpibean) {
				allIDSet.add(alpbean.getBean().getMember_id());
			}
			
			allIDSet.removeAll(friendIDSet);
			System.out.println("78787878787878778787878787878787878787787787878787878"+allIDSet);
			
			return allIDSet;
		}
		
}

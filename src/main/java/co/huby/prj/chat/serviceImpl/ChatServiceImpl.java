package co.huby.prj.chat.serviceImpl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import co.huby.prj.chat.service.ChatService;
import co.huby.prj.vo.InterviewVo;
import co.huby.prj.vo.MessageVo;

@Service
public class ChatServiceImpl implements ChatService {

	@Inject
	private SqlSession session;
	private static String namespace = "co.huby.prj.chat.mapper.ChatMap";

	@Override
	public void createRoom(InterviewVo vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".createRoom", vo);

	}

	@Override
	public InterviewVo isRoom(InterviewVo vo) throws Exception {
		// TODO Auto-generated method stub
		InterviewVo interVo = null;
		interVo = session.selectOne(namespace + ".isRoom", vo);
		System.out.println("ss");
		System.out.println(interVo);

		return interVo;
	}

	@Override
	public String getMember(InterviewVo vo) throws Exception {
		List<InterviewVo> intervo = session.selectList(namespace + ".getCompany", vo);

		return intervo.get(0).getMember_id();
	}

	@Override
	public String getProfile(String str) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".getProfile", str);
	}

	@Override
	public String getName(String str) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".getName", str);
	}

	@Override
	public List<MessageVo> getMessageList(String str) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".getMessageList", str);
	}

	// @Override
	/*
	 * public List<InterviewVo> getRoomList(String str) throws Exception { // TODO
	 * Auto-generated method stub return session.selectList(namespace +
	 * ".getRoomList", str); }
	 */

	@Override
	public String getCompany(String str) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".getCompany", str);
	}

	@Override
	public List<InterviewVo> getRoomListCompany(String str) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".getRoomListCompany", str);
	}

	@Override
	public void updateReadTime(String resume_id, String member_id, String company_id) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("company_id", company_id);
		map.put("member_id", member_id);
		map.put("resume_id", resume_id);
		session.update(namespace + ".updateReadTime", map);
	}

	@Override
	public void updateReadTimeCompany(String resume_id, String member_id, String company_id) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("company_id", company_id);
		map.put("member_id", member_id);
		map.put("resume_id", resume_id);
		session.update(namespace + ".updateReadTimeCompany", map);

	}

	@Override
	public int getUnReadCount(String company_id, String resume_id, String member_id) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("company_id", company_id);
		map.put("member_id", member_id);
		map.put("resume_id", resume_id);

		return session.selectOne(namespace + ".getUnReadCount", map);
	}

	@Override
	public int getUnReadCountCompany(String company_id, String resume_id, String member_id) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("company_id", company_id);
		map.put("member_id", member_id);
		map.put("resume_id", resume_id);

		return session.selectOne(namespace + ".getUnReadCountCompany", map);
	}

	@Override
	public int getAllCount(String str) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("member_id", str);
		map.put("company_id", str);
		if (session.selectOne(namespace + ".getAllCount", map) == null) {
			return 0;
		} else {

			return session.selectOne(namespace + ".getAllCount", map);
		}
	}

	@Override
	public void insertMessage(MessageVo vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".insertMessage", vo);
	}

	@Override
	public MessageVo getRecentMessage(String str) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".getRecentMessage", str);
	}

	@Override
	public List<InterviewVo> getRoomList(InterviewVo vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".getRoomList", vo);
	}

	@Override
	public List<InterviewVo> getRoomList2(InterviewVo vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".getRoomList2", vo);
	}

}

package co.huby.prj.chat.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.chat.mapper.ChatMap;
import co.huby.prj.chat.service.ChatService;
import co.huby.prj.vo.InterviewVo;
import co.huby.prj.vo.MessageVo;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatMap map;

	@Override
	public List<InterviewVo> createRoom(InterviewVo vo) throws Exception {
		return map.createRoom(vo);

	}

	@Override
	public InterviewVo isRoom(InterviewVo vo) throws Exception {
		return map.isRoom(vo);
	}

	@Override
	public List<InterviewVo> getRoomListCompany(String str) throws Exception {
		// TODO Auto-generated method stub
		return map.getRoomListCompany(str);
	}

	@Override
	public void updateReadTime(String resume_id, String member_id, String company_id) throws Exception {
		// TODO Auto-generated method stub
		map.updateReadTime(resume_id, member_id, company_id);
	}

	@Override
	public void updateReadTimeCompany(String resume_id, String member_id, String company_id) throws Exception {
		// TODO Auto-generated method stub
		map.updateReadTimeCompany(resume_id, member_id, company_id);

	}

	@Override
	public int getUnReadCount(String company_id, String resume_id, String member_id) throws Exception {
		return map.getUnReadCountCompany(company_id, resume_id, member_id);
	}

	@Override
	public int getUnReadCountCompany(String company_id, String resume_id, String member_id) throws Exception {
		// TODO Auto-generated method stub
		return map.getUnReadCountCompany(company_id, resume_id, member_id);
	}

	@Override
	public int getAllCount(String str) {
		return map.getAllCount(str);
	}

	@Override
	public void insertMessage(MessageVo vo) throws Exception {
		// TODO Auto-generated method stub
		map.insertMessage(vo);
	}

	@Override
	public List<InterviewVo> getRoomList(InterviewVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.getRoomList(vo);
	}

	@Override
	public List<MessageVo> getMessageList(MessageVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.getMessageList(vo);
	}

	@Override
	public MessageVo getRecentMessage(MessageVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.getRecentMessage(vo);
	}

	@Override
	public List<InterviewVo> getRoomList2(InterviewVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.getRoomList2(vo);
	}

	@Override
	public List<Map> getName(InterviewVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.getName(vo);
	}

}

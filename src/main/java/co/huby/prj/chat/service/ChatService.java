package co.huby.prj.chat.service;

import java.util.List;
import java.util.Map;

import co.huby.prj.vo.InterviewVo;
import co.huby.prj.vo.MessageVo;

public interface ChatService {

	public void createRoom(InterviewVo vo) throws Exception;

	public InterviewVo isRoom(InterviewVo vo) throws Exception;

	public void insertMessage(MessageVo vo) throws Exception;

	public List<MessageVo> getMessageList(MessageVo vo) throws Exception;

	public List<InterviewVo> getRoomList(InterviewVo vo) throws Exception;

	public List<InterviewVo> getRoomList2(InterviewVo vo) throws Exception;

	public MessageVo getRecentMessage(MessageVo vo) throws Exception;

	public Map getName(InterviewVo vo) throws Exception;
	
	public List<InterviewVo> getRoomListCompany(String str) throws Exception;

	public void updateReadTime(String resume_id, String member_id, String company_id) throws Exception;

	public void updateReadTimeCompany(String resume_id, String member_id, String company_id) throws Exception;

	public int getUnReadCount(String company_id, String resume_id, String member_id) throws Exception;

	public int getUnReadCountCompany(String company_id, String resume_id, String member_id) throws Exception;

	public int getAllCount(String str);


}

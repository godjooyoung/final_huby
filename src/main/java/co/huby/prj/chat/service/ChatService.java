package co.huby.prj.chat.service;

import java.util.List;

import co.huby.prj.common.InterviewVo;
import co.huby.prj.common.MessageVo;

public interface ChatService {

	public void createRoom(InterviewVo vo) throws Exception;

	public InterviewVo isRoom(InterviewVo vo) throws Exception;

	public String getMember(InterviewVo vo) throws Exception;

	public String getProfile(String str) throws Exception;

	public String getName(String str) throws Exception;
	
	public List<MessageVo> getMessageList(String str) throws Exception;

	public List<InterviewVo> getRoomList(String str) throws Exception;

	public List<InterviewVo> getRoomList2(String str) throws Exception;

	public String getCompany(String str) throws Exception;

	public List<InterviewVo> getRoomListCompany(String str) throws Exception;

	public void updateReadTime(String resume_id, String member_id, String company_id) throws Exception;

	public void updateReadTimeCompany(String resume_id, String member_id, String company_id) throws Exception;

	public int getUnReadCount(String company_id, String resume_id, String member_id) throws Exception;

	public int getUnReadCountCompany(String company_id, String resume_id, String member_id) throws Exception;

	public int getAllCount(String str);

}
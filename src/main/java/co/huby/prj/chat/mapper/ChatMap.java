package co.huby.prj.chat.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.vo.InterviewVo;
import co.huby.prj.vo.MessageVo;

@MapperScan
public interface ChatMap {
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

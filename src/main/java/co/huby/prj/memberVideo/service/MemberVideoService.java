package co.huby.prj.memberVideo.service;

import java.util.HashMap;
import java.util.List;

import co.huby.prj.vo.VideoVo;

public interface MemberVideoService {

	void memberVideoInsert(HashMap<String, String> map) throws Exception;

	int memberVideoCount(String member_id);
	
	List<String> memberSelect(String member_id);
}

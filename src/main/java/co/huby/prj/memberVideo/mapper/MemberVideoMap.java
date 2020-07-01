package co.huby.prj.memberVideo.mapper;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.vo.VideoVo;

@MapperScan("map")
public interface MemberVideoMap {

	void memberVideoInsert(HashMap<String, String> map) throws Exception;

	int memberVideoCount(String member_id);
	
	List<String> memberSelect(String member_id);
	
	void memberVideoDelete(String video_id);
	
	VideoVo memberVideoId(String video_id);
}

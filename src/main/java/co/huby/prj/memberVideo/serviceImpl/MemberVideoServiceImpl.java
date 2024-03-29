package co.huby.prj.memberVideo.serviceImpl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.memberVideo.mapper.MemberVideoMap;
import co.huby.prj.memberVideo.service.MemberVideoService;
import co.huby.prj.vo.VideoVo;

@Service("memberVideoService")
public class MemberVideoServiceImpl implements MemberVideoService {

	@Autowired
	private MemberVideoMap mapper;

	@Override
	public void memberVideoInsert(HashMap<String, String> map) throws Exception {

		mapper.memberVideoInsert(map);
	}

	@Override
	public int memberVideoCount(String member_id) {
		// TODO Auto-generated method stub
		return mapper.memberVideoCount(member_id);
	}

	@Override
	public List<String> memberSelect(String member_id) {
		return mapper.memberSelect(member_id);

	}

	@Override
	public void memberVideoDelete(String video_id) {
		mapper.memberVideoDelete(video_id);
		
	}

	@Override
	public VideoVo memberVideoId(String video_id) {
		// TODO Auto-generated method stub
		return mapper.memberVideoId(video_id);
	}

}

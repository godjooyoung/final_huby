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
	public List<VideoVo> selectVideoName(VideoVo vo) {
		// TODO Auto-generated method stub
		return mapper.selectVideoName(vo) ;
	}

}

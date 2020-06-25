package co.huby.prj.memberVideo.serviceImpl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.memberVideo.mapper.MemberVideoMap;
import co.huby.prj.memberVideo.service.MemberVideoService;

@Service("memberVideoService")
public class MemberVideoServiceImpl implements MemberVideoService {

	@Autowired
	 private MemberVideoMap mapper;
	
	@Override
	public void memberVideoInsert(HashMap<String, String> map) throws Exception {

		mapper.memberVideoInsert(map);
	}

}

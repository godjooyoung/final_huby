package co.huby.prj.member.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.member.mapper.MemberMap;
import co.huby.prj.member.service.MemberService;
import co.huby.prj.member.service.MemberVo;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMap map;
	
	@Override
	public List<MemberVo> SelectAll() throws Exception {
		// TODO Auto-generated method stub
		return map.SelectAll();
	}

	@Override
	public MemberVo selectone(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.selectone(vo);
	}

	@Override
	public int memberInsert(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.memberInsert(vo);
	}

	@Override
	public int memberUpdate(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int memberDelete(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public MemberVo memberIdCheck(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.memberIdCheck(vo);
	}
	
	}

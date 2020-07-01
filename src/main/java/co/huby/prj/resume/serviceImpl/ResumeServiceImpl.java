package co.huby.prj.resume.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.member.service.MemberVo;
import co.huby.prj.resume.mapper.ResumeMap;
import co.huby.prj.resume.service.ResumeService;
import co.huby.prj.vo.HabitVo;
import co.huby.prj.vo.ResumeVo;

@Service("resumeService")
public class ResumeServiceImpl implements ResumeService {
	
	@Autowired
	ResumeMap map;
	
	@Override
	public List<ResumeVo> SelectAll(MemberVo vo) {
		// TODO Auto-generated method stub
		return map.SelectAll(vo);
	}

	@Override
	public ResumeVo selectone(ResumeVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.selectone(vo);
	}

	@Override
	public int resumeInsert(ResumeVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.resumeInsert(vo);
	}

	@Override
	public int resumeUpdate(ResumeVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.resumeUpdate(vo);
	}

	@Override
	public int resumeDelete(ResumeVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.resumeDelete(vo);
	}

	@Override
	public List<HabitVo> selecthabit(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.selecthabit(vo);
	}

}

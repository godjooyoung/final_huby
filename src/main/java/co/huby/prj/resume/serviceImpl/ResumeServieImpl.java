package co.huby.prj.resume.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;

import co.huby.prj.member.service.MemberVo;
import co.huby.prj.resume.service.ResumeService;
import co.huby.prj.vo.ResumeVo;

@Service("resumeService")
public class ResumeServieImpl implements ResumeService {

	@Override
	public List<ResumeVo> SelectAll(MemberVo vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResumeVo selectone(ResumeVo vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int resumeInsert(ResumeVo vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int resumeUpdate(ResumeVo vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int resumeDelete(ResumeVo vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}

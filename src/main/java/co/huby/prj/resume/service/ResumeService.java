package co.huby.prj.resume.service;

import java.util.List;

import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.HabitVo;
import co.huby.prj.vo.ResumeVo;

public interface ResumeService {
	List<ResumeVo> SelectAll(MemberVo vo);
	ResumeVo selectone(ResumeVo vo) throws Exception;
	int resumeInsert(ResumeVo vo) throws Exception;
	int resumeUpdate(ResumeVo vo) throws Exception;
	int resumeDelete(ResumeVo vo) throws Exception;
	List<HabitVo> selecthabit(MemberVo vo) throws Exception;
}

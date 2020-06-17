package co.huby.prj.resume.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.ResumeVo;

@MapperScan
public interface ResumeMap {
	List<ResumeVo> SelectAll(MemberVo vo);
	ResumeVo selectone(ResumeVo vo) throws Exception;
	int resumeInsert(ResumeVo vo) throws Exception;
	int resumeUpdate(ResumeVo vo) throws Exception;
	int resumeDelete(ResumeVo vo) throws Exception;
}

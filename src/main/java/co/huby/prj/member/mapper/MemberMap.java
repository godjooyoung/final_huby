package co.huby.prj.member.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import co.huby.prj.member.service.MemberService;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.SkillsVo;

@MapperScan
public interface MemberMap{
	List<MemberVo> SelectAll() throws Exception;
	MemberVo selectone(MemberVo vo) throws Exception;
	int memberInsert(MemberVo vo) throws Exception;
	int memberUpdate(MemberVo vo) throws Exception;
	int memberDelete(MemberVo vo) throws Exception;
	MemberVo memberIdCheck(MemberVo vo) throws Exception;
	String selectpw(MemberVo vo) throws Exception;
	List<SkillsVo> skillsAll(MemberVo vo) throws Exception;
	int skillInsert(MemberVo vo) throws Exception;
}

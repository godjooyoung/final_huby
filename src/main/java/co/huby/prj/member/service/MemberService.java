package co.huby.prj.member.service;

import java.util.List;

import co.huby.prj.vo.SkillsVo;

public interface MemberService {
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

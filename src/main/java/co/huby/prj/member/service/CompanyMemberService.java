package co.huby.prj.member.service;

import java.util.List;

import co.huby.prj.vo.CompanyVo;

public interface CompanyMemberService {
	List<CompanyVo> SelectAll();
	CompanyVo selectone(CompanyVo vo);
	int companyMemberInsert(CompanyVo vo);
	int companyMemberUpdate(CompanyVo vo);
	int companyMemberDelete(CompanyVo vo);
	CompanyVo companyMemberIdCheck(CompanyVo vo);
	CompanyVo companyrNumCheck(CompanyVo vo);
	CompanyVo companySelectOne(CompanyVo vo);
	int companyPwUpdate(CompanyVo vo);
}

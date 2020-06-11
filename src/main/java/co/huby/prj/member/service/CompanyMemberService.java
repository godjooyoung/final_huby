package co.huby.prj.member.service;

import java.util.List;

public interface CompanyMemberService {
	List<CompanyMemberVo> SelectAll();
	CompanyMemberVo selectone(CompanyMemberVo vo);
	int companyMemberInsert(CompanyMemberVo vo);
	int companyMemberUpdate(CompanyMemberVo vo);
	int companyMemberDelete(CompanyMemberVo vo);
}

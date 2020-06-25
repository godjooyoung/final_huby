package co.huby.prj.member.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import co.huby.prj.member.service.CompanyMemberService;
import co.huby.prj.vo.CompanyVo;

@MapperScan
public interface CompanyMemberMap{
	List<CompanyVo> SelectAll();
	CompanyVo selectone(CompanyVo vo);
	int companyMemberInsert(CompanyVo vo);
	int companyMemberUpdate(CompanyVo vo);
	int companyMemberDelete(CompanyVo vo);
	CompanyVo companyMemberIdCheck(CompanyVo vo);
	CompanyVo companyrNumCheck(CompanyVo vo);
	CompanyVo companySelectOne(CompanyVo vo);
}

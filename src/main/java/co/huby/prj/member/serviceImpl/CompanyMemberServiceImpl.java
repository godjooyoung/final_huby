package co.huby.prj.member.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.member.mapper.CompanyMemberMap;
import co.huby.prj.member.service.CompanyMemberService;
import co.huby.prj.member.service.CompanyMemberVo;

@Service("companyMemberService")
public class CompanyMemberServiceImpl implements CompanyMemberService {

	@Autowired
	private CompanyMemberMap map;
	
	@Override
	public List<CompanyMemberVo> SelectAll(){
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CompanyMemberVo selectone(CompanyMemberVo vo){
		// TODO Auto-generated method stub
		return map.selectone(vo);
	}

	@Override
	public int companyMemberInsert(CompanyMemberVo vo){
		// TODO Auto-generated method stub
		return map.companyMemberInsert(vo);
	}

	@Override
	public int companyMemberUpdate(CompanyMemberVo vo){
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int companyMemberDelete(CompanyMemberVo vo){
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CompanyMemberVo companyMemberIdCheck(CompanyMemberVo vo) {
		// TODO Auto-generated method stub
		return map.companyMemberIdCheck(vo);
	}

	@Override
	public CompanyMemberVo companyrNumCheck(CompanyMemberVo vo) {
		// TODO Auto-generated method stub
		return map.companyrNumCheck(vo);
	}
}

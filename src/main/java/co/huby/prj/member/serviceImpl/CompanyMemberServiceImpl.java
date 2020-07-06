package co.huby.prj.member.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import co.huby.prj.member.mapper.CompanyMemberMap;
import co.huby.prj.member.service.CompanyMemberService;
import co.huby.prj.vo.CompanyVo;

@Service("companyMemberService")
public class CompanyMemberServiceImpl implements CompanyMemberService {

	@Autowired
	private CompanyMemberMap map;
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	@Override
	public List<CompanyVo> SelectAll(){
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CompanyVo selectone(CompanyVo vo){
		// TODO Auto-generated method stub
		return map.selectone(vo);
	}

	@Override
	public int companyMemberInsert(CompanyVo vo){
		// TODO Auto-generated method stub
		vo.setCompany_pw(pwdEncoder.encode(vo.getCompany_pw()));
		
		return map.companyMemberInsert(vo);
	}

	@Override
	public int companyMemberUpdate(CompanyVo vo){
		// TODO Auto-generated method stub
		return map.companyMemberUpdate(vo);
	}

	@Override
	public int companyMemberDelete(CompanyVo vo){
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CompanyVo companyMemberIdCheck(CompanyVo vo) {
		// TODO Auto-generated method stub
		return map.companyMemberIdCheck(vo);
	}

	@Override
	public CompanyVo companyrNumCheck(CompanyVo vo) {
		// TODO Auto-generated method stub
		return map.companyrNumCheck(vo);
	}

	@Override
	public CompanyVo companySelectOne(CompanyVo vo) {
		// TODO Auto-generated method stub
		return map.companySelectOne(vo);
	}

	@Override
	public int companyPwUpdate(CompanyVo vo) {
		vo.setCompany_pw(pwdEncoder.encode(vo.getCompany_pw()));
		// TODO Auto-generated method stub
		return map.companyPwUpdate(vo);
	}
}

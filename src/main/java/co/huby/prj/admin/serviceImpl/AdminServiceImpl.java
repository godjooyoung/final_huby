package co.huby.prj.admin.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.admin.mapper.AdminMap;
import co.huby.prj.admin.service.AdminService;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.AdminTableVo;
import co.huby.prj.vo.CompanyVo;
import co.huby.prj.vo.NoticeVo;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMap map;

	@Override
	public List<MemberVo> memberSelectAll(MemberVo vo) {
		// TODO Auto-generated method stub
		return map.memberSelectAll(vo);
	}

	@Override
	public List<CompanyVo> companySelectAll(CompanyVo vo) {
		// TODO Auto-generated method stub
		return map.companySelectAll(vo);
	}

	@Override
	public List<NoticeVo> noticeSelectAll(NoticeVo vo) {
		// TODO Auto-generated method stub
		return map.noticeSelectAll(vo);
	}

	@Override
	public int noticeInsert(NoticeVo vo) {
		// TODO Auto-generated method stub
		return map.noticeInsert(vo);
	}

	@Override
	public NoticeVo noticeSelectOne(NoticeVo vo) {
		// TODO Auto-generated method stub
		return map.noticeSelectOne(vo);
	}

	@Override
	public int noticeUpdate(NoticeVo vo) {
		// TODO Auto-generated method stub
		return map.noticeUpdate(vo);
	}

	@Override
	public int noticeDelete(NoticeVo vo) {
		// TODO Auto-generated method stub
		return map.noticeDelete(vo);
	}

	@Override
	public int memberCnt() {
		// TODO Auto-generated method stub
		return map.memberCnt();
	}

	@Override
	public int CompanyCnt() {
		// TODO Auto-generated method stub
		return map.CompanyCnt();
	}

	@Override
	public int noticeCnt() {
		// TODO Auto-generated method stub
		return map.noticeCnt();
	}

	@Override
	public AdminTableVo adminSelectOne(AdminTableVo vo) {
		// TODO Auto-generated method stub
		return map.adminSelectOne(vo);
	}

	@Override
	public int allMemberCnt() {
		// TODO Auto-generated method stub
		return map.allMemberCnt();
	}

	@Override
	public int allCompanyMemberCnt() {
		// TODO Auto-generated method stub
		return map.allCompanyMemberCnt();
	}

	@Override
	public int allQnaCnt() {
		// TODO Auto-generated method stub
		return map.allQnaCnt();
	}

	@Override
	public int allMemberResumeCnt() {
		// TODO Auto-generated method stub
		return map.allMemberResumeCnt();
	}

	@Override
	public int allCompanyEmploymentsCnt() {
		// TODO Auto-generated method stub
		return map.allCompanyEmploymentsCnt();
	}

	@Override
	public int allViceoCnt() {
		// TODO Auto-generated method stub
		return map.allViceoCnt();
	}

	@Override
	public int allInterviewCnt() {
		// TODO Auto-generated method stub
		return map.allInterviewCnt();
	}

	@Override
	public int allApplyCnt() {
		// TODO Auto-generated method stub
		return map.allApplyCnt();
	}

	@Override
	public List<Map> memberFirstHopeJob() {
		// TODO Auto-generated method stub
		return map.memberFirstHopeJob();
	}

	@Override
	public List<Map> companyFirstHopeJob() {
		// TODO Auto-generated method stub
		return map.companyFirstHopeJob();
	}

	@Override
	public List<Map> monthlyMemberCnt() {
		// TODO Auto-generated method stub
		return map.monthlyMemberCnt();
	}

	@Override
	public List<Map> monthlyCompanyMemberCnt() {
		// TODO Auto-generated method stub
		return map.monthlyCompanyMemberCnt();
	}
	 
}

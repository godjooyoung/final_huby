package co.huby.prj.admin.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.admin.mapper.AdminMap;
import co.huby.prj.admin.service.AdminService;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.CompanyVo;
import co.huby.prj.vo.NoticeVo;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMap map;

	@Override
	public List<MemberVo> memberSelectAll() {
		// TODO Auto-generated method stub
		return map.memberSelectAll();
	}

	@Override
	public List<CompanyVo> companySelectAll() {
		// TODO Auto-generated method stub
		return map.companySelectAll();
	}

	@Override
	public List<NoticeVo> noticeSelectAll() {
		// TODO Auto-generated method stub
		return map.noticeSelectAll();
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

	
}

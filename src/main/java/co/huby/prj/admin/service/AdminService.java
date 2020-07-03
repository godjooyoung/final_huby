package co.huby.prj.admin.service;

import java.util.List;

import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.AdminTableVo;
import co.huby.prj.vo.CompanyVo;
import co.huby.prj.vo.NoticeVo;

public interface AdminService {
	List<MemberVo> memberSelectAll(MemberVo vo);
	List<CompanyVo> companySelectAll(CompanyVo vo);
	List<NoticeVo> noticeSelectAll(NoticeVo vo);
	int noticeInsert(NoticeVo vo);
	NoticeVo noticeSelectOne(NoticeVo vo);
	int noticeUpdate(NoticeVo vo);
	int noticeDelete(NoticeVo vo);
	int memberCnt();
	int CompanyCnt();
	int noticeCnt();
	AdminTableVo adminSelectOne(AdminTableVo vo);
}

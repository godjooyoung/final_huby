package co.huby.prj.admin.service;

import java.util.List;

import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.CompanyVo;
import co.huby.prj.vo.NoticeVo;

public interface AdminService {
	List<MemberVo> memberSelectAll();
	List<CompanyVo> companySelectAll();
	List<NoticeVo> noticeSelectAll();
	int noticeInsert(NoticeVo vo);
	NoticeVo noticeSelectOne(NoticeVo vo);
	int noticeUpdate(NoticeVo vo);
}

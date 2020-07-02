package co.huby.prj.admin.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.CompanyVo;
import co.huby.prj.vo.NoticeVo;

@MapperScan
public interface AdminMap {
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
}

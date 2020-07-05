package co.huby.prj.admin.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.AdminTableVo;
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
	AdminTableVo adminSelectOne(AdminTableVo vo);
	int allMemberCnt();	//	전체 회원 수
	int allCompanyMemberCnt(); // 전체 기업회원 수
	int allQnaCnt();	//	답변 해줘야 할 Qna 수
	int allMemberResumeCnt();	// 전체 개인 이력서 수
	int allCompanyEmploymentsCnt();	// 전체 회사 공고 수
	int allViceoCnt();	// 전체 개인 영상 수
	int allInterviewCnt();	// 개인과 회사간의 진행중인 면접 수
	int allApplyCnt();	//	개인이 회사에 실제 지원한 이력서 개수
	List<Map> memberFirstHopeJob();	// 개인이 가장 선호하는 1순위 직종(가지고 있는 이력서 기준)
	List<Map> companyFirstHopeJob(); // 회사가 공고에 가장 많이 낸 1순위 직종(올린 공고 기준)
	List<Map> monthlyMemberCnt();// 월별 개인 가입자 수
	List<Map> monthlyCompanyMemberCnt(); // 월별 기업 가입자 수
}

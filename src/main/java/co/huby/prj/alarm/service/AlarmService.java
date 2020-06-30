package co.huby.prj.alarm.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import co.huby.prj.vo.CompanyVo;
import co.huby.prj.vo.EmploymentsVo;

public interface AlarmService {
	public ArrayList<AlarmVo> personalarmlist(String personid) throws Exception;
	public ArrayList<AlarmVo> companyalarmlist(String companyid) throws Exception;
	int alarmInsert(AlarmVo vo);
	int currentY(AlarmVo vo);
	void currentN(AlarmVo vo);
	void alarmdelete(AlarmVo vo);
	int alarminsertcheck(AlarmVo vo);
	int alarmupdatecheck(AlarmVo vo);
	List<Map> comemploymentlist(String companyid) throws Exception; 
	List<AlarmVo> companyselect(CompanyVo vo) throws Exception;
	int memberreadstate(String personid);
	int companyreadstate(String companyid);
	int memcountselect(AlarmVo vo);
	int companycountselect(AlarmVo vo);
	int countselect(String loginId, String loginType);
}

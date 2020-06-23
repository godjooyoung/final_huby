package co.huby.prj.alarm.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import co.huby.prj.vo.EmploymentsVo;

public interface AlarmService {
	public ArrayList<AlarmVo> personalarmlist(String personid) throws Exception;
	public ArrayList<AlarmVo> companyalarmlist(String companyid) throws Exception;
	int alarmInsert(AlarmVo vo);
	void currentY(AlarmVo vo);
	void currentN(AlarmVo vo);
	void alarmdelete(AlarmVo vo);
	int alarminsertcheck(AlarmVo vo);
	List<Map> comemploymentlist(String companyid) throws Exception; 
}

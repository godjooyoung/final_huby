package co.huby.prj.alarm.service;

import java.util.ArrayList;

public interface AlarmService {
	public ArrayList<AlarmVo> personalarmlist(String personid) throws Exception;
	public ArrayList<AlarmVo> companyalarmlist(String companyid) throws Exception;
	int alarmInsert(AlarmVo vo);
	void currentY(AlarmVo vo);
	void currentN(AlarmVo vo);
	void alarmdelete(AlarmVo vo);
	int alarminsertcheck(AlarmVo vo);
}

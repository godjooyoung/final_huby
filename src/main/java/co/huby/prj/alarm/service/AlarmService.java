package co.huby.prj.alarm.service;

import java.util.ArrayList;

public interface AlarmService {
	public ArrayList<AlarmVo> personalarmlist(String personid) throws Exception;
	public ArrayList<AlarmVo> companyalarmlist(UserVo uservo) throws Exception;
	void AlarmInsert(AlarmVo vo);
}

package co.huby.prj.alarm.service;

import java.util.ArrayList;

public interface AlarmService {
	public ArrayList<AlarmVo> personalarmlist() throws Exception;
	public ArrayList<AlarmVo> companyalarmlist() throws Exception;
	void AlarmInsert(AlarmVo vo);
}

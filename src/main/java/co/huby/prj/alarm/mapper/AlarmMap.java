package co.huby.prj.alarm.mapper;


import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.alarm.service.AlarmVo;

@MapperScan
public interface AlarmMap {
	public ArrayList<AlarmVo> personalarmlist(String personid);
	public ArrayList<AlarmVo> companyalarmlist(String companyid);
	void alarmInsert(AlarmVo vo);
	void currentY(AlarmVo vo);
	void currentN(AlarmVo vo);
	void alarmdelete(AlarmVo vo);
}

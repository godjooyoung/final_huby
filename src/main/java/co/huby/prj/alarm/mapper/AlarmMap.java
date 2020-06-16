package co.huby.prj.alarm.mapper;


import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.alarm.service.AlarmVo;

@MapperScan
public interface AlarmMap {
	public ArrayList<AlarmVo> personalarmlist();
	public ArrayList<AlarmVo> companyalarmlist();
	void alarmInsert(AlarmVo vo);
	
}

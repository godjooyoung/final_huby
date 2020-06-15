package co.huby.prj.alarm.mapper;


import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.alarm.service.AlarmVo;

@MapperScan
public interface AlarmMap {
	public ArrayList<AlarmVo> personalarm();
	public ArrayList<AlarmVo> companyalarm();
	void alarmInsert(AlarmVo vo);
	
}

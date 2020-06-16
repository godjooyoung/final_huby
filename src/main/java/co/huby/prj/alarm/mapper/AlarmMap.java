package co.huby.prj.alarm.mapper;


import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.alarm.service.AlarmVo;
import co.huby.prj.alarm.service.UserVo;

@MapperScan
public interface AlarmMap {
	public ArrayList<AlarmVo> personalarmlist(String personid);
	public ArrayList<AlarmVo> companyalarmlist(UserVo uservo);
	void alarmInsert(AlarmVo vo);
	
}

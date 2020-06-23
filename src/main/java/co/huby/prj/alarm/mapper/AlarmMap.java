package co.huby.prj.alarm.mapper;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.alarm.service.AlarmVo;
import co.huby.prj.vo.EmploymentsVo;

@MapperScan
public interface AlarmMap {
	public ArrayList<AlarmVo> personalarmlist(String personid);
	public ArrayList<AlarmVo> companyalarmlist(String companyid);
	int alarmInsert(AlarmVo vo);
	void currentY(AlarmVo vo);
	void currentN(AlarmVo vo);
	void alarmdelete(AlarmVo vo);
	int alarminsertcheck(AlarmVo vo);
	List<Map> comemploymentlist(String companyid);
}

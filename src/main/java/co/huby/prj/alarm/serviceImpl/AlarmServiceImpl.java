package co.huby.prj.alarm.serviceImpl;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.alarm.mapper.AlarmMap;
import co.huby.prj.alarm.service.AlarmService;
import co.huby.prj.alarm.service.AlarmVo;

@Service("alarmService")
public class AlarmServiceImpl implements AlarmService {
	@Autowired
	private AlarmMap map;
	
	@Override
	public ArrayList<AlarmVo> personalarmlist() throws Exception{
		return map.personalarmlist();
	}

	@Override
	public ArrayList<AlarmVo> companyalarmlist() throws Exception {
		// TODO Auto-generated method stub
		return map.companyalarmlist();
	}

	@Override
	public void AlarmInsert(AlarmVo vo) {
		// TODO Auto-generated method stub
		
	}
	
}

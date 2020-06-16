package co.huby.prj.alarm.serviceImpl;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.alarm.mapper.AlarmMap;
import co.huby.prj.alarm.service.AlarmService;
import co.huby.prj.alarm.service.AlarmVo;
import co.huby.prj.alarm.service.UserVo;

@Service("alarmService")
public class AlarmServiceImpl implements AlarmService {
	@Autowired
	private AlarmMap map;
	
	
	@Override
	public ArrayList<AlarmVo> personalarmlist(String personid) throws Exception{
		return map.personalarmlist(personid);
	}

	@Override
	public ArrayList<AlarmVo> companyalarmlist(UserVo uservo) throws Exception {
		// TODO Auto-generated method stub
		return map.companyalarmlist(uservo);
	}

	@Override
	public void AlarmInsert(AlarmVo vo) {
		// TODO Auto-generated method stub
		
	}
	
}

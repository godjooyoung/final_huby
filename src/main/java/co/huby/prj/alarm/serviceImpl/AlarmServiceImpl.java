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
	public ArrayList<AlarmVo> personalarmlist(String personid) throws Exception{
		return map.personalarmlist(personid);
	}

	@Override
	public ArrayList<AlarmVo> companyalarmlist(String companyid) throws Exception {
		// TODO Auto-generated method stub
		return map.companyalarmlist(companyid);
	}

	@Override
	public int alarmInsert(AlarmVo vo) {
		int n = map.alarminsertcheck(vo);
		if(n==0) {
			return map.alarmInsert(vo);
		} else {
			return 0;
		}
	}
	
	@Override
	public void currentY(AlarmVo vo) {
		map.currentY(vo);
	}
	
	@Override
	public void currentN(AlarmVo vo) {
		map.currentN(vo);
	}
	
	@Override
	public void alarmdelete(AlarmVo vo) {
		map.alarmdelete(vo);
	}
	@Override
	public int alarminsertcheck(AlarmVo vo) {
		return map.alarminsertcheck(vo);
	}
	
}

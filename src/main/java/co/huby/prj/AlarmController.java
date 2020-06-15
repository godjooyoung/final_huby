package co.huby.prj;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.huby.prj.alarm.service.AlarmService;
import co.huby.prj.alarm.service.AlarmVo;

@Controller
public class AlarmController {
	
	@Autowired
	AlarmService alarmService;

	@RequestMapping("/companyalarm.do")
	public String companyalarm(Model model) {
		return "alarm/companyalarmlist";
	}
	
	
	@RequestMapping("/personalarm.do")
	public ModelAndView personalarmlist(ModelAndView mav) throws Exception  {
		ArrayList<AlarmVo> list = alarmService.personalarmlist();
		mav.addObject("list", list);
		mav.setViewName("alarm/personalarmlist");
		return mav;
	}
	
}
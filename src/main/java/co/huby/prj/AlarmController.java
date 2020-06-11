package co.huby.prj;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AlarmController {

	@RequestMapping("/alarm.do")
	public String companyalarm(Model model) {
		return "alarm/alarm";
	}
	
	/*
	@RequestMapping("personalarm.do")
	public String memberalarm(Model model) {
		return "alarm/personalarm";
	}*/
}

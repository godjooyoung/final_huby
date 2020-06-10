package co.huby.prj;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AlarmController {

	@RequestMapping("companyalarm.do")
	public String companyalarm(Model model) {
		return "alarm/companyalarm";
	}
	
	@RequestMapping("memberalarm.do")
	public String memberalarm(Model model) {
		return "alarm/memberalarm";
	}
}

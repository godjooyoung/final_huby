package co.huby.prj;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.huby.prj.member.service.CompanyMemberService;
import co.huby.prj.vo.CompanyVo;

@Controller
public class CompanyController {

	@InitBinder
	public void allowEmptyDateBinding( WebDataBinder binder )
		{
		    // Custom String Editor. tell spring to set empty values as null instead of empty string.
		    // binder.registerCustomEditor( String.class, new StringTrimmerEditor( true ));			
		    //Custom Date Editor
												
		    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
		    simpleDateFormat.setLenient(false);
		    binder.registerCustomEditor( Date.class, new CustomDateEditor( simpleDateFormat,true));	   
		}
	
	@Autowired
	CompanyMemberService companyMemberService;
	
	@RequestMapping("/CompanyInsertJoin.do")
	public ModelAndView CompanyInsertJoin(Model model, CompanyVo vo) {
		ModelAndView mav = new ModelAndView();		
		
		int n = companyMemberService.companyMemberInsert(vo);
		
		if (n == 1) {
			mav.setViewName("no/common/login");
		} else {
			mav.setViewName("member/personalmemberjoinFail");
		}
		
		
		return mav;
	}
}

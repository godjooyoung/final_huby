package co.huby.prj.code;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JobCodeController {

	@Autowired
	JobCodeService codeService;

	@RequestMapping(value = "/code.do", method = RequestMethod.GET)
	public String toHome() {
		return "common/code";
	}

	@RequestMapping(value = "/getData.do")
	@ResponseBody
	public Object getData(JobCodeVo request) throws UnsupportedEncodingException {
		String svcType = request.getSvcType();
		String svcCode = request.getSvcCode();
		String gubun = request.getGubun();
		Object response = codeService.getItemsFromOpenApi(svcType, svcCode, gubun);
		return response;
	}
}

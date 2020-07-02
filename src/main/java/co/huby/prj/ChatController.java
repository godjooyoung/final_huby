package co.huby.prj;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.huby.prj.chat.service.ChatService;
import co.huby.prj.vo.InterviewVo;
import co.huby.prj.vo.MessageVo;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	// @Autowired
	// Handler handler;

	@RequestMapping(value = "/company_chatList.do") // 기업회원 채팅창
	public String getChatViewPage(Model model, HttpServletRequest request, InterviewVo vo) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		String memberid = (String) request.getSession().getAttribute("personalVo");
		vo.setCompany_id(companyid);
		vo.setMember_id(memberid);
		List<InterviewVo> list = chatService.getRoomList2(vo);
		model.addAttribute("companyChatList", list);

		// message = chatService.getRecentMessage(message);
		// model.addAttribute("recent", message);
		return "company/chat/chatCompany";

	}

	@RequestMapping(value = "/person_chatList.do") // 개인회원 채팅창
	public String getChatViewPage2(Model model, HttpServletRequest request, InterviewVo vo, MessageVo message)
			throws Exception {
		String memberid = (String) request.getSession().getAttribute("loginId");
		String companyid = (String) request.getSession().getAttribute("companyVo");
		vo.setCompany_id(companyid);
		vo.setMember_id(memberid);
		List<InterviewVo> list = chatService.getRoomList(vo);
		model.addAttribute("personChatList", list);

		return "person/chat/chatMember";

	}

	// @RequestMapping(value = "/person_chatList.do") // 개인회원 채팅리스트
	// public String personChatList(Model model, HttpServletRequest request,
	// InterviewVo vo) throws Exception {
	// String memberid = (String) request.getSession().getAttribute("loginId");
	// String companyid = (String) request.getSession().getAttribute("companyVo");
	// vo.setCompany_id(companyid);
	// vo.setMember_id(memberid);
	// List<InterviewVo> list = chatService.getRoomList(vo);
	// model.addAttribute("personChatList", list);
	// return "person/chat/personChatList";
	//
	// }

	/*
	 * @RequestMapping(value = "/company_chatList.do") // 기업회원 채팅리스트 public String
	 * companyChatList(Model model, HttpServletRequest request, InterviewVo vo)
	 * throws Exception { String companyid = (String)
	 * request.getSession().getAttribute("loginId"); String memberid = (String)
	 * request.getSession().getAttribute("personalVo"); vo.setCompany_id(companyid);
	 * vo.setMember_id(memberid); List<InterviewVo> list =
	 * chatService.getRoomList2(vo); model.addAttribute("companyChatList", list);
	 * return "company/chat/companyChatList";
	 * 
	 * }
	 */

	@ResponseBody
	@RequestMapping(value = "/ajaxSelectChat.do")
	public HashMap<String, Object> ajaxSelectChat(InterviewVo vo, MessageVo message, Model model,
			HttpServletRequest request) throws Exception {
		String intervie_id = request.getParameter("interview_id");
		vo.setInterview_id(intervie_id);
		Map map = chatService.getName(vo);
		message.setInterview_id(vo.getInterview_id());
		List<MessageVo> messageList = chatService.getMessageList(message);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("result", messageList);
		result.put("interview", vo);
		result.put("name", map);
		return result;
	}

}

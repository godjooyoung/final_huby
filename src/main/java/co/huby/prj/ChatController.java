package co.huby.prj;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.huby.prj.chat.service.ChatService;
import co.huby.prj.vo.InterviewVo;
import co.huby.prj.vo.MessageVo;
import oracle.jdbc.driver.Message;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	// @Autowired
	// Handler handler;

	@RequestMapping(value = "/company_chat.do") // 기업회원 채팅창
	public String getChatViewPage(Model model, HttpServletRequest request, InterviewVo vo, MessageVo message)
			throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		String memberid = (String) request.getSession().getAttribute("personalVo");
		vo.setCompany_id(companyid);
		vo.setMember_id(memberid);
		List<InterviewVo> list = chatService.getRoomList2(vo);
		model.addAttribute("companyChatList", list);
		vo = chatService.isRoom(vo);
		model.addAttribute("room", vo);
		message.setInterview_id(vo.getInterview_id());
		List<MessageVo> messageList = chatService.getMessageList(message);
		model.addAttribute("message", messageList);
		message = chatService.getRecentMessage(message);
		model.addAttribute("recent", message);
		return "company/chat/chatTest";

	}

	@RequestMapping(value = "/person_chat.do") // 개인회원 채팅창
	public String getChatViewPage2(Model model, HttpServletRequest request, InterviewVo vo, MessageVo message)
			throws Exception {
		vo = chatService.isRoom(vo);
		model.addAttribute("room", vo);
		message.setInterview_id(vo.getInterview_id());
		List<MessageVo> list = chatService.getMessageList(message);
		model.addAttribute("message", list);
		return "person/chat/chat";

	}

	@RequestMapping(value = "/person_chatList.do") // 개인회원 채팅리스트
	public String personChatList(Model model, HttpServletRequest request, InterviewVo vo) throws Exception {
		String memberid = (String) request.getSession().getAttribute("loginId");
		String companyid = (String) request.getSession().getAttribute("companyVo");
		vo.setCompany_id(companyid);
		vo.setMember_id(memberid);
		List<InterviewVo> list = chatService.getRoomList(vo);
		model.addAttribute("personChatList", list);
		return "person/chat/personChatList";

	}

	@RequestMapping(value = "/company_chatList.do") // 기업회원 채팅리스트
	public String companyChatList(Model model, HttpServletRequest request, InterviewVo vo) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		String memberid = (String) request.getSession().getAttribute("personalVo");
		vo.setCompany_id(companyid);
		vo.setMember_id(memberid);
		List<InterviewVo> list = chatService.getRoomList2(vo);
		model.addAttribute("companyChatList", list);
		return "company/chat/companyChatList";

	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/insertMessage.do") public String
	 * insertMessage(MessageVo vo, Model model, HttpServletRequest request) throws
	 * Exception { String loginId = (String)
	 * request.getSession().getAttribute("loginId"); String msg =
	 * request.getParameter("message_contents"); vo.setMessage_sender(loginId);
	 * vo.setMessage_contents(msg);
	 * vo.setCompany_id(request.getParameter("company_id"));
	 * chatService.insertMessage(vo); return null; }
	 */
}

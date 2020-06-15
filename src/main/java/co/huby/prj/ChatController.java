package co.huby.prj;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
// @ServerEndpoint(value = "/echo.do")
public class ChatController {
	// private static final List<Session> sessionList = new ArrayList<Session>();;
	// // private static final Logger logger =
	// // LoggerFactory.getLogger(ChatController.class);
	//
	// public void WebSocketChat() {
	// // TODO Auto-generated constructor stub
	// System.out.println("웹소켓(서버) 객체생성");
	// }

	@RequestMapping(value = "/company_chat.do")
	public String getChatViewPage(Model model, HttpServletRequest request) {
		String companyid = (String) request.getSession().getAttribute("companyloginid");
		return "company/chat/test";

	}

	@RequestMapping(value = "/person_chat.do")
	public String getChatViewPage2(Model model, HttpServletRequest request) {
		String personalid = (String) request.getSession().getAttribute("personalloginid");
		return "person/chat/test";

	}

	// @OnOpen
	// public void onOpen(Session session) {
	// Logger.info("Open session id:" + session.getId());
	// try {
	// final Basic basic = session.getBasicRemote();
	// basic.sendText("Connection Established");
	// } catch (Exception e) {
	// // TODO: handle exception
	// System.out.println(e.getMessage());
	// }
	// sessionList.add(session);
	// }

	/*
	 * 모든 사용자에게 메시지를 전달한다.
	 * 
	 * @param self
	 * 
	 * @param message
	 */
	// private void sendAllSessionToMessage(Session self, String message) {
	// try {
	// for (Session session : ChatController.sessionList) {
	// if (!self.getId().equals(session.getId())) {
	// session.getBasicRemote().sendText(message.split(",")[1] + " : " + message);
	// }
	// }
	// } catch (Exception e) {
	// // TODO: handle exception
	// System.out.println(e.getMessage());
	// }
	// }

	// @OnMessage
	// public void onMessage(String message, Session session) {
	// logger.info("Message From " + message.split(",")[1] + ": " +
	// message.split(",")[0]);
	// try {
	// final Basic basic = session.getBasicRemote();
	// basic.sendText("to : " + message);
	// } catch (Exception e) {
	// // TODO: handle exception
	// System.out.println(e.getMessage());
	// }
	// sendAllSessionToMessage(session, message);
	// }
	//
	// @OnError
	// public void onError(Throwable e, Session session) {
	//
	// }

	// @OnClose
	// public void onClose(Session session) {
	// logger.info("Session " + session.getId() + " has ended");
	// sessionList.remove(session);
	// }

}
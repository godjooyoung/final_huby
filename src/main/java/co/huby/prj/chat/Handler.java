package co.huby.prj.chat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import co.huby.prj.chat.service.ChatService;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.InterviewVo;
import co.huby.prj.vo.MessageVo;

import com.google.gson.Gson;

public class Handler extends TextWebSocketHandler {

	@Autowired
	private ChatService service;
	private List<WebSocketSession> connectedUsers;
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	public Handler() {
		connectedUsers = new ArrayList<WebSocketSession>();
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getId() + " 연결 됨!!");
		users.put((String) session.getAttributes().get("loginId"), session);
		connectedUsers.add(session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log(session.getId() + " 연결 종료됨");
		connectedUsers.remove(session);
		users.remove(session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message.getPayload());
		Map<String, Object> map = null;
		MessageVo messageVo = MessageVo.convertMessage(message.getPayload());

		System.out.println("1 : " + messageVo.toString());

		InterviewVo interviewVo = new InterviewVo();
		interviewVo.setInterview_id(messageVo.getInterview_id()); // 인터뷰
		interviewVo.setCompany_id(messageVo.getCompany_id()); // 회사
		interviewVo.setMember_id(messageVo.getMember_id()); // 유저

		InterviewVo iroom = null;
		if (!messageVo.getMember_id().equals(messageVo.getCompany_id())) {
			System.out.println("a");

			if (service.isRoom(interviewVo) == null) {
				System.out.println("b");
				service.createRoom(interviewVo);
				System.out.println("d");
				iroom = service.isRoom(interviewVo);

			} else {
				System.out.println("C");
				iroom = service.isRoom(interviewVo);
			}
		} else {

			iroom = service.isRoom(interviewVo);
		}

		messageVo.setInterview_id(iroom.getInterview_id());
		if (iroom.getMember_id().equals(messageVo.getMessage_sender())) {
			messageVo.setMessage_receiver(interviewVo.getCompany_id());
		} else {
			messageVo.setMessage_receiver(interviewVo.getMember_id());
		}

		for (WebSocketSession websocketSession : connectedUsers) {
			map = websocketSession.getAttributes();
			MemberVo login = (MemberVo) map.get("login");

			// 받는사람
			if (login.getMember_id().equals(messageVo.getMessage_sender())) {
				Gson gson = new Gson();
				String msgJson = gson.toJson(messageVo);
				websocketSession.sendMessage(new TextMessage(msgJson));
			}

		}
	}

	@Override

	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);

	}

}
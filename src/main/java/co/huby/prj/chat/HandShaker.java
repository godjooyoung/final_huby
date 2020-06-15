package co.huby.prj.chat;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandShaker extends HttpSessionHandshakeInterceptor {

	@Override
	public void afterHandshake(org.springframework.http.server.ServerHttpRequest request, ServerHttpResponse response,
			WebSocketHandler wsHandler, Exception ex) {
		// TODO Auto-generated method stub
		super.afterHandshake(request, response, wsHandler, ex);


	}

	@Override
	public boolean beforeHandshake(org.springframework.http.server.ServerHttpRequest request, ServerHttpResponse response,
			WebSocketHandler arg2, Map<String, Object> attributes) throws Exception {
		// TODO Auto-generated method stub
		
		 ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
	        System.out.println("URI:"+request.getURI());
	  
	        HttpServletRequest req =  ssreq.getServletRequest();
	 
	        /*String userId = req.getParameter("userid");
	        System.out.println("param, id:"+userId);
	        attributes.put("userId", userId);*/
	  
	        // HttpSession 에 저장된 이용자의 아이디를 추출하는 경우
	        String id = (String)req.getSession().getAttribute("loginId");
	        attributes.put("loginId", id);
	        return super.beforeHandshake(request, response, arg2, attributes);
	}

}

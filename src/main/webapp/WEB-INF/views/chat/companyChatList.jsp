<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.huby.prj.Applistner"%>
<br>
<%=Applistner.getUserList()%>
<c:set var="connId" value="<%=Applistner.getUserList()%>" />
<br>
<br>
<div align="center">
	<h1>면접리스트</h1>
	<form id="ivList2" name="ivList2" method="post">
		<table>
			<thead>
				<tr>
					<th>인터뷰시작</th>
					<th>면접자</th>
					<th>개인회원</th>
					<th>기업회원</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${companyChatList}">
					<tr onclick="goChat(window.event, '${list.interview_id}')">
						<td>${list.interview_start}</td>
						<td>${list.member_name}</td>
						<td>${list.member_id}</td>
						<td>${list.company_id}</td>
						<td><c:if test="${fn:contains(connId, list.member_id)}">
								<font color="red">현재접속중</font>
							</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</div>

<script>
	function goChat(e, interview_id) {

		var company_id = $(e.target).closest("tr").find("td").eq(3).html();
		var member_id = $(e.target).closest("tr").find("td").eq(2).html()
		//대화요청
		var message = {};
		message.message_content = '대화요청';
		message.message_receiver = member_id;
		message.message_sender = company_id;
		message.interview_id = interview_id;
		message.member_id = member_id;
		message.company_id = company_id;
		message.message_type = 'OPEN';

		sock.send(JSON.stringify(message)); //웹소켓으로 메시지를 보내겠어

		location.href = 'company_chat.do?interview_id=' + interview_id;
	}
</script>
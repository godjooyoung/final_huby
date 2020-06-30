<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
${room.company_id} ${room.interview_id }
<br>
<br>
<br>
<br>
<br>
<br>
<%=session.getAttribute("loginId")%>
${personChatList}
<c:set var="user" value='<%=session.getAttribute("loginId")%>' />

<div class="col-12 row justify-content-center align-items-center my-5 ">
	<a href=""><img src="../../../resources/image/AlmomLogo.png"
		alt="Almom Logo" width="180px" class="img-fluid" /></a>
</div>
<div class="col-12">
	<div class="col-2" style="float: left">
		<span> 목록 </span>
	</div>
	<div class="col-8" style="float: left; text-align: center;">님과 대화</div>
	<div class="col-2" style="float: right">
		<span> 닫기 </span>
	</div>
</div>
<div class="col-12" style="margin-top: 40px; clear: both;">
	<div class="col-10"
		style="margin: 20px auto; text-align: center; color: white; background-color: #01D1FE; border: 1px solid #01D1FE; padding: 10px 10px; border-radius: 8px;">
		문의해보세요.</div>

</div>
<!-- 채팅 내용 -->
<div class="col-12">
	<div class="col-11"
		style="margin: 0 auto; border: 1px solid #01D1FE; height: 400px; border-radius: 10px; overflow: scroll"
		id="chatArea">
		<div id="chatMessageArea" style="margin-top: 10px; margin-left: 10px;">
			<c:forEach var="contents" items="${message}">
				<c:choose>
					<c:when test="${contents.message_sender == (loginId)}">
						<div class='col-12 row' style='height: auto; margin-top: 5px;'>
							<div class='col-2'
								style='float: left; padding-right: 0px; padding-left: 0px;'>
								<img id='profileImg' class='img-fluid'
									src='/displayFile?fileName=${userImage}&directory=profile'
									style='width: 50px; height: 50px;'>
								<div style='font-size: 9px; clear: both;''>여기 유저이름</div>
							</div>
							<div class='col-10'
								style='overflow: y; margin-top: 7px; float: left;'>
								<div class='col-12'
									style='background-color: #134a8e; font-color: #FFFFFF; padding: 10px 5px; float: left; border-radius: 10px;'>
									<span style='font-size: 12px; font-color: #FFFFFF;'>
										${contents.message_content}</span>
								</div>
								<div col-12
									style='font-size: 9px; text-align: left; float: left; font-color: #FFFFFF;'>
									<span
										style='float: left; font-size: 9px; text-align: left; font-color: #FFFFFF;'>
										${contents.message_sandtime } </span>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class='col-10'
							style='overflow: y; margin-top: 7px; float: right;'>
							<div class='col-12'
								style='background-color: #ACF3FF; padding: 10px 5px; float: left; border-radius: 10px;'>
								<span style='font-size: 12px;'>
									${contents.message_content} </span>
							</div>
							<div col-12
								style='font-size: 9px; text-align: right; float: right;'>
								<span style='float: right; font-size: 9px; text-align: right;'>${contents.message_sandtime }
								</span>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
</div>

<!-- 채팅 입력창 -->
<div class="col-12" style="margin-top: 20px; margin-bottom: 15px;">
	<div class="col-12" style="float: left">
		<textarea class="form-control"
			style="border: 1px solid #01D1FE; height: 65px; float: left; width: 80%"
			placeholder="내용을 입력하세요" id="message">
				</textarea>
		<span
			style="float: right; width: 18%; height: 65px; text-align: center; background-color: #01D1FE; border-radius: 5px;">
			<a
			style="margin-top: 30px; text-align: center; color: white; font-weight: bold;"
			id="sendBtn"><br>전송</a>
		</span>
	</div>
</div>
===========================${loginType}, ${loginId}

<img id="profileImg" class="img-fluid"
	src="/displayFile?fileName=${member_photo}&directory=profile"
	style="display: none">
<input type="text" id="nickname" value="${member_name}"
	style="display: none">
<input type="button" id="enterBtn" value="입장" style="display: none">
<input type="button" id="exitBtn" value="나가기" style="display: none">
<script type="text/javascript">
	function send() {
		var msg = $("#message").val();
		if (msg != "") {
			message = {};
			message.message_content = $("#message").val();
			message.cmd = "message";
			message.message_receiver = '${loginId}' == '${room.company_id}' ? '${room.member_id}'
					: '${room.company_id}';
			message.message_sender = '${loginId}'
			message.interview_id = '${room.interview_id}';
			message.member_id = '${room.member_id}';
			message.company_id = '${room.company_id}';
			message.message_type = 'CHAT';
		}

		sock.send(JSON.stringify(message)); //웹소켓으로 메시지를 보내겠어
		$("#message").val("");
	}

	function getTimeStamp() {
		var d = new Date();
		var s = leadingZeros(d.getFullYear(), 4) + '-'
				+ leadingZeros(d.getMonth() + 1, 2) + '-'
				+ leadingZeros(d.getDate(), 2) + ' ' +

				leadingZeros(d.getHours(), 2) + ':'
				+ leadingZeros(d.getMinutes(), 2) + ':'
				+ leadingZeros(d.getSeconds(), 2);

		return s;
	}

	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();
		if (n.length < digits) {
			for (i = 0; i < digits - n.length; i++)
				zero += '0';
		}
		return zero + n;
	}

	function appendMessage(msg) {
		if (msg == '') {
			return false;
		} else {
			var t = getTimeStamp();
			console.log(msg)
			if (msg.message_sender == '${loginId}') {
				$("#chatMessageArea")
						.append(
								"<div class='col-12 row' style = 'height : auto; margin-top : 5px;'><div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'><img id='profileImg' class='img-fluid' src='/displayFile?fileName=${userImage}&directory=profile' style = 'width:50px; height:50px; '><div style='font-size:9px; clear:both;' '>${user_name}</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:left;'><div class = 'col-12' style = ' background-color:#134a8e; font-color:#FFFFFF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px; font-color:#FFFFFF;'>"
										+ msg.message_content // msg.message_sender +'${loginId}'
										+ "</span></div><div col-12 style = 'font-size:9px; text-align:left; float:left; font-color:#FFFFFF;'><span style ='float:left; font-size:9px; text-align:left; font-color:#FFFFFF;' >"
										+ t + "</span></div></div></div>")

			} else {
				$("#chatMessageArea")
						.append(
								"${loginId}</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"
										+ msg.message_content // msg.message_sender +'${loginId}'
										+ "</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"
										+ t + "</span></div></div></div>")

			}

			var chatAreaHeight = $("#chatArea").height();
			var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
			$("#chatArea").scrollTop(maxScroll);

		}
	}
	$(document).ready(function() {
		$('#message').keypress(function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13') {
				send();
			}
			event.stopPropagation();
		});

		$('#sendBtn').click(function() {
			send();
		});
		$('#enterBtn').click(function() {
			connect();
		});
		$('#exitBtn').click(function() {
			disconnect();
		});
	});
</script>

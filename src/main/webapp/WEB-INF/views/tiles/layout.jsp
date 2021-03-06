<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="initial-scale=1.0, width=device-width" />
<link rel="shortcut icon" href="http://oliveclinic.webtro.kr/favi.ico">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<!-- css -->
<link media="all" href="${pageContext.request.contextPath}/resources/css/common.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap-grid.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap-reboot.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
<!-- js -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/basic.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- slick  -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick/slick.min.js"></script>
<link media="all" href="${pageContext.request.contextPath}/resources/js/slick/slick.css" type="text/css" rel="stylesheet" />
<link media="all" href="${pageContext.request.contextPath}/resources/js/slick/slick-theme.css" type="text/css" rel="stylesheet" />
<!-- bxslider  -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bxslider/jquery.bxslider.min.js"></script>
<link media="all" href="${pageContext.request.contextPath}/resources/js/bxslider/jquery.bxslider.css" type="text/css" rel="stylesheet" />
<!-- gnb  -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/gnb/gnb.js"></script>
<link media="all" href="${pageContext.request.contextPath}/resources/js/gnb/gnb.css" type="text/css" rel="stylesheet" />
<!-- aos  -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/aos/aos.js"></script>
<link media="all" href="${pageContext.request.contextPath}/resources/js/aos/aos.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="http://newtondental.webtro.kr/js/jquery.reslider.js"></script>

<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Karma", sans-serif
}
.w3-container {
	min-height: 600px;
}
.w3-bar-block .w3-bar-item {
	padding: 20px
}
</style>
<title>HUBY</title>
</head>
<body id="page-top">
	<div id="wrapper" style="background-color: white;">
		<tiles:insertAttribute name="top" />
		<br> <br>
		<div id="msgAlert"></div>
		<div id="contents">
			<tiles:insertAttribute name="body" />
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
<!--JavaScript-->
<script>
	$(document)
			.ready(
					function() {
						$('.sub_menu_tit')
								.click(
										function() {
											$(
													'.sub01 .sub_menu_box.sub01, .sub02 .sub_menu_box.sub02, .sub03 .sub_menu_box.sub03, .sub04 .sub_menu_box.sub04, .sub05 .sub_menu_box.sub05, .sub06 .sub_menu_box.sub06, .sub07 .sub_menu_box.sub07, .sub08 .sub_menu_box.sub08')
													.slideToggle(200);
										});
					});
</script>
<script>
	connect();

	//연결
	function connect() {
		sock = new SockJS('http://39.116.34.40/huby/chat.do'); //'http://39.116.34.40/huby/chat.do'
		sock.onopen = function() {
			console.log('open');
		};
		sock.onmessage = function(evt) {
			var data = evt.data;
			var obj = JSON.parse(data)
			if (obj.message_type == 'CHAT') {
				appendMessage(obj);
			} else if (obj.message_type == 'OPEN') {
				console.log("aaa");
				$('#msgAlert').html(data);
				//alert('면접요청이 들어왔습니다');
			} else if (obj.message_type == 'ALARM') {
				$('#count').html(JSON.parse(data).message_content);
			}
		};
		sock.onclose = function() {
			appendMessage("연결을 끊었습니다.");
			console.log('close');
		};
	}
</script>
</html>
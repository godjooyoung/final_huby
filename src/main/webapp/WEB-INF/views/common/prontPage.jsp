<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.flex-container {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	max-width:100%;
	height: auto !important;
	
}
</style>
</head>
<body>
	<div>
		<div>
			<div>
				<a href="main.do"><img
					src="${pageContext.request.contextPath}/img/common/logo.jpg" /></a>
			</div>
			<div align="right">
				<button></button>
			</div>
		</div>
		<div class="flex-container">
			<div>
				<a href="main.do"><img
					src="${pageContext.request.contextPath }/img/common/img01.jpg" /></a>
			</div>
		</div>
	</div>
</body>
</html>
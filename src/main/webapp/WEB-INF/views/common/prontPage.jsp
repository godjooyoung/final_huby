<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.img01{
		text-align: center;
	}
</style>
</head>
<body>
	<div>
		<div>
			<div>
				<img
					src="${pageContext.request.contextPath}/img/common/logo.jpg" />
			</div>
			<div align="right">
				<button type="button" class="button1 button1-1" onclick="location.href='login.do'">로그인</button>
			</div>
		</div>
		<div class="img01">
			<div>
				<img
					src="${pageContext.request.contextPath }/img/common/img01.jpg" />
			</div>
		</div>
	</div>
</body>
</html>
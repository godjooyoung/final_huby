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

.button1 {
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  }
  .button1-1 {background-color: #4CAF50;} /* Green */
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
				<button type="button" class="button1 button1-1" onclick="location.href='login.do'">로그인</button>
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
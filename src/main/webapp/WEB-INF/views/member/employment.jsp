<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
.employment01 {
	width: auto;
	height: auto;
	padding: 6%;
}
</style>

<div align="center">
	<div class="employment01" >
		<img src="${pageContext.request.contextPath }/resources/img/employment01.JPG"><br />
		<img src="${pageContext.request.contextPath }/resources/img/employment02.JPG"><br />
		<img src="${pageContext.request.contextPath }/resources/img/employment03.JPG">
		<br />
		<div style="margin:20px">
			<button type="button" onclick="location.href='memberUpdate.do'">정보수정</button>
		</div>
	</div>

</div>
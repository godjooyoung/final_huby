<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<style>
.alarmlist {
	margin: 0;
	height: 700px;
}
</style>
<br><br><br><br><br><br>


<form>
	<div class="alarmlist">
		<c:forEach var="list" items="${personalarmlist }">
			<br>${list.company_name }<br>
				${list.alarm_message }<br>
				${list.alarm_time }<br>
			<input type="button" value="수락" onclick="location.href='currentY.do'">
			<input type="button" value="거절" onclick='alert("거절되었습니다.")'>
		</c:forEach>
	</div>
</form>

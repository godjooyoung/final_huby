<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.alarmlist {
	margin: 0;
	height: 700px;
}
</style>
<br><br><br><br><br><br>


	
<form>
	<div class="alarmlist">
		<c:forEach var="list" items="${companyalarmlist }">
			<br>${list.member_name }님이
				${list.alarm_message }를 수락하셨습니다.
				<br>
			<input type="button" value="채팅">
		</c:forEach>
	</div>
</form>
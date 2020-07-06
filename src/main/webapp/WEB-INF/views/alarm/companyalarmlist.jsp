<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br>
<br>
<br>
<br>
<br>
<br>

<style>
ul {
	width: 500px;
  margin-left: auto;
  margin-right: auto;
}
</style>
<script>
	function checkAlarmDelete() {
		if (confirm("삭제하시겠습니까?") == true) {
			//$("#frm").attr("action", "checkAlarmDelete.do");
			$("#alarm_id").closest("#alarmlist").remove();
			
			//document.frm.submit();
		//} else {
		//	return;
		}
	}
</script>

<body>
<h1 align="center">
<img width=40px src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAABUElEQVRIS9WV7U0CQRCGHypQKkAqUCtQOtAKwArECtQKxAqECrADtQKxArAC7EDzkpnNZbPLsUeOxP11HDPvM18326Hl02lZnxhwDFwB0wR4BDzZ+7uMzQMwAX7cPwYsgFPgGng1I0FvgTGgZx0JSOi5Iibxe0Aa5ymAHCT0DZyZo0ftwnFiAt1YMLKReA94BAQMJToBluYtugwl/rJjjwRRWRXYp/n0gZWXyNObmbCAMsxFnspEgspIoCGgPk0c8A5cAANAzw7cMYGNmZdFQzIHPoBLB4h8BHQtCm92CcCbq6zXptN1wK8pxb9LANWeBr2DAeJIPYKmGQS/3Kr43wCfgtLyyN6nMFsiib/ZF9kEoFHVt1S77JqIu0922cmgaXPjgMLw5Nb1Phl8VUt88BstF3lq+YWdvy3dkgwE0a2mo8tpc6HUnRJAnVby/9YBf8z7RRlnN+oyAAAAAElFTkSuQmCC"/>
   알림내역</h1>
<br><br><br>
	<div class="alarmlist" align="center">
		<br />
<form id="frm" name="frm" method="post">
		<!-- <button class="btn btn-outline-primary btn-sm" type="button"
			onclick="checkAlarmDelete()">선택한 알림 삭제</button><br><br> -->
		<br>
		
		<c:forEach var="list" items="${companyalarmlist }">
		<ul class="list-group">
				
				<li class="list-group-item">${list.member_name }님이
				${list.alarm_message }를 수락하셨습니다.
				<!-- <input type="checkbox" id="alarm_id" name="alarm_id"
				value="${list.alarm_id }"> --></li><br>
				
			</ul>
		</c:forEach>
		</form>
	</div>
	</body>
	<br><br><br>
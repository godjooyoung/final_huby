<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	String id = (String)session.getAttribute("personalVo");
%>


<body>
	<c:forEach var="alarm" items="${list }">
		${alarm.company_id }
		${alarm.alarm_mesaage }
		${alarm.alarm_time }
	</c:forEach>
</body>
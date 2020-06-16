<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<body>
	<c:forEach var="list" items="${personalarmlist }">
		${list.company_id }
		${list.alarm_mesaage }
		${list.alarm_time }
	</c:forEach>
</body>
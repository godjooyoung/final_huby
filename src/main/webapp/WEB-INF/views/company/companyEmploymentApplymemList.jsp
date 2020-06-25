<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h1>공고 지원자 목록 페이지</h1>

${applymenList}
${applymenList}.[0]
<c:forEach var="applymen" items="${applymenList}">
<h2><b>공고 </b>
${applymen.employment_title}</h2> 
<span>
${applymen.member_name}
</span>
</c:forEach>


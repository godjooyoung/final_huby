<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	li{cursor:pointer}
	
</style>

<h1 align="center">POSTED EMPLOYMENTS</h1>
<div class="container">
  <ul class="list-group list-group-flush">
  	<c:forEach var="employment" items="${employments}">
    <li class="list-group-item"  value="${employment.employment_id}" 
    	onclick="showemployment(${employment.employment_id})">
    	${employment.employment_title} <p align="right"><fmt:formatDate pattern ="yyyy년MM월dd일 까지" value="${employment.employment_time}"/></p>
    </li>
    <form id="frm${employment.employment_id}">
    	<input type="hidden" 
    	value="${employment.employment_id}" 
    	name="employment_id">
    </form>
    </c:forEach>

  </ul>
</div>

<script>
	//게시글을 누르면 셀렉트 되서 상세 내용 보기로 간다 슝슝
	function showemployment(employment_id){
		alert(employment_id);
		var emp_id =employment_id;
		var frm = document.getElementById("frm"+emp_id);
			 frm.action = "employmentsDetailsforCom.do";
			 frm.method = "post";
			 frm.submit();
			}
	

</script>
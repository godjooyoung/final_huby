<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br><br><br><br>
<h1>여기는 기업입장에서 내가 낸 공고 목로이 보입니ㅏㄷ.</h1>
<h2>공고 목록을 누르면 상세 공고 내용을 보고 수정삭제가 가능하게 할겁ㄴ다.</h2>
<style>
li{cursor:pointer}
</style>
<div class="container">
  <ul class="list-group list-group-flush">
  	<c:forEach var="employments" items="${employments}">
    <li class="list-group-item"  value="${employments.employment_id}" 
    onclick="showemployment(${employments.employment_id})">
    ${employments.employment_title}
    </li>
    <form id="frm${employments.employment_id}">
    	<input type="hidden" 
    	value="${employments.employment_id}" 
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
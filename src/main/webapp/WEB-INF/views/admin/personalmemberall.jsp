<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/adminlayout/head.jsp"></jsp:include>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<div class="container">
  <h2 align="center">개인회원 명단</h2><br> 
  <table class="table table-hover">
    <thead>
      <tr style="background: lightgray">
        <th>아이디</th>
        <th>이름</th>
        <th>생일</th>
        <th>주소</th>
        <th>전화번호</th>
        <th>이메일</th>
        <th>성별</th>
        <th>가입일</th>
      </tr>
    </thead>
    <tbody>
     	<c:forEach items="${ mlist }" var="member">
     	<fmt:formatDate value="${ member.member_date }" pattern="yyyy-MM-dd" var="member_date" />
     	<fmt:formatDate value="${ member.member_birth }" pattern="yyyy-MM-dd" var="member_birth" />
    	<tr tabindex="1">
	        <td>${ member.member_id }</td>
	        <td>${ member.member_name }</td>
	        <td>${ member_birth }</td>
	        <td>${ member.member_addr }</td>
	        <td>${ member.member_tel }</td>
	        <td>${ member.member_email }</td>
	        <c:if test="${ member.member_gender == 'M'}">
	        	<td>남자</td>
	        </c:if>
	        <c:if test="${ member.member_gender == 'Y'}">
	        	<td>여자</td>
	        </c:if>
	        <td>${ member_date }</td>
   	   </tr>
        </c:forEach>
      
    </tbody>
  </table>
</div>
<jsp:include page="/WEB-INF/views/adminlayout/footer.jsp"></jsp:include>

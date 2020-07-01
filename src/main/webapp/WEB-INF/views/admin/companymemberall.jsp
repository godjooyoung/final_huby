<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/adminlayout/head.jsp"></jsp:include>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<div class="container">
  <h2 align="center">기업회원 명단</h2><br> 
  <table class="table table-hover">
    <thead>
      <tr style="background: lightgray">
        <th>아이디</th>
        <th>사업자번호</th>
        <th>회사명</th>
        <th>전화번호</th>
        <th>이메일</th>
        <th>CEO</th>
        <th>종목</th>
        <th>카테고리</th>
        <th>가입일</th>
      </tr>
    </thead>
    <tbody>
     	<c:forEach items="${ clist }" var="company">
     	<fmt:formatDate value="${ company.company_date }" pattern="yyyy-MM-dd" var="company_date" />
    	<tr tabindex="1">
	        <td>${ company.company_id }</td>
	        <td>${ company.regist_number }</td>
	        <td>${ company.company_name }</td>
	        <td>${ company.company_tel }</td>
	        <td>${ company.company_email }</td>
	        <td>${ company.ceo_name }</td>
	       	<td>${ company.business_type }</td>
	        <td>${ company.business_category }</td>
	        <td>${ company_date }</td>
   	   </tr>
        </c:forEach>
      
    </tbody>
  </table>
</div>
<jsp:include page="/WEB-INF/views/adminlayout/footer.jsp"></jsp:include>

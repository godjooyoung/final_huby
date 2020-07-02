<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/adminlayout/head.jsp"></jsp:include>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script>
	function gopage(p) {
		location.href = window.location.pathname + "?page=" + p;
	}
</script>
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
<div align="center">
<nav id="paging" aria-label="Page navigation example">
	<ul class="pagination">
		<c:if test="${paging.startPage>1}">
			<li class="page-item"><a class="page-link"
				href="javascript:void(0);" onclick="gopage(${paging.startPage-1})">이전</a>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
			<c:if test="${i != paging.page}">
				<li class="page-item"><a class="page-link"
					href="javascript:void(0);" onclick="gopage(${i})">${i}</a>
			</c:if>
			<c:if test="${i == paging.page}">
				<li class="page-item active"><a class="page-link"
					href="javascript:void(0);" onclick="gopage(${i})">${i}</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.totalPageCount}">
			<li class="page-item"><a class="page-link"
				href="javascript:void(0);" onclick="gopage(${paging.endPage+1})">다음</a>
		</c:if>
	</ul>
</nav>
</div>
<jsp:include page="/WEB-INF/views/adminlayout/footer.jsp"></jsp:include>

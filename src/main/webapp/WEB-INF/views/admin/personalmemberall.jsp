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

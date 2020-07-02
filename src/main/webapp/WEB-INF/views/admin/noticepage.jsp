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
	
	function noticeSelectOne(nid){
		$("#nid").val(nid);
		$("#frm").attr("action","noticeSelectOnePage.do")
		document.frm.submit();
	}
</script>
<form id="frm" name="frm" method="post">
<div class="container">
  <h2 align="center">공지사항</h2>
  <div align="center">
  <button type="button" class="btn-primary" onclick="location.href='noticeInsertPage.do'"> 글 작성하기 </button>
  </div><br>
  <table class="table table-hover">
    <thead>
      <tr style="background: lightgray">
        <th>제목</th>
        <th>작성자</th>
        <th>등록일자</th>
      </tr>
    </thead>
    <tbody>
     	<c:forEach items="${ nlist }" var="notice">
     	<fmt:formatDate value="${ notice.notice_date }" pattern="yyyy-MM-dd" var="notice_date" />
    	<tr tabindex="1" onclick="noticeSelectOne(${notice.notice_id})">
	        <td>${ notice.admin_id }</td>
	        <td>${ notice.notice_title }</td>
	        <td>${ notice_date }</td>
   	   </tr>
        </c:forEach>
    </tbody>
  </table>
<input type="hidden" id="nid" name="notice_id">
</div>
</form>
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

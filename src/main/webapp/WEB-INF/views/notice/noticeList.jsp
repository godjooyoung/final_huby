<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#portfolio {
	margin-top: 3rem
}

#paging {
	position: relative;
}

#paging .pagination {
	position: absolute;
	transform: translateX(-50%);
	left: 50%;
}
</style>
<script>
	function noticedetail(nid){
		$("#notice_id").val(nid);
		$("#frm").attr("action","noticedetail.do");
		document.frm.submit();		
	}
</script>
<div id="sub_vis_wrap" class="sub01 page01">
	<div class="hd_box"></div>
	<div class="visual-area ">
		<div class="visual-area-in">
			<div class="visual-area-txt inner sub01 ">
				<div class="tit" data-aos="fade-up" data-aos-delay="300">공지사항</div>
				<p class="fs18" data-aos="fade-up" data-aos-delay="400">
					공지사항임데이
				</p>
			</div>
		</div>
	</div>
</div>
<div align="center">
	<div class="container">
		<form id="frm" name="frm" method="post">
			<table class="table table-hover">
				<thead>
					<tr>
						<th width="50">글번호</th>
						<th width="200">제목</th>
						<th width="100">작성자</th>
						<th width="100">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty noticeList}">
							<tr>
								<td colspan="4" align="center">데이터가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="notice" items="${noticeList}">
								<tr onclick="noticedetail('${notice.NOTICE_ID}')"
									style="cursor: pointer">
									<td>${notice.RN}</td>
									<td>${notice.NOTICE_TITLE}</td>
									<td>${notice.ADMIN_ID}</td>
									<td>${notice.NOTICE_DATE}</td>

								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<input type="hidden" id="notice_id" name="notice_id">
		</form>
	</div>
</div>
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
<script>
	function gopage(p) {
		location.href = window.location.pathname + "?page=" + p;
	}
</script>
<br>
<br>
<br>
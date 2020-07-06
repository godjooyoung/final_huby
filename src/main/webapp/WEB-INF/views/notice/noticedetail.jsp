<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<br><br><br><br><br><br><br><br>
<div id="base" class="container col-md-8">
   <div class="card">
      <div class="card-body">
         <h4 class="card-title mb-3">${nvo.notice_title }</h4>
         <h6 class="card-subtitle text-muted mb-4">
            <i class="far fa-user"></i> ${nvo.admin_id } · <i
            <fmt:formatDate value="${nvo.notice_date }"
							pattern="yyyy-MM-dd HH:mm:ss" var="notice_date" />
               class="far fa-clock"></i> ${notice_date }
         </h6>
         <div style="white-space: pre;">
            <p class="card-text">${nvo.notice_title }
               <%-- <br> <img src="/nadeulee/Image/>${nvo.notice_title }" id="n_photo"> --%>
            </p>
         </div>
      </div>
      <%-- <c:choose>
         <c:when test="${not empty email}">
            <c:if test="${auth == 'A' }">
               <div class="card-body">
                  <a href="noticeupdate.do?n_no=${detail.n_no}"
                     class="btn btn-outline-secondary btn-sm" role="button">수정</a> <a
                     href="#" class="btn btn-outline-secondary btn-sm " role="button"
                     onclick="removeCheck();">삭제</a>
               </div>
            </c:if>
         </c:when>
      </c:choose> --%>
      <div class="card-body">
         <button type="button" class="btn btn-info"
            onclick="location.href='noticeListMember.do'">목록으로</button>
      </div>
   </div>
</div>
<br><br><br><br>
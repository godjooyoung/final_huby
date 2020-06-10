<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- !PAGE CONTENT! -->
<!-- !기업회원에게 매칭해서 자기소개영상띄워주는 페이지! -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px"></div>



  <!-- First Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">
    <div class="w3-quarter">
      <img src="/w3images/sandwich.jpg" alt="Sandwich" style="width:100%">
      <h3>비디오해시태그뿌려주는 자리</h3>
      <p>비디오컨텐츠자리</p>
    </div>
    <div class="w3-quarter">
      <img src="/w3images/steak.jpg" alt="Steak" style="width:100%">
      <h3>비디오해시태그뿌려주는 자리</h3>
      <p>비디오컨텐츠자리</p>
    </div>
    <div class="w3-quarter">
      <img src="/w3images/cherries.jpg" alt="Cherries" style="width:100%">
      <h3>비디오해시태그뿌려주는 자리</h3>
      <p>비디오컨텐츠자리</p>
    </div>
    <div class="w3-quarter">
      <img src="/w3images/wine.jpg" alt="Pasta and Wine" style="width:100%">
       <h3>비디오해시태그뿌려주는 자리</h3>
      <p>비디오컨텐츠자리</p>
    </div>
  </div>
  
  <!-- Second Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center">
    <div class="w3-quarter">
      <img src="/w3images/popsicle.jpg" alt="Popsicle" style="width:100%">
       <h3>비디오해시태그뿌려주는 자리</h3>
      <p>비디오컨텐츠자리</p>
    </div>
    <div class="w3-quarter">
      <img src="/w3images/salmon.jpg" alt="Salmon" style="width:100%">
       <h3>비디오해시태그뿌려주는 자리</h3>
      <p>비디오컨텐츠자리</p>
    </div>
    <div class="w3-quarter">
      <img src="/w3images/sandwich.jpg" alt="Sandwich" style="width:100%">
      <h3>비디오해시태그뿌려주는 자리</h3>
      <p>비디오컨텐츠자리</p>
    </div>
    <div class="w3-quarter">
      <img src="/w3images/croissant.jpg" alt="Croissant" style="width:100%">
     <h3>비디오해시태그뿌려주는 자리</h3>
      <p>비디오컨텐츠자리</p>
    </div>
  </div>

  <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">뒤로</a>
      <a href="#" class="w3-bar-item w3-black w3-button">1</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
      <a href="#" class="w3-bar-item w3-button w3-hover-black">앞으로</a>
    </div>
  </div>
  <!-- test button -->
  	<button type="button" onclick="location.href='matchingForCompany.do' ">매칭하기</button>
  	<c:forEach var="matched" items="${matched }">
	${matched.video_contents }<br>
</c:forEach>
  <!-- test end -->
  
  <hr id="about">

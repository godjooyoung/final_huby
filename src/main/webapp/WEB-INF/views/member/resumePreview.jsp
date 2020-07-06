<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, user-scalable=no">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>
<div style="margin: 30px 30px 30px 30px;">
<form class="form-horizontal" id="frm" name="frm" method="post">
    <fieldset>

        <!-- Form Name -->
        <legend>이력서 등록</legend>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="name">제목</label>  
          <div class="col-md-4">
          <input id="resume_title" name="resume_title" type="text" class="form-control input-md" required="required">
          <span class="help-block"></span>  
          </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="phone">희망직무</label>  
          <div class="col-md-4">
          <select class="form-control input-md" id="hope_job" name="hope_job" required="required" onchange="typecheck(this.value)">
		  		<option value="">종목 선택</option>
		  		<c:forEach items="${ clist }" var="type">
		  		<option value=${ type.code_id }>${ type.code_name }</option>
		  		</c:forEach>
		  	</select>  
          <span class="help-block"></span>  
          </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="email">희망급여</label>  
          <div class="col-md-4">
          <select class="form-control input-md" id="hope_salary" name="hope_salary" required="required">
   			<option value="" disabled selected>선택</option>
			<option value="회사내규">회사 내규에 따름</option>
			<option value="1,400만원">1,400만원 이하</option>
			<option value="1,400~1,600만원">1,400~1,600만 원</option>
			<option value="1,600~1,800만원">1,600~1,800만원</option>
			<option value="1,800~2,000만원">1,800~2,000만원</option>
			<option value="2,000~2,200만원">2,000~2,200만원</option>
			<option value="2,200~2,400만원">2,200~2,400만원</option>
			<option value="2,400~2,600만원">2,400~2,600만원</option>
			<option value="2,600~2,800만원">2,600~2,800만원</option>
			<option value="2,800~3,000만원">2,800~3,000만원</option>
			<option value="3,000~3,200만원">3,000~3,200만원</option>
			<option value="3,200~3,400만원">3,200~3,400만원</option>
			<option value="3,400~3,600만원">3,400~3,600만원</option>
			<option value="3,600~3,800만원">3,600~3,800만원</option>
			<option value="3,800~4,000만원">3,800~4,000만원</option>
			<option value="4,000~5,000만원">4,000~5,000만원</option>
			<option value="5,000~6,000만원">5,000~6,000만원</option>
			<option value="6,000~7,000만원">6,000~7,000만원</option>
			<option value="7,000~8,000만원">7,000~8,000만원</option>
			<option value="8,000~9,000만원">8,000~9,000만원</option>
			<option value="9,000~1억원">9,000~1억원</option>
		</select>
          <span class="help-block"></span>  
          </div>
        </div>

        <!-- Password input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="password">희망지역</label>
          <div class="col-md-4">
            <select class="form-control input-md" id="hope_location" name="hope_location" required="required">
		  		<option value="">지역 선택</option>
		  		<option value="서울">서울</option>
		  		<option value="인천">인천</option>
		  		<option value="경기">경기</option>
		  		<option value="부산">부산</option>
		  		<option value="대구">대구</option>
		  		<option value="광주">광주</option>
		  		<option value="대전">대전</option>
		  		<option value="울산">울산</option>
		  		<option value="세종">세종</option>
		  		<option value="강원">강원</option>
		  		<option value="경남">경남</option>
		  		<option value="경북">경북</option>
		  		<option value="전남">전남</option>
		  		<option value="전북">전북</option>
		  		<option value="충남">충남</option>
		  		<option value="충북">충북</option>
		  		<option value="제주">제주</option>
		  		<option value="강원.">강원</option>
		  		<option value="전국">전국</option>
		  	</select>
            <span class="help-block"></span>  
          </div>
        </div>

        <!-- Password input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="rpassword">최종학력</label>
          <div class="col-md-4">
            <input id="final_education" name="final_education" type="text" class="form-control input-md" required="required">
            <span class="help-block"></span>  
          </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="address1">각오 한마디</label>  
          <div class="col-md-4">
          <input id="resume_coment" name="resume_coment" type="text" class="form-control input-md" required="required">
    		<span class="help-block"></span>  
          </div>
        </div>

        

        <!-- Button (Double) -->
        <div class="form-group">
          <label class="col-md-4 control-label" for="save"></label>
          <div class="col-md-8">
            <input type="button" id="save" name="save" class="btn btn-success" onclick="resumeInsertGo()" value="등록하기">
            <input type="reset" name="cancel" class="btn btn-danger" value="취소">
            <input type="button" name="cancel" class="btn btn-primary" onclick="winclose()" value="창닫기">
          </div>
        </div>
        </fieldset>
        <script>
        	function winclose(){
        		window.close();
        	}
        	
        	function resumeInsertGo(){
        	var resume_title = $("#resume_title").val();
        	var hope_job = $("#hope_job").val();
        	var hope_salary = $("#hope_salary").val();
        	var hope_location = $("#hope_location").val();
        	var final_education = $("#final_education").val();
        	var resume_coment = $("#resume_coment").val();
        	
        	/* $("#frm").attr("action","resumeinsert.do");
        	document.frm.submit(); */
        	
        	$.ajax({
    		    url: "resumeInsertAjax.do",
    		    type: "post",
    		    dataType: "json",
    		    async: false,
    		    data: {
    		    	'resume_title':resume_title,
    		    	'hope_job':hope_job,
    		    	'hope_salary':hope_salary,
    		    	'hope_location':hope_location,
    		    	'final_education':final_education,
    		    	'resume_coment':resume_coment
    		    },
    		    success: function(data){
    		    	if(data==1){
    		    		opener.parent.location.reload();
    		    	}else{
    		    		alert("이력서 등록 에러. 관리자 문의.")
    		    	}
    		    },
    		    error: function (request, status, error){
    		    }
    		  });

        	
    		window.close();
        	}
        </script>
        </form>
</div>
</body>
</html>
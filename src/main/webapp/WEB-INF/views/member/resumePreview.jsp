<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
          <input id="hope_salary" name="hope_salary" type="text" class="form-control input-md" required="required">
          <span class="help-block"></span>  
          </div>
        </div>

        <!-- Password input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="password">희망지역</label>
          <div class="col-md-4">
            <input id="hope_location" name="hope_location" type="text" class="form-control input-md" required="required">
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
        	/* opener.document.getElementById("v_hashtag").innerHTML = document.getElementById.find("#resume_title").html();
        	opener.document.getElementById("v_hashtag").innerHTML = document.getElementById.find("#hope_job").html();
        	opener.document.getElementById("v_hashtag").innerHTML = document.getElementById.find("#hope_salary").html();
        	opener.document.getElementById("v_hashtag").innerHTML = document.getElementById.find("#hope_location").html();
        	opener.document.getElementById("v_hashtag").innerHTML = document.getElementById.find("#final_education").html();
        	opener.document.getElementById("v_hashtag").innerHTML = document.getElementById.find("#resume_coment").html(); */
        	$("#frm").attr("action","resumeinsert.do");
        	document.frm.submit();
        	
    		window.close();
        	}
        </script>
        </form>
</div>
</body>
</html>
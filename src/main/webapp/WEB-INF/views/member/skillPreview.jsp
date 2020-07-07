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
<form class="form-horizontal" id="frm" name="frm" method="post" onsubmit="skillInsertGo()" >
		<h1 align="center" style="font-weight: bolder;">스킬 등록</h1>
        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="email">스킬이름</label>  
          <div class="col-md-4">
          <input id="skill_name" name="skill_name" type="text" class="form-control input-md" required="required" maxlength="50">
          <span class="help-block"></span>  
          </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="email">스킬레벨</label>  
          <div class="col-md-4">
          <select class="form-control input-md" id="skill_level" name="skill_level" required="required" onchange="typecheck(this.value)">
	  		<option value="10">10</option>
	  		<option value="20">20</option>
	  		<option value="30">30</option>
	  		<option value="40">40</option>
	  		<option value="50">50</option>
	  		<option value="60">60</option>
	  		<option value="70">70</option>
	  		<option value="80">80</option>
	  		<option value="90">90</option>
	  		<option value="100">100</option>
	  	</select>
          </div>
        </div>

        <!-- Button (Double) -->
        <div class="form-group">
          <label class="col-md-4 control-label" for="save"></label>
          <div class="col-md-8">
            <input type="submit" id="save" name="save" class="btn btn-success" value="등록하기">
            <input type="reset" name="cancel" class="btn btn-danger" value="취소">
            <input type="button" name="cancel" class="btn btn-primary" onclick="winclose()" value="창닫기">
          </div>
        </div>
        <script>
        	function winclose(){
        		window.close();
        	}
        </script>
        <script>
        	function skillInsertGo(){
        		var skill_name = $("#skill_name").val();
        		var skill_level = $("#skill_level").val();
        		
        		$.ajax({
        		    url: "skillInsertAjax.do",
        		    type: "post",
        		    dataType: "json",
        		    async: false,
        		    data: {
        		    	'skill_name':skill_name,
        		    	'skill_level':skill_level
        		    },
        		    success: function(data){
        		    	if(data==1){
        		    		opener.parent.location.reload();
        		    	}else{
        		    		alert("스킬 등록 에러. 관리자 문의.")
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
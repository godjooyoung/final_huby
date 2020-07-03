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
    <fieldset>

        <!-- Form Name -->
        <legend>습관 등록</legend>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="email">습관명</label>  
          <div class="col-md-4">
          <input id=habit_name name="habit_name" type="text" class="form-control input-md" required="required">
          <span class="help-block"></span>  
          </div>
        </div>

        <!-- Button (Double) -->
        <div class="form-group">
          <label class="col-md-4 control-label" for="save"></label>
          <div class="col-md-8">
            <input type="button" id="save" name="save" class="btn btn-success" onclick="habitInsertGo()" value="등록하기">
            <input type="reset" name="cancel" class="btn btn-danger" value="취소">
            <input type="button" name="cancel" class="btn btn-primary" onclick="winclose()" value="창닫기">
          </div>
        </div>
        </fieldset>
        <script>
        	function winclose(){
        		window.close();
        	}
        </script>
        <script>
        	function habitInsertGo(){
        		var habit_name = $("#habit_name").val();
        		
        		$.ajax({
        		    url: "habitInsertAjax.do",
        		    type: "post",
        		    dataType: "json",
        		    async: false,
        		    data: {
        		    	'habit_name':habit_name
        		    },
        		    success: function(data){
        		    	if(data==1){
        		    		opener.parent.location.reload();
        		    	}else{
        		    		alert("습관 등록 에러. 관리자 문의.")
        		    	}
        		    },
        		    error: function (request, status, error){
        		    }
        		  });
        		
        		window.close();
        	}
        </script>
        
</div>
</body>
</html>
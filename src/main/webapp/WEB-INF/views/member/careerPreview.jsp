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
<form class="form-horizontal" id="frm" name="frm" method="post" onsubmit="careerInsertGo()" >
    <fieldset>

        <!-- Form Name -->
        <legend>커리어 등록</legend>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="name">회사명</label>  
          <div class="col-md-4">
          <input id="company_name" name="company_name" type="text" class="form-control input-md" required="required">
          <span class="help-block"></span>  
          </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="phone">시작기간</label>  
          <div class="col-md-4">
          <input id="start_date" name="start_date" type="date" class="form-control input-md" required="required">
          <span class="help-block"></span>  
          </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="email">종료기간</label>  
          <div class="col-md-4">
          <input id="end_date" name="end_date" type="date" class="form-control input-md" required="required">
          <span class="help-block"></span>  
          </div>
        </div>

        <!-- Password input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="password">업무직종</label>
          <div class="col-md-4">
            <select class="form-control input-md" id="job" name="job" required="required" onchange="typecheck(this.value)">
		  		<option value="">종목 선택</option>
		  		<c:forEach items="${ clist }" var="type">
		  		<option value=${ type.code_id }>${ type.code_name }</option>
		  		</c:forEach>
		  	</select>  
          </div>
        </div>

        <!-- Password input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="rpassword">업무직책</label>
          <div class="col-md-4">
            <select class="form-control input-md" input id="job_position" name="job_position" required="required">
  				<option value="" disabled selected>선택</option>
  				<option value="사원">사원급</option>
  				<option value="대리">대리급</option>
  				<option value="과장">과장급</option>
  				<option value="차장">차장급</option>
  				<option value="팀장">팀장급</option>
			</select>
            <span class="help-block"></span>  
          </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="address1">업무내용</label>  
          <div class="col-md-4">
          <input id="career_content" name="career_content" type="text" class="form-control input-md" required="required">
    		<span class="help-block"></span>  
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
        </fieldset>
        <script>
        	function winclose(){
        		window.close();
        	}
        	
        	function careerInsertGo(){
        	/* $("#frm").attr("action","careerInsert.do");
            document.frm.submit(); */
         	var company_name = $("#company_name").val();
        	var start_date = $("#start_date").val();
         	var end_date = $("#end_date").val();
         	var job = $("#job").val()
         	var job_position = $("#job_position").val();
         	var career_content = $("#career_content").val();
         	
        	$.ajax({
    		    url: "careerInsertAjax.do",
    		    type: "post",
    		    dataType: "json",
    		    async: false,
    		    data: {
    		    	'company_name':company_name,
    		    	'start_date':start_date,
    		    	'end_date':end_date,
    		    	'job':job,
    		    	'job_position':job_position,
    		    	'career_content':career_content
    		    },
    		    success: function(data){
    		    	if(data==1){
    		    		opener.parent.location.reload();
    		    	}else{
    		    		alert("커리어 등록 에러. 관리자 문의.")
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
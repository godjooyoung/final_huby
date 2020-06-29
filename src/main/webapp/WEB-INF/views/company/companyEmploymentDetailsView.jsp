<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <br><br><br><br>
    <h1>공고 상세 페이지</h1>
    <table>
    <tr>
    	<th>
    		공고 상세 내용
    	</th>
    </tr>
    <tr>
    	<td>
    		*${employmentsDetails.employment_title}
    	</td>
    </tr>
    <tr>
    	<td>
    		*${employmentsDetails.employment_time}
    	</td>
    	<td>
    		*${employmentsDetails.hope_salary}
    	</td>
    </tr>
    <tr>
    	<td>
    		*${employmentsDetails.employment_contents}
    	</td>
    </tr>
    <tr>
    	<td>
    		*${employmentsDetails.hope_career}
    	</td>
    	<td>
    		*${employmentsDetails.hope_graduate}
    	</td>
    </tr>
    <tr>
    	<td>
    		*${employmentsDetails.hope_job_position}
    	</td>
    	<td>
    		*${employmentsDetails.hope_job}
    	</td>
    </tr>
    <tr>
    	<td>
    		*${employmentsDetails.hope_location}
    	</td>
    	<td>
    		*${employmentsDetails.hope_work_type}
    	</td>
    </tr>
    <tr>
    	<td>
    		*${employmentsDetails.employment_prefer}
    	</td>
    </tr>
    </table>
    <br>
	
	<form id="formodify" name="formodify" action="">
	<input type="hidden" name ="emp_id" id="emp_id" value="${employmentsDetails.employment_id}">
	<input type="hidden" name ="title" id="title" value="${employmentsDetails.employment_title}">
	<input type="hidden" name ="contents" id="contents" value="${employmentsDetails.employment_contents}">
	<input type="hidden" name ="prefer" id="prefer" value="${employmentsDetails.employment_prefer}">
	<input type="button"  class="btn btn-primary" value="수정"  id="btnUpdate" onclick="subm('modi')"> 
	<input type="button"  class="btn btn-primary" value="삭제"  id="btnDelete" onclick="subm('dele')">
	</form>
	
<script>
function subm(type){
	var employment_id =document.getElementById("emp_id").value ;
	if (type == "modi"){
	alert(employment_id +"번 공고를 수정합니다.");
	document.getElementById("formodify").action="empMpdifyPageGo.do";
	document.getElementById("formodify").method = "post";
	document.getElementById("formodify").submit();
	}else{
            if (confirm("정말 삭제하시겠습니까? 해당공고에 지원자가 있을 수 있습니다.") == true) {
                 // Yes click
                document.getElementById("formodify").action="delete_employment.do";
         		document.getElementById("formodify").method = "post";
         		document.getElementById("formodify").submit();
            } else {
            	alert("공고 삭제를 취소하셨습니다.");
			}
        }
	}	
</script>
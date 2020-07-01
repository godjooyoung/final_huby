<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    	<td>*
    	<fmt:formatDate pattern ="yyyy년MM월dd일 까지" value="${employmentsDetails.employment_time}"/>
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
	<input type="hidden" name="salary" id="salary" value="${employmentsDetails.hope_salary}"> 
	<input type="hidden" name="job" id="job" value="${employmentsDetails.hope_job}"> 
	<input type="hidden" name="graduate" id="graduate" value="${employmentsDetails.hope_graduate}"> 
	<input type="hidden" name="position" id="position" value="${employmentsDetails.hope_job_position}"> 
	<input type="hidden" name="career" id="career" value="${employmentsDetails.hope_career}"> 
	<input type="hidden" name="worktype" id="worktype" value="${employmentsDetails.hope_work_type}"> 

	<input type="button"  class="btn btn-primary" value="수정"  id="btnUpdate" onclick="subm('modi')"> 
	<input type="button"  class="btn btn-primary" value="삭제"  id="btnDelete" onclick="subm('dele')">
	<input type="button"  class="btn btn-success" value="마감"  id="btnComplete" onclick="subm('complete')">
	</form>
	
<script>
function subm(type){
	var employment_id =document.getElementById("emp_id").value ;
	if (type == "modi"){
	alert(employment_id +"번 공고를 수정합니다.");
	document.getElementById("formodify").action="empMpdifyPageGo.do";
	document.getElementById("formodify").method = "post";
	document.getElementById("formodify").submit();
	}else if(type =="dele") {
            if (confirm("정말 삭제하시겠습니까? 해당공고에 지원자가 있을 수 있습니다.") == true) {
                 // Yes click
                document.getElementById("formodify").action="delete_employment.do";
         		document.getElementById("formodify").method = "post";
         		document.getElementById("formodify").submit();
            } else {
            	alert("공고 삭제를 취소하셨습니다.");
			}
        }else {
        	if (document.getElementById("btnComplete").value == "마감") {
        	if (confirm("공고를 마감하시겠습니까?") == true) {
        		 var emp_id =document.getElementById("emp_id").value;
                // Yes click
                	$.ajax({
					type:"post",
					url:"complete.do",
					data : {'emp_id': emp_id },  
					//contentType: 'application/json', 
					success: function(){
			 		alert("공고마감했습니다.");
			 		document.getElementById("btnComplete").value="마감 취소"
					},
					error: function(){
			  		alert("에러 발생. 관리자에게 문의주세요.");
			}
		})//end ajax
           } else {
           	alert("공고 마감 취소.");
			}
        }else{
        	if (confirm("공고를 재개하십니까?") == true) {
                // Yes click
                	$.ajax({
					type:"post",
					url:"re_post.do",
					data : {'emp_id': emp_id },  
					//contentType: 'application/json', 
					success: function(){
			 		alert("공고재개했습니다.");
			 		document.getElementById("btnComplete").value="마감"
					},
					error: function(){
			  		alert("에러 발생. 관리자에게 문의주세요.");
			}
		})//end ajax
                 
           } else {
           	alert("공고 재개취소.");
			}
        }
        }
	}	
</script>
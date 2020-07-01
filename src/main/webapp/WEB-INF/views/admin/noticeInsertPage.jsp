<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<jsp:include page="/WEB-INF/views/adminlayout/head.jsp"></jsp:include>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function back(){
		history.back();
	}
	
	function noticeInsert(){
		$("#frm").attr("action","noticeInsert.do");
		document.frm.submit();
	}
</script>

<div align="center">
<div class="container">
<div class="col-md-12">
    <div class="form-area">  
        <form id="frm" name="frm" method="post">
        <br style="clear:both">
                    <h3 style="margin-bottom: 25px; text-align: center;">공지글 작성</h3>
    				<div class="form-group">
						<input type="text" class="form-control" id="notice_title"  name="notice_title" required="required">
					</div>
                    <div class="form-group">
                    <textarea class="form-control" type="textarea" id="notice_contents" name="notice_contents" maxlength="1000" rows="10" required="required"></textarea>
                        <span class="help-block"><p id="characterLeft" class="help-block ">HUBY</p></span>                    
                    </div>
        </form>
    </div>
    <div align="center">
	        <button type="reset" class="btn btn-primary pull-right">취소</button>
	        <button type="button" class="btn btn-primary pull-right" onclick="back()">이전페이지</button>
	        <button type="button" class="btn btn-primary pull-right" onclick="noticeInsert()">등록하기</button>
    </div>
</div>
</div>
</div>






<jsp:include page="/WEB-INF/views/adminlayout/footer.jsp"></jsp:include>
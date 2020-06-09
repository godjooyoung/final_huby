<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="main">
	<div class="container">
		<div class="signup-content">
			<form method="POST" id="frm" name="frm" class="signup-form"
				action="memberInsert.do">
				<h2 class="form-title">회 원 가 입</h2>
				<div class="form-group">
					<input type="text" class="form-input" name="name" id="name"
						placeholder="Your Name" required />
					<div id="nameResult"></div>
				</div>
				<div class="form-group">
					<input type="text" class="form-input" name="id" id="id"
						placeholder="Your Id" required />
					<div id="idResult"></div>
				</div>
				<div class="form-group">
					<input type="password" class="form-input" name="pw" id="pw"
						placeholder="Password" required />
					<div id="pwResult"></div>
				</div>
				<div class="form-group">
					<input type="password" class="form-input" name="pwc" id="pwc"
						placeholder="Repeat your password" />
					<div id="pwcResult"></div>
				</div>
				<div class="form-group">
					<input type="text" name="addr" id="addr" class="form-input"
						placeholder="your address" required />
					<div id="addrResult"></div>
				</div>
				<div class="form-group">
					<input type="text" name="tell" id="tell" class="form-input"
						maxlength="11" autocomplete="off" placeholder="your PhonNumber"
						required />
					<div id="tellResult"></div>
				</div>
				<div class="form-group">
					<input type="submit" name="join" id="join" class="form-submit"
						value="가입하기" />
				</div>
				<div>
					<input type="reset" name="join" id="join" class="form-submit"
						value="취소" />
				</div>
				<div>
					<br /> <input type=button name="join" id="join" class="form-submit"
						onclick="location.href='${pageContext.request.contextPath}/home.do'"
						value="홈으로" />
				</div>
			</form>
			<p class="loginhere">
				Have already an account ? <a href="login.do" class="loginhere-link">Login
					here</a>
			</p>
		</div>
	</div>
</div>

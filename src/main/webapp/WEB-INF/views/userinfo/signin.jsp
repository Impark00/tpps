<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" flush="false"/>

<div class="container">
<div class="row">
<div class="col-md-12">
<form method="post">
	<div class="form-group">
		<input type="text" name="userId" placeholder="아이디" class="form-control my-5">
	</div>
	<div class="form-group">
		<input type="text" name="userPassword" placeholder="비밀번호" class="form-control my-5">
	</div>
	<div class="form-group d-flex">
		<a href="/signup" class="form-control">회원가입</a>
		<a href="#" class="form-control">아이디 찾기</a>
		<a href="#" class="form-control">비밀번호 찾기</a>
	</div>
	<div class="d-flex justify-content-end">
		<input type="submit" value="로그인" class="btn btn-outline-primary my-5">
	</div>
</form>
</div>
</div>
</div>

<jsp:include page="../include/footer.jsp" flush="false"/>

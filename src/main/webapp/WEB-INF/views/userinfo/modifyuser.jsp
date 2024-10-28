<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<jsp:include page="../include/header.jsp" flush="false"/>
<div class="container">
<div class="row">
<div class="col-md-12">
<form method="post" class="d-flex justify-content-center">
<div class="card">
	<div class="input-group mt-3">
		<label>아이디</label>
		<input type="text" value="${user.userId}" class="form-control">
	</div>
	<div class="input-group mt-3">
		<label>비밀번호</label>
		<input type="password" placeholder="비밀번호" class="form-control">
	</div>
	<div class="input-group mt-3">
		<label>유저 이름</label>
		<input type="text" value="${user.userName}" class="form-control">
	</div>
	<div class="input-group mt-3">
		<label>유저 전화번호</label>
		<input type="text" value="${user.userPhone}" class="form-control">
	</div>
	<div class="input-group mt-3">
		<label>유저 이메일</label>
		<input type="email" value="${user.userEmail}" class="form-control">
	</div>
	<div class="input-group mt-3 d-flex justify-content-end">
		<input type="submit" value="수정" class="btn btn-primary">
	</div>
</div>
</form>
</div>
</div>
</div>
<jsp:include page="../include/footer.jsp" flush="false"/>
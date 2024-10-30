<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<jsp:include page="../include/header.jsp" flush="false"/>

<div class="container">
<div class="row justify-content-center">
<div class="col-md-6 col-lg-4">
<form method="post" class="card mt-5">
<div class="form-group d-flex justify-content-center">
	<input type="text" name="userId" id="userId" placeholder="아이디" class="form-control my-3 w-75">
</div>
<div id="checkResult" class="text-danger d-flex justify-content-end"></div>
<button type="button" id="idcheck" class="btn btn-secondary">아이디 확인</button>
<div class="form-group d-flex">
	<input type="password" name="userPassword" placeholder="비밀번호" class="form-control my-3">
	<input type="password" name="userPasswordRe" placeholder="비밀번호확인" class="form-control my-3">
</div>
<div class="form-group">
	<input type="text" name="userName" placeholder="이름" class="form-control">
</div>
<div class="form-group">
	<input type="text" name="userPhone" placeholder="전화번호" class="form-control mt-3">
</div>
<div class="form-goup">
	<input type="email" name="userEmail" placeholder="이메일" class="form-control mt-3">
</div>
<div class="d-flex justify-content-end">
	<input type="submit" value="회원가입" class="btn btn-outline-primary">
</div>
</form>
</div>
</div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/idCheck.js"></script>

<jsp:include page="../include/footer.jsp" flush="false"/>

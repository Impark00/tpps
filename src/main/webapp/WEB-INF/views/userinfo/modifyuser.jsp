<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<jsp:include page="../include/header.jsp" flush="false"/>
<div class="container">
<div class="row justify-content-center">
<div class="col-md-6 col-lg-4">
<form method="post" class="card mt-5 p-4 px-3">
	<div class="mb-3">
		<label class="form-label ">아이디</label>
		<div class="form-control bg-light">${user.userId}</div>
	</div>
	<div class="mb-3">
		<label class="form-label">유저 이름</label>
		<input type="text" name="userName" value="${user.userName}" class="form-control">
	</div>
	<div class="mb-3">
		<label class="form-label">유저 전화번호</label>
		<input type="text" name="userPhone" value="${user.userPhone}" class="form-control">
	</div>
	<div class="mb-3">
		<label class="form-label">유저 이메일</label>
		<input type="email" name="userEmail" value="${user.userEmail}" class="form-control">
	</div>
	<div class="input-group d-flex justify-content-end">
		<a href="/mypage" class="btn btn-primary m-3 rounded">돌아가기</a>
		<input type="submit" value="수정" class="btn btn-primary m-3 rounded ">
	</div>
</form>
</div>
</div>
</div>
<jsp:include page="../include/footer.jsp" flush="false"/>
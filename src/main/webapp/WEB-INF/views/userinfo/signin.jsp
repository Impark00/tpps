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
		<input type="password" name="userPassword" placeholder="비밀번호" class="form-control my-5">
	</div>
	<div class="d-flex justify-content-end">
		<input type="submit" value="로그인" class="btn btn-outline-primary">
	</div>
	<c:if test="${msg==false}">
		<p class="text-danger d-flex justify-content-end">로그인 실패</p>
	</c:if>
</form>
</div>
</div>
</div>

<jsp:include page="../include/footer.jsp" flush="false"/>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" flush="false"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    .custom-link {
        color: #333333; /* 링크 색상 */
        text-decoration: none; /* 기본 밑줄 제거 */
        transition: color 0.3s; /* 색상 변화 애니메이션 */
    }
</style>
<div class="container">
<div class="row justify-content-center h-100">
<div class="col-md-6 col-lg-4">
<form method="post" class="card mt-5 p-4 px-3">
	<div class="form-group d-flex justify-content-center">
		<input type="text" name="userId" placeholder="아이디" class="form-control mb-3">
	</div>
	<div class="form-group d-flex justify-content-center">
		<input type="password" name="userPassword" placeholder="비밀번호" class="form-control mb-5">
	</div>
	<div class="form-group d-flex justify-content-evenly">
		<a href="/signup" class="custom-link">회원가입</a>
		<a href="#" class="custom-link">아이디 찾기</a>
		<a href="#" class="custom-link">비밀번호 찾기</a>
	</div>
	<div class="d-flex justify-content-end">
		<input type="submit" value="로그인" class="btn btn-outline-primary mt-5 mb-3 me-3">
	</div>
	<c:if test="${msg==0}">
		<p class="text-danger d-flex justify-content-end">비밀번호가 다름</p>
	</c:if>
	<c:if test="${msg==-1}">
		<p class="text-danger d-flex justify-content-end">아이디가 없음</p>
	</c:if>
</form>
<script>

</script>
</div>
</div>
</div>

<jsp:include page="../include/footer.jsp" flush="false"/>

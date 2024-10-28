<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<jsp:include page="../include/header.jsp" flush="false"/>

<div class="container">
<div class="row">
<div class="col-md-12">
<h3 class="mt-5 mb-3">회원정보</h3>
<div class="d-inline-flex">
	<ul class="list-group">
		<li class="list-group-item">아이디 : ${user.userId}</li>
		<li class="list-group-item">이름 : ${user.userName}</li>
		<li class="list-group-item">전화번호 : ${user.userPhone}</li>
		<li class="list-group-item">이메일 : ${user.userEmail}</li>
	</ul>
</div>
<a href="/modifyuser" type="button" class="mt-5 btn btn-primary">회원정보 수정</a>
<button type="button" id="acountDelete" class="mt-5 d-block btn btn-danger">탈퇴하기</button>



<div>
	<h4>내가 쓴 글</h4>
	
</div>
</div>
</div>
</div>

<jsp:include page="../include/footer.jsp" flush="false"/>
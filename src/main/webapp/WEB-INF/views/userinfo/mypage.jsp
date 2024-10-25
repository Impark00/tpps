<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" flush="false"/>

<div class="container">
<div class="row">
<div class="col-md-12">
<h3>회원정보</h3>
<div class="d-inline-flex">
	<ul class="list-group">
		<li class="list-group-item">아이디 : ${user.userId}</li>
		<li class="list-group-item">이름 : ${user.userName}</li>
		<li class="list-group-item">전화번호 : ${user.userPhone}</li>
		<li class="list-group-item">이메일 : ${user.userEmail}</li>
	</ul>
</div>

<a href="/" class="mt-5 d-block text-decoration-none">돌아가기</a>

</div>
</div>
</div>

<jsp:include page="../include/footer.jsp" flush="false"/>
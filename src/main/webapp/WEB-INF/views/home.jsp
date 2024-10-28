<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="include/header.jsp" flush="false"/>

<c:if test="${userinfo==null}">
<div class="card position-fixed top-1 start-1 my-5 p-3 border rounded">
	<ul class="list-unstyled">
		<li class=" mb-2 mb-lg-0 me-auto">
			<a href="/signin" class="text-decoration-none">로그인</a>/<a href="/signup" class="text-decoration-none">회원가입</a>
		</li>
	</ul>
</div>
</c:if>
<c:if test="${userinfo!=null}">
<div class="card position-fixed top-1 ms-4 my-5 p-3 border rounded">
	<ul class="list-unstyled">
		<li class="mb-2 mb-lb-0 me-auto">
			<span class="fw-bold">${userinfo.userId}&nbsp;님 환영합니다</span>
		</li>
		<li class="mb-2 mb-lg-0 me-auto">
			<a href="/mypage" class="text-decoration-none">마이페이지</a>/<a href="/logout" class="text-decoration-none">로그아웃</a>
		</li>
	</ul>
</div>
</c:if>
<jsp:include page="include/footer.jsp" flush="false"/>
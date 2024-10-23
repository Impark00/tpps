<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<jsp:include page="../include/header.jsp" flush="false"/>
<div class="container">
<div class="row">
<div class="col-md-12">
<h1 class="my-5">Write</h1>

<form action="/aboard/write" method="POST">
<div class="input-group my-3">
	<label class="form-label">
제목
	</label>
<input type="text" name="atitle" class="form-control" placeholder="제목을 적어주세요"/>
</div>

<div class="input-group mb-4">
	<label class="form-label">
내용
	</label>
<textarea name="acontent" class="form-control" placeholder="내용을 적어주세요"></textarea>
</div>
<input type="hidden" name="awriter" class="form-control" value="${userinfo.userId}"/>
<div class="d-flex justify-content-end my-5">
<button type="submit" class="btn btn-outline-primary">전송</button>
</div>
</form>


</div>
</div>
</div>
<jsp:include page="../include/footer.jsp" flush="false"/>
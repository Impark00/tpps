<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<jsp:include page="../include/header.jsp" flush="false"/>
<div class="container">
<div class="row">
<div class="col-md-12">
<h1 class="my-5">게시물 보기</h1>

<div class="input-group my-3">
	<label class="form-label w-25">
	제목
	</label>
	<label class="form-label w-75">${view.atitle}</label>
</div>
<hr/>
<div class="input-group mb-3">
	<label class="form-label w-25">
	날짜
	</label>
	<fmt:formatDate value="${view.adate}" pattern="yyyy-MM-dd"/>
</div>
<hr/>
<div class="input-group mb-3">
	<label class="form-label w-25">
	내용
	</label>
	<label class="form-label w-75">${view.acontent}</label>
</div>
<hr/>
<div class="input-group mb-3">
	<label class="form-label w-25">
	작성자
	</label>
	<label class="form-label w-75">${view.awriter}</label>
</div>
<hr/>
<div class="d-flex justify-content-end my-5">
	<div class="btn-group">
		<a class="btn btn-outline-primary" href="/aboard/list">목록</a>
		<a class="btn btn-outline-success" href="/aboard/modify?ano=${view.ano}">수정</a>
		<a class="btn btn-outline-danger" href="/aboard/delete?ano=${view.ano}">삭제</a>
	</div>
</div>

<!-- comment -->
	<hr/>
	<ul class="list-group">
	<c:forEach items="${comment}" var="comment">
		<li class="list-group-item">
			<div>
				<p class="text-secondary">${comment.arwriter}/ <fmt:formatDate value="${comment.ardate}" pattern="yyyy-MM-dd"/></p>
				<p class="text-secondary">${comment.arcontent}</p>			
			</div>
			<div class="d-flex justify-content-end my-5">
				<div class="btn-group">
					<a href="/acom/modify?ano=${view.ano}&arno=${comment.arno}" class="btn btn-outline-success">수정</a>
					<a href="/acom/delete?ano=${view.ano}&arno=${comment.arno}" class="btn btn-outline-danger">삭제</a>
				</div>
			</div>
		</li>
	</c:forEach>
	</ul>

<form method="post" action="/acom/write">
<div class="input-group my-5">
	<label class="form-label">
	댓글 작성자
	</label>
	<input type="text" class="form-control" name="arwriter">
</div>
<textarea class="form-control" name="arcontent"></textarea>
<input type="hidden" name="ano" value="${view.ano}">
<div class="my-3 d-flex justify-content-end">
<input type="submit" value="댓글작성" class="btn btn-light"/>
</div>
</form>



</div>
</div>
</div>
<jsp:include page="../include/footer.jsp" flush="false"/>
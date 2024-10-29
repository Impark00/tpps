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
 <div class="mb-4">
    <label class="form-label">태그 선택</label>
    <div class="d-flex flex-wrap">
        <div class="form-check me-3">
            <input class="form-check-input" type="radio" name="atag" value="팬아트" id="tag1">
            <label class="form-check-label" for="tag1">팬아트</label>
        </div>
        <div class="form-check me-3">
            <input class="form-check-input" type="radio" name="atag" value="질문" id="tag2">
            <label class="form-check-label" for="tag2">질문</label>
        </div>
        <div class="form-check me-3">
            <input class="form-check-input" type="radio" name="atag" value="자유" id="tag3" checked>
            <label class="form-check-label" for="tag3">자유</label>
        </div>
        <!-- 추가 태그를 여기에 더할 수 있습니다 -->
    </div>
</div>

<div class="input-group mb-4">
	<label class="form-label">
내용
	</label>
<textarea name="acontent" class="form-control" placeholder="내용을 적어주세요"></textarea>
</div>
<c:if test ="${userinfo != null }">
<input type="hidden" name="awriter" class="form-control" value="${userinfo.userId}"/>
</c:if>

<div class="d-flex justify-content-end my-5">
<button type="submit" class="btn btn-outline-primary">전송</button>
</div>
</form>


</div>
</div>
</div>
<jsp:include page="../include/footer.jsp" flush="false"/>
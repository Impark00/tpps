<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<jsp:include page="../include/header.jsp" flush="false"/>
<div class="container">
<div class="row">
<div class="col-md-12">
<h1 class="my-5">게시물 보기</h1>

<form method="POST">
<div class="input-group my-3">
	<label class="form-label">
제목
	</label>
<input type="text" name="atitle" class="form-control" value="${view.atitle}"/>
</div>

<div class="mb-4">
    <div class="d-flex align-items-center"> <!-- Flexbox로 정렬 -->
        <label class="form-label me-2">태그 선택 &nbsp;</label>
        <div class="d-flex flex-wrap">
            <div class="form-check me-3">
                <input class="form-check-input" type="radio" name="atag" value="팬아트" id="tag1" 
                <c:if test="${view.atag == '팬아트'}">checked</c:if>>
                <label class="form-check-label" for="tag1">팬아트</label>
            </div>
            <div class="form-check me-3">
                <input class="form-check-input" type="radio" name="atag" value="질문" id="tag2" 
                <c:if test="${view.atag == '질문'}">checked</c:if>>
                <label class="form-check-label" for="tag2">질문</label>
            </div>
            <div class="form-check me-3">
                <input class="form-check-input" type="radio" name="atag" value="자유" id="tag3" 
                <c:if test="${view.atag == '자유'}">checked</c:if>>
                <label class="form-check-label" for="tag3">자유</label>
            </div>
        </div>
    </div>
</div>

<div class="input-group mb-4">
	<label class="form-label">
내용
	</label>
<textarea name="acontent" class="form-control"> ${view.acontent}</textarea>
</div>
<div class="d-flex justify-content-end my-5">
<button type="submit" class="btn btn-outline-primary">전송</button>
</div>
</form>


</div>
</div>
</div>
<jsp:include page="../include/footer.jsp" flush="false"/>
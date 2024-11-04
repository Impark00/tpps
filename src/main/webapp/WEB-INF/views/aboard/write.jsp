<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<jsp:include page="../include/header.jsp" flush="false"/>
<div class="container mt-5">
    <h1 class="mb-4">글 작성</h1>

    <style>
        .write-container {
            background-color: white; 
            border-radius: 0.5rem; 
            padding: 20px; 
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); 
        }
    </style>

    <div class="write-container">
        <form action="/aboard/write" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
        
            <div class="mb-4">
                <label class="form-label">태그 선택</label>
                <div class="d-flex flex-wrap">
                    <div class="form-check me-3">
                        <input class="form-check-input" type="radio" name="atag" value="기본" id="tag1" checked>
                        <label class="form-check-label" for="tag1">기본</label>
                    </div>
                    <div class="form-check me-3">
                        <input class="form-check-input" type="radio" name="atag" value="공지" id="tag2">
                        <label class="form-check-label" for="tag2">공지</label>
                    </div>
                    <div class="form-check me-3">
                        <input class="form-check-input" type="radio" name="atag" value="질문" id="tag3">
                        <label class="form-check-label" for="tag3">질문</label>
                    </div>
                    <div class="form-check me-3">
                        <input class="form-check-input" type="radio" name="atag" value="정보" id="tag4">
                        <label class="form-check-label" for="tag4">정보</label>
                    </div>
                </div>
            </div>
        
            <div class="input-group my-3">
                <label class="form-label" for="atitle">제목</label>
                <input type="text" name="atitle" id="atitle" class="form-control" placeholder="제목을 적어주세요" required/>
            </div>

            <div class="input-group mb-4">
                <label class="form-label" for="acontent">내용</label>
                <textarea name="acontent" id="acontent" class="form-control" placeholder="내용을 적어주세요"></textarea>
            </div>

            <div class="input-group mb-4">
                <label class="form-label" for="image">이미지 업로드</label>
                <input type="file" name="image" id="image" class="form-control" accept="image/*"/>
            </div>
            <c:if test ="${userinfo != null}">
                <input type="hidden" name="awriter" class="form-control" value="${userinfo.userId}"/>
            </c:if>

            <div class="d-flex justify-content-end my-5">
                <button type="submit" class="btn btn-outline-primary">전송</button>
            </div>
        </form>
    </div>
</div>

<script>
    function validateForm() {
        const content = document.getElementById('acontent').value.trim();
        const image = document.getElementById('image').files.length > 0;

        // 내용이 비어있고 이미지도 없는 경우
        if (content === '' && !image) {
            alert("내용 또는 이미지를 선택해야 합니다.");
            return false; // 제출 중지
        }

        return true; // 제출 허용
    }
</script>

<jsp:include page="../include/footer.jsp" flush="false"/>

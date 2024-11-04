<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<jsp:include page="../include/header.jsp" flush="false"/>
<div class="container mt-5">
    <h1 class="mb-4">게시물 보기</h1>

    <style>
        /* 스타일링: 전체 게시물 보기 컨테이너 */
        .view-container {
            background-color: white; /* 배경색 */
            border-radius: 0.5rem; /* 모서리 둥글게 */
            padding: 20px; /* 내부 여백 */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }
    </style>

    <div class="view-container">
        <form method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
        
        
            <!-- 태그 선택 -->
            <div class="mb-4">
                <div class="d-flex align-items-center"> <!-- Flexbox로 정렬 -->
                    <label class="form-label me-2">태그 선택</label>
                    <div class="d-flex flex-wrap">
                        <div class="form-check me-3">
                            <input class="form-check-input" type="radio" name="atag" value="기본" id="tag1"
                                   <c:if test="${view.atag == '기본'}">checked</c:if> />
                            <label class="form-check-label" for="tag1">기본</label>
                        </div>
                        <div class="form-check me-3">
                            <input class="form-check-input" type="radio" name="atag" value="공지" id="tag2"
                                   <c:if test="${view.atag == '공지'}">checked</c:if> />
                            <label class="form-check-label" for="tag2">공지</label>
                        </div>
                        <div class="form-check me-3">
                            <input class="form-check-input" type="radio" name="atag" value="질문" id="tag3"
                                   <c:if test="${view.atag == '질문'}">checked</c:if> />
                            <label class="form-check-label" for="tag3">질문</label>
                        </div>
                        <div class="form-check me-3">
                            <input class="form-check-input" type="radio" name="atag" value="정보" id="tag4"
                                   <c:if test="${view.atag == '정보'}">checked</c:if> />
                            <label class="form-check-label" for="tag4">정보</label>
                        </div>
                    </div>
                </div>
            </div>
			
			  <!-- 제목 입력 -->
            <div class="input-group my-3">
                <label class="form-label" for="atitle">제목</label>
                <input type="text" name="atitle" id="atitle" class="form-control" value="${view.atitle}" required/> <!-- 필수 입력 -->
            </div>
            
            <!-- 내용 입력 -->
            <div class="input-group mb-4">
                <label class="form-label" for="acontent">내용</label>
                <textarea name="acontent" id="acontent" class="form-control" >${view.acontent}</textarea> <!-- 필수 입력 -->
            </div>

            <div class="input-group mb-4">
                <label class="form-label" for="image">이미지 업로드</label>
                <input type="file" name="image" id="image" class="form-control" accept="image/*"/>
            </div>
            
                        <c:if test="${not empty view.imagepath}">
                <div class="mb-4">
                    <label>현재 이미지:</label><br>
                    <img src="${view.imagepath}" alt="Current Image" class="img-fluid" style="max-width: 100%;"/>
                </div>
            </c:if>

            <!-- 전송 버튼 -->
            <div class="d-flex justify-content-end my-5">
                <button type="submit" class="btn btn-outline-primary">전송</button> <!-- 제출 버튼 -->
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
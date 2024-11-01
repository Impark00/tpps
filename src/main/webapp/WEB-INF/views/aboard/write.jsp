<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<jsp:include page="../include/header.jsp" flush="false"/>
<div class="container mt-5">
    <h1 class="mb-4">글 작성</h1>

    <style>
        /* 스타일링: 전체 글 작성 컨테이너 */
        .write-container {
            background-color: white; /* 배경색 */
            border-radius: 0.5rem; /* 모서리 둥글게 */
            padding: 20px; /* 내부 여백 */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }
    </style>

    <div class="write-container">
        <form action="/aboard/write" method="POST" enctype="multipart/form-data">
        
            <!-- 태그 선택 -->
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
                    <!-- 추가 태그를 여기에 더할 수 있습니다 -->
                </div>
            </div>
        
            <!-- 제목 입력 -->
            <div class="input-group my-3">
                <label class="form-label" for="atitle">제목</label>
                <input type="text" name="atitle" id="atitle" class="form-control" placeholder="제목을 적어주세요" required/> <!-- 필수 입력 -->
            </div>

            <!-- 내용 입력 -->
            <div class="input-group mb-4">
                <label class="form-label" for="acontent">내용</label>
                <textarea name="acontent" id="acontent" class="form-control" placeholder="내용을 적어주세요" required></textarea> <!-- 필수 입력 -->
            </div>

			<div class="input-group mb-4">
        		<label class="form-label" for="image">이미지 업로드</label>
        		<input type="file" name="image" id="image" class="form-control" accept="image/*"/>
    		</div>
            <c:if test ="${userinfo != null}">
                <input type="hidden" name="awriter" class="form-control" value="${userinfo.userId}"/> <!-- 작성자 ID 숨김 필드 -->
            </c:if>

            <!-- 전송 버튼 -->
            <div class="d-flex justify-content-end my-5">
                <button type="submit" class="btn btn-outline-primary">전송</button> <!-- 제출 버튼 -->
            </div>
        </form>
    </div>
</div>

<jsp:include page="../include/footer.jsp" flush="false"/>
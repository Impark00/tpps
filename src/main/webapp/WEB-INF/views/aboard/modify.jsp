<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<jsp:include page="../include/header.jsp" flush="false"/>
<link rel="stylesheet" href="${path}/resources/css/board.css"/>
<div class="container mt-5">
    <h1 class="mb-4">게시물 보기</h1>



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

<script src="${path}/resources/js/board.js"></script>

<jsp:include page="../include/footer.jsp" flush="false"/>
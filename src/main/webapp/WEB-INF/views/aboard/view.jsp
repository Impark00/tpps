<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<jsp:include page="../include/header.jsp" flush="false"/>
<div class="container mt-5">
    <h1 class="mb-4">게시물 보기</h1>

    <style>
        /* 알림 스타일 */
        .small-alert {
            font-size: 0.85rem; /* 글자 크기 조정 */
            padding: 0.5rem 1rem; /* 패딩 조정 */
        }
        /* 전체 컨테이너 스타일 */
        .post-container {
            background-color: white; /* 배경색 */
            border-radius: 0.5rem; /* 모서리 둥글게 */
            padding: 20px; /* 내부 여백 */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }
    </style>

    <div class="post-container">
        <!-- 게시물 제목과 메타데이터 -->
        <div class="input-group my-3">
            <label class="form-label w-25">제목:</label>
            <div class="w-75">
                <strong>${view.atitle}</strong> <!-- 게시물 제목 -->
            </div>
            <label class="form-label w-25">추천 수: ${view.achu}</label> <!-- 추천 수 -->
            <label class="form-label w-25">태그: [${view.atag}]</label> <!-- 태그 -->
        </div>
        <hr/>

        <!-- 게시물 날짜와 작성자 -->
        <div class="input-group mb-3">
            <label class="form-label w-25">날짜:</label>
            <label class="form-label w-75">
                <fmt:formatDate value="${view.adate}" pattern="yyyy-MM-dd HH:mm:ss"/> <!-- 작성일 -->
            </label>
            <label class="form-label w-25">작성자:</label>
            <label class="form-label w-75">${view.awriter}</label> <!-- 작성자 이름 -->
        </div>
        <hr/>

        <!-- 게시물 내용 -->
        <div class="input-group mb-3">
            <label class="form-label w-25">내용:</label>
            <div class="w-75">${view.acontent}</div> <!-- 게시물 내용 -->
        </div>
          <c:if test="${not empty view.imagepath}">
            <div class="input-group mb-3">
                <label class="form-label w-25">이미지:</label>
                <div class="w-75">
                   <img src="${pageContext.request.contextPath}${view.imagepath}" alt="게시물 이미지" class="img-fluid" />
                </div>
            </div>
            <hr/>
        </c:if>
        <hr/>

        <!-- 추천 버튼과 메세지 -->
        <div class="d-flex justify-content-between my-5">
            <div class="me-2 d-flex align-items-center">
                <c:if test="${userinfo != null}">
                    <form method="post" action="/aboard/achu">
                        <input type="hidden" name="ano" value="${view.ano}"/>
                        <input type="submit" value="추천" class="btn btn-outline-secondary"/> <!-- 추천 버튼 -->
                    </form>
                </c:if>
                <c:if test="${not empty message}">
                    <div class="alert alert-warning mt-2 mb-2 ms-3" role="alert">
                        ${message} <!-- 경고 메시지 -->
                    </div>
                </c:if>
            </div>

            <!-- 네비게이션 버튼 -->
            <div class="btn-group d-flex align-items-center">
                <a class="btn btn-outline-primary" href="/aboard/list">목록</a>
                <c:if test="${userinfo.userId == view.awriter || userinfo.verify == 9 }">
                <a class="btn btn-outline-success" href="/aboard/modify?ano=${view.ano}">수정</a>
                <a class="btn btn-outline-danger" href="/aboard/delete?ano=${view.ano}">삭제</a>
                </c:if>
            </div>
        </div>

        <!-- 댓글 목록 -->
        <hr/>
        <ul class="list-group">
            <c:forEach items="${comment}" var="comment">
                <li class="list-group-item">
                    <div>
                        <p class="text-secondary">${comment.arwriter} / <fmt:formatDate value="${comment.ardate}" pattern="yyyy-MM-dd"/></p>
                        <p class="text-secondary">${comment.arcontent}</p> <!-- 댓글 내용 -->
                    </div>
                    <div class="d-flex justify-content-end my-3">
                        <div class="btn-group">
                        <c:if test="${userinfo.userId == view.awriter || userinfo.verify == 9 }">
                            <a href="/acom/modify?ano=${view.ano}&arno=${comment.arno}" class="btn btn-outline-success">수정</a>
                            <a href="/acom/delete?ano=${view.ano}&arno=${comment.arno}" class="btn btn-outline-danger">삭제</a>
                            </c:if>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>

        <!-- 댓글 작성 폼 -->
        <form method="post" action="/acom/write">
            <div class="input-group my-2">
                <p>Comment</p> <!-- 댓글 작성 안내 -->
            </div>
            <textarea class="form-control" name="arcontent" placeholder="댓글을 입력하세요..."></textarea> <!-- 댓글 입력란 -->

            <c:if test="${userinfo != null}">
                <input type="hidden" name="arwriter" class="form-control" value="${userinfo.userId}"/> <!-- 작성자 ID -->
                <input type="hidden" name="ano" value="${view.ano}"> <!-- 게시물 번호 -->
                <div class="my-3 d-flex justify-content-end">
                    <input type="submit" value="댓글작성" class="btn btn-light"/> <!-- 댓글 작성 버튼 -->
                </div>
            </c:if>
            <c:if test="${userinfo == null}">
                <div class="my-3 d-flex justify-content-end">
                    <a href="/signin" class="btn btn-light">댓글작성</a> <!-- 로그인 필요 안내 -->
                </div>
            </c:if>
        </form>
    </div>
</div>

<jsp:include page="../include/footer.jsp" flush="false"/>
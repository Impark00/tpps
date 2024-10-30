<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<jsp:include page="../include/header.jsp" flush="false"/>
<style>
    body {
        background-color: #f8f9fa; /* 배경색 */
        font-family: 'Arial', sans-serif; /* 글꼴 */
    }
    .custom-link {
        color: #007bff; /* 링크 색상 */
        text-decoration: none; /* 기본 밑줄 제거 */
        transition: color 0.3s; /* 색상 변화 애니메이션 */
    }
    .custom-link:hover {
        color: #0056b3; /* 마우스 오버 시 색상 */
    }
    .table {
        background-color: white; /* 테이블 배경 */
        border-radius: 0.5rem; /* 테이블 모서리 둥글게 */
        overflow: hidden; /* 모서리 둥글게 */
    }
    .table th, .table td {
        vertical-align: middle; /* 수직 정렬 */
    }
    .badge {
        font-size: 0.9rem; /* 배지 글꼴 크기 */
    }
    .pagination .page-item.active .page-link {
        background-color: #007bff; /* 활성화된 페이지 색상 */
        color: white; /* 활성화된 페이지 글자 색상 */
    }
    .pagination .page-link {
        color: #007bff; /* 페이지 링크 색상 */
    }
    .pagination .page-link:hover {
        background-color: #e9ecef; /* 페이지 링크 호버 색상 */
    }
</style>

<div class="container mt-5">
    <h1 class="mb-4">목록</h1>
    <table class="table table-striped table-hover">
        <colgroup>
            <col style="width:5%"/>
            <col style="width:60%"/>
            <col style="width:20%"/>
            <col style="width:10%"/>
            <col style="width:5%"/>
        </colgroup>
        <thead>
            <tr>
                <th class="text-center">번호</th>
                <th class="text-center">제목</th>
                <th class="text-center">작성일</th>
                <th class="text-center">조회수</th>
                <th class="text-center">추천</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="item">
                <tr>
                    <td class="text-center">${item.ano}</td>
                    <td>
                        <c:if test="${item.atag != '자유'}">
                            <span class="badge bg-secondary"> [${item.atag}]</span>
                        </c:if>
                        <a href="/aboard/view?ano=${item.ano}" class="custom-link">${item.atitle}</a>
                    </td>
                    <td class="text-center"><fmt:formatDate value="${item.adate}" pattern="yyyy-MM-dd"/></td>
                    <td class="text-center">${item.aview}</td>
                    <td class="text-center">${item.achu}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <form>
        <div class="d-flex justify-content-center my-4">
            <div class="input-group w-50">
                <select name="searchType" class="form-select">
                    <option value="atitle" <c:if test="${page.searchType eq 'atitle'}">selected</c:if>>제목</option>
                    <option value="acontent" <c:if test="${page.searchType eq 'acontent'}">selected</c:if>>내용</option>
                    <option value="atitle_acontent" <c:if test="${page.searchType eq 'atitle_acontent'}">selected</c:if>>제목+내용</option>
                    <option value="awriter" <c:if test="${page.searchType eq 'awriter'}">selected</c:if>>작성자</option>
                </select>
                <input type="text" name="keyword" class="form-control" value="${page.keyword}"/>
                <input type="submit" class="btn btn-outline-success" id="searchBtn" value="검색"/>
            </div>
        </div>
    </form>

    <div class="d-flex justify-content-center my-4">
        <ul class="pagination">
            <c:if test="${page.prev}">
                <li class="page-item"><a href="/aboard/list?num=${page.startPageNum - 1}${page.searchTypeKeyword}" class="page-link">[이전]</a></li>
            </c:if>
            <c:forEach begin='${page.startPageNum}' end="${page.endPageNum}" var="num">
                <li class="page-item <c:if test="${select == num}">active</c:if>">
                    <a href="/aboard/list?num=${num}${page.searchTypeKeyword}" class="page-link">
                        <c:if test="${select == num}"><b>${num}</b><c:if test="${select != num}"> </c:if></c:if>
                        <c:if test="${select != num}">${num}</c:if>
                    </a>
                </li>
            </c:forEach>
            <c:if test="${page.next}">
                <li class="page-item"><a href="/aboard/list?num=${page.endPageNum + 1}${page.searchTypeKeyword}" class="page-link">[다음]</a></li>
            </c:if>
        </ul>
    </div>

    <div class="d-flex justify-content-end my-4">
        <c:if test="${userinfo != null}">
            <a href="/aboard/write" class="btn btn-outline-primary">Write</a>
        </c:if>
        <c:if test="${userinfo == null}">
            <a href="/signin" class="btn btn-outline-primary">Write</a>
        </c:if>
    </div>
</div>
<jsp:include page="../include/footer.jsp" flush="false"/>
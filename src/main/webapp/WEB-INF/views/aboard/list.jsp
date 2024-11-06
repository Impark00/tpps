<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ page import="java.util.ArrayList" %>
<link rel="stylesheet" href="${path}/resources/css/board.css"/>
<%
    ArrayList<String> predefinedTags = new ArrayList<>();
    predefinedTags.add("기본");
    predefinedTags.add("공지");
    predefinedTags.add("질문");
    predefinedTags.add("정보");
    request.setAttribute("predefinedTags", predefinedTags);
%>

<jsp:include page="../include/header.jsp" flush="false"/>

<div class="container mt-5">
    <h1 class="mb-4">목록</h1>
    <div class="d-flex justify-content-center my-4">
    <form action="/aboard/list" method="get" class="w-50">
        <input type="hidden" name="searchType" value="${page.searchType}"/>
        <input type="hidden" name="keyword" value="${page.keyword}"/>
        <div class="btn-group" role="group" aria-label="Tag selection">
            <button type="submit" name="atag" value="" class="btn btn-outline-secondary <c:if test="${page.atag == ''}">active</c:if>">모든 태그</button>
            <c:forEach items="${predefinedTags}" var="pTag">
                <button type="submit" name="atag" value="${pTag}" class="btn btn-outline-secondary <c:if test="${page.atag == pTag}">active</c:if>">${pTag}</button>
            </c:forEach>
        </div>
    </form>
</div>
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
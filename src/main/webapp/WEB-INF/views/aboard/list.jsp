<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<jsp:include page="../include/header.jsp" flush="false"/>
<style>
    .custom-link {
        color: #333333; /* 링크 색상 */
        text-decoration: none; /* 기본 밑줄 제거 */
        transition: color 0.3s; /* 색상 변화 애니메이션 */
    }
</style>

<div class="container">
<div class="row">
<div class="col-md-12">
<h1 class="my-5">목록</h1>
<table class="table">
<colgroup>
<col style="width:5%"/>
<col style="width:60%"/>
<col style="width:20%"/>
<col style="width:10%"/>
<col style="width:5%"/>
</colgroup>
<thead>
<tr>
<th class="text-center">번호</th><th class="text-center">제목</th><th class="text-center">작성일</th><th class="text-center">조회수</th><th class="text-center">추천</th>
</tr>
</thead>
<tbody>
<c:forEach items="${list}" var="list">
 <tr>
  <td class="text-center">${list.ano}</td>
  <td><a href="/aboard/view?ano=${list.ano}" class="custom-link">${list.atitle}</a></td>
  <td class="text-center"><fmt:formatDate value="${list.adate}" pattern="yyyy-MM-dd"/></td>
  <td class="text-center">${list.aview}</td>
  <td class="text-center">${list.achu}</td>
 </tr>
</c:forEach>
</tbody>
</table>
<form>
<div class="d-flex justify-content-center my-5">
<div class="input-group w-50">
	<select name="searchType" class="form-select">
		<option value="atitle" <c:if test="${page.searchType eq 'atitle'}">selected</c:if>>
		제목</option>
		<option value="acontent" <c:if test="${page.searchType eq 'acontent'}">selected</c:if>>
		내용</option>
		<option value="atitle_acontent"<c:if test="${page.searchType eq 'atitle_acontent'}">selected</c:if>>
		제목+내용</option>
		<option value="awriter"<c:if test="${page.searchType eq 'awriter'}">selected</c:if>>
		작성자</option>
	</select>
	<input type="text" name="keyword" class="form-control" value="${page.keyword}"/>
	<input type="submit" class="btn btn-outline-success" id="searchBtn" value="검색"/>
  </div>
</div>
</form>

<div class="d-flex justify-content-center my-5">
<ul class="pagination">
<c:if test="${page.prev}">
  <li class="page-item"><a href="/aboard/list?num=${page.startPageNum -1}${page.searchTypeKeyword}" class="page-link">[이전]</a></li>
</c:if>
<c:forEach begin='${page.startPageNum}' end="${page.endPageNum}" var="num">
	<c:if test="${select != num }">
		<li class="page-item"><a href="/aboard/list?num=${num}${page.searchTypeKeyword}" class="page-link">${num}</a></li>
	</c:if>
	<c:if test="${select == num }">
	<li class="page-item"><a href="/aboard/list?num=${num}${page.searchTypeKeyword}" class="page-link"><b class="fw-bold">${num}</b></a></li>
	</c:if>
</c:forEach>
<c:if test="${page.next}">
<li class="page-item"><a href="/aboard/list?num=${page.endPageNum + 1 }${page.searchTypeKeyword}" class="page-link">[다음]</a></li>
</c:if>

</ul>
</div>

<div class="d-flex justify-content-end my-5">
<c:if test ="${userinfo != null }">
<a href="/aboard/write" class="btn btn-outline-primary">Write</a>
</c:if>
<c:if test ="${userinfo == null }">
<a href="/signin" class="btn btn-outline-primary">Write</a>
</c:if>

</div>
</div>
</div>
</div>
<jsp:include page="../include/footer.jsp" flush="false"/>
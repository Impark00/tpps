<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<jsp:include page="../include/header.jsp" flush="false"/>
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
  <td><a href="/aboard/view?ano=${list.ano} ">${list.atitle}</a></td>
  <td class="text-center"><fmt:formatDate value="${list.adate}" pattern="yyyy-MM-dd"/></td>
  <td class="text-center">${list.aview}</td>
  <td class="text-center">${list.achu}</td>
 </tr>
</c:forEach>
</tbody>
</table>
<div class="d-flex justify-content-end my-5">
<a href="/aboard/write" class="btn btn-outline-primary">Write</a>

</div>
</div>
</div>
</div>
<jsp:include page="../include/footer.jsp" flush="false"/>
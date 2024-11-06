<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<jsp:include page="../include/header.jsp" flush="false"/>
<link rel="stylesheet" href="${path}/resources/css/board.css"/>
<div class="container">
<div class="row">
<div class="col-md-12">
<h3 class="mt-5 mb-3">회원정보</h3>
<div class="d-inline-flex">
	<ul class="list-group">
		<li class="list-group-item">아이디 : ${userinfo.userId}</li>
		<li class="list-group-item">이름 : ${userinfo.userName}</li>
		<li class="list-group-item">전화번호 : ${userinfo.userPhone}</li>
		<li class="list-group-item">이메일 : ${userinfo.userEmail}</li>
	</ul>
</div>
<a href="/modifyuser" type="button" class="mt-5 btn btn-primary">회원정보 수정</a>
<button type="button" id="acountDelete" class="mt-5 d-block btn btn-danger">탈퇴하기</button>



<div>
	<h4>내가 쓴 글</h4>
	 <table class="table table-striped table-hover">
        <colgroup>
            <col style="width:10%"/>
            <col style="width:60%"/>
            <col style="width:10%"/>
            <col style="width:10%"/>
            <col style="width:10%"/>
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
            <c:forEach items="${list}" var="list">
                <tr>
                    <td class="text-center">${list.ano}</td>
                    <td><a href="/aboard/view?ano=${list.ano}" class="custom-link">${list.atitle}</a></td>
                    <td class="text-center"><fmt:formatDate value="${list.adate}" pattern="MM-dd"/></td>
                    <td class="text-center">${list.aview}</td>
                    <td class="text-center">${list.achu}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</div>
</div>
</div>

<jsp:include page="../include/footer.jsp" flush="false"/>
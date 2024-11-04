<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<div class="container">
<div class="row">
<div class="col-md-12">
<h3 class="mt-5 mb-3">회원정보</h3>
<div class="d-inline-flex">
	<ul class="list-group">
		<li class="list-group-item">아이디 : ${user.userId}</li>
		<li class="list-group-item">이름 : ${user.userName}</li>
		<li class="list-group-item">전화번호 : ${user.userPhone}</li>
		<li class="list-group-item">이메일 : ${user.userEmail}</li>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${path}/resources/css/bbs.css"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<title>COMU</title>
<body>

<nav class="navbar navbar-expand-sm bg-light">
	<div class="container-fluid w-100">
		<a class="navbar-brand" href="${path}/">COMU</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="mynavbar">
			<ul class="navbar-nav mb-2 mb-lg-0 me-auto">
				<c:if test ="${member == null }">
					<li class="nav-item">
						<a class="nav-link" href="#">write</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/signin">login</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/signup">join</a>
					</li>
				</c:if>
			</ul>
			<c:if test ="${userinfo != null }">
				<c:if test ="${userinfo.verify == 0}">
					<div class="d-flex align-items-center">
						<ul class="navbar-nav mb-2 mb-lg-0 me-auto">
							<li class="nav-item">
								<span class="fw-bold">${userinfo.userId}&nbsp;님 환영합니다</span>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">마이페이지</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="/logout">logout</a>
							</li>	
						</ul>
					</div>
				</c:if>
			</c:if>
			<form class="dflex btn-group">
				<input class="form-control" type="text" placeholder="Search">
				<button class="btn btn-primary" type="button">Search</button>
			</form>
		</div>
	</div>
</nav>

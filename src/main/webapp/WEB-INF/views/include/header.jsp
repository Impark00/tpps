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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<title>COMU</title>

<nav class="navbar navbar-expand-sm bg-light">
	<div class="container-fluid w-100">
		<a class="navbar-brand" href="${path}/">COMU</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="mynavbar">
			<ul class="navbar-nav mb-2 mb-lg-0 me-auto">
				<li class="nav-item">
					<a class="nav-link" href="${path}/aboard/list">alist</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${path}/bboard/list">blist</a>
				</li>
			</ul>
			<form class="dflex btn-group">
				<input class="form-control" type="text" placeholder="Search">
				<button class="btn btn-primary" type="button">Search</button>
			</form>
		</div>
	</div>
</nav>

<style>
        /* 헤더 스타일 추가 */
        .navbar {
            background-color: #FFB6C1; /* 검은색 배경 */
        }
        .navbar .nav-link,
        .navbar .navbar-brand {
            color: #fff; /* 하얀색 글자 */
        }
        .navbar .nav-link:hover {
            color: #ccc; /* 마우스 오버 시 연한 회색 */
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-sm">
    <div class="container-fluid w-100">
        <a class="navbar-brand" href="${path}/">COMU</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        <
            
            </ul>
       
        </div>
    </div>
</nav>
>>>>>>> 175df1ae0cc0c62e56c54679bfb565cde90bf532

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
    <link rel="stylesheet" href="${path}/resources/css/header.css"/>
    <title>COMU</title>


</head>
<body>
<nav class="navbar navbar-expand-sm">
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
                    <a class="nav-link" href="${path}/api/navermap">map</a>
                </li>
                
            </ul>
            <form class="d-flex btn-group">
                <input class="form-control" type="text" placeholder="Search">
                <button class="btn btn-primary" type="button">Search</button>
            </form>
            <button id="darkModeToggle" class="btn btn-secondary ms-2">다크 모드</button>
        </div>
    </div>
</nav>

<script src="${path}/resources/js/header.js"></script>

</body>
</html>

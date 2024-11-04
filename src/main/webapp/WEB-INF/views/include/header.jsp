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
    <title>COMU</title>

    <style>
        /* 헤더 스타일 추가 */
        .navbar {
            background-color: #FFB6C1; /* 핑크색 배경 */
        }
        .navbar .nav-link,
        .navbar .navbar-brand {
            color: #fff; /* 하얀색 글자 */
        }
        .navbar .nav-link:hover {
            color: #ccc; /* 마우스 오버 시 연한 회색 */
        }
        body.dark-mode {
            background-color: #2c2c2c; /* 다크 모드 배경 */
            color: white; /* 다크 모드 글자색 */
        }
        body.dark-mode .navbar {
            background-color: #343a40; /* 다크 모드 헤더 색상 */
        }
        /* 다크 모드 버튼 스타일 */
        #darkModeToggle {
            transition: background-color 0.3s, color 0.3s; /* 색상 전환 효과 */
        }
        body.dark-mode #darkModeToggle {
            background-color: white; /* 다크 모드일 때 버튼 배경색 */
            color: black; /* 다크 모드일 때 버튼 글자색 */
        }
    </style>
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
                    <a class="nav-link" href="${path}/bboard/list">blist</a>
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

<script>
    // 다크 모드 상태 체크
    if (localStorage.getItem('darkMode') === 'enabled') {
        document.body.classList.add('dark-mode');
        document.getElementById('darkModeToggle').innerText = '화이트 모드'; // 다크 모드일 때 버튼 텍스트
    }

    // 다크 모드 토글 버튼
    document.getElementById('darkModeToggle').addEventListener('click', function() {
        document.body.classList.toggle('dark-mode');
        // 다크 모드 상태 저장 및 버튼 텍스트 변경
        if (document.body.classList.contains('dark-mode')) {
            localStorage.setItem('darkMode', 'enabled');
            this.innerText = '화이트 모드'; // 버튼 텍스트 변경
        } else {
            localStorage.removeItem('darkMode');
            this.innerText = '다크 모드'; // 버튼 텍스트 변경
        }
    });
</script>
</body>
</html>

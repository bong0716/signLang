<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 --%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수어 다국어 화상통화</title>

<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Style -->
<link rel="stylesheet" href="/css/styles.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">

<!-- Fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700&display=swap"
	rel="stylesheet">
</head>

<body>

	<header class="header">
		<div class="container">
			<a href="/" class="logo"> <img src="/image/logo.png" alt="">
				&nbsp; <span style="font-weight: bold; color: red;">B</span> <span
				style="font-weight: bold; color: #FCD006;">M</span> <span
				style="font-weight: bold; color: green;">ee</span> <span
				style="font-weight: bold; color: blue;">t</span>
			</a>
			<nav class="navi">
				<ul class="navi-list">
					<li class="navi-item"><a href="/user/${principal.user.id}">
							<i class="far fa-user"></i>
					</a></li>
				</ul>
			</nav>
		</div>
	</header>
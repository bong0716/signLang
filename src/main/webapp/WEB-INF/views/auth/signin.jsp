<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<div class="container_login">

	<main class="loginMain">
		<!--로그인섹션-->
		<section class="login">
			<!--로그인박스-->
			<article class="login__form__container">
				<!--로그인 폼-->
				<div class="login__form">
					<h1>
						<img src="/image/logo.jpg" alt="">
					</h1>

					<!--로그인 인풋-->
					<form class="login__input" action="/auth/signin" method="POST">
						<input type="text" name="username" placeholder="유저네임"
							required="required" /> <input type="password" name="password"
							placeholder="비밀번호" required="required" />
						<button>로그인</button>
					</form>
					<!--로그인 인풋end-->

					<!-- 또는 -->
					<div class="login__horizon">
						<div class="br"></div>
						<div class="or">또는</div>
						<div class="br"></div>
					</div>
					<!-- 또는end -->

					<!-- Oauth 소셜로그인 -->
					<div class="login__google">
					<button id="googleSignInButton">
					    <img src="/image/googleSignin.png" alt="Sign in with Google">
					</button>
					</div>
					<!-- Oauth 소셜로그인end -->
				</div>

				<!--계정이 없으신가요?-->
				<div class="login__register">
					<span>계정이 없으신가요?</span> <a href="/auth/signup">가입하기</a>
				</div>
				<!--계정이 없으신가요?end-->
			</article>
		</section>
	</main>

</div>

<script>
    document.getElementById('googleSignInButton').addEventListener('click', function() {
        window.location.href = '/oauth2/authorization/google';
    });
</script>

<%@ include file="../layout/footer.jsp"%>
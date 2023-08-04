<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Title -->
    <title>Login</title>
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- slick slider -->
	 <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	 <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
	 <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- Custom Css & Js -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <script src="${pageContext.request.contextPath}/js/login-custom.js"></script>
    <!-- Favicon -->
  	 <link rel="icon" href="${pageContext.request.contextPath}/resources/images/Favicon.png">
</head>
<body>

  <div class="container">
    <!-- Header -->
    <header>
      <div class="header-inner">
          <div class="banner">
            <div class="logo">
              <a href="${pageContext.request.contextPath}/pages/main.jsp">
                <!-- <img src="../resources/images/Logo.png"> -->
              </a>
            </div>
            <div class="lnb">
              <a href="${pageContext.request.contextPath}/pages/register.jsp">SIGN UP</a>
              <div class="darkmode"></div>
            </div>
          </div>
      </div>
    </header>
  
    <!-- Section : Login -->
    <section class="login" id="login">
      <div class="section-inner">
        <div class="login-form-inner">
          <form action="${pageContext.request.contextPath}/login" method="post" class="login-form">
            <h1>LOGIN</h1>
            <div class="login-text">
              <label for="accountId" class="accountId">
                <input type="text" id="accountId" name="accountId" class="accountId-text" placeholder="Account Id" required>
              </label>
              <label for="password" class="password">
                <input type="password" id="password" name="password" class="password-text" placeholder="Password" required>
              </label>
            </div>
            <div class="login-checks">
              <label for="login-check" class="login-check-inner">
                <input type="checkbox" class="login-check" id="login-check"> 아이디저장
              </label>
              <a href="#">ID / PW 찾기</a>
            </div>
            <div class="login-btn-inner">
              <div class="login-btns">
                <button type="submit" class="login-btn">LOGIN</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </section>
  
    <!-- Footer -->
    <footer>
      <div class="footer-inner">
        <div class="footer-logo">
          <img src="../resources/images/Footerlogo.png" alt="#none">
        </div>
        <div class="copyright">
          <div class="service">
            <p>
              Service center : 111 - 1111
              <span>
                Weekdays: 09:00 am to 6:00 pm<br>
                Lunch time: 12:00 am to 1:00 pm Closed<br>
                on Sat/Sun/Holidays
              </span>
            </p>
          </div>
          <div class="service-text">
            <div>
              <span>About Us</span>
              <span>Terms of service</span>
              <span>Privacy Statement</span>
              <span>Information Use</span>
            </div>
            <div class="sns">
              <a href="#none"><i class="xi-facebook"></i></a>
              <a href="#none"><i class="xi-instagram"></i></a>
              <a href="#none"><i class="xi-twitter"></i></a>
              <a href="#none"><i class="xi-youtube-play"></i></a>
            </div>
          </div>
        </div>
        <div class="sub-text">
          <p>
            Copyright © Music Streaming . All rights reserved.<br>
            We provide services by subscribing to payment purchase safety (escrow) for safe transactions.
          </p>
        </div>
      </div>
    </footer>
  </div>
</body>
</html>

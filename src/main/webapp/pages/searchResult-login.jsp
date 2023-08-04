<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Title -->
  <title>Search Results</title>
  <!-- jQuery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- slick slider -->
  <script src="../js/slick.min.js"></script>
  <link rel="stylesheet" href="../css/slick-theme.css">
  <link rel="stylesheet" href="../css/slick.css">
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- Custom Css & Js -->
  <link rel="stylesheet" href="../css/searchResult-login.css">
  <script src="../js/searchResult-login.js"></script>
  <!-- Favicon -->
  <link rel="icon" href="../resources/images/Favicon.png">
</head>
<body>
  
  <div class="container">
    <!-- Header -->
    <header>
      <div class="header-inner">
          <div class="banner">
            <div class="logo">
              <a href="#">
                <!-- <img src="../resources/images/Logo.png"> -->
              </a>
            </div>
            <div class="lnb">
              <c:if test="${not empty userAccount}">
                <p>${userAccount.name}님 환영합니다. </p>
              </c:if>
              <a href="#none">LOGOUT</a>
              <a href="#none">MY PAGE</a>
              <div class="darkmode"></div>
            </div>
          </div>
          <nav>
            <div class="sub-lnb">
              <input type="search">
            </div>
            <div class="gnb">

            </div>
          </nav>
      </div>
    </header>

    <!-- Section : Search Results -->
    <section class="search-results" id="search-results">
      <div class="section-inner">
        <div class="search-results-inner">

          <h2>Artist</h2>
          <c:if test="${not empty singers}">
            <c:forEach items="${singers}" var="singers">
              <p>아티스트 : ${singers.singerName}</p>
              <p>아티시트 해쉬태그 : ${singers.singerHashtags}</p>
              <P><img src="${singers.singerPhoto}"/></P>
              <!-- Display more artist information as needed -->
            </c:forEach>
          </c:if>
          <c:if test="${empty singers}">
            <p>No artists found.</p>
          </c:if>
          <hr>

          <h2>Songs</h2>
          <c:if test="${not empty songs}">
            <c:forEach items="${songs}" var="song">
              <p>곡 제목 : ${song.title}</p>
              <p>곡 정보 : ${song.songInfo}</p>

              <c:forEach items="${song.songHashtags}" var="hashtags">
                <p>#${hashtags.hashtagValue}</p>
              </c:forEach>

              <!-- Display more song information as needed -->
              <br>
            </c:forEach>
          </c:if>
          <c:if test="${empty songs}">
            <p>No songs found.</p>
          </c:if>
          <hr>

          <h2>Albums</h2>
          <c:if test="${not empty albums}">
            <c:forEach items="${albums}" var="album">
              <P><img src="${album.coverPhoto}"/></P>
              <p>엘범 타이틀 : ${album.albumTitle}</p>
              <p>엘범 정보 : ${album.albumInfo}</p>
              <p>뮤직 비디오 링크 : ${album.musicVideoLink}</p>
              <!-- Display more album information as needed -->
            </c:forEach>
          </c:if>
          <c:if test="${empty albums}">
            <p>No albums found.</p>
          </c:if>

          <!-- Display other search results as needed for genres, etc. -->


        </div>
      </div>
    </section>
    
    <!-- Chat-Helper -->
    <div class="chat-helper-icon">
      <button class="chat-helper-start">
        <img class="chat-helper-img" src="../resources/images/chat-helper.png">
      </button>
    </div>
    <div class="chat-helper-main">
      <form class="chat-helper-inner">
        <div class="helper-text">
        </div>
        <div class="user-text">
          <textarea cols="100%" rows="4" class="user-chat"></textarea>
          <button type="submit" class="helper-send">Send</button>
        </div>
      </form>
    </div>

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

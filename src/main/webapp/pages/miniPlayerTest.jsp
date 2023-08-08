
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
  <!-- slick slider -->
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
  <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- FontAwesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <!-- Custom Css & Js -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main-style.css">
  <!-- Favicon -->
  <link rel="icon" href="${pageContext.request.contextPath}/resources/images/Favicon.png">

    <title></title>
</head>
<body>

<!-- Mini Player -->
<div id="player" class="player">
  <div class="info">
    <audio id="plyr-audio" class="audio">
      <source src="/mp3/ditto_31.mp3" type="audio/mp3">
    </audio>
    <div class="album-cover">
      <div class="album-img-inner"></div>
    </div>

    <div class="info-sub">
      <div class="progressBar">
        <div class="progressBar-main">
          <input type="range" value="0" id="progress">
        </div>
      </div>

      <div class="currentlyPlaying">
        <div class="currentlyPlaying-text">
          <span class="songName">Super Shy</span>
          <span class="artistName">NewJeans</span>
        </div>
        <div class="controls">
          <div class="music-timer">
            <span class="current">0:00</span>
            <span> / </span>
            <span class="duration">0:00</span>
          </div>
          <div class="repeat"><i class="fa-solid fa-repeat fa-xl"></i></div>
          <div class="previous"><i class="fas fa-backward fa-xl"></i></div>
          <div class="play"><i class="fas fa-play fa-xl"></i></div>
          <div class="pause"><i class="fas fa-pause fa-xl"></i></div>
          <div class="next"><i class="fas fa-forward fa-xl"></i></div>
          <div class="shuffle"><i class="fas fa-random fa-xl"></i></div>
          <div class="volume-btn">
            <div class="volume"><i class="fas fa-volume-up fa-xl"></i></div>
            <div class="mute"><i class="fas fa-volume-xmark fa-xl"></i></div>
            <div class="volumeCtrl">
              <div class="volume-bar">
                <div class="volumeBg">
                  <input class="volumeRange" type="range" min="0" max="100" step="1" value="50"></input>
                </div>
              </div>
            </div>
          </div>
          <div class="option"><i class="fas fa-bars fa-2xl"></i></div>
        </div>
      </div>
    </div>
  </div>
</div>


<script src="${pageContext.request.contextPath}/js/miniPlaySong.js"></script>


</body>
</html>

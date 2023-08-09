<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Title -->
  <title>Custom Playlist</title>
  <!-- jQuery CDN -->
  <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
  <!-- slick slider -->
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
  <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/sortablejs@latest/Sortable.min.js"></script>
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- FontAwesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <!-- Custom Css & Js -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customPlaylist.css">
  <!-- Favicon -->
  <link rel="icon" href="${pageContext.request.contextPath}/resources/images/Favicon.png">
  	<script>
		let contextPath = '<%= request.getContextPath() %>';
	</script>
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
              <a href="${pageContext.request.contextPath}/pages/login.jsp">LOGIN</a>
              <a href="${pageContext.request.contextPath}/pages/register.jsp">SIGN UP</a>
              <div class="darkmode"></div>
            </div>
          </div>
          <nav>
            <div class="sub-lnb">
              <form action="${pageContext.request.contextPath}/search" method="get">
                <input type="text" id="mainSearchQuery" name="mainSearchQuery" required>
                <button type="submit"></button>
              </form>
            </div>
            <div class="gnb">

            </div>
          </nav>
      </div>
    </header>

    <!-- Section : Playlist -->
    <section class="playlist" id="playlist">
      <div class="section-inner">
      	<div class="playlist-inner">
				<div id="playlist-container">
				<!--
				    <h1	>Custom Playlist Details</h1>
				-->
				<c:if test="${customPlaylist != null}">
				
				<!--
				   <h2 style="display:inline">Playlist ID: ${customPlaylist.playlistId}</h2>
				   <a href="<%= request.getContextPath() %>/DeletePlaylist?playlistId=${customPlaylist.playlistId}">플레이리스트 삭제</a>
				<h2>Playlist Name: ${customPlaylist.playlistName}</h2>
				-->
				
				<div class="card text-center">
				  <div class="card-header">
				    <h2>${customPlaylist.playlistName}</h2>
				  </div>
				</div>
				<p></p>
				
				<!-- <div class="card text-center">
					<div class="card-body">
					</div>
				</div>
				<p></p> -->
				
				<!--
					<h3>Songs:</h3>
				-->
				<c:forEach items="${customPlaylist.songs}" var="song" varStatus="loop">
				<div class="song-details" id="song-${song.songId}">
				<div class="song-info">				
					<span>${song.title}</span>
					<span>${song.songInfo}</span>
				</div>
				<!--
				   <p>Song ID: ${song.songId}</p>
				   <p>Title: ${song.title}</p>
				   <p>Singer ID: ${song.singerId}</p>
				   <p>URL: ${song.url}</p>
				   -->
			   <div>				   
				<button type="button" class="btn btn-dark"><a href="${pageContext.request.contextPath}/playSong?songId=${song.songId}">Play Song</a> &nbsp&nbsp
				            </button>
				<button id="delete-song-btn" type="button" class="btn btn-warning delete-song" data-playlist-id="${customPlaylist.playlistId}" data-song-id="${song.songId}"> 곡 삭제
				</button>
			   </div>
				</div>
				</c:forEach>
				</c:if>
				<div class="card-footer text-body-secondary">
				  <a href="<%= request.getContextPath() %>/DeletePlaylist?playlistId=${customPlaylist.playlistId}" class="btn btn-dark">플레이리스트 삭제</a>
				</div>
				</div>
			</div>
      </div>
    </section>
    
    <!-- Chat-Helper -->
    <div class="chat-helper-icon">
      <button class="chat-helper-start">
        <img class="chat-helper-img" src="${pageContext.request.contextPath}/resources/images/chat-helper.png">
      </button>
    </div>
	 <div class="chat-helper-main">
      <div class="chat-helper-inner">
        <div class="helper-text">
          <div id="answer" class="helper-answer">${answer}</div>
        </div>
        <div class="instant-play">
        		<input type="text" placeholder="노래제목을 입력하세요">
        		<button type="submit"><i class="bi bi-play-fill"></i></button>
        </div>
        <div class="user-text">
<%--          <label for="question">Enter your question:</label><br>--%>
          <textarea id="question" rows="4" cols="100%" class="user-chat"></textarea><br>
          <button id="submitBtn" class="helper-send">Send</button>
        </div>
      </div>
    </div>

    <!-- Footer -->
    <footer>
      <div class="footer-inner">
        <div class="footer-logo">
          <img src="${pageContext.request.contextPath}/resources/images/Footerlogo.png" alt="#none">
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
    
    <!-- Mini Player -->
    <div id="player" class="player">
      <div class="info">
        <audio class="audio">
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
  </div>

  <script src="${pageContext.request.contextPath}/js/navConfig.js"></script>
  <script src="${pageContext.request.contextPath}/js/customPlaylist.js"></script>
  <script src="${pageContext.request.contextPath}/js/customPlaylist-custom.js"></script>
  <script src="${pageContext.request.contextPath}/js/miniPlaySong.js"></script>
</body>
</html>

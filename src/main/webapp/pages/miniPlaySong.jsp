<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="../css/mini-play-song.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="../js/miniPlaySong.js"></script>
    
</head>
<body>
    <div id="player">
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
              <div class="heart">
                <div class="blankedHeart"><i class="fa-regular fa-heart fa-flip-x fa-xl" style="color: pink;"></i></div>
                <div class="coloredHeart"><i class="fas fa-heart fa-flip-x fa-xl" style="color: pink;"></i></div>
              </div>
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
</body>
</body>
</html>
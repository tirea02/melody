<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.melody.dao.SingerDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.melody.model.SongSimple" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/play-song.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="${pageContext.request.contextPath}/js/playSong.js"></script>
</head>
<body>
<div id="player">
    <div>
        <div class="album">
            <div class="albumImg">
            </div>
            <div class="blankedHeart"><i class="fa-regular fa-heart fa-flip-x fa-xl" style="color: pink;"></i></div>
            <div class="coloredHeart"><i class="fas fa-heart fa-flip-x fa-xl" style="color: pink;"></i></div>
        </div>
    </div>

    <div class="info">
        <audio class="audio" preload="metadata">
            <source src="${songSimple.url}" type="audio/mp3">
        </audio>

        <div class="progressBar">
            <input type="range" value="0" id="progress">
            <span class="current">0:00</span>
            <span class="duration">0:00</span>
        </div>

        <div class="currentlyPlaying">
            <h1 class="songName">${songSimple.title}</h1>
            <h1 class="artistName">${songSimple.artist}</h1>
        </div>

        <div class="controls">
            <div class="option"><i class="fas fa-bars fa-2xl"></i></div>
            <div class="repeat"><i class="fa-solid fa-repeat fa-xl"></i></div>
            <div class="previous"><i class="fas fa-backward fa-xl"></i></div>
            <div class="play"><i class="fas fa-play fa-xl"></i></div>
            <div class="pause"><i class="fas fa-pause fa-xl"></i></div>
            <div class="next"><i class="fas fa-forward fa-xl"></i></div>
            <div class="shuffle"><i class="fas fa-random fa-xl"></i></div>
            <div class="volume"><i class="fas fa-volume-up fa-xl"></i></div>
            <div class="mute"><i class="fas fa-volume-xmark fa-xl"></i></div>
            <div class="volumeCtrl">
                <div class="volumeBg">
                    <input class="volumeRange" type="range" min="0" max="100" step="1" value="50"></input>
                </div>
            </div>
            <div class="add"><i class="fas fa-plus fa-2xl"></i></div>
        </div>
    </div>
</div>
</body>
</html>

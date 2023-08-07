<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Song Detail</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/melody_css.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>

<body>
<h3>곡 정보</h3>
<c:if test="${not empty song}">
  <c:if test="${not empty album}">
  <table border="0" cellspacing="0" cellpadding="10">
    <tr>
      <td rowspan="6" align="center">
        <a href="${album.coverPhoto}">
          <img src="${album.coverPhoto}" alt="앨범 사진">
        </a>
      </td>
      <td>앨범명 | ${album.albumTitle}</td>
      <td rowspan="6" align="center">
        <button type="button" id="likeButton" class="song_Likes" onclick="click_Likes()">
          <i id="likeIcon" class="fa-regular fa-heart"></i>
          <p style="color: pink;">${song.likes}</p>
        </button>
      </td>
    </tr>
    <tr>
      <td>가수 | ${album.singerName}</td>
    </tr>
    <tr>
      <td></td>
    </tr>
    <tr>
      <td>곡 명 | ${song.title}</td>
    </tr>
    <tr>
      <td>장르 | ${album.genre}</td>
    </tr>
    <tr>
      <td>발매일 | ${album.releaseDate}</td>
    </tr>
    <tr>
      <th colspan="3">

        <c:forEach items="${song.songHashtags}" var="hashtag">
          #${hashtag.hashtagValue},
        </c:forEach>
      </th>
    </tr>
  </table>
  <hr>
  </c:if>
</c:if>

<h3>재생횟수</h3>
<div>
  <c:if test="${not empty song}">
    <input type="text" readonly id="musicCount" value="${song.title}을(를) 들은 횟수는 총 ${song.playlistCount} 번 입니다.">
  </c:if>
</div>
<hr>
<h3>PlayList</h3>
<div>
  이 곡이 포함된 플레이 리스트 입니다.
</div>
<hr>
<h3>비디오</h3>
<div>
  <c:if test="${not empty album}">
    <iframe src="${album.musicVideoLink}" title="YouTube video player"></iframe>
  </c:if>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/melody_js.js"></script>
</body>
</html>

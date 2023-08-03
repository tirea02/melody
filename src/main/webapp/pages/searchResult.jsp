<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Search Results</title>
</head>
<body>
<h1>Search Results</h1>

<h2>Artists:</h2>
<c:if test="${not empty singers}">
  <c:forEach items="${singers}" var="singers">
    <p>${singers.singerName}</p>
    <p>${singers.singerHashtags}</p>
    <!-- Display more artist information as needed -->
  </c:forEach>
</c:if>
<c:if test="${empty singers}">
  <p>No artists found.</p>
</c:if>

<h2>Songs:</h2>
<c:if test="${not empty songs}">
  <c:forEach items="${songs}" var="song">
    <p>${song.title}</p>
    <p>${song.songInfo}</p>

    <c:forEach items="${song.songHashtags}" var="hashtags">
      <p>${hashtags.hashtagValue}</p>
    </c:forEach>

    <!-- Display more song information as needed -->
  </c:forEach>
</c:if>
<c:if test="${empty songs}">
  <p>No songs found.</p>
</c:if>

<h2>Albums:</h2>
<c:if test="${not empty albums}">
  <c:forEach items="${albums}" var="album">
    <p>${album.albumTitle}</p>
    <p>${album.albumInfo}</p>
    <p>${album.musicVideoLink}</p>
    <!-- Display more album information as needed -->
  </c:forEach>
</c:if>
<c:if test="${empty albums}">
  <p>No albums found.</p>
</c:if>

<!-- Display other search results as needed for genres, etc. -->

</body>
</html>

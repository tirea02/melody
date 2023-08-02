<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.melody.model.CustomPlaylist, com.melody.model.Song" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Custom Playlist</title>
</head>
<body>
<h1>Custom Playlist Details</h1>
<c:if test="${customPlaylist != null}">
    <h2>Playlist ID: ${customPlaylist.playlistId}</h2>
    <h2>Playlist Name: ${customPlaylist.playlistName}</h2>
    <h3>Songs:</h3>
    <c:forEach items="${customPlaylist.songs}" var="song">
        <p>Song ID: ${song.songId}</p>
        <p>Title: ${song.title}</p>
        <p>Singer ID: ${song.singerId}</p>
        <p>URL: ${song.url}</p>
        <a href="<%= request.getContextPath() %>/playSong?songId=${song.songId}">Play Song</a>
        <!-- Add more details as needed -->
        <hr>
    </c:forEach>
</c:if>
</body>
</html>

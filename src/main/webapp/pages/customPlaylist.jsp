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
<h1>Custom Playlist</h1>
<c:if test="${customPlaylist != null}">
    <h2>${customPlaylist.playlistName}</h2>
    <c:forEach items="${customPlaylist.songs}" var="song">
        <p>${song.title} - ${song.singerId}</p>
        <!-- Add other details you want to display for each song -->
    </c:forEach>
</c:if>
</body>
</html>

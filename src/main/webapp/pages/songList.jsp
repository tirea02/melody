<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.melody.model.Song" %>

<!DOCTYPE html>
<html>
<head>
  <title>Song List</title>
</head>
<body>
<h1>Song List</h1>
<table border="1">
  <tr>
    <th>ID</th>
    <th>Title</th>
    <th>Artist</th>
    <th>Album</th>
  </tr>
  <% for (Song song : (List<Song>) request.getAttribute("songs")) { %>
  <tr>
    <td><%= song.getId() %></td>
    <td><%= song.getTitle() %></td>
    <td><%= song.getArtist() %></td>
    <td><%= song.getAlbum() %></td>
  </tr>
  <% } %>
</table>
</body>
</html>

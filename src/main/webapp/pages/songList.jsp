<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.melody.model.Song" %>

<%
  int currentPage = 1;
  int songsPerPage = 10;
  if (request.getParameter("page") != null) {
    currentPage = Integer.parseInt(request.getParameter("page"));
  }

  List<Song> songs = (List<Song>) request.getAttribute("songs");
  int totalSongs = songs.size();
  int totalPages = (int) Math.ceil((double) totalSongs / songsPerPage);

  int startIdx = (currentPage - 1) * songsPerPage;
  int endIdx = Math.min(startIdx + songsPerPage, totalSongs);
  List<Song> songsToDisplay = songs.subList(startIdx, endIdx);
%>

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
    <th>Url</th>

  </tr>
  <% for (Song song : songsToDisplay) { %>
  <tr>
    <td><%= song.getId() %></td>
    <td><%= song.getTitle() %></td>
    <td><%= song.getArtist() %></td>
    <td><%= song.getAlbum() %></td>
    <td><%= song.getUrl() %></td>
  </tr>
  <% } %>
</table>

<p>
  <% for (int pageNum = 1; pageNum <= totalPages; pageNum++) { %>
  <% if (pageNum == currentPage) { %>
  <%= pageNum %>
  <% } else { %>
  <a href="<%= request.getContextPath() %>/songs?page=<%= pageNum %>"><%= pageNum %></a>
  <% } %>
  <% } %>
</p>
</body>
</html>

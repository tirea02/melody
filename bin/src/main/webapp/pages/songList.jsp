<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.melody.model.SongSimple" %>

<%
  int currentPage = 1;
  int songsPerPage = 10;
  if (request.getParameter("page") != null) {
    currentPage = Integer.parseInt(request.getParameter("page"));
  }

  List<SongSimple> songSimples = (List<SongSimple>) request.getAttribute("songSimples");
  int totalSongs = songSimples.size();
  int totalPages = (int) Math.ceil((double) totalSongs / songsPerPage);

  int startIdx = (currentPage - 1) * songsPerPage;
  int endIdx = Math.min(startIdx + songsPerPage, totalSongs);
  List<SongSimple> songsToDisplay = songSimples.subList(startIdx, endIdx);
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
  <% for (SongSimple songSimple : songsToDisplay) { %>
  <tr>
    <td><%= songSimple.getId() %></td>
    <td><%= songSimple.getTitle() %></td>
    <td><%= songSimple.getArtist() %></td>
    <td><%= songSimple.getAlbum() %></td>
    <td><%= songSimple.getUrl() %></td>
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

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %></h1>
<br/>

<h1>Welcome to Melody App</h1>
<a href="${pageContext.request.contextPath}/pages/main.jsp">main</a>
<br>

<p>
  <a href="songs">View Song List</a>
</p>

<a href="hello-servlet">Hello Servlet</a>
<br>

<a href="TableScraperServlet">test table</a>
<br>
<br>
<br>
<a href="${pageContext.request.contextPath}/pages/register.jsp">Register Now</a>


<a href="download?id=31">play music</a>
<br>
<a href="pages/music-player.html">play music</a>

<br>
<a href="playSong?songId=1">세담 play song</a>
<br>

<br>
<a href="pages/miniPlaySong.jsp">세담 mini play song</a>
<br>

<br>

<a href="customPlaylist?playlistId=1">playlist 생성 test</a>

<br>

<br>

<form action="search" method="get">
  <label for="query">Enter Search Query:</label>
  <input type="text" id="mainSearchQuery" name="mainSearchQuery" required>
  <button type="submit">Search</button>
</form>

<br>


<h1>Ask Google BARD</h1>
<form action="pythonExecutor" method="get">
  <label for="question">Enter your question:</label><br>
  <textarea name="question" id="question" rows="4" cols="50"></textarea><br>
  <input type="submit" value="Submit">
</form>
<hr>
<div>
  <h2>Answer:</h2>
  <div id="answer">${answer}</div>
</div>

<h1>YouTube Link Extractor</h1>
<form action="youtube-crawler" method="get">
  <label for="query">Enter Search Query:</label>
  <input type="text" id="query" name="query" required>
  <button type="submit">Search</button>
</form>

<h2>First Video Link:</h2>
<p>${videoLink}</p>

<br>

<h1>Song data Extractor</h1>
<form action="playSongSimple" method="get">
  <label for="query">Enter Search Query:</label>
  <input type="text" id="melonQuery" name="melonQuery" required>
  <button type="submit">Search</button>
</form>

<h2>result of songSimple</h2>
<p>${songSimple}</p>

<br>
<a href="${pageContext.request.contextPath}/userDetail">user detail</a>

<br>
<a href="${pageContext.request.contextPath}/pages/login.jsp">login test</a>

<br>


<%--<h1>YouTube Crawler</h1>--%>
<%--<p>--%>
<%--  <a href="${pageContext.request.contextPath}/youtube-crawler">Get First YouTube Video Link</a>--%>
<%--</p>--%>
<%--<p>--%>
<%--  First video link: ${videoLink}--%>
<%--</p>--%>

</body>
</html>
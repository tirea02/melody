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


<p>
  <a href="songs">View Song List</a>
</p>

<a href="hello-servlet">Hello Servlet</a>
<br>


<a href="download?id=31">play music</a>
<br>
<a href="pages/music-player.html">play music</a>

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

</body>
</html>
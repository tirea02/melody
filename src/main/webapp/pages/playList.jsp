<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myLibrary</title>
</head>
<body>
	<h1>My playList</h1>
    <form action="${pageContext.request.contextPath}/createPlaylist" method="post">
        <input type="submit" value="Create MyList">
    </form>
    
    <br>
    
    <form action="${pageContext.request.contextPath}/deletePlaylist" method="post">
   	<input type="submit" value="Delete Mylist">
    </form>
    
    
</body>
</html>	
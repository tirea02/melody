<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="melody_db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	String songID = request.getParameter("songID");
	//int change = Integer.parseInt(request.getParameter("change"));
	
	//String updateLikesQuery = "UPDATE Song SET Likes = Likes + " + change + 
	String updateLikesQuery = "UPDATE Song SET Likes = Likes + 1 WHERE Song_ID = " + songID;
    ST.executeUpdate(updateLikesQuery); // 좋아요 업데이트

    // 업데이트된 좋아요 숫자를 응답으로 보냄
    String likesUpdateQuery = "SELECT Likes FROM Song WHERE Song_ID = " + songID;
    ST.executeUpdate(likesUpdateQuery);
    int updatedLikes = 0;
    RS = ST.executeQuery(likesUpdateQuery);
    if(RS.next()){
    	updatedLikes = RS.getInt("Likes");
    }
    out.print(updatedLikes);
    System.out.println(updatedLikes);
%>

<%
	//앨범 좋아요
    String albumID = request.getParameter("albumID");
    String updateQuery = "UPDATE Album SET Likes = Likes + 1 WHERE Album_ID = " + albumID;
    ST.executeUpdate(updateQuery);
%>
<script type="text/javascript">
	window.history.back();
</script>
</body>
</html>
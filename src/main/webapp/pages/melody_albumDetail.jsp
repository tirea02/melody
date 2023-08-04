<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="melody_db.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Album Detail</title>
<link rel="stylesheet" href="../css/melody_css.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script type="text/javascript" src="../js/melody_js.js"></script>
</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    let currentRating = 0; 
    updateStars(currentRating); 

    $("#ratingSlider").on("input", function() {
        currentRating = $(this).val();
        updateStars(currentRating); 
    });

    function updateStars(rating) {
        $(".rating_star").html("");
        for (let i = 0; i < 5; i++) {
            if (i < rating) {
                $(".rating_star").append("★");
            } else {
                $(".rating_star").append("☆");
            }
        }
        // 현재 평점을 업데이트
        $("#currentRating").text(rating);
    }
});
</script>

<body>
<div align="left">
<h3>앨범 정보</h3>
<%
String albumID = request.getParameter("albumID");
System.out.println("Album ID: " + albumID);
String albumDetail = "SELECT Album.Cover_Photo, Album.Album_Title, Singer.Singer_Name, Genre.Genre_Name, Album.Release_Date, Album.Album_Hashtags " +
        ", Song.Title, Album.Likes, Album.Rating FROM Album " +
		"INNER JOIN Song ON Album.Album_ID = Song.Album_ID "+
        "INNER JOIN Singer ON Song.Singer_ID = Singer.Singer_ID " +
        "LEFT JOIN Genre ON Song.Genre_ID = Genre.Genre_ID " +
        "WHERE Album.Album_ID = " + albumID;
RS = ST.executeQuery(albumDetail);
if(RS.next()){
	M_albumCover = RS.getString("Cover_Photo");
	M_albumTitle = RS.getString("Album_Title");
	M_singerName = RS.getString("Singer_Name");
	M_genreName = RS.getString("Genre_name");
	M_Release = RS.getDate("Release_Date");
	M_albumHashtag = RS.getString("Album_Hashtags");
	M_songTitle = RS.getString("Title");
	M_albumLikes = RS.getInt("Likes");
	M_albumRating = RS.getInt("Rating");
%>
<table border="0" cellspacing="0" cellpadding="10">
<tr>
	<td rowspan="4" align="center" >
		<a href="<%=M_albumCover %>">
			<img src="<%=M_albumCover %>" alt="앨범 사진">
		</a>
	</td>
	<td>앨범명 | <%=M_albumTitle %></td>
	<td rowspan="2" align="center">
		<button type="button" id="likeButton" class="album_Likes" onclick="click_Likes()">
			<i id="likeIcon" class="fa-regular fa-heart"></i>
			<p style="color: pink;"><%=M_albumLikes%></p>
		</button>
		<!--Album_ID, Likes -->
	</td>
</tr>

<tr><td>가수 | <%=M_singerName %> <!-- Singer_Name --></td></tr>
<tr>
	<td>장르 | <%=M_genreName %></td>
	<td rowspan="2" align="center">
		<div class="rating_box">
	    	<div class="rating">
	       		 <span class="rating_star"></span>
	       		 <input type="range" value="0" step="1" min="0" max="5" id="ratingSlider">
	       		 	    	<p id="rating_text">평점 ㅣ <%=M_albumRating %></p>
	   		 </div>
	    	<span id="currentRating"></span>
		</div>
		<!-- Album_ID, Rating -->
	</td>
</tr>
<tr><td>발매일 | <%=M_Release %></td></tr>
<!-- Album_ID, Release_Date -->
<tr>
	<!-- Album_ID, Album_Hashtags -->
	<th colspan="3">#<%=M_albumHashtag %></th>
</tr>
</table>
<%} else {
	System.out.println("앨범 정보가 잘못되었습니다. *albumID가 잘 전달되는지 확인!");
	} %>

<hr>
<h3>앨범 소개</h3>
<div>
	<%
	String infoList="SELECT Album_Info FROM Album WHERE Album_ID = " + albumID;
	
	RS = ST.executeQuery(infoList);
	if(RS.next()){
		M_albumInfo = RS.getString("Album_Info");
	%>
	<p><%=M_albumInfo%></p>
	<%} %>
</div>
<hr>
<h3>수록곡</h3>
<div>
	<!-- Song_ID, Album_ID, Title -->
<%
String songList = "SELECT ROWNUM AS RowNumber, Song_ID, Title FROM Song WHERE Album_ID = " + albumID;
RS = ST.executeQuery(songList);
int songNumber = 1;
while (RS.next() == true) {
    M_songTitle = RS.getString("Title");
    M_songID = RS.getInt("Song_ID"); // Song_ID 필드 가져오기
%>
<%= songNumber %>.  <a href="melody_songDetail.jsp?songID=<%=M_songID%>"target="_blank"><%= M_songTitle %></a> <br>
<%
    songNumber++;
} 
%>

<%
String videoList = "SELECT Music_Video_Link FROM Album WHERE Album_ID = "+albumID;

RS = ST.executeQuery(videoList);
while(RS.next()==true){
	M_videoURL = RS.getString("Music_Video_Link");

%>
<hr>
</div>
<h3>비디오</h3>
<div>
    <iframe src="<%=M_videoURL %>" title="YouTube video player"></iframe>
	<!-- Album_ID, Music_Video_Link -->
	
</div>
<%} %>
</div>
</body>
</html>
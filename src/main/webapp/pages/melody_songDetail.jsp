<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ include file="melody_db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Song Detail</title>
<link rel="stylesheet" href="../css/melody_css.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script type="text/javascript" src="../js/melody_js.js"></script>
</head>

<body>
<h3>곡 정보</h3>	<!-- 단독실행X -->
<%
String songID = request.getParameter("songID");
String songDetail = "SELECT Album.Cover_Photo, Album.Album_Title, Singer.Singer_Name, Song.Title AS Song_Title, Genre.Genre_Name, Album.Release_Date, Album.Album_Hashtags " +
        ", Song.Likes FROM Album " +
        "INNER JOIN Song ON Album.Album_ID = Song.Album_ID " +
        "INNER JOIN Singer ON Song.Singer_ID = Singer.Singer_ID " +
        "LEFT JOIN Genre ON Song.Genre_ID = Genre.Genre_ID " +
        "WHERE Song.Song_ID = " + songID;

RS = ST.executeQuery(songDetail);
if(RS.next()==true){
	M_albumCover = RS.getString("Cover_Photo");
	M_albumTitle = RS.getString("Album_Title");
	M_singerName = RS.getString("Singer_Name");
	M_songTitle = RS.getString("Song_Title");
	M_genreName = RS.getString("Genre_name");
	M_Release = RS.getDate("Release_Date");
	M_albumHashtag = RS.getString("Album_Hashtags");
	M_songLikes = RS.getInt("Likes");
%>
<table border="0" cellspacing="0" cellpadding="10">
<tr>
	<td rowspan="6" align="center">
		<a href="<%=M_albumCover %>">
			<img src="<%=M_albumCover %>" alt="앨범 사진">
		</a>
	</td>
	<td>앨범명 | <%=M_albumTitle %></td>
	<td rowspan="6" align="center">
	<script>
	function updateLikes(){
		String updateLikesQuery="UPDATE Song set Likes = " + click_Likes() + "WHERE Song_ID = " + songID;
		
		RS = ST.executeQuery(updateLikesQuery){
			M_songLikes = RS.getInt("Likes");
		}
	}
</script>
		<button type="button" id="likeButton" class="song_Likes" onclick="click_Likes()">
			<i id="likeIcon" class="fa-regular fa-heart"></i>
			<p style="color: pink;"><%=M_songLikes %></p>
		</button>
	</td>
</tr>

<tr><td>가수 | <%=M_singerName %></td></tr>
<tr><td></td></tr>
<tr><td> 곡 명 | <%=M_songTitle %></td></tr>
<tr><td>장르 | <%=M_genreName %></td></tr>
<tr><td>발매일 |<%=M_Release %></td></tr>

<tr>
	<th colspan="3">#<%=M_albumHashtag %></th>
</tr>
</table>
<hr>
<%}//while %>
<h3>재생횟수</h3>
<div>
	<%
		String countQuery = "SELECT Playlist_Count FROM Song WHERE Song_ID = " + songID;
		String videoQuery = "SELECT URL FROM Song WHERE Song_ID = " + songID;
		
		RS = ST.executeQuery(countQuery);
		if(RS.next()){
			M_musicCount = RS.getInt("Playlist_Count");
		}
		
		RS = ST.executeQuery(videoQuery);
		if(RS.next()){
			M_videoURL = RS.getString("URL");
		}
	%>
	<input type="text" readonly id="musicCount" value="<%=M_songTitle %>을(를) 들은 횟수는 총 <%=M_musicCount%> 번 입니다.">
	<!-- sql update 이용해서 count횟수 증가 -->
</div>
<hr>
<h3>PlayList</h3>
<div>
	이 곡이 포함된 플레이 리스트 입니다.
	<!-- Album_ID, Song_ID, Playlist_ID -->
</div>
<hr>
<h3>비디오</h3>
<div>
	<%
        if (M_videoURL != null && !M_videoURL.isEmpty()) {
    %>
        <iframe src="<%=M_videoURL%>" title="YouTube video player"></iframe>
    <%
        } else {
    %>
        <p>관련된 영상이 없습니다.</p>
    <%
        }
    %>
</div>

</body>
</html>
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
<h3>�� ����</h3>	<!-- �ܵ�����X -->
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
			<img src="<%=M_albumCover %>" alt="�ٹ� ����">
		</a>
	</td>
	<td>�ٹ��� | <%=M_albumTitle %></td>
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

<tr><td>���� | <%=M_singerName %></td></tr>
<tr><td></td></tr>
<tr><td> �� �� | <%=M_songTitle %></td></tr>
<tr><td>�帣 | <%=M_genreName %></td></tr>
<tr><td>�߸��� |<%=M_Release %></td></tr>

<tr>
	<th colspan="3">#<%=M_albumHashtag %></th>
</tr>
</table>
<hr>
<%}//while %>
<h3>���Ƚ��</h3>
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
	<input type="text" readonly id="musicCount" value="<%=M_songTitle %>��(��) ���� Ƚ���� �� <%=M_musicCount%> �� �Դϴ�.">
	<!-- sql update �̿��ؼ� countȽ�� ���� -->
</div>
<hr>
<h3>PlayList</h3>
<div>
	�� ���� ���Ե� �÷��� ����Ʈ �Դϴ�.
	<!-- Album_ID, Song_ID, Playlist_ID -->
</div>
<hr>
<h3>����</h3>
<div>
	<!-- Album_ID, Song_ID, Music_Video_Link -->
	<iframe src="<%=M_videoURL%>" title="YouTube video player"></iframe>
</div>

</body>
</html>
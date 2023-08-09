<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.melody.model.CustomPlaylist, com.melody.model.Song" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Custom Playlist</title>
    <!-- Add Bootstrap CSS link here -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Add any additional CSS for styling -->
    <style>
        /* Add your custom CSS styles here */
        body {
            padding: 100px;
        }
        .playlist-container {
            max-width: 600px;
            margin: 0 auto;
        }
        .song-details {
            background-color: #f8f9fa;
            padding: 10px;
            border: 1px solid #dee2e6;
            margin-bottom: 10px;
        }
        .song-title {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .play-button {
            display: block;
            margin-top: 10px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sortablejs@latest/Sortable.min.js"></script>
	<script>
		let contextPath = '<%= request.getContextPath() %>';
	</script>
</head>
<body>
<div id="playlist-container">
<!--
    <h1	>Custom Playlist Details</h1>
-->
    <c:if test="${customPlaylist != null}">
    
    	<!--
        <h2 style="display:inline">Playlist ID: ${customPlaylist.playlistId}</h2>
        <a href="<%= request.getContextPath() %>/DeletePlaylist?playlistId=${customPlaylist.playlistId}">플레이리스트 삭제</a>
        <h2>Playlist Name: ${customPlaylist.playlistName}</h2>
        -->

		<div class="card text-center">
		  <div class="card-header">
		    <h1	>Custom Playlist Details</h1>
		  </div>
		  <div class="card-body">
		    <p class="card-text">Playlist Name: ${customPlaylist.playlistName}</p>
		  </div>
		  <div class="card-footer text-body-secondary">
		    <a href="<%= request.getContextPath() %>/DeletePlaylist?playlistId=${customPlaylist.playlistId}" class="btn btn-dark">플레이리스트 삭제</a>
		  </div>
		</div>
		<p></p>
		
		<div class="card text-center">
			<div class="card-body">
				<h3>Songs:</h3>
			</div>
		</div>
		<p></p>

		<!--
			<h3>Songs:</h3>
		-->
        <c:forEach items="${customPlaylist.songs}" var="song" varStatus="loop">
            <div class="song-details" id="song-${song.songId}">
            	<p><h3>${song.title}</h3></p>
            	<p><h5>${song.songInfo}</h5></P>
            	<!--
                <p>Song ID: ${song.songId}</p>
                <p>Title: ${song.title}</p>
                <p>Singer ID: ${song.singerId}</p>
                <p>URL: ${song.url}</p>
                -->
                <button type="button" class="btn btn-dark"><a href="${pageContext.request.contextPath}/playSong?songId=${song.songId}">Play Song</a> &nbsp&nbsp
                </button>
				<button id="delete-song-btn" type="button" class="btn btn-warning delete-song" data-playlist-id="${customPlaylist.playlistId}" data-song-id="${song.songId}"> 곡 삭제
				</button>
                <hr>
            </div>
        </c:forEach>
    </c:if>
</div>



<script src="${pageContext.request.contextPath}/js/customPlaylist.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My PlayList</title>
</head>
<script>
	function createPlaylist_window(){
		window.open("inputPlaylist.jsp", "Create MyPlayList",
				"width=400, height=300, top=50, left=50 ");
	}
</script>
<body>

	<h1>My PlayList</h1>
	
	<input type="button" value="내 플레이리스트 만들기" onclick="createPlaylist_window();">
    
	<c:forEach items="${sessionScope.customPlaylists}" var="playlist">
		<div class="myplaylist">
				<a href="<c:url value='/customPlaylist'>
                	<c:param name='playlistId' value='${playlist.playlistId}' />
                    </c:url>">
                    <h1>${customPlaylist.playlistName}</h1>
				</a>
		</div>

		<div class="myplaylist-delete">
			<a href="<c:url value='/DeletePlaylist'>
                    <c:param name='playlistId' value='${playlist.playlistId}' />
                	</c:url>">
				<input type="button" value="Delete myPlayList">
			</a>
		</div>
	</c:forEach>
	
</body>
</html>
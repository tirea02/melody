<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL Import -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>MyPlayList</h1>
    <a href="${pageContext.request.contextPath}/pages/customPlaylistAddPlaylist.jsp">Create MyList</a>

	<c:forEach items="${sessionScope.customPlaylists}" var="playlist">
		<div class="myplaylist">
				<a href="<c:url value='/customPlaylist'>
                	<c:param name='playlistId' value='${playlist.playlistId}' />
                    </c:url>">
                    <h1>플레이리스트들</h1>
				</a>
		</div>
		
		<div class="myplaylistAddSong">
			<a href="<c:url value='/CustomPlaylistaddSong'>
				<c:param name='playlistId' value='${playlist.playlistId}' />
				</c:url>">
				<h6>곡추가</h6>
			</a>
		</div>


		<div class="myplaylist-delete">
			<a href="<c:url value='/CustomPlaylistDelete'>
                    <c:param name='playlistId' value='${playlist.playlistId}' />
                	</c:url>">
				<input type="button" value="myPlaylist delete">
			</a>
		</div>
	</c:forEach>




</body>
</html>
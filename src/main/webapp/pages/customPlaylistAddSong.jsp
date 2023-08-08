<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.melody.model.CustomPlaylist, com.melody.model.Song" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>플레이리스트에 추가</h1>
	<c:if test="${customPlaylist != null }">
		<c:forEach items="${sessionScope.customPlaylists}" var="playlist">
			<div class="myplaylist">
				<a href="<c:url value='/customPlaylist'>
                	<c:param name='playlistId' value='${playlist.playlistId}' />
                    </c:url>">
                    <h2>Playlist ID: ${customPlaylist.playlistId}</h2>
				</a>
			</div>
		</c:forEach>
	</c:if>
</body>
</html>
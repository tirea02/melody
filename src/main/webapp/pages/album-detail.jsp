<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Album Detail</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/melody_css.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // Add your JavaScript code here
    </script>
</head>
<body>
<div align="left">
    <h3>앨범 정보</h3>
    <c:if test="${not empty album}">
        <table border="0" cellspacing="0" cellpadding="10">
            <tr>
                <td rowspan="4" align="center" >
                    <a href="${album.coverPhoto}">
                        <img src="${album.coverPhoto}" alt="앨범 사진">
                    </a>
                </td>
                <td>앨범명 | ${album.albumTitle}</td>
                <td rowspan="2" align="center">
                    <button type="button" id="likeButton" class="album_Likes" onclick="click_Likes()">
                        <i id="likeIcon" class="fa-regular fa-heart"></i>
                        <p style="color: pink;">${album.likes}</p>
                    </button>
                    <!--Album_ID, Likes -->
                </td>
            </tr>

            <tr>
                <td>가수 | ${album.singerName} <!-- Singer_Name --></td>
            </tr>
            <tr>
                <td>장르 | ${album.genre}</td>
                <td rowspan="2" align="center">
                    <div class="rating_box">
                        <div class="rating">
                            <span class="rating-star"></span>
                            <input id="rating-input" type="range" value="0" step="1" min="0" max="5" >
                            <p id="rating_text">평점 ㅣ ${album.rating}</p>
                        </div>
                        <span id="currentRating"></span>
                    </div>
                    <!-- Album_ID, Rating -->
                </td>
            </tr>
            <tr><td>발매일 | ${album.releaseDate}</td></tr>
            <!-- Album_ID, Release_Date -->
            <tr>
                <!-- Album_ID, Album_Hashtags -->
                <th colspan="3">#${album.albumHashtags}</th>
            </tr>
        </table>
    </c:if>

    <hr>
    <h3>앨범 소개</h3>
    <c:if test="${not empty album}">
        <div>
            <p>${album.albumInfo}</p>
        </div>
    </c:if>
    <hr>
    <h3>수록곡</h3>
    <c:if test="${not empty songs}">
        <div>
            <c:forEach items="${songs}" var="song" varStatus="status">
                ${status.index + 1}. <a href="${pageContext.request.contextPath}/songDetail?songID=${song.songId}" target="_blank">${song.title}</a> <br>
            </c:forEach>
        </div>
    </c:if>
    <hr>
    <h3>비디오</h3>
<%--    <c:if test="${not empty videoURLs}">--%>
<%--        <div>--%>
<%--            <c:forEach items="${videoURLs}" var="videoURL">--%>
<%--                <iframe src="${videoURL}" title="YouTube video player"></iframe>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>
<%--    </c:if>--%>

    <!-- Add the rest of your JSP code here -->

</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/melody_js.js"></script>
</body>
</html>

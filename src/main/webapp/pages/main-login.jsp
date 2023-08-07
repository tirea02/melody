<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Title -->
  <title>Melody</title>
  <!-- jQuery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- slick slider -->
  <script src="../js/slick.min.js"></script>
  <link rel="stylesheet" href="../css/slick-theme.css">
  <link rel="stylesheet" href="../css/slick.css">
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- Custom Css & Js -->
  <link rel="stylesheet" href="../css/main-login-style.css">
  <script src="../js/main-login-custom.js"></script>
  <!-- Favicon -->
  <link rel="icon" href="../resources/images/Favicon.png">
</head>
<body>
    
  <div class="container">
    <!-- Header -->
    <header>
      <div class="header-inner">
          <div class="banner">
            <div class="logo">
              <a href="#">
                <!-- <img src="../resources/images/Logo.png"> -->
              </a>
            </div>
            <div class="lnb">
              <c:if test="${not empty userAccount}">
               <p>${userAccount.name}님 환영합니다. </p>
              </c:if>
              <a href="#none">LOGOUT</a>
              <a href="${pageContext.request.contextPath}/pages/userDetail.jsp">MY PAGE</a>
              <div class="darkmode"></div>
            </div>
          </div>
          <nav>
            <div class="sub-lnb">
              <input type="search">
            </div>
            <div class="gnb">
              <a href="#myplaylist">MyPlayList</a>
              <a href="#tag-song">Tag Song</a>
              <a href="#musicvideo">Music Video</a>
            </div>
          </nav>
      </div>
    </header>

    <!-- Section : my playlist -->
    <section class="myplaylist" id="myplaylist">
      <div class="section-inner">
        <div class="section-header">
          <h2 class="content-heading">
            <b>My Playlist</b>
            
            <form action="${pageContext.request.contextPath}/CustomPlaylistInsert" method="post">
                <input type="submit" value="Create MyList">
            </form>
            
			  <c:forEach items="${sessionScope.customPlaylists}" var="playlist">
                  <div class="myplaylist-delete">
                        <a href="<c:url value='/CustomPlaylistDelete'>
                            <c:param name='playlistId' value='${playlist.playlistId}' />
                        	</c:url>">
                  			<input type="button" value="playlist">
                  		</a>
                  </div>
              </c:forEach>
              
          </h2>
        </div>
        <div class="myplaylist-inner">
          <div class="myplaylist-slider">
            <c:forEach items="${sessionScope.customPlaylists}" var="playlist">
            <div class="myplaylist-items">        
              <c:forEach items="${playlist.songs}" var="song">
                <div class="myplaylist-item">
                  <a href="<c:url value='/customPlaylist'>
                            <c:param name='playlistId' value='${playlist.playlistId}' />
                        </c:url>">
                    <div class="myplaylist-img-inner">
                      <p></p>
                    </div>
                  </a>
                  <div class="myplaylist-text">
                    <span>${playlist.playlistName}</span>
                  </div>
                </div>
            </c:forEach>
          </div>
          </c:forEach>
        </div>
      </div>
    </div>

  </section>

    <!-- Section : #Tag song -->
  <
    <section class="tag-song" id="tag-song">
      <div class="section-inner">
        <div class="section-header">
          <h2 class="content-heading">
            <b>#OO</b>
             곡과 비슷한 곡
          </h2>
          <div class="more-btn">
            <a href="#">More</a>
          </div>
        </div>
        <div class="tag-song-tab-inner">
          <div class="tag-song-items">
            <div class="tag-song-item">
              <div class="tag-song-content">
                <table class="tag-song-table">
                  <tr>
                    <th>곡</th>
                    <th>아티스트</th>
                    <th>재생</th>
                    <th>추가</th>
                  </tr>
                  <tr>
                    <td>
                      <div class="tag-song-info">
                        <a href="#">
                          <div class="tag-song-img-inner">
                            <img src="../resources/images/MockupsUpImg.png">
                          </div>
                          <div class="tag-song-name">
                            <span>
                              Dance The Night Away
                            </span>
                          </div>
                        </a>
                      </div>
                    </td>
                    <td>
                      <p>
                        TWICE (트와이스)
                      </p>
                    </td>
                    <td>
                      <a href="#" class="tag-song-play"><i class="bi bi-play-fill"></i></a>
                    </td>
                    <td>
                      <a href="#" class="tag-song-plus"><i class="bi bi-plus"></i></a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="tag-song-info">
                        <a href="#">
                          <div class="tag-song-img-inner">
                            <img src="../resources/images/MockupsUpImg.png">
                          </div>
                          <div class="tag-song-name">
                            <span>
                              Dance The Night Away
                            </span>
                          </div>
                        </a>
                      </div>
                    </td>
                    <td>
                      <p>
                        TWICE (트와이스)
                      </p>
                    </td>
                    <td>
                      <a href="#" class="tag-song-play"><i class="bi bi-play-fill"></i></a>
                    </td>
                    <td>
                      <a href="#" class="tag-song-plus"><i class="bi bi-plus"></i></a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="tag-song-info">
                        <a href="#">
                          <div class="tag-song-img-inner">
                            <img src="../resources/images/MockupsUpImg.png">
                          </div>
                          <div class="tag-song-name">
                            <span>
                              Dance The Night Away
                            </span>
                          </div>
                        </a>
                      </div>
                    </td>
                    <td>
                      <p>
                        TWICE (트와이스)
                      </p>
                    </td>
                    <td>
                      <a href="#" class="tag-song-play"><i class="bi bi-play-fill"></i></a>
                    </td>
                    <td>
                      <a href="#" class="tag-song-plus"><i class="bi bi-plus"></i></a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="tag-song-info">
                        <a href="#">
                          <div class="tag-song-img-inner">
                            <img src="../resources/images/MockupsUpImg.png">
                          </div>
                          <div class="tag-song-name">
                            <span>
                              Dance The Night Away
                            </span>
                          </div>
                        </a>
                      </div>
                    </td>
                    <td>
                      <p>
                        TWICE (트와이스)
                      </p>
                    </td>
                    <td>
                      <a href="#" class="tag-song-play"><i class="bi bi-play-fill"></i></a>
                    </td>
                    <td>
                      <a href="#" class="tag-song-plus"><i class="bi bi-plus"></i></a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="tag-song-info">
                        <a href="#">
                          <div class="tag-song-img-inner">
                            <img src="../resources/images/MockupsUpImg.png">
                          </div>
                          <div class="tag-song-name">
                            <span>
                              Dance The Night Away
                            </span>
                          </div>
                        </a>
                      </div>
                    </td>
                    <td>
                      <p>
                        TWICE (트와이스)
                      </p>
                    </td>
                    <td>
                      <a href="#" class="tag-song-play"><i class="bi bi-play-fill"></i></a>
                    </td>
                    <td>
                      <a href="#" class="tag-song-plus"><i class="bi bi-plus"></i></a>
                    </td>
                  </tr>
                </table>
                <div class="table-btn">
                  <a href="#">1</a>
                  <a href="#">2</a>
                  <a href="#">3</a>
                  <a href="#">4</a>
                  <a href="#">5</a>
                  <a href="#">6</a>
                  <a href="#">7</a>
                  <a href="#">8</a>
                  <a href="#">9</a>
                  <a href="#">10</a>
                  <a href="#">></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </section>

    <!-- Section : MusicVideo -->
    <section class="musicvideo" id="musicvideo">
      <div class="section-inner">
        <div class="section-header">
          <h2 class="content-heading">
            <b>My List</b>
            Music Video
          </h2>
        </div>
        <div class="musicvideo-inner">
          <div class="musicvideo-slider">
            <div class="musicvideo-items">
              <div class="musicvideo-item">
                <a href="#">
                  <div class="musicvideo-img-inner">
                    <img src="../resources/images/MockupsUpVideo.png">
                  </div>
                  <div class="musicvideo-text">
                    <span>TWICE (트와이스)</span>
                  </div>
                </a>
              </div>
              <div class="musicvideo-item">
                <a href="#">
                  <div class="musicvideo-img-inner">
                    <img src="../resources/images/MockupsUpVideo.png">
                  </div>
                  <div class="musicvideo-text">
                    <span>TWICE (트와이스)</span>
                  </div>
                </a>
              </div>
              <div class="musicvideo-item">
                <a href="#">
                  <div class="musicvideo-img-inner">
                    <img src="../resources/images/MockupsUpVideo.png">
                  </div>
                  <div class="musicvideo-text">
                    <span>TWICE (트와이스)</span>
                  </div>
                </a>
              </div>
              <div class="musicvideo-item">
                <a href="#">
                  <div class="musicvideo-img-inner">
                    <img src="../resources/images/MockupsUpVideo.png">
                  </div>
                  <div class="musicvideo-text">
                    <span>TWICE (트와이스)</span>
                  </div>
                </a>
              </div>
            </div>
            <div class="musicvideo-items">
              <div class="musicvideo-item">
                <a href="#">
                  <div class="musicvideo-img-inner">
                    <img src="../resources/images/MockupsUpVideo.png">
                  </div>
                  <div class="musicvideo-text">
                    <span>TWICE (트와이스)</span>
                  </div>
                </a>
              </div>
              <div class="musicvideo-item">
                <a href="#">
                  <div class="musicvideo-img-inner">
                    <img src="../resources/images/MockupsUpVideo.png">
                  </div>
                  <div class="musicvideo-text">
                    <span>TWICE (트와이스)</span>
                  </div>
                </a>
              </div>
              <div class="musicvideo-item">
                <a href="#">
                  <div class="musicvideo-img-inner">
                    <img src="../resources/images/MockupsUpVideo.png">
                  </div>
                  <div class="musicvideo-text">
                    <span>TWICE (트와이스)</span>
                  </div>
                </a>
              </div>
              <div class="musicvideo-item">
                <a href="#">
                  <div class="musicvideo-img-inner">
                    <img src="../resources/images/MockupsUpVideo.png">
                  </div>
                  <div class="musicvideo-text">
                    <span>TWICE (트와이스)</span>
                  </div>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Chat-Helper -->
    <div class="chat-helper-icon">
      <button class="chat-helper-start">
        <img class="chat-helper-img" src="../resources/images/chat-helper.png">
      </button>
    </div>
    <div class="chat-helper-main">
      <form class="chat-helper-inner">
        <div class="helper-text">
        </div>
        <div class="user-text">
          <textarea cols="100%" rows="4" class="user-chat"></textarea>
          <button type="submit" class="helper-send">Send</button>
        </div>
      </form>
    </div>

    <!-- Footer -->
    <footer>
      <div class="footer-inner">
        <div class="footer-logo">
          <img src="../resources/images/Footerlogo.png" alt="#none">
        </div>
        <div class="copyright">
          <div class="service">
            <p>
              Service center : 111 - 1111
              <span>
                Weekdays: 09:00 am to 6:00 pm<br>
                Lunch time: 12:00 am to 1:00 pm Closed<br>
                on Sat/Sun/Holidays
              </span>
            </p>
          </div>
          <div class="service-text">
            <div>
              <span>About Us</span>
              <span>Terms of service</span>
              <span>Privacy Statement</span>
              <span>Information Use</span>
            </div>
            <div class="sns">
              <a href="#none"><i class="xi-facebook"></i></a>
              <a href="#none"><i class="xi-instagram"></i></a>
              <a href="#none"><i class="xi-twitter"></i></a>
              <a href="#none"><i class="xi-youtube-play"></i></a>
            </div>
          </div>
        </div>
        <div class="sub-text">
          <p>
            Copyright © Music Streaming . All rights reserved.<br>
            We provide services by subscribing to payment purchase safety (escrow) for safe transactions.
          </p>
        </div>
      </div>
    </footer>
  </div>

</body>
</html>

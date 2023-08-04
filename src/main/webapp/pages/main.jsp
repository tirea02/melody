<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
  <link rel="stylesheet" href="../css/main-style.css">
  <script src="../js/main-custom.js"></script>
  <!-- Favicon -->
  <link rel="icon" href="../resources/images/Favicon.png">
  <script>
    let contextPath = '<%= request.getContextPath() %>';
  </script>
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
              <a href="${pageContext.request.contextPath}/pages/login.jsp">LOGIN</a>
              <a href="${pageContext.request.contextPath}/pages/register.jsp">SIGN UP</a>
              <div class="darkmode"></div>
            </div>
          </div>
          <nav>
            <div class="sub-lnb">
              <input type="search">
            </div>
            <div class="gnb">
              <a href="#season">Season</a>
              <a href="#best">Best</a>
              <a href="#new">New</a>
              <a href="#genre">Genre</a>
              <a href="#artist">Artist</a>
              <a href="#musicvideo">Music Video</a>
            </div>
          </nav>
      </div>
    </header>

    <!-- Section : Season -->
    <section class="season" id="season">
      <div class="section-inner">
        <div class="season-inner">
          <div class="season-slider">
            <div class="season-item">
              <a href="#" class="season-slide">
                <div class="season-text">
                  <span>여름노래 기강잡는 <br>추억의 썸머송</span>
                  <p>총 10곡 <b> | </b> #summer</p>
                  <i class="bi bi-play-fill"></i>
                </div>
                <div class="season-list">
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </a>
            </div>
            <div class="season-item season-item2">
              <a href="#" class="season-slide">
                <div class="season-text">
                  <span>나른한 오후에 즐기는 <br>피크닉 타임</span>
                  <p>총 10곡 <b> | </b> #healing</p>
                  <i class="bi bi-play-fill"></i>
                </div>
                <div class="season-list">
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </a>
            </div>
            <div class="season-item season-item3">
              <a href="#" class="season-slide">
                <div class="season-text">
                  <span>비 오는 날<br>여유를 즐기고 싶다면</span>
                  <p>총 10곡 <b> | </b> #summer</p>
                  <i class="bi bi-play-fill"></i>
                </div>
                <div class="season-list">
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </a>
            </div>
            <div class="season-item season-item4">
              <a href="#" class="season-slide">
                <div class="season-text">
                  <span>여행 떠나기 전 <br>챙겨야 할 노래집</span>
                  <p>총 10곡 <b> | </b> #summer</p>
                  <i class="bi bi-play-fill"></i>
                </div>
                <div class="season-list">
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </a>
            </div>
            <div class="season-item season-item5">
              <a href="#" class="season-slide">
                <div class="season-text">
                  <span>운동할 때 내적댄스 <br>유발하는곡</span>
                  <p>총 10곡 <b> | </b> #summer</p>
                  <i class="bi bi-play-fill"></i>
                </div>
                <div class="season-list">
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="../resources/images/MockupsUpImg.png">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Dance The Night Away</span>
                          TWICE (트와이스)
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Section : Best -->
    <section class="best" id="best">
      <div class="section-inner">
        <div class="section-header">
          <h2 class="content-heading">
            <b>Best</b>
            Music
          </h2>
          <div class="more-btn">
            <a href="#">More</a>
          </div>
        </div>
        <div class="best-tab-inner">
          <div class="best-btn-tab">
            <a href="#none" class="active">Top 100</a>
            <a href="#none">Hot 100</a>
            <a href="#none">Daily</a>
            <a href="#none">Monthly</a>
          </div>
          <div class="best-tabs">
            <div class="best-tab1">
              <div class="best-item">
                <table class="best-table">
                  <tr>
                    <th>순위</th>
                    <th>곡</th>
                    <th>아티스트</th>
                    <th>재생</th>
                    <th>추가</th>
                  </tr>
                  <tr>
                    <td>
                      <p>1</p>
                    </td>
                    <td>
                      <div class="best-song-info">
                        <a href="#">
                          <div class="best-img-inner">
                            <img src="../resources/images/MockupsUpImg.png">
                          </div>
                          <div class="best-song-name">
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
                      <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                    </td>
                    <td>
                      <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <p>2</p>
                    </td>
                    <td>
                      <div class="best-song-info">
                        <a href="#">
                          <div class="best-img-inner">
                            <img src="../resources/images/MockupsUpImg.png">
                          </div>
                          <div class="best-song-name">
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
                      <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                    </td>
                    <td>
                      <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <p>3</p>
                    </td>
                    <td>
                      <div class="best-song-info">
                        <a href="#">
                          <div class="best-img-inner">
                            <img src="../resources/images/MockupsUpImg.png">
                          </div>
                          <div class="best-song-name">
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
                      <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                    </td>
                    <td>
                      <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <p>4</p>
                    </td>
                    <td>
                      <div class="best-song-info">
                        <a href="#">
                          <div class="best-img-inner">
                            <img src="../resources/images/MockupsUpImg.png">
                          </div>
                          <div class="best-song-name">
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
                      <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                    </td>
                    <td>
                      <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <p>5</p>
                    </td>
                    <td>
                      <div class="best-song-info">
                        <a href="#">
                          <div class="best-img-inner">
                            <img src="../resources/images/MockupsUpImg.png">
                          </div>
                          <div class="best-song-name">
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
                      <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                    </td>
                    <td>
                      <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
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
            <div class="best-tab2">
              <table class="best-table">
                <tr>
                  <th>순위</th>
                  <th>곡</th>
                  <th>아티스트</th>
                  <th>재생</th>
                  <th>추가</th>
                </tr>
                <tr>
                  <td>
                    <p>1</p>
                  </td>
                  <td>
                    <div class="best-song-info">
                      <a href="#">
                        <div class="best-img-inner">
                          <img src="../resources/images/MockupsUpImg.png">
                        </div>
                        <div class="best-song-name">
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
                    <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                  </td>
                  <td>
                    <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p>2</p>
                  </td>
                  <td>
                    <div class="best-song-info">
                      <a href="#">
                        <div class="best-img-inner">
                          <img src="../resources/images/MockupsUpImg.png">
                        </div>
                        <div class="best-song-name">
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
                    <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                  </td>
                  <td>
                    <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p>3</p>
                  </td>
                  <td>
                    <div class="best-song-info">
                      <a href="#">
                        <div class="best-img-inner">
                          <img src="../resources/images/MockupsUpImg.png">
                        </div>
                        <div class="best-song-name">
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
                    <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                  </td>
                  <td>
                    <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p>4</p>
                  </td>
                  <td>
                    <div class="best-song-info">
                      <a href="#">
                        <div class="best-img-inner">
                          <img src="../resources/images/MockupsUpImg.png">
                        </div>
                        <div class="best-song-name">
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
                    <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                  </td>
                  <td>
                    <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p>5</p>
                  </td>
                  <td>
                    <div class="best-song-info">
                      <a href="#">
                        <div class="best-img-inner">
                          <img src="../resources/images/MockupsUpImg.png">
                        </div>
                        <div class="best-song-name">
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
                    <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                  </td>
                  <td>
                    <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
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
            <div class="best-tab3">
              <table class="best-table">
                <tr>
                  <th>순위</th>
                  <th>곡</th>
                  <th>아티스트</th>
                  <th>재생</th>
                  <th>추가</th>
                </tr>
                <tr>
                  <td>
                    <p>1</p>
                  </td>
                  <td>
                    <div class="best-song-info">
                      <a href="#">
                        <div class="best-img-inner">
                          <img src="../resources/images/MockupsUpImg.png">
                        </div>
                        <div class="best-song-name">
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
                    <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                  </td>
                  <td>
                    <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p>2</p>
                  </td>
                  <td>
                    <div class="best-song-info">
                      <a href="#">
                        <div class="best-img-inner">
                          <img src="../resources/images/MockupsUpImg.png">
                        </div>
                        <div class="best-song-name">
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
                    <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                  </td>
                  <td>
                    <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p>3</p>
                  </td>
                  <td>
                    <div class="best-song-info">
                      <a href="#">
                        <div class="best-img-inner">
                          <img src="../resources/images/MockupsUpImg.png">
                        </div>
                        <div class="best-song-name">
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
                    <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                  </td>
                  <td>
                    <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p>4</p>
                  </td>
                  <td>
                    <div class="best-song-info">
                      <a href="#">
                        <div class="best-img-inner">
                          <img src="../resources/images/MockupsUpImg.png">
                        </div>
                        <div class="best-song-name">
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
                    <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                  </td>
                  <td>
                    <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p>5</p>
                  </td>
                  <td>
                    <div class="best-song-info">
                      <a href="#">
                        <div class="best-img-inner">
                          <img src="../resources/images/MockupsUpImg.png">
                        </div>
                        <div class="best-song-name">
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
                    <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                  </td>
                  <td>
                    <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
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
            <div class="best-tab4">
              <table class="best-table">
                <tr>
                  <th>순위</th>
                  <th>곡</th>
                  <th>아티스트</th>
                  <th>재생</th>
                  <th>추가</th>
                </tr>
                <tr>
                  <td>
                    <p>1</p>
                  </td>
                  <td>
                    <div class="best-song-info">
                      <a href="#">
                        <div class="best-img-inner">
                          <img src="../resources/images/MockupsUpImg.png">
                        </div>
                        <div class="best-song-name">
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
                    <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                  </td>
                  <td>
                    <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p>2</p>
                  </td>
                  <td>
                    <div class="best-song-info">
                      <a href="#">
                        <div class="best-img-inner">
                          <img src="../resources/images/MockupsUpImg.png">
                        </div>
                        <div class="best-song-name">
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
                    <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                  </td>
                  <td>
                    <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p>3</p>
                  </td>
                  <td>
                    <div class="best-song-info">
                      <a href="#">
                        <div class="best-img-inner">
                          <img src="../resources/images/MockupsUpImg.png">
                        </div>
                        <div class="best-song-name">
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
                    <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                  </td>
                  <td>
                    <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p>4</p>
                  </td>
                  <td>
                    <div class="best-song-info">
                      <a href="#">
                        <div class="best-img-inner">
                          <img src="../resources/images/MockupsUpImg.png">
                        </div>
                        <div class="best-song-name">
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
                    <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                  </td>
                  <td>
                    <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
                  </td>
                </tr>
                <tr>
                  <td>
                    <p>5</p>
                  </td>
                  <td>
                    <div class="best-song-info">
                      <a href="#">
                        <div class="best-img-inner">
                          <img src="../resources/images/MockupsUpImg.png">
                        </div>
                        <div class="best-song-name">
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
                    <a href="#" class="best-play"><i class="bi bi-play-fill"></i></a>
                  </td>
                  <td>
                    <a href="#" class="best-plus"><i class="bi bi-plus"></i></a>
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
    </section>

    <!-- Section :  New -->
    <section class="new" id="new">
      <div class="section-inner">
        <div class="section-header">
          <h2 class="content-heading">
            <b>New</b>
            Music
          </h2>
        </div>
        <div class="new-inner">
          <div class="new-slider">
            <div class="new-items">
              <div class="new-item">
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
              </div>
              <div class="new-item">
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
              </div>
            </div>
            <div class="new-items">
              <div class="new-item">
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
              </div>
              <div class="new-item">
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
              </div>
            </div>
            <div class="new-items">
              <div class="new-item">
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
              </div>
              <div class="new-item">
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="../resources/images/MockupsUpImg.png">
                    </div>
                    <div class="new-text">
                      <span>TWICE (트와이스)</span>
                      <p>Dance The Night Away</p>
                    </div>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Section : Genre -->
    <section class="genre" id="genre">
      <div class="section-inner">
        <div class="section-header">
          <h2 class="content-heading">
            <b>Genre</b>
            Music
          </h2>
          <div class="more-btn">
            <a href="#">More</a>
          </div>
        </div>
        <div class="genre-tab-inner">
          <div class="genre-btn-tab">
            <a href="#none" class="active">Dance</a>
            <a href="#none">Ballad</a>
            <a href="#none">POP</a>
            <a href="#none">ROCK</a>
            <a href="#none">R&B</a>
            <a href="#none">Hip Hop</a>
          </div>
          <div class="genre-tabs">
            <div class="genre-tab1">
              <table class="genre-table">
                <tr>
                  <th>순위</th>
                  <th>곡</th>
                  <th>아티스트</th>
                  <th>재생</th>
                  <th>추가</th>
                </tr>

              </table>
              <div class="table-btn pagination">

              </div>
            </div>
            <div class="genre-tab2">
              <table class="genre-table">
                <tr>
                  <th>순위</th>
                  <th>곡</th>
                  <th>아티스트</th>
                  <th>재생</th>
                  <th>추가</th>
                </tr>
              </table>
              <div class="table-btn">

              </div>
            </div>
            <div class="genre-tab3">
              <table class="genre-table">
                <tr>
                  <th>순위</th>
                  <th>곡</th>
                  <th>아티스트</th>
                  <th>재생</th>
                  <th>추가</th>
                </tr>
              </table>
              <div class="table-btn">

              </div>
            </div>
            <div class="genre-tab4">
              <table class="genre-table">
                <tr>
                  <th>순위</th>
                  <th>곡</th>
                  <th>아티스트</th>
                  <th>재생</th>
                  <th>추가</th>
                </tr>
              </table>
              <div class="table-btn">
              </div>
            </div>

            <div class="genre-tab5">
              <table class="genre-table">
                <tr>
                  <th>순위</th>
                  <th>곡</th>
                  <th>아티스트</th>
                  <th>재생</th>
                  <th>추가</th>
                </tr>
              </table>
              <div class="table-btn">
              </div>
            </div>

            <div class="genre-tab6">
              <table class="genre-table">
                <tr>
                  <th>순위</th>
                  <th>곡</th>
                  <th>아티스트</th>
                  <th>재생</th>
                  <th>추가</th>
                </tr>
              </table>
              <div class="table-btn">
              </div>
            </div>


          </div>
        </div>
      </div>
    </section>

    <!-- Section : Artist -->
    <section class="artist" id="artist">
      <div class="section-inner">
        <div class="section-header">
          <h2 class="content-heading">
            <b>Artist</b>
          </h2>
        </div>
        <div class="artist-inner">
          <div class="artist-slider">
            <div class="artist-items">
              <div class="artist-item">
                <a href="#">
                  <div class="artist-img-inner">
                    <img src="../resources/images/MockupsUpImg.png">
                  </div>
                  <div class="artist-text">
                    <span>TWICE (트와이스)</span>
                  </div>
                </a>
              </div>
              <div class="artist-item">
                <a href="#">
                  <div class="artist-img-inner">
                    <img src="../resources/images/MockupsUpImg.png">
                  </div>
                  <div class="artist-text">
                    <span>TWICE (트와이스)</span>
                  </div>
                </a>
              </div>
              <div class="artist-item">
                <a href="#">
                  <div class="artist-img-inner">
                    <img src="../resources/images/MockupsUpImg.png">
                  </div>
                  <div class="artist-text">
                    <span>TWICE (트와이스)</span>
                  </div>
                </a>
              </div>
              <div class="artist-item">
                <a href="#">
                  <div class="artist-img-inner">
                    <img src="../resources/images/MockupsUpImg.png">
                  </div>
                  <div class="artist-text">
                    <span>TWICE (트와이스)</span>
                  </div>
                </a>
              </div>
            </div>
            <div class="artist-items">
              <div class="artist-item">
                <a href="#">
                  <div class="artist-img-inner">
                    <img src="../resources/images/MockupsUpImg.png">
                  </div>
                  <div class="artist-text">
                    <span>TWICE (트와이스)</span>
                  </div>
                </a>
              </div>
              <div class="artist-item">
                <a href="#">
                  <div class="artist-img-inner">
                    <img src="../resources/images/MockupsUpImg.png">
                  </div>
                  <div class="artist-text">
                    <span>TWICE (트와이스)</span>
                  </div>
                </a>
              </div>
              <div class="artist-item">
                <a href="#">
                  <div class="artist-img-inner">
                    <img src="../resources/images/MockupsUpImg.png">
                  </div>
                  <div class="artist-text">
                    <span>TWICE (트와이스)</span>
                  </div>
                </a>
              </div>
              <div class="artist-item">
                <a href="#">
                  <div class="artist-img-inner">
                    <img src="../resources/images/MockupsUpImg.png">
                  </div>
                  <div class="artist-text">
                    <span>TWICE (트와이스)</span>
                  </div>
                </a>
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
            <b>Music Video</b>
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
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>

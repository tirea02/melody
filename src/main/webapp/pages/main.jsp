<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Title -->
  <title>Melody</title>
  <!-- jQuery CDN -->
  <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
  <!-- slick slider -->
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
  <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- FontAwesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <!-- Custom Css & Js -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main-style.css">
  <!-- Favicon -->
  <link rel="icon" href="${pageContext.request.contextPath}/resources/images/Favicon.png">
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
              <a href="${pageContext.request.contextPath}/pages/main.jsp">
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
              <form action="${pageContext.request.contextPath}/search" method="get">
                <input type="text" id="mainSearchQuery" name="mainSearchQuery" required>
                <button type="submit"></button>
              </form>
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
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/81/456/11281456_20230706180841_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Super Shy</span>
                          뉴진스 (NewJeans)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/109/09/179/10909179_20220405103521_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>LOVE DIVE</span>
                          IVE (아이브)
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/34/678/11234678_20230502162327_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>이브, 프시케 그리고 푸른 수염의 아내</span>
                          LE SSERAFIM (르세라핌)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/36/264/11236264_20230508184331_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Spicy</span>
                          aespa
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/111/88/020/11188020_20230223114923_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Cupid</span>
                          FIFTY FIFTY
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/111/65/170/11165170_20230214120544_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Teddy Bear</span>
                          STAYC (스테이씨)
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
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/111/27/145/11127145_20230102135733_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>OMG</span>
                          뉴진스 (NewJeans)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/110/78/852/11078852_20221017102947_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>LOVE</span>
                          (여자)아이들
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/36/264/11236264_20230508184331_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Thirsty</span>
                          aespa
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/54/858/11254858_20230531233847_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Steal The Show</span>
                          Lauv
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/106/38/810/10638810_20210628163843_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>오르골</span>
                          NCT DREAM
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/108/44/485/10844485_20221006154824_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Light Switch</span>
                          Charlie Puth
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
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/110/78/852/11078852_20221017102947_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Reset</span>
                          (여자)아이들
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/27/533/11227533_20230419162238_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>헤어지자 말해요</span>
                          박재정
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/36/264/11236264_20230508184331_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Til We Meet Again</span>
                          aespa
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/58/233/11258233_20230605094802_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>모래 알갱이</span>
                          임영웅
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/109/22/231/10922231_20220527120653_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Darl+ing</span>
                          세븐틴 (SEVENTEEN)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/106/38/810/10638810_20210628163843_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>지금처럼만</span>
                          NCT DREAM
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
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/111/27/145/11127145_20230102135733_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Ditto</span>
                          뉴진스 (NewJeans)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/11/297/11211297_20230410151046_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>I AM</span>
                          IVE (아이브)
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/34/678/11234678_20230502162327_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>UNFORGIVEN</span>
                          LE SSERAFIM (르세라핌)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/109/90/058/10990058_20220623170956_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>Life's Too Short</span>
                          aespa
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/14/411/11214411_20230330163342_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>꽃</span>
                          지수 (JISOO)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/109/03/868/10903868_20220330103544_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>오르트 구름</span>
                          윤하 (YOUNHA)
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
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/81/456/11281456_20230706180841_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>ETA</span>
                          뉴진스 (NewJeans)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/40/232/11240232_20230509151820_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>퀸카 (Queencard)</span>
                          (여자)아이들
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/110/34/298/11034298_20220822101843_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>After LIKE</span>
                          IVE (아이브)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/110/78/496/11078496_20221014153848_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>ANTIFRAGILE</span>
                          LE SSERAFIM (르세라핌)
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="season-songs">
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/29/537/11229537_20230421170444_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>손오공</span>
                          세븐틴 (SEVENTEEN)
                        </p>
                      </div>
                    </div>
                    <div class="season-song">
                      <div class="season-song-img">
                        <img src="https://cdnimg.melon.co.kr/cm2/album/images/111/40/018/11140018_20230105103451_500.jpg">
                      </div>
                      <div class="season-song-text">
                        <p>
                          <span>건물 사이에 피어난 장미</span>
                          HI - KEY (하이키)
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
                  <a href="/melody/albumDetail?albumID=3">
                    <div class="new-img-inner">
                      <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/81/456/11281456_20230706180841_500.jpg">
                    </div>
                    <div class="new-text">
                      <span>뉴진스 (NewJeans)</span>
                      <p>Get Up</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="/melody/albumDetail?albumID=15">
                    <div class="new-img-inner">
                      <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/58/233/11258233_20230605094802_500.jpg">
                    </div>
                    <div class="new-text">
                      <span>임영웅</span>
                      <p>모래 알갱이</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="/melody/albumDetail?albumID=14">
                    <div class="new-img-inner">
                      <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/54/858/11254858_20230531233847_500.jpg">
                    </div>
                    <div class="new-text">
                      <span>Lauv</span>
                      <p>Steal The Show (From “엘리멘탈”)</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="/melody/albumDetail?albumID=5">
                    <div class="new-img-inner">
                      <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/40/232/11240232_20230509151820_500.jpg">
                    </div>
                    <div class="new-text">
                      <span>(여자)아이들</span>
                      <p>I feel</p>
                    </div>
                  </a>
                </div>
              </div>
              <div class="new-item">
                <div class="new-content">
                  <a href="/melody/albumDetail?albumID=12">
                    <div class="new-img-inner">
                      <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/36/264/11236264_20230508184331_500.jpg">
                    </div>
                    <div class="new-text">
                      <span>aespa</span>
                      <p>MY WORLD</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="/melody/albumDetail?albumID=10">
                    <div class="new-img-inner">
                      <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/34/678/11234678_20230502162327_500.jpg">
                    </div>
                    <div class="new-text">
                      <span>LE SSERAFIM (르세라핌)</span>
                      <p>UNFORGIVEN</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="/melody/albumDetail?albumID=16">
                    <div class="new-img-inner">
                      <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/29/537/11229537_20230421170444_500.jpg">
                    </div>
                    <div class="new-text">
                      <span>세븐틴 (SEVENTEEN)</span>
                      <p>FML</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="/melody/albumDetail?albumID=9">
                    <div class="new-img-inner">
                      <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/27/533/11227533_20230419162238_500.jpg">
                    </div>
                    <div class="new-text">
                      <span>박재정</span>
                      <p>Alone</p>
                    </div>
                  </a>
                </div>
              </div>
            </div>
            <div class="new-items">
              <div class="new-item">
                <div class="new-content">
                  <a href="/melody/albumDetail?albumID=8">
                    <div class="new-img-inner">
                      <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/11/297/11211297_20230410151046_500.jpg">
                    </div>
                    <div class="new-text">
                      <span>IVE (아이브)</span>
                      <p>I've IVE</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="/melody/albumDetail?albumID=20">
                    <div class="new-img-inner">
                      <img src="https://cdnimg.melon.co.kr/cm2/album/images/112/14/411/11214411_20230330163342_500.jpg">
                    </div>
                    <div class="new-text">
                      <span>지수 (JISOO)</span>
                      <p>ME</p>
                    </div>
                  </a>
                </div>
                <div class="new-content">
                  <a href="#">
                    <div class="new-img-inner">
                      <img src="https://cdnimg.melon.co.kr/cm2/album/images/111/88/020/11188020_20230223114923_500.jpg">
                    </div>
                    <div class="new-text">
                      <span>FIFTY FIFTY</span>
                      <p>The Beginning: Cupid</p>
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
                        <a href="/melody/albumDetail?albumID=3">
                          <div class="best-img-inner">
                            <img src="https://cdnimg.melon.co.kr/cm2/album/images/109/22/231/10922231_20220527120653_500.jpg">
                          </div>
                          <div class="best-song-name">
                            <span>
                              Super Shy
                            </span>
                          </div>
                        </a>
                      </div>
                    </td>
                    <td>
                      <p>
                        뉴진스 (NewJeans)
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
                        <a href="/melody/albumDetail?albumID=4">
                          <div class="best-img-inner">
                            <img src="https://cdnimg.melon.co.kr/cm2/album/images/110/78/852/11078852_20221017102947_500.jpg">
                          </div>
                          <div class="best-song-name">
                            <span>
                              Nxde
                            </span>
                          </div>
                        </a>
                      </div>
                    </td>
                    <td>
                      <p>
                        (여자)아이들
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
                        <a href="/melody/albumDetail?albumID=6">
                          <div class="best-img-inner">
                            <img src="https://cdnimg.melon.co.kr/cm2/album/images/109/09/179/10909179_20220405103521_500.jpg">
                          </div>
                          <div class="best-song-name">
                            <span>
                              LOVE DIVE
                            </span>
                          </div>
                        </a>
                      </div>
                    </td>
                    <td>
                      <p>
                        IVE (아이브)
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
                        <a href="/melody/albumDetail?albumID=11">
                          <div class="best-img-inner">
                            <img src="https://cdnimg.melon.co.kr/cm2/album/images/110/78/496/11078496_20221014153848_500.jpg">
                          </div>
                          <div class="best-song-name">
                            <span>
                              ANTIFRAGILE
                            </span>
                          </div>
                        </a>
                      </div>
                    </td>
                    <td>
                      <p>
                        LE SSERAFIM (르세라핌)
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
                        <a href="/melody/albumDetail?albumID=12">
                          <div class="best-img-inner">
                            <img src="https://cdnimg.melon.co.kr/cm2/album/images/109/90/058/10990058_20220623170956_500.jpg">
                          </div>
                          <div class="best-song-name">
                            <span>
                              Spicy
                            </span>
                          </div>
                        </a>
                      </div>
                    </td>
                    <td>
                      <p>
                        aespa
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
                <a href="https://www.youtube.com/watch?v=7HDeem-JaSY">
                  <div class="musicvideo-img-inner">
                    <img src="../resources/images/queencard.jpeg">
                  </div>
                  <div class="musicvideo-text">
                    <span>(여자)아이들((G)I-DLE) - '퀸카 (Queencard)' Official Music Video</span>
                  </div>
                </a>
              </div>
              <div class="musicvideo-item">
                <a href="https://www.youtube.com/watch?v=F0B7HDiY-10">
                  <div class="musicvideo-img-inner">
                    <img src="../resources/images/after like.jpeg">
                  </div>
                  <div class="musicvideo-text">
                    <span>IVE 아이브 'After LIKE' MV</span>
                  </div>
                </a>
              </div>
              <div class="musicvideo-item">
                <a href="https://www.youtube.com/watch?v=pyf8cbqyfPs">
                  <div class="musicvideo-img-inner">
                    <img src="../resources/images/antifragile.jpeg">
                  </div>
                  <div class="musicvideo-text">
                    <span>LE SSERAFIM (르세라핌) 'ANTIFRAGILE' OFFICIAL M/V</span>
                  </div>
                </a>
              </div>
              <div class="musicvideo-item">
                <a href="https://www.youtube.com/watch?v=Os_heh8vPfs">
                  <div class="musicvideo-img-inner">
                    <img src="../resources/images/spicy.jpeg">
                  </div>
                  <div class="musicvideo-text">
                    <span>aespa 에스파 'Spicy' MV</span>
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
      <div class="chat-helper-inner">
        <div class="helper-text">
          <div id="answer" class="helper-answer">${answer}</div>
        </div>
          <div class="instant-play">
	        <form id="playSongForm" action="${pageContext.request.contextPath}/playSongSimple" method="get">
            <input id="songQuery" name="songTitle" type="text" placeholder="노래제목을 입력하세요">
            <button id="playSongBtn" type="submit"><i class="bi bi-play-fill"></i></button>
	        </form>
          </div>
        <div class="user-text">
<%--          <label for="question">Enter your question:</label><br>--%>
          <textarea id="question" rows="4" cols="100%" class="user-chat"></textarea><br>
          <button id="submitBtn" class="helper-send">Send</button>
        </div>
      </div>
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
    
<%--    <!-- Mini Player -->--%>
<%--    <div id="player" class="player">--%>
<%--      <div class="info">--%>
<%--        <audio class="audio">--%>
<%--          <source src="/mp3/ditto_31.mp3" type="audio/mp3">--%>
<%--        </audio>--%>
<%--        <div class="album-cover">--%>
<%--          <div class="album-img-inner"></div>--%>
<%--        </div>--%>

<%--        <div class="info-sub">--%>
<%--          <div class="progressBar">--%>
<%--            <div class="progressBar-main">--%>
<%--              <input type="range" value="0" id="progress">--%>
<%--            </div>--%>
<%--          </div>--%>

<%--          <div class="currentlyPlaying">--%>
<%--            <div class="currentlyPlaying-text">--%>
<%--              <span class="songName">Super Shy</span>--%>
<%--              <span class="artistName">NewJeans</span>--%>
<%--            </div>--%>
<%--            <div class="controls">--%>
<%--              <div class="music-timer">--%>
<%--                <span class="current">0:00</span>--%>
<%--                <span> / </span>--%>
<%--                <span class="duration">0:00</span>--%>
<%--              </div>--%>
<%--              <div class="repeat"><i class="fa-solid fa-repeat fa-xl"></i></div>--%>
<%--              <div class="previous"><i class="fas fa-backward fa-xl"></i></div>--%>
<%--              <div class="play"><i class="fas fa-play fa-xl"></i></div>--%>
<%--              <div class="pause"><i class="fas fa-pause fa-xl"></i></div>--%>
<%--              <div class="next"><i class="fas fa-forward fa-xl"></i></div>--%>
<%--              <div class="shuffle"><i class="fas fa-random fa-xl"></i></div>--%>
<%--              <div class="volume-btn">--%>
<%--                <div class="volume"><i class="fas fa-volume-up fa-xl"></i></div>--%>
<%--                <div class="mute"><i class="fas fa-volume-xmark fa-xl"></i></div>--%>
<%--                <div class="volumeCtrl">--%>
<%--                  <div class="volume-bar">--%>
<%--                    <div class="volumeBg">--%>
<%--                      <input class="volumeRange" type="range" min="0" max="100" step="1" value="50"></input>--%>
<%--                    </div>--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--              <div class="option"><i class="fas fa-bars fa-2xl"></i></div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
    <div id="audio-player"></div>


  </div>



  <script src="${pageContext.request.contextPath}/js/main.js"></script>
  <script src="${pageContext.request.contextPath}/js/main-custom.js"></script>
  <script src="${pageContext.request.contextPath}/js/miniPlaySong.js"></script>





</body>
</html>

$(document).ready(function() {
  const blankedHeart = $(".blankedHeart");
  const coloredHeart = $(".coloredHeart");

  const audioElement = document.querySelector("audio");
  // const mp3FilePath = "./music/NewJeans-SuperShy.mp3";
  // audioElement.src = mp3FilePath;
  const audioUrl = [
	  {url: "/mp3/ditto_31.mp3", title: "Ditto", artist: "NewJeans"},
	  {url: "/mp3/사계_0.mp3", title: "사계", artist: "태연"},
	  {url: "/mp3/New Emotions_0.mp3", title: "New Emotions", artist: "인피니트"},
	  {url: "/mp3/I AM_0.mp3", title: "I AM", artist: "아이브"}
  ];

  const progressBar = $("#progress");
  const currentTime = $(".current");
  const durationTime = $(".duration");

  const repeatButton = $(".repeat");
  const previousButton = $(".previous");
  const playButton = $(".play");
  const pauseButton = $(".pause");
  const nextButton = $(".next");
  const shuffleButton = $(".shuffle");
  const volumeButton = $(".volume");
  const muteButton = $(".mute");
  const volumeCtrlButton = $(".volumeCtrl");
    const volumeRangeButton = $(".volumeRange");

  let isPlaying = false;
  let isMuted = false;
  let previousVolume = 1.0;
  let currentSongIndex = 0;
  let shuffledPlaylist = [...audioUrl];
  let isShuffled = false;
  let shuffleRounds = audioUrl.length;


  //좋아요 하트
  coloredHeart.hide(); //hide coloredHeart button until clicked
  blankedHeart.click(function () {
    blankedHeart.hide();
    coloredHeart.show();
  });
  coloredHeart.click(function () {
    coloredHeart.hide();
    blankedHeart.show();
  });  


  //제목,가수
  function updateSongInfo(index) {
    if (isShuffled) {
      const nextShuffledSong = shuffledPlaylist[index];
      $(".songName").text(nextShuffledSong.title);
      $(".artistName").text(nextShuffledSong.artist);
    } else {
      const nextSong = audioUrl[index];
      $(".songName").text(nextSong.title);
      $(".artistName").text(nextSong.artist);
    }
  }

  //곡 정보 업데이트
  updateSongInfo(currentSongIndex);
  
  //progressBar 재생 시간 업데이트
  audioElement.addEventListener('timeupdate', function () {
    const currentTimeValue = audioElement.currentTime;
    const durationValue = audioElement.duration;

    if (!isNaN(currentTimeValue) && !isNaN(durationValue)) { //시간 정상적으로 계산되었을때0
      const progressPercent = (currentTimeValue / durationValue) * 100; //현재 재생 상태 퍼센트로 계산
      progressBar.val(progressPercent); //퍼센트에 따라 progressBar 이동

      // Update the playtime display
      currentTime.text(formatTime(currentTimeValue));
      durationTime.text(formatTime(durationValue));
    }
  });

  //시간 MM:SS 형식으로 변환
  function formatTime(time) {
    const minutes = Math.floor(time / 60);
    const seconds = Math.floor(time % 60);
    return `${minutes}:${seconds.toString().padStart(2, '0')}`; //문자열 길이 1일때 앞에 0 추가 (초 두자릿수로 표현)
  }

  //progress bar 재생 위치 업데이트
  progressBar.on('input', function () {
    const seekTime = (progressBar.val() * audioElement.duration) / 100; //현재 재생 위치 0-100 정규화
    audioElement.currentTime = seekTime;
  });

  //반복 버튼
  repeatButton.click(function () {
    $(this).toggleClass('clicked');
    audioElement.loop = $(this).hasClass('clicked');
  });

  //이전 곡 버튼
  previousButton.click(function () {
    if (audioElement.currentTime <= 2) {
      currentSongIndex = (currentSongIndex - 1 + audioUrl.length) % audioUrl.length; // Ensure positive index
      const prevSong = audioUrl[currentSongIndex].url;

      audioElement.src = prevSong;
      audioElement.currentTime = 0; //Reset audio to 0 sec
      audioElement.play();
      updateSongInfo(currentSongIndex);
    }else {
      audioElement.currentTime = 0;
    }
  });

  //재생 버튼
  pauseButton.hide(); //hide pause button until clicked
  playButton.click(function () {
    if (!isPlaying) {
      audioElement.play();
      playButton.hide();
      pauseButton.show();
    }
    isPlaying = true;
  });
  pauseButton.click(function () {
    if (isPlaying) {
      audioElement.pause();
      pauseButton.hide();
      playButton.show();
    }
    isPlaying = false;
  });

  //다음 곡 버튼
  nextButton.click(function () {
  if (isShuffled) {
    playNextShuffledSong();
  } else {
    currentSongIndex = (currentSongIndex + 1) % audioUrl.length;
    const nextSong = audioUrl[currentSongIndex].url
    audioElement.src = nextSong;
    audioElement.currentTime = 0;
    audioElement.play();
    updateSongInfo(currentSongIndex);
  }
  });

  //셔플 버튼
  function random_Url() {
    return audioUrl[Math.floor(Math.random()*audioUrl.length)];
  }
  var audio = new Audio(random_Url());
  audio.play();
  audio.addEventListener('ended', function() {
    audio.src = random_Url();
    audio.play();
  });

  shuffleButton.click(function () {
    $(this).toggleClass('clicked');
    if ($(this).hasClass('clicked')) {
      for (let i=0; i<shuffleRounds; i++){
        shufflePlaylist();
      }
      playNextShuffledSong();
    } else {
      isShuffled = false;
    }
  });

  function shufflePlaylist() {
    shuffledPlaylist = [...audioUrl];
    for (let i = shuffledPlaylist.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [shuffledPlaylist[i], shuffledPlaylist[j]] = [shuffledPlaylist[j], shuffledPlaylist[i]]; // Swap elements
    }
    currentSongIndex = 0; // Start from the first song in shuffled playlist
    isShuffled = true;
  }

  function playNextShuffledSong() {
    if (isShuffled) {
      const nextShuffledSong = shuffledPlaylist[currentSongIndex].url;
      audioElement.src = nextShuffledSong;
      audioElement.currentTime = 0;
      audioElement.play();
      updateSongInfo(currentSongIndex);
      currentSongIndex = (currentSongIndex + 1) % shuffledPlaylist.length;
    }
  }

  //볼륨바 숨기기
  volumeCtrlButton.hide();
  volumeButton.hover(function () {
    volumeCtrlButton.show();
  });
  volumeCtrlButton.mouseleave(function () {
    volumeCtrlButton.hide();
  });
  muteButton.hover(function () {
    volumeCtrlButton.hide();
  });

  //볼륨바 range 설정
  volumeRangeButton.on("input", function () {
    const volumeValue = parseFloat($(this).val());
    audioElement.volume = volumeValue;
    if (volumeValue === 0) {
      muteButton.show();
      volumeButton.hide();
      isMuted = true;
    } else {
      muteButton.hide();
      volumeButton.show();
      isMuted = false;
    }
  });

  //소리,무음 버튼
  muteButton.hide(); //hide mute button until clicked
  volumeButton.click(function () {
    previousVolume = audioElement.volume;
    audioElement.volume = 0;
    volumeRangeButton.val(0); // Set the range value to 0
    volumeCtrlButton.hide();
    audioElement.play();
    volumeButton.hide();
    muteButton.show();
    isMuted = true;
  });
  muteButton.click(function () {
    if (isMuted) {
      audioElement.volume = previousVolume;
      volumeRangeButton.val(previousVolume); // Restore the previous volume value
      volumeButton.show();
      muteButton.hide();
      isMuted = false;
    }else {
      audioElement.play();
      muteButton.show();
      volumeButton.hide();
      isMuted = true;
    }
  });
});
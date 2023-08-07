$(document).ready(function() {
  const blankedHeart = $(".blankedHeart");
  const coloredHeart = $(".coloredHeart");

  const audioElement = document.querySelector("audio");
  // const mp3FilePath = "./music/NewJeans-SuperShy.mp3";
  // audioElement.src = mp3FilePath;
  const audioUrl = [
	  {url: "/mp3/ditto_31.mp3", title: "Ditto", artist: "NewJeans"},
	  {url: "/mp3/I AM_0.mp3", title: "I AM", artist: "아이브"},
      {url: "/mp3/Dance The Night Away_0.mp3", title: "Dance The Night Away", artist: "Twice"}
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
      const nextSong = audioUrl[index];
      $(".songName").text(nextSong.title);
      $(".artistName").text(nextSong.artist);
  }

  // Initial song info update
  updateSongInfo(currentSongIndex);

  // Update the progress bar and playtime display
  audioElement.addEventListener('timeupdate', function () {
    const currentTimeValue = audioElement.currentTime;
    const durationValue = audioElement.duration;

    if (!isNaN(currentTimeValue) && !isNaN(durationValue)) {
      // Update the progress bar
    const progressPercent = (currentTimeValue / durationValue) * 100;
    progressBar.val(progressPercent);

    // Update the playtime display
    currentTime.text(formatTime(currentTimeValue));
    durationTime.text(formatTime(durationValue));
    }
  });

  // 시간 MM:SS 형식으로 변환
  function formatTime(time) {
    const minutes = Math.floor(time / 60);
    const seconds = Math.floor(time % 60);
    return `${minutes}:${seconds.toString().padStart(2, '0')}`;
  }

  // Function to handle seeking through the progress bar
  progressBar.on('input', function () {
    const seekTime = (progressBar.val() * audioElement.duration) / 100;
    audioElement.currentTime = seekTime;
  });

  //반복 버튼
  repeatButton.click(function () {
    $(this).toggleClass('clicked');
    audioElement.loop = $(this).hasClass('clicked');
  });

  //이전 곡 버튼
  previousButton.click(function () {
    audioElement.currentTime = 0; //Reset audio to 0 sec
    // Implement the logic to play the previous song
    // For example: audioElement.src = "path_to_previous_song.mp3";
    // You may need to manage the playlist and track the current song index
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
    //const nextSong = "/mp3/사계_0.mp3"; //audioElement.src = "path_to_next_song.mp3";
    currentSongIndex = (currentSongIndex + 1) % audioUrl.length;
    const nextSong = audioUrl[currentSongIndex].url
	audioElement.src = nextSong;
	audioElement.currentTime = 0;
	audioElement.play();
	updateSongInfo(currentSongIndex);
  });

  //셔플 버튼
  shuffleButton.click(function () {
    $(this).toggleClass('clicked');
    // Implement the logic to shuffle the playlist and play songs in random order
    // For example: shufflePlaylistAndPlay();
    // You may need to manage the playlist and track the current song index
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
      volumeButton.show();
      isMuted = false;
    }else {
      audioElement.play();
      muteButton.show();
      volumeButton.hide();
      isMuted = true;
    }
  });

  //볼륨바 숨기기
  volumeCtrlButton.hide();
  volumeButton.hover(function () {
    volumeCtrlButton.show();
  })
  volumeCtrlButton.mouseleave(function () {
    volumeCtrlButton.hide();
  })
  muteButton.hover(function () {
    volumeCtrlButton.hide();
  })

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
});
$(document).ready(function() {
  const blankedHeart = $(".blankedHeart");
  const coloredHeart = $(".coloredHeart");

  const audioElement = document.querySelector("audio");
  const mp3FilePath = "C:/melody/mp3/ditto_31.mp3";
  audioElement.src = mp3FilePath;

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
    const volumeBgButton = $(".volumeBg");
    const volumeRangeButton = $(".volumeRange");

  let isPlaying = false;
  let isMuted = false;
  

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
    // Implement the logic to play the next song
    // For example: audioElement.src = "path_to_next_song.mp3";
    // You may need to manage the playlist and track the current song index
  });

  //셔플 버튼
  shuffleButton.click(function () {
    $(this).toggleClass('clicked');
    // Implement the logic to shuffle the playlist and play songs in random order
    // For example: shufflePlaylistAndPlay();
    // You may need to manage the playlist and track the current song index
  });

  //볼륨조절 버튼
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

  //소리,무음 버튼
  muteButton.hide(); //hide mute button until clicked
  volumeButton.click(function () {
    volumeCtrlButton.hide();
    audioElement.play();
    audioElement.volume = 0;
    volumeButton.hide();
    muteButton.show();
  });
  muteButton.click(function () {
    audioElement.pause();
    volumeButton.show();
    muteButton.hide();
  });
});/**
 * 
 */
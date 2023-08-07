$(function(){
  //Dark mode
  $('.darkmode').click(function(){
    $(this).toggleClass('on')
  })
  $('.darkmode').click(function(){
	  $('body, .slick-dots, section:nth-child(odd), header, .section-header, .lnb, .gnb, .logo, .myplaylist-text, .musicvideo-text, footer, .sns, .player').toggleClass('dark')
  })
  
  //Overlay
  $('.chat-helper-icon').click(function(){
    $(this).toggleClass('active')
    $('.chat-helper-main').toggleClass('active')
  })

  // Slick
  $('.myplaylist-slider').slick({
    dots: true,
    infinite: true,
    centerMode: true,
    centerPadding: '10px',
    speed: 1000,
    draggable: false
  });

  $('.musicvideo-slider').slick({
    dots: true,
    infinite: true,
    centerMode: true,
    centerPadding: '10px',
    speed: 1000,
    draggable: false
  });
})
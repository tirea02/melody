$(function(){
  //Dark mode
  $('.darkmode').click(function(){
    $(this).toggleClass('on')
  })
  $('.darkmode').click(function(){
	  $('body, .slick-dots, section:nth-child(odd), header, .section-header, .sub-lnb input[type=search], .lnb, .gnb, .logo, .new-text, .artist-text, .musicvideo-text, footer, .sns').toggleClass('dark')
  })
  
  //Overlay
  $('.chat-helper-icon').click(function(){
    $(this).toggleClass('active')
    $('.chat-helper-main').toggleClass('active')
  })

})
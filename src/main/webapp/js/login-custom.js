$(function(){
  //Dark mode
  $('.darkmode').click(function(){
    $(this).toggleClass('on')
  })
  $('.darkmode').click(function(){
	  $('body, header, .lnb, .logo, .login-form, footer, .sns').toggleClass('dark')
  })
  
  //Overlay
  $('.chat-helper-icon').click(function(){
    $(this).toggleClass('active')
    $('.chat-helper-main').toggleClass('active')
  })
})
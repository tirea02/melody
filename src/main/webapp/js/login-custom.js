$(function(){
  //Dark mode
  $('.darkmode').click(function(){
    $(this).toggleClass('on')
  })
  $('.darkmode').click(function(){
	  $('body, header, .lnb, .logo, .login-form, footer, .sns').toggleClass('dark')
  })
})
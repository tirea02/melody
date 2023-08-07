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

  //Genre Tab menu
  $('.genre-tab1').show()
  $('.genre-btn-tab a:nth-child(1)').click(function(){
    $('.genre-tab1').show()
    $('.genre-tab2').hide()
    $('.genre-tab3').hide()
    $('.genre-tab4').hide()
    $('.genre-tab5').hide()
    $('.genre-tab6').hide()
    $(this).addClass('active')
    $(this).siblings().removeClass('active')
  })
  $('.genre-btn-tab a:nth-child(2)').click(function(){
    $('.genre-tab1').hide()
    $('.genre-tab2').show()
    $('.genre-tab3').hide()
    $('.genre-tab4').hide()
    $('.genre-tab5').hide()
    $('.genre-tab6').hide()
    $(this).addClass('active')
    $(this).siblings().removeClass('active')
  })
  $('.genre-btn-tab a:nth-child(3)').click(function(){
    $('.genre-tab1').hide()
    $('.genre-tab2').hide()
    $('.genre-tab3').show()
    $('.genre-tab4').hide()
    $('.genre-tab5').hide()
    $('.genre-tab6').hide()
    $(this).addClass('active')
    $(this).siblings().removeClass('active')
  })
  $('.genre-btn-tab a:nth-child(4)').click(function(){
    $('.genre-tab1').hide()
    $('.genre-tab2').hide()
    $('.genre-tab3').hide()
    $('.genre-tab4').show()
    $('.genre-tab5').hide()
    $('.genre-tab6').hide()
    $(this).addClass('active')
    $(this).siblings().removeClass('active')
  })
  $('.genre-btn-tab a:nth-child(5)').click(function(){
    $('.genre-tab1').hide()
    $('.genre-tab2').hide()
    $('.genre-tab3').hide()
    $('.genre-tab4').hide()
    $('.genre-tab5').show()
    $('.genre-tab6').hide()
    $(this).addClass('active')
    $(this).siblings().removeClass('active')
  })
  $('.genre-btn-tab a:nth-child(6)').click(function(){
    $('.genre-tab1').hide()
    $('.genre-tab2').hide()
    $('.genre-tab3').hide()
    $('.genre-tab4').hide()
    $('.genre-tab5').hide()
    $('.genre-tab6').show()
    $(this).addClass('active')
    $(this).siblings().removeClass('active')
  })
})
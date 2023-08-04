$(function(){
  //Dark mode
  $('.darkmode').click(function(){
    $(this).toggleClass('on')
  })
  $('.darkmode').click(function(){
	  $('body, .slick-dots, section:nth-child(odd), header, .section-header, .sub-lnb input[type=search], .lnb, .gnb, .logo, .new-text, .artist-text, .musicvideo-text, footer, .sns, .player').toggleClass('dark')
  })
  
  //Overlay
  $('.chat-helper-icon').click(function(){
    $(this).toggleClass('active')
    $('.chat-helper-main').toggleClass('active')
  })

  // Slick
  $('.season-slider').slick({
      dots: true,
      infinite: true,
      centerMode: true,
      centerPadding: '0px',
      speed: 1000,
      autoplay: true,
      autoplaySpeed: 4000,
      draggable: false,
      slidesToShow: 1,
      slidesToScroll: 1,
      arrow: false,
  });

  $('.new-slider').slick({
    dots: true,
    infinite: true,
    centerMode: true,
    centerPadding: '10px',
    speed: 1000,
    autoplay: true,
    autoplaySpeed: 4000,
    draggable: false
  });

  $('.artist-slider').slick({
    dots: true,
    infinite: true,
    centerMode: true,
    centerPadding: '10px',
    speed: 1000,
    autoplay: true,
    autoplaySpeed: 4000,
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
  
  // Tab menu
  $('.best-tab1').show()
  $('.best-btn-tab a:nth-child(1)').click(function(){
    $('.best-tab1').show()
    $('.best-tab2').hide()
    $('.best-tab3').hide()
    $('.best-tab4').hide()
    $(this).addClass('active')
    $(this).siblings().removeClass('active')
  })
  $('.best-btn-tab a:nth-child(2)').click(function(){
    $('.best-tab1').hide()
    $('.best-tab2').show()
    $('.best-tab3').hide()
    $('.best-tab4').hide()
    $(this).addClass('active')
    $(this).siblings().removeClass('active')
  })
  $('.best-btn-tab a:nth-child(3)').click(function(){
    $('.best-tab1').hide()
    $('.best-tab2').hide()
    $('.best-tab3').show()
    $('.best-tab4').hide()
    $(this).addClass('active')
    $(this).siblings().removeClass('active')
  })
  $('.best-btn-tab a:nth-child(4)').click(function(){
    $('.best-tab1').hide()
    $('.best-tab2').hide()
    $('.best-tab3').hide()
    $('.best-tab4').show()
    $(this).addClass('active')
    $(this).siblings().removeClass('active')
  })

  //Genre Tab menu
  $('.genre-tab1').show()
  $('.genre-btn-tab a:nth-child(1)').click(function(){
    $('.genre-tab1').show()
    $('.genre-tab2').hide()
    $('.genre-tab3').hide()
    $('.genre-tab4').hide()
    $(this).addClass('active')
    $(this).siblings().removeClass('active')
  })
  $('.genre-btn-tab a:nth-child(2)').click(function(){
    $('.genre-tab1').hide()
    $('.genre-tab2').show()
    $('.genre-tab3').hide()
    $('.genre-tab4').hide()
    $(this).addClass('active')
    $(this).siblings().removeClass('active')
  })
  $('.genre-btn-tab a:nth-child(3)').click(function(){
    $('.genre-tab1').hide()
    $('.genre-tab2').hide()
    $('.genre-tab3').show()
    $('.genre-tab4').hide()
    $(this).addClass('active')
    $(this).siblings().removeClass('active')
  })
  $('.genre-btn-tab a:nth-child(4)').click(function(){
    $('.genre-tab1').hide()
    $('.genre-tab2').hide()
    $('.genre-tab3').hide()
    $('.genre-tab4').show()
    $(this).addClass('active')
    $(this).siblings().removeClass('active')
  })
})
$(window).load(function() {
  // http://stackoverflow.com/a/13319029
  var shortestBannerImage;
  $( '.hero-banner-image' ).each( function(e, i) {
    if( shortestBannerImage !== undefined && $(e).height() > shortestBannerImage.height() ) shortestBannerImage = $(e);
  } );

  $('.hero-banner-slick').height($(shortestBannerImage).height());
  $('.hero-banner-slick').slick({
    autoplay: true,
    autoplaySpeed: 5000,
    nextArrow: '.hero-banner-next',
    prevArrow: '.hero-banner-previous',
    fade: true
  });
});

$(function() {
  $('.helpful-guides-slick').slick({
    nextArrow: '.helpful-guide-home-content-box-slider-controls .home-content-box-next',
    prevArrow: '.helpful-guide-home-content-box-slider-controls .home-content-box-previous',
    slidesToShow: 4,
    slidesToScroll: 4,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });

  $('.article-title').matchHeight();

  $('.articles-slick').slick({
    nextArrow: '.articles-home-content-box-slider-controls .home-content-box-next',
    prevArrow: '.articles-home-content-box-slider-controls .home-content-box-previous',
    slidesToShow: 4,
    slidesToScroll: 4,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          slidesToShow: 1,
        }
      }
    ]
  });

  $('.hero-banner-audience-select .has-children:first-of-type > a').addClass('active');
});

/*
$(document).on('click', '.hero-banner-audience-select .has-children > a', function() {
  $('.hero-banner-audience-select [data-active]').removeAttr('data-active').removeClass('active');
  $(this).attr('data-active', 'true');
});

$(document).on({
  mouseenter: function (e) {
    $('.hero-banner-audience-select .active').removeClass('active');
  },
  mouseleave: function () {
    $('.hero-banner-audience-select [data-active=true]').addClass('active');
  }
}, '.hero-banner-audience-select .has-children > a');
*/

$(document).on({
  mouseenter: function (e) {
    $('.hero-banner-audience-select .active').removeClass('active');
    $(this).addClass('active');
  }
}, '.hero-banner-audience-select .has-children > a');

$(document).on({
  mouseenter: function (e) {
    $(this).css('background', $(this).data('colour'));
  },
  mouseleave: function () {
    $(this).attr('style', '');
  }
}, '.hero-banner-navigation-link-horizontal, .hero-banner-navigation-link-vertical');

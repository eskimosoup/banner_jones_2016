function teamMembersSlick() {
  $('.home-team-members-slick').on('init', function() {
    $('.home-team-member:first-of-type .home-team-member-profile-card-update').click();
  });

  $('.home-team-members-slick').slick({
    nextArrow: '.home-team-members-home-content-box-slider-controls .home-content-box-next',
    prevArrow: '.home-team-members-home-content-box-slider-controls .home-content-box-previous',
    slidesToShow: 12,
    slidesToScroll: 1,
    swipe: false
  });
}

$(function() {
  $('.hero-banner-slick').slick({
    autoplay: true,
    autoplaySpeed: 5000,
    nextArrow: '.hero-banner-next',
    prevArrow: '.hero-banner-previous',
    fade: true
  });

  $('.testimonials-slick').slick({
    arrows: false,
    dots: true,
    autoplay: true,
    autoplaySpeed: 6000
  });

  $('.helpful-guides-slick').slick({
    nextArrow: '.helpful-guide-home-content-box-slider-controls .home-content-box-next',
    prevArrow: '.helpful-guide-home-content-box-slider-controls .home-content-box-previous',
    slidesToShow: 4,
    slidesToScroll: 1
  });

  teamMembersSlick();

  $('.article-title').matchHeight();

  $('.articles-slick').slick({
    nextArrow: '.articles-home-content-box-slider-controls .home-content-box-previous',
    prevArrow: '.articles-home-content-box-slider-controls .home-content-box-next',
    slidesToShow: 4
  });

  $('.hero-banner-audience-select .has-children:first-of-type > a').addClass('active');
});


$(document).on('click', '.home-team-member-profile-card-update', function() {
  var $teamMemberProfileCard = $($(this).data('container'));
  $('.home-team-members-slick-profile').html($teamMemberProfileCard.html());
  $('.home-team-member-profile-card-update.active').removeClass('active');
  $(this).addClass('active');
  return false;
});

$(document).on('click', '.home-content-box-next, .home-content-box-previous', function() {
  return false;
});

$(document).on('keyup', '.home-team-member-search-name', function() {
  $(this).closest('form').submit();
});

$(document).on('change', '.home-team-member-search-service', function() {
  $(this).closest('form').submit();
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

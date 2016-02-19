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
    nextArrow: '.helpful-guide-content-box-slider-controls .content-box-next',
    prevArrow: '.helpful-guide-content-box-slider-controls .content-box-previous',
    slidesToShow: 4,
    slidesToScroll: 1
  });

  $('.home-team-members-slick').slick({
    nextArrow: '.home-team-members-content-box-slider-controls .content-box-next',
    prevArrow: '.home-team-members-content-box-slider-controls .content-box-previous',
    slidesToShow: 12,
    slidesToScroll: 1,
    swipe: false
  });

  $('.article-title').matchHeight();

  $('.articles-slick').slick({
    nextArrow: '.articles-content-box-slider-controls .content-box-previous',
    prevArrow: '.articles-content-box-slider-controls .content-box-next',
    slidesToShow: 4
  });
});


$(document).on('click', '.home-team-member-profile-card-update', function() {
  var $teamMemberProfileCard = $($(this).data('container'));
  $('.home-team-members-slick-profile').html($teamMemberProfileCard.html());
  return false;
});

$(document).on('click', '.content-box-next, .content-box-previous', function() {
  return false;
});

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

$(document).ready(function() {
  $('.testimonials-slick').slick({
    arrows: false,
    dots: true,
    autoplay: true,
    autoplaySpeed: 6000
  });  

  teamMembersSlick();
});

function teamMembersSlick() {
  var slidesToShowCount = 12;
  if(typeof partialWidth !== 'undefined') {
    slidesToShowCount = partialWidth;
  }

  $('.slider-team-members-slick').on('init', function() {
    $('.slider-team-member.slick-current').click();
  });

  $('.slider-team-members-slick').slick({
    nextArrow: '.slider-team-members-slider-content-box-slider-controls .slider-content-box-next',
    prevArrow: '.slider-team-members-slider-content-box-slider-controls .slider-content-box-previous',
    slidesToShow: slidesToShowCount,
    slidesToScroll: slidesToShowCount,
    swipe: false,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          slidesToScroll: 3,
          slidesToShow: 3
        }
      }
    ]
  });
}

$(document).on('click', '.slider-team-member-profile-card-update', function() {
  var $teamMemberProfileCard = $($(this).data('container'));
  $('.slider-team-members-slick-profile').html($teamMemberProfileCard.html());
  $('.slider-team-member-profile-card-update.active').removeClass('active');
  $(this).addClass('active');
  return false;
});

$(document).on('click', '.slider-content-box-next, .slider-content-box-previous', function() {
  return false;
});

$(document).on('keyup', '.slider-team-member-search-name', function() {
  $(this).closest('form').submit();
  $('.slider-team-members-loading').css('display', 'block');
});

$(document).on('change', '.slider-team-member-search-select', function() {
  $(this).closest('form').submit();
  $('.slider-team-members-loading').css('display', 'block');
});

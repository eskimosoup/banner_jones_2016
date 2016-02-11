$(document).on('mouseover', '.hover-toggle', function() {
  var contentSection = $(this).data('container');
  $(this).parent().parent().find('.active').removeClass('active');
  $(this).addClass('active');
  $('.' + contentSection).siblings().addClass('hide');
  $('.' + contentSection).removeClass('hide');
});

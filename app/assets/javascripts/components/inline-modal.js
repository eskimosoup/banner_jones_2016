$('.large-modal-overlay').on('click', function (e) {
  if (e.target !== this)
    return;

  $(this).fadeOut(250);
});

$('.inline-modal:not(.bilton-hammond-popup)').on('click', function(e) {
  if (e.target !== this)
    return;

  $(this).removeClass('visible');
});

$(document).ready(function() {
  var biltonHammond = Cookies.get('bilton-hammond');

  if($('.bilton-hammond-redirect').length == 1 && biltonHammond === undefined) {
    $('.bilton-hammond-redirect').addClass('visible').attr('style', '');
  }
});

$(document).on('click', '.set-bilton-hammond-close-cookie', function() {
  Cookies.set('bilton-hammond', '1', { expires: 1 });
});

$('.bilton-hammond-popup').on('click', function(e) {
  if (e.target !== this)
    return;

  $(this).removeClass('visible');
  Cookies.set('bilton-hammond', '1', { expires: 1 });
});

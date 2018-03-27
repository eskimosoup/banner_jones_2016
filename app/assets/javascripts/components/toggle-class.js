$(document).on("click", ".toggle-class", function(e) {
  var toggleContainer = $(this).data('container');
  var toggleClass     = $(this).data('class');
  var dataReturn      = $(this).data('return');

  $(toggleContainer).toggleClass(toggleClass);

  if (dataReturn === false) {
    e.preventDefault();
  }
});

$(document).on("click", ".toggle-class-closest", function(e) {
  var toggleContainer = $(this).data('container');
  var toggleClass     = $(this).data('class');
  var dataReturn      = $(this).data('return');

  $(this).parent().parent().find(toggleContainer).slideToggle();

  if (dataReturn === false) {
    e.preventDefault();
  }
});

$(document).on("click", ".slide-toggle", function(e) {
  var toggleContainer = $(this).data('container');
  var dataReturn      = $(this).data('return');

  $(toggleContainer).slideToggle();
  $(this).toggleClass('toggled');

  if (dataReturn === false) {
    e.preventDefault();
  }
});

$(document).on("click", ".fade-toggle", function(e) {
  var toggleContainer = $(this).data('container');
  var dataReturn      = $(this).data('return');

  $(toggleContainer).fadeToggle();

  if (dataReturn === false) {
    e.preventDefault();
  }
});

$(document).on("click", ".large-modal-overlay-toggle--click", function(e) {
  var toggleContainer = $(this).data('container');
  var dataReturn      = $(this).data('return');

  if($(toggleContainer).is(':visible')) {
    $(toggleContainer).fadeOut(250);
    $('.visible').removeClass('visible');
  } else {
    $(toggleContainer).fadeIn(250, function() {
      $('.large-modal-overlay').height($('body').height());
    });
  }

  if (dataReturn === false) {
    e.preventDefault();
  }
});

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

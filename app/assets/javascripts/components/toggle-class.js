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

  console.log('test');
  $(this).parent().parent().find(toggleContainer).toggleClass(toggleClass);

  if (dataReturn === false) {
    e.preventDefault();
  }
});

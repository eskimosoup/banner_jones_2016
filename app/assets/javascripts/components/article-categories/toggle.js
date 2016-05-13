$(document).on('click', '.article-category-toggle', function() {
  var container = $(this).data('container');
  $(container).slideToggle(150);
  $(this).children('span').toggle();
});

// Adapted from http://stackoverflow.com/questions/7717527/jquery-smooth-scrolling-when-clicking-an-anchor-link
var $root;

function smoothScroll(elem) {
  $root.animate({
    scrollTop: $(elem).offset().top
  }, 500, function () {
    window.location.hash = elem;
  });
}

$(function () {
  $root = $('html, body');
});

$(document).on('click', '.smooth-scroll', function () {
  var elem = $.attr(this, 'href');

  // http://stackoverflow.com/a/298525
  if (elem.indexOf("#") != -1) {
    elem = elem.substr(elem.indexOf("#"))
  }

  if ($(elem).length) {
    smoothScroll(elem);
    return false;
  }
});

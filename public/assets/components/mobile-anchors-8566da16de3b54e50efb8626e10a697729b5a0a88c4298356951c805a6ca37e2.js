$(window).load(function() {
  if (Modernizr.mq('only screen and (max-width: 768px)')) {
    offsetHeight = parseInt($('.primary-header').height()) + 40;

    var windowAnchor = window.location.hash;

    if(windowAnchor !== undefined && $(windowAnchor).length === 1) {
      smoothScrollToPageAnchor(windowAnchor);
    }
  }
});


// Adapted from http://stackoverflow.com/questions/7717527/jquery-smooth-scrolling-when-clicking-an-anchor-link
function smoothScrollToPageAnchor(elem) {
  var scrollTo = $(elem).offset().top - offsetHeight;
  $(window).scrollTop(scrollTo, 0);
  return false;
}
;

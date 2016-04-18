// Sticky header
var offsetHeight, $onpageLinks, onpageLinksHeight;

function setFixedHeader() {
  if (Modernizr.mq('only screen and (min-width: 1200px)')) {
    if($(document).scrollTop() > offsetHeight) {
      $onpageLinks.addClass('fixed');
      $onpageContent.addClass('fixed');
    } else {
      $onpageLinks.removeClass('fixed');
      $onpageContent.removeClass('fixed');
    }
  }
}

$(window).load(function() {
  offsetHeight = parseInt($('.primary-header').height()) + parseInt($('.primary-navigation-wrap').height()) + parseInt($('.service-page-content-wrap').height()) + onpageLinksHeight;
  setFixedHeader();

  var windowAnchor = window.location.hash;
  if(windowAnchor !== undefined && $(windowAnchor).length === 1) {
    smoothScroll(windowAnchor);
  }
});

$(window).scroll(function() {
  setFixedHeader();
});

// Smooth scroll

// Adapted from http://stackoverflow.com/questions/7717527/jquery-smooth-scrolling-when-clicking-an-anchor-link
var $root, onpageLinksHeight;

function smoothScroll(elem) {
  $root.animate({
    scrollTop: $(elem).offset().top - onpageLinksHeight
  }, 500, function () {
    window.location.hash = elem;
  });
}

$(function() {
  $onpageLinks = $('.service-onpage-navigation-links');
  $onpageContent = $('.service-onpage-navigation');
  onpageLinksHeight = parseInt($onpageLinks.height());
  $root = $('html, body');
});

$(document).on('click', '.service-onpage-navigation-link', function() {
  var elem = $.attr(this, 'href');
  smoothScroll(elem);
  $(this).siblings().removeClass('active');
  $(this).addClass('active');
  return false;
});

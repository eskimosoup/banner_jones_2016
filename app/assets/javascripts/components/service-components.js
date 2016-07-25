// Sticky header
var offsetHeight, $onpageLinks, onpageLinksHeight;

function setFixedHeader() {
  if (Modernizr.mq('only screen and (min-width: 1024px)')) {
    if($(document).scrollTop() > offsetHeight && $onpageLinks.length) {
      $onpageLinks.addClass('fixed');
      $onpageContent.addClass('fixed');
    } else if($onpageLinks.length) {
      $onpageLinks.removeClass('fixed');
      $onpageContent.removeClass('fixed');
    }
  }
}

function updateContentHeight() {
  $('.onpage-navigation-wrap .onpage-navigation-item').matchHeight();
}

$(window).load(function() {
  offsetHeight = parseInt($('.primary-header').height()) + parseInt($('.primary-navigation-wrap').height()) + parseInt($('.page-content-wrap').height()) + onpageLinksHeight;
  setFixedHeader();
  $('.page-aside-navigation-content, .page-content').matchHeight();

  $('.onpage-navigation-wrap .onpage-navigation-item').matchHeight();

  var windowAnchor = window.location.hash;
  if(windowAnchor !== undefined && $(windowAnchor).length === 1) {
    // smoothScroll(windowAnchor);
  }
});

$(window).scroll(function() {
  setFixedHeader();
});

// Adapted from http://stackoverflow.com/questions/7717527/jquery-smooth-scrolling-when-clicking-an-anchor-link
var $root, onpageLinksHeight;

function smoothScroll(elem) {
  var scrollTo = $(elem).offset().top - onpageLinksHeight;

  if (Modernizr.mq('only screen and (min-width: 1024px)')) {
    $root.animate({
      scrollTop: scrollTo
    }, 250, function () {
      window.location.hash = elem;
    });
  } else {
    $(window).scrollTop(scrollTo, 0);
  }
}

$(document).ready(function() {
  $onpageLinks = $('.service-onpage-navigation-links');
  $onpageContent = $('.service-onpage-navigation');
  onpageLinksHeight = parseInt($onpageLinks.height());
  $root = $('html, body');

  $('.multiple-team-members-slick').slick({
    autoplay: true,
    autoplaySpeed: 4000,
    fade: true,
    arrows: false,
    dots: false
  });

  // Based off http://stackoverflow.com/a/12033350
  if ($('.inline-colorbox').length) {
    $('.inline-colorbox').each(function() {
      var url = $(this).attr("href");
      $(this).colorbox({
        inline: true,
        href: url,
        onOpen:function() {
          $(url).show();
        },
        onCleanup:function() {
          $(url).hide();
        }
      }).attr("href","javascript:void(0)");
    });
  }
});

$(document).on('click', '.page-aside-navigation-top-level', function() {
  if (Modernizr.mq('only screen and (max-width: 1024px)')) {
    $('.page-aside-child-navigation-links-list').slideToggle();
    $(this).toggleClass('expanded');
    return false;
  }
});

$(document).on('click', '.service-onpage-navigation-link', function() {
  var elem = $.attr(this, 'href');
  smoothScroll(elem);
  $(this).siblings().removeClass('active');
  $(this).addClass('active');
  return false;
});

$(document).on('click', '.toggle-class', function() {
  updateContentHeight();
});

$(document).on('click', '.frequently-asked-question-toggle', function() {
  // smoothScroll('#' + $(this).attr('id'));
  return false;
});

if (Modernizr.mq('only screen and (max-width: 768px)')) {
  var currentScrollPosition;

  $(document).on('click', '.inline-modal .close-button', function() {
    $(window).scrollTop(currentScrollPosition, 0);
  });

  $(document).on('click', '.page-call-to-action.toggle-class', function() {
    var scrollTo = $($(this).attr('href')).offset().top - onpageLinksHeight;
    currentScrollPosition = $(window).scrollTop();
    $(window).scrollTop(scrollTo, 0);
  });
}

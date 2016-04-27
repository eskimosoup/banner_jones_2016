$(document).ready(function() {
  if (Modernizr.mq('only screen and (min-width: 1024px)')) {
    $('.meganav-dropdown-primary-list, .meganav-dropdown-team-member-wrap').matchHeight({ byRow: false });
  }
  
  $('.menu-item:has(.meganav-dropdown), .hover-toggle').doubleTapToGo();
});

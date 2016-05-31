$(document).ready(function() {
  if (Modernizr.mq('only screen and (min-width: 1024px)')) {
    $('.meganav-dropdown-primary-list, .meganav-dropdown-team-member-wrap').matchHeight({ byRow: false });
  }

  $('.has-children').doubleTapToGo();
});

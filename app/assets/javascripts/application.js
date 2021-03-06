// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require cookie_consent/consent
//= require components/meganav
//= require components/hover-toggle
//= require components/footer-awards
//= require components/articles/colour-toggle
//= require components/toggle-class
//= require components/inline-modal
//= require components/mobile-anchors
//= require components/ga-events
//= require components/smooth-scroll
//= require vendor/modernizr
//= require vendor/doubletaptogo
//= require vendor/jquery.unveil
//= require vendor/js-cookie
//= require vendor/stickyfill.min
//= require cocoon

$(document).ready(function() {
  $('img[data-src]').unveil();
});

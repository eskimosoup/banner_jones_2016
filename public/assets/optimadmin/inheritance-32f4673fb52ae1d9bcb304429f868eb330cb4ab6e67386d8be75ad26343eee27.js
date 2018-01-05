/*
Step 1:
  <%= content_for :head do %>
    <%= javascript_include_tag 'optimadmin/inheritance.js' %>
  <% end %>

Step 2:
  Add <div class="relationships" /> wrap around relationships that
  can be dynamically set
*/

function checkInheritance() {
  var inheritanceId = $('.inheritance-select').val();
  if(inheritanceId !== '') {
    $('.relationships').hide();
  } else {
    $('.relationships').show();
  }
}

$(window).load(function() {
  checkInheritance();
});

$(document).on('change', '.inheritance-select', function() {
  checkInheritance();
});

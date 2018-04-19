$(document).ready(function() {
  teamMembersSlick(12);
});

$(document).on('click', '.print-page', function() {
  window.print();
  return false;
})

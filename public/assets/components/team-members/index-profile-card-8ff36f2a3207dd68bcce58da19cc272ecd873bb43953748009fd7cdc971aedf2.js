function teamMemberEqualHeightProfileCard() {
  if (Modernizr.mq('only screen and (min-width: 1024px)')) {
    $('.index-team-member-profile-content').matchHeight();
  }
}

$(document).ready(function() {
  teamMemberEqualHeightProfileCard();
});

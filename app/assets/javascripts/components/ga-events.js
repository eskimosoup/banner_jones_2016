$(document).on('click', '.ga-event', function(e) {
  var eventCategory = $(this).data('event-category');
  var eventAction = $(this).data('event-action');
  var eventLabel = $(this).data('event-label');
  // var eventValue = $(this).data('event-value');

  if (eventCategory && eventAction && typeof ga === 'function') {
    ga('send', {
      hitType: 'event',
      eventCategory: eventCategory, // required
      eventAction: eventAction, // required
      eventLabel: eventLabel,
      // eventValue: eventValue,
      // hitCallback: function() {
      //   console.log('ga Event, category: "' + eventCategory + '", action: "' + eventAction + '", label: "' + eventLabel + '"');
      // }
    });
  }
});

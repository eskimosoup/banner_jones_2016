$(document).on({
  mouseenter: function (e) {
    $(this).find('.helpful-guide-content').slideToggle();
  },
  mouseleave: function () {
    $(this).find('.helpful-guide-content').slideToggle();
  }
}, '.helpful-guide-hover');

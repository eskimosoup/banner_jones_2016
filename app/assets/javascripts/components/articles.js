$(document).on({
  mouseenter: function (e) {
    var color = $(this).data('service-colour');
    $(this).find('.article-title').css({
      backgroundColor: color,
      borderColor: color,
    });
  },
  mouseleave: function () {
    $(this).find('.article-title').css('background-color', '');
  }
}, '.article');

$(document).on({
  mouseenter: function (e) {
    var color = $(this).data('service-colour');
    if(typeof color != 'undefined') {
      $(this).find('.article-title').css({
        backgroundColor: color,
        borderColor: color,
        color: '#fff',
      });
    }
  },
  mouseleave: function () {
    $(this).find('.article-title').css({
      backgroundColor: '',
      borderColor: '',
      color: '',
    });
  }
}, '.article');

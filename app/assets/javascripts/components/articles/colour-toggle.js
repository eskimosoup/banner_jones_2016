$(document).on({
  mouseenter: function (e) {
    var color = $(this).data('service-colour');
    if(color !== '') {
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

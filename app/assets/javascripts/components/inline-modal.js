$('.inline-modal').on('click', function(e) {
  if (e.target !== this)
    return;

  $(this).removeClass('visible');
});

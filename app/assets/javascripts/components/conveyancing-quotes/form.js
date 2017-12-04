const digitRegex = /^-?(\d+\.?\d*)$|(\d*\.?\d+)$/

$(document).on('focusin', '.conveyancing-landing-hero-form__input', function () {
  $(this)
    .parent()
    .find('.conveyancing-landing-hero-form__options')
    .css('opacity', 1);
});

function validateForm() {
  var validateForm = $('.conveyancing-landing-hero-form .conveyancing-landing-hero-form__input--valid').length;
  if (validateForm) {
    $('.conveyancing-landing-hero-form__submit').removeClass('conveyancing-landing-hero-form__submit--disabled');
  } else {
    $('.conveyancing-landing-hero-form__submit').addClass('conveyancing-landing-hero-form__submit--disabled');
  }
}

$(document).on('keyup', '.conveyancing-landing-hero-form__input', function () {
  var input = $(this).val();

  if (digitRegex.test(input)) {
    $(this)
      .parent()
      .addClass('conveyancing-landing-hero-form__input--valid');

    $('.conveyancing-landing-hero-form__errors').slideUp(250);
  } else {
    $(this)
      .parent()
      .removeClass('conveyancing-landing-hero-form__input--valid');
  }

  validateForm();
});

$(document).on('click', '.conveyancing-landing-hero-form__submit', function () {
  let filled = false;

  if ($('.conveyancing-landing-hero-form__input--valid').length) {
    filled = true;
  }

  if (!filled) {
    $(this).addClass('conveyancing-landing-hero-form__submit--shake');
    $('.conveyancing-landing-hero-form__errors').slideDown(250);

    setTimeout(function () {
      $('.conveyancing-landing-hero-form__submit')
        .removeClass('conveyancing-landing-hero-form__submit--shake');
    }, 500);

    return false;
  }
});

$(document).on('click', '.conveyancing-landing-hero-form__options-label', function () {
  $(this).parent()
    .parent()
    .parent()
    .parent()
    .find('input[type="checkbox"]')
    .attr('checked', false);
  $(this).closest('input[type="checkbox"]')
    .attr('checked', true);
});

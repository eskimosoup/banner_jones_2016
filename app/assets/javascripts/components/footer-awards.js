$(function() {
  $('.awards-and-accreditations-slick').slick({
    autoplay: true,
    autoplaySpeed: 5000,
    slidesToShow: 6,
    slidesToScroll: 6,
    dots: true,
    arrows: false,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          slidesToShow: 3,
          slidesToScroll: 3
        }
      }
    ]
  })
})

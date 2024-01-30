window.addEventListener('load', () => {
  const slideLength = document.querySelectorAll('.slider .slider-item').length;

  if (slideLength >= 2) {
    $('.slider').slick({
      dots: true,
      infinite: true,
      speed: 300,
      slidesToShow: 1,
    });
  }
});
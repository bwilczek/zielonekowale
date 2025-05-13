$(document).ready(function(){
  $('.slick-carousel').slick({
    autoplay: false,
    lazyLoad: 'ondemand',
    dots: true
  });

  $('.slick-carousel-single').slick({
    autoplay: false,
    lazyLoad: 'ondemand',
    dots: false
  });

  $('.collapsible-control').click(function(e){
    $(e.target).siblings().filter('div.collapsible-content').toggle()
  });
});

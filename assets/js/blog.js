$(document).ready(function(){
  $('.slick-carousel').slick({
    autoplay: false,
    lazyLoad: 'ondemand',
    dots: true
  });

  $('.collapsible-control').click(function(e){
    $(e.target).siblings().filter('div.collapsible-content').toggle()
  });
});

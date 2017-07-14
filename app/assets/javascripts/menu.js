$( document ).on('turbolinks:load', function() {
  $('.tab').hide();
  infoBox();
});

var infoBox = function(){
  $('.tabs').find('a').on('click', function(e){
  e.preventDefault();
  $('.tabs').find('.current').removeClass('.current');
  $(this).addClass('current');
  $(this.hash).show().siblings().hide();
})
};


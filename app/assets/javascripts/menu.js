
$( document ).on('turbolinks:load', function() {
  $('.tab').hide();
  stockBox();
});

var stockBox = function(){
  $('.tabs').find('a').on('click', function(e){
  e.preventDefault();
  $('.tabs').find('.current').removeClass('.current');
  $(this).addClass('current');
  console.log('*** fuck yeah ***');
  console.log(this.hash);
  $(this.hash).show().siblings().hide();
})
};

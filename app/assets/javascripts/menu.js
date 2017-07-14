$( document ).on('turbolinks:load', function() {
  $('.tab').hide();
  infoBox();
  //stockBox();
});


var infoBox = function(){
  $('.tabs').find('a').on('click', function(e){
    e.preventDefault();
    $('.tabs').find('.current').removeClass('current');
    $(this).addClass('current');
    $(this.hash).show().siblings().hide();
  });
};

var stockBox = function(){
  $('.stockbox').find('a').on('click', function(e){
    e.preventDefault();
      var $this = $(this);
      url = $this.attr('href')
    debugger
    $.ajax({
  			url: url,
  			method: 'get',
        data: { ticker: $this.text }
  		})
  		.done(function(response) {
        debugger
  			console.log(response);
  			$('.list').append(response);
  			console.log("success");
  		})
  		.fail(function() {
  			console.log("error");
  		});

})
}

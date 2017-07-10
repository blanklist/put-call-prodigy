$( document ).on('turbolinks:load', function() {
  $('.tab').hide();
  infoBox();
  stockBox();
});

var infoBox = function(){
  $('.tabs').find('a').on('click', function(e){
  e.preventDefault();
  $('.tabs').find('.current').removeClass('.current');
  $(this).addClass('current');
  $(this.hash).show().siblings().hide();
})
};


var stockBox = function(){
  $('.stockbox').find('a').on('click', function(e){
  // e.preventDefault();
  $link = $(this).text()
  console.log('* * * * * * * * *')
  console.log($link)
  $.ajax({
			url: url,
			type: method,
		})
		.done(function(response) {
			console.log(response);
			$('.list').append(response);
			$form.hide();
			console.log("success");
		})
		.fail(function() {
			console.log("error");
		})

})
}

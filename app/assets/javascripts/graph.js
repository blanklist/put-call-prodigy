$(document).on('turbolinks:load', function (e) {
  // setInterval(function(){ loadGraph(e); }, 3000);
  // setInterval(function(){ loadGraph(e); }, 300000);
  loadGraph(e)

});

var loadGraph = function(e) {
  $('.stockbox').find('a').on('click', function(e){
    // e.preventDefault();
    $ticker = $(this).text()

    console.log($ticker);
  var url = "/api/graphs/graph_data";
  var method = "get";
  var chart_data = { ticker: $ticker };

  $.ajax({
    url: url,
    method: method,
    data: chart_data
  }).done(function (data) {
      // Create the chart
      Highcharts.stockChart('container', {

          rangeSelector: {
              selected: 1
          },

          title: {
              text: $ticker + ' Stock Price'
          },

          series: [{
              name: $ticker,
              data: data[0].data,
              tooltip: {
                  valueDecimals: 2
              }
          }]
      });
  }).fail(function(data) {
    console.error("Something went wrong", data);
  });
})
};
